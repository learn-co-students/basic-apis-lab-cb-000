class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "fd8b22008b5ca05e8ac4"
    secret = "deb911fb269d3927c79f02f59ea42ad893726d80"

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
