class EstadisticasController < ApplicationController
  require "net/http"
  require "uri"

  def index
	  	url = URI.parse('http://api-search-twitts.herokuapp.com/api/b7bac/list_tag')
		result = Net::HTTP.get(url)
		if JSON(result)["data"] != nil
			@results = JSON(result)["data"]
		else
			@results = nil
		end

		if params[:value] != nil
			url = URI.parse('http://api-search-twitts.herokuapp.com/api/b7bac/list_twitts_by_tag/' + params[:value] + '/20')
		else
			url = URI.parse('http://api-search-twitts.herokuapp.com/api/b7bac/list_twitts/20')
		end

		twitts = Net::HTTP.get(url)
		if JSON(twitts)["data"] != nil
			@twitts = JSON(twitts)["data"]
		else
			@twitts = nil
		end

  end

  def create

  	tag = params[:tag]

  	url = URI.parse('http://api-search-twitts.herokuapp.com/api/b7bac/create_tag/' + tag)
	result = Net::HTTP.get(url)

	redirect_to :action => "index"
  end

end
