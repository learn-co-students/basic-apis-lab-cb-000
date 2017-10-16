class RepositoriesController < ApplicationController

  def search

  end

  def github_search

    @repo = Faraday.get "https://api.github.com/search/repositories?q=#{params[:query]}" do |req|
      req.params['client_id'] = Rails.application.secrets.client_id
      req.params['client_secret'] = Rails.application.secrets.client_secret
    end
   @repo_hash = JSON.parse(@repo.body)
   @results = @repo_hash["items"]

   render 'search'
  end
end
