class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get('https://api.github.com/search/repositories') do |req|
        req.params['client_id'] = '2bd2a315ce178794983e'
        req.params['client_secret'] = '38844e1bd54a79fad59a042529332f35a99f1d5a'
        req.params['q'] = params[:query]
      end

      body = JSON.parse(@resp.body)
      if @resp.success?
        @repos = body['items']
      elsif body['total_count'] == 0
        @error = "No results were found."
      else
        @error = body['message']
      end

    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    render 'search'
  end
end
