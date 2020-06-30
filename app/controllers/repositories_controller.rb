class RepositoriesController < ApplicationController

  def search

  end

  #### GitHub is deprecating authentication via query parameters in May 2021; authentication should go in the headers with an OAuth2 token (?)

  # https://developer.github.com/changes/2020-02-10-deprecating-auth-through-query-param/

  # https://lostisland.github.io/faraday/usage/
  # 'Accept' => 'application/vnd.github.v3+json' (from what I'm reading, GitHub always wants to see this in the header)
  # 'token' => 'my_access_token' ....??? 


  def github_search
    
    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = ENV['GITHUB_ID']
      req.params["client_secret"] = ENV['GITHUB_SECRET']
    end

    @repos = JSON.parse(resp.body)["items"]
    render :search
  end
end

