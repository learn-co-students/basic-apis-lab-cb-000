class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = ''
      req.params['client_secret'] = ''
      req.params['q'] = params[:query]
    end
    hash = JSON.parse(@resp.body)
    if @resp.success?
      @items = hash["items"]
      @name = hash["items"][0]["name"]
      @url = hash["items"][0]["owner"]["url"]
      #@description = hash["items"][1]["description"]
    else
      @error = hash["errors"][0]["message"]
    end
    render 'search'
  end
end
