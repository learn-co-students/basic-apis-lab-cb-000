class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	client_id = "57c07d4fd96f5f2e04d5"
  	secret = "92824bb1d5213e66415f63a6e14ee406a13834dd"

  	resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = client_id
      req.params["client_secret"] = secret
    end

    body = JSON.parse(resp.body)
    @results = body["items"]
    render :search
  end
end
