class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
       @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
           req.params['client_id'] = "e1f888c726f9f70a278d"
           req.params['client_secret'] = "51b79f7c1be71eade3d94abb8b966fb6d74ea711"

           req.params['q'] = params[:query]

           req.options.timeout = 100
         end
         body = JSON.parse(@resp.body)
         if @resp.success?
           @results = body['items']
         else
           @error = 'Missing query search'
         end

       rescue Faraday::ConnectionFailed
         @error = "There was a timeout. Please try again."
       end
       render 'search'
     end
  end
