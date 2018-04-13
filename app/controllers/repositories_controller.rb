class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "d506e0c75e4b59ce01fb56946f2b14002f3338db"
    secret = "REPLACE ME"

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