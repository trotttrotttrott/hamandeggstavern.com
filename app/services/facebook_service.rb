require 'http_agent'

class FacebookService < BaseService

  USER ||= ENV['INTEGRATION_FACEBOOK_USER']

  def initialize
    base_uri = 'https://graph.facebook.com'
    headers  = { 'User-Agent' => 'GOHAM' }
    @http = HttpAgent.new base_uri, headers
  end

  def music_listens(options={})
    access_token = Integration::Facebook.first.try(:token)
    net_http = @http.get "#{USER}/music.listens?access_token=#{access_token}&limit=#{options.fetch(:limit, 3)}"
    case options.fetch(:format, :track_set)
    when :track_set
      body = JSON.parse net_http.body
      return [] if body['data'].nil?
      body['data'].map do |listen|
        uri = listen['data']['song']['url']
        uri.split('/').last
      end
    when :json
      JSON.parse net_http.body
    else
      net_http
    end
  end
end
