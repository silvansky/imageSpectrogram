# Convert image into sound

Command line utility written in `perl` and wrapped around with `ruby`.

## Depends on:

    cpan Audio::Wav
    cpan GD

### Usage:

    perl imageSpectrogram.pl image_file sound_file.wav

## macOS only: `spectr.rb`. Depends on:

    brew install sox imagemagick

### Usage:

    ./spectr.rb image_file [options]

This will produce sound file via `imageSpectrogram.pl` and it's spectrogram via `sox`.

#### Options

    --resize:
Resize image to 150px height using `sips` utility

    --invert
Invert image colors using `imagemagick` utility

## Examples:

    ./spectr.rb selfie3.jpg --resize

This command will produce this spectrogram:

![Example 1](examples/selfie3.jpg_spectrum.png)

[Resulting sound file](examples/selfie3.jpg.wav)
