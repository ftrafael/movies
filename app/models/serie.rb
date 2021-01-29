class Serie
  attr_reader :name, :overview, :poster_path
  
  API_KEY = 'e2e6c0526e3737f2381684d2fd63d354'

  def initialize(args)
    args.each do |key, value|
      instance_variable_set("@#{key.to_s}", value)
    end
  end

  def self.populares
    response = Themoviedb.client.get do |req|
      req.url "tv/popular?api_key=#{API_KEY}&language=pt-BR&page=1"
    end
    return response.body[:results].map { |serie| new(serie) } if response.status == 200

    []
  end
end