class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |r|
      r.params['client_id'] = '5f7a833ec73a8ae08cc8'
      r.params['client_secret'] = 'd35d95baddb5eeaadfbdeb120abd8dea43695682'
      r.params['q'] = params['query']
    end

    result = JSON.parse(@resp.body)
    if @resp.success?
      @repos = result['items']
    end

    render 'repositories/search'
  end
end
