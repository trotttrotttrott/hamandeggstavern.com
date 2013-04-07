class HttpAgent

  attr :base_uri, :headers

  def initialize(base_uri, headers={}, params={})
    @base_uri = base_uri
    @headers = headers
  end

  def get(path, options={}, &block)
    request :get, path, &block
  end

  def post(path, data={}, options={}, &block)
    request :post, path do |request|
      request.set_form_data(data)
      block.call(request) if !!block
    end
  end

  def put(path, data={}, options={}, &block)
    request :put, path do |request|
      request.set_form_data(data)
      block.call(request) if !!block
    end
  end

  def delete(path, options={}, &block)
    request :delete, path, &block
  end

  private

  def request(verb, path)
    path = path.gsub /^\//, ''
    uri = URI.parse(File.join(base_uri, path))
    request_type = Net::HTTP.const_get(verb.to_s.classify)
    request = request_type.new(uri.request_uri, headers)
    yield request if block_given?
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl, http.verify_mode = [true, OpenSSL::SSL::VERIFY_NONE] if http.port == 443
    http.read_timeout = 600
    http.request(request)
  end
end
