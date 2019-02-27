class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    client_id = ENV['CLIENT_ID'];
    client_secret = ENV['CLIENT_SECRET'];
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secret
      req.params['q'] = params[:query]
    end

    body_hash = JSON.parse(@resp.body)
    @repos = body_hash["items"]

     render 'search'
  end
end
