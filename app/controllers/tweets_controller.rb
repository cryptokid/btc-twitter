class TweetsController < ApplicationController
  
  def new
  end

  def create
    query_hash = { 'q' => params[:search] }
    response = TwitterAPICaller.call(query_hash)
    TwitterAPICaller.results(response)
    binding.pry
    redirect_to :index
  end

end
