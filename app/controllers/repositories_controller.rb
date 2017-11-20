class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "bRRRITSCOLD"
    secret = "81b34b08d7d63464f19dda2f191778858f9602ac"

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
