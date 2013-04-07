require 'http_agent'

class FacebookService < BaseService

  ACCESS_TOKEN ||= ENV['FACEBOOK_ACCESS_TOKEN']
  USER ||= ENV['FACEBOOK_USER']

  def initialize
    base_uri = 'https://graph.facebook.com'
    headers  = { 'User-Agent' => 'GOHAM' }
    @http = HttpAgent.new base_uri, headers
  end

  def music_listens(options={})
    net_http = @http.get "#{USER}/music.listens?access_token=#{ACCESS_TOKEN}&limit=#{options.fetch(:limit, 3)}"
    case options.fetch(:format, :track_set)
    when :track_set
      body = JSON.parse net_http.body
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
