# OmniAuth YouTube

This is an OmniAuth strategy for authenticating to YouTube.

This currently requires features only available from a fork of *omniauth-oauth*:

<https://github.com/jamiew/omniauth-oauth>

I'll update this when the patch is merged into core, and a gem
has been published.


## Basic Usage

    use OmniAuth::Builder do
      provider :youtube, ENV['YOUTUBE_KEY'], ENV['YOUTUBE_SECRET']
    end

## License

Copyright (c) 2011 Jamie Wilkinson
Source code released under an MIT license
