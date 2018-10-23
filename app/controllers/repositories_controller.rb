class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "a040ca40ed590b4e31b9"
    secret = "b0c14754d715202ef39633765f1c3dc77b8423e5"

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
