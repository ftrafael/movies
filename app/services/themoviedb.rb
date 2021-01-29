require 'faraday'
require 'faraday_middleware'

class Themoviedb
  class << self
    def endpoint
      'http://api.themoviedb.org/'
    end
    
    def api_version
      '3/'
    end

    def themovie_url
      "#{endpoint}#{api_version}"
    end

    def client
      @client ||= new_connection
    end

    private

    def new_connection
      Faraday.new(url: themovie_url) do |faraday|
        faraday.use :instrumentation
        faraday.headers['Content-Type'] = 'application/json'
        
        faraday.response :json, parser_options: { symbolize_names: true },
          content_type: /\bjson$/
        faraday.adapter :net_http
      end
    end
  end
end
