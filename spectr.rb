#!/usr/bin/env ruby

require 'optparse'

options = { }
OptionParser.new do |opts|
  opts.banner = "Usage: spectr.rb image_file [options]"

  opts.on('--resize', 'Resize image to 250 px height') { |v| options[:resize] = true }

end.parse!

if ARGV.length == 0
	puts "No filename provided!"
else
	image_file = ARGV[0]
	sound_file = "#{image_file}.wav"
	spectrogram_file = "#{image_file}_spectrum.png"

	if options[:resize]
		puts "Resizing image: #{image_file}"
		system("sips #{image_file} --resampleHeight 250 --out resized_#{image_file}")
		image_file = "resized_#{image_file}"
	end

	puts "Generating sound: #{sound_file}"
	system("perl imageSpectrogram.pl #{image_file} #{sound_file}")

	puts "Generating spectrogram: #{spectrogram_file}"
	system("sox #{sound_file} -n spectrogram -o #{spectrogram_file}")
end
