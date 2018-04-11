class RepositoriesController < ApplicationController

  def search
    render :search
  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories'  do |req|
        req.params['q'] = params[:query]
      end

      if !@resp.success?
        @error = "connection filed  !@resp.success"
      else
        @items_array = JSON.parse(@resp.body)["items"]
      end

    rescue Faraday::ConnectionFailed
      @error = 'connection failed'
    end

    render :search
  end

end
