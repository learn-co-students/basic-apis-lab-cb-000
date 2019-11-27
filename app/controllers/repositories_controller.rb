class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = 'tetris'
      req.params['client_id'] = '88d57525a8243b4c95cc'
      req.params['client_secret'] = 'ebd56e27d043a95d8bdf0e8e37fe8c8cb8eb481a'
    end

    body = JSON.parse(resp.body)
    @results = body["items"]
    render :search
  end
end
