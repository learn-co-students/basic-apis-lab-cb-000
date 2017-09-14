class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '02eefbbaea6502e3c0c7'
      req.params['client_secret'] = 'd8082568c2faefda71fe9e0b82f4b5c414781907'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    if @resp.success?
      @items = body["items"]
    else
      @error = body["meta"]["errorDetail"]
    end

    render 'search'
  end
end
