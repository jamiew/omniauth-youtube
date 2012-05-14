require 'omniauth-oauth2'
require 'multi_json'

module OmniAuth
  module Strategies
    class YouTube < OmniAuth::Strategies::OAuth2
      option :name, 'youtube'
      option :client_options, {
        :site => 'https://www.youtube.com',
        :authorize_url => 'https://accounts.google.com/o/oauth2/auth',
        :token_url => 'https://accounts.google.com/o/oauth2/token'
      }
      option :authorize_params, {
        :scope => 'http://gdata.youtube.com'
      }


      uid { user['id']['$t'] }

      info do
        {
          'uid' => user['id']['$t'],
          'nickname' => user['author'].first['name']['$t'],
          'first_name' => user['yt$firstName'] && user['yt$firstName']['$t'],
          'last_name' => user['yt$lastName'] && user['yt$lastName']['$t'],
          'image' => user['media$thumbnail'] && user['media$thumbnail']['url'],
          'description' => user['yt$description'] && user['yt$description']['$t'],
          'location' => user['yt$location'] && user['yt$location']['$t']
        }
      end

      extra do
        { 'user_hash' => user }
      end

      def user
        user_hash['entry']
      end

      def user_hash
        @user_hash ||= MultiJson.decode(@access_token.get("http://gdata.youtube.com/feeds/api/users/default?alt=json").body)
      end

    end
  end
end

OmniAuth.config.add_camelization 'youtube', 'YouTube'
