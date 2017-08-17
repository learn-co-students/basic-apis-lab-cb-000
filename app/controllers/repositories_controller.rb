class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin

      @resp = Faraday.get "https://api.github.com/search/repositories" do |req|
        req.params["client_id"] = "< INSERT DATA >"
        req.params["client_secret"] = "< INSERT DATA >"
        req.params["q"] = params[:query]
      end

      body = JSON.parse(@resp.body)

      if @resp.success?
        @repositories = body["items"]
      else
        @error = body["message"]
      end

    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end

    render "search"
  end
end
