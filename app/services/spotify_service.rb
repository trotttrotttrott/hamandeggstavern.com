require 'http_agent'

class SpotifyService < BaseService

  def initialize
    base_uri = 'http://ws.spotify.com/lookup/1'
    headers  = { 'User-Agent' => 'GOHAM' }
    @http = HttpAgent.new base_uri, headers
  end

  def lookup_track(track_id)
    net_http = @http.get "?uri=spotify:track:#{track_id}"
    Hash.from_xml net_http.body
  end
end
