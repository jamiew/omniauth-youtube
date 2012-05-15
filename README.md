OmniAuth YouTube
================

This is an [OmniAuth 1.0](https://github.com/intridea/omniauth) strategy for authenticating to YouTube.

Get a Google Oauth2.0 API key at their [API console](https://code.google.com/apis/console/)

Your key (AKA client_id) looks like "555555555555.apps.googleusercontent.com"; a longer key like "555555555-xxxxyyyzzz"
won't work. See [this issue](https://github.com/zquestz/omniauth-google-oauth2/issues/10#issuecomment-5720475) for discussion.

An example Rails 3.2 application using omniauth and omniauth-youtube is also available:
<https://github.com/jamiew/omniauth-rails-app>


Usage
-----

In a Rack application:

```ruby
use OmniAuth::Builder do
  provider :youtube, ENV['YOUTUBE_KEY'], ENV['YOUTUBE_SECRET'], {:access_type => 'online', :approval_prompt => ''}
end
```

For Rails, put this in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :youtube, ENV['YOUTUBE_KEY'], ENV['YOUTUBE_SECRET'], {:access_type => 'online', :approval_prompt => ''}
end
```

Restart your server and visit */auth/youtube* to try it out

Options
-------

Re. :access_type and :approval_prompt, via (omniauth-google-oauth2)[https://github.com/zquestz/omniauth-google-oauth2/blob/master/examples/omni_auth.rb]:

If you don't need a refresh token -- if you're only using Google for account creation/auth and don't need google services -- set the access_type to 'online', vs. 'offline'
Also, set the approval prompt to an empty string, since otherwise it will be set to 'force', which makes users manually approve to the Oauth every time they log in.
See <http://googleappsdeveloper.blogspot.com/2011/10/upcoming-changes-to-oauth-20-endpoint.html>



Authors
-------

* [Jamie Wilkinson (@jamiew)](https://github.com/jamiew)
* [@tarko](https://github.com/tarko)
* [Simon Gate (@simon)](https://github.com/simon)


License
-------

Copyright (c) 2011 Jamie Wilkinson

This source code released under an MIT license.
