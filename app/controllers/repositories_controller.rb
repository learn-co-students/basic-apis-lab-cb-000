class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '3337eb4dcb901315f5bd'
      req.params['client_secret'] = 'd8577a514e288025cf0d5d35fb70fafa2923ba11'
      req.params['q'] = "cat"
    end
    render 'search'
  end

end
