class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = '4db81c2667b506af49ba'
    client_secret = '4d0b4904fe26fb8e9d5036e69443fb34edcb8f08'

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
