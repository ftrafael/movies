class FilmeExterno
  attr_reader :title, :overview, :poster_path, :release_date
  
  API_KEY = 'e2e6c0526e3737f2381684d2fd63d354'

  def initialize(args)
    args.each do |key, value|
      instance_variable_set("@#{key.to_s}", value)
    end
  end

  def self.em_cartaz
    response = Themoviedb.client.get do |req|
      req.url "movie/now_playing?api_key=#{API_KEY}&language=pt-BR&page=1"
    end
    return response.body[:results].map { |filme| new(filme) } if response.status == 200

    []
  end
end