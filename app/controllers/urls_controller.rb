class UrlsController < ApplicationController
  def new
    @url = Url.new
  end

  def create
    
    @url = Url.new(url_params)

    if @url.save
      redirect_to :urls_show, notice: 'Short URL was successfully created.'
    else
      render :new ,notice: 'Url should be stating with http or https'
    end
  end

  def show
  
    @url = Url.all

  end

  private

  def url_params
    params.require(:url).permit(:original).merge(short: Url.generate_short_url)
  end
end
