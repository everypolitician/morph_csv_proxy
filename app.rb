require 'bundler/setup'
require 'sinatra'
require 'rest-client'

helpers do
  def morph_api_key
    ENV['MORPH_API_KEY']
  end

  def scraper_csv(scraper:, query:)
    RestClient.get(
      "https://morph.io/#{scraper}/data.csv",
      params: { key: morph_api_key, query: query }
    ).to_s
  end
end

get '/' do
  content_type 'text/plain; charset=utf-8'
  scraper_csv(scraper: params[:scraper], query: params[:query])
end
