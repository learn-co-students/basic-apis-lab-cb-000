class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	begin
	  	@resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
	      req.params['client_id'] = 'c3b772800816141ae256'
	      req.params['client_secret'] = 'a54eba066460d8efd09de9dd79e44538073a15b2'
	      req.params['q'] = params[:query]
	      req.options.timeout = 10
	    end
    	body = JSON.parse(@resp.body)
    rescue JSON::ParserError
    	@error = "Cannot parse JSON"
  	end
   	if @resp.success?
   		@items = body["items"]
   	end
    render 'search'
  end
end
