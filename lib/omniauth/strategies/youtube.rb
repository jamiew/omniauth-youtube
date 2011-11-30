require 'omniauth-oauth'
require 'multi_json'

module OmniAuth
  module Strategies
    class YouTube < OmniAuth::Strategies::OAuth
      option :name, 'youtube'
      option :client_options, {
        :site => 'https://www.google.com',
        :request_token_path => '/accounts/OAuthGetRequestToken',
        :access_token_path => '/accounts/OAuthGetAccessToken',
        :authorize_path => '/accounts/OAuthAuthorizeToken',
      }

      # For the time being this option requires a fork of omniauth-oauth:
      # http://github.com/jamiew/omniauth-oauth
      option :request_params, {
        :scope => 'http://gdata.youtube.com'
      }

      uid { user['id'] }

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
