class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'ec0c70033670cfb14d75'
      req.params['client_secret'] = '773b6ff13c6dfa2a8c08c60ffe55831515799fd8'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    @results = body['items']
    render 'search'
  end
end 