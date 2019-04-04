class RepositoriesController < ApplicationController

  def search
    @body = {}
    @body["items"] = []
    render "search"
  end

  def github_search
    query = params[:query]
    @resp = Faraday.get 'https://api.github.com/search/repositories?' do |req|
      req.params["q"] = query
      req.options.timeout = 1000
    end
    @body = JSON.parse(@resp.body)
    render "search"
  end
end
