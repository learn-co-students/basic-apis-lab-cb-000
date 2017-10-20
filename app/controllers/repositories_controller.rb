class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['q'] = params[:query]
        req.params['client_id'] = 'Iv1.c27750e5b7f00576'
        req.params['client_secret'] = '4cae20376a4b2abc5247538cbddc6d8b26b34d85'
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @results = body['items']
      else
        @error = body['message']
      end
    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    render :search
  end
end
