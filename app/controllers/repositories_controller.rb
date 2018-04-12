class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    client_id = "68db58f78d7c7a0614e2"
    secret = "b5361257d211c6baf00e4b9b614636ae1e1a0e12"

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
