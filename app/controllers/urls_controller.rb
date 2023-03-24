class UrlsController < ApplicationController
  def new
    @url = Url.new
  end

  def create_old
    
    @url = Url.new(url_params)

    if @url.save
     # redirect_to :urls_show, notice: 'Short URL was successfully created.'

     
    #redirect_to urls_path(short: @url.short)
        redirect_to urls_show_path(short: @url.short)

    else
      render :new ,notice: 'Url should be stating with http or https'
    end
  end


   



def create

    @url = Url.new(url_params)

   # Save the short URL and original URL in your database
    if @url.save

    # Get the original URL from the form data
    original_url = @url.original

    short_url = @url.short

    
    
    end
    # Redirect to the original URL, but display the short URL name in the URL bar
    redirect_to short_url_path(short: short_url)
  end

  def show

    # Find the short URL in the database based on the short URL name
    short_url = Url.find_by(short: params[:short])

    # Redirect to the original URL
    redirect_to short_url.original
  end







  def show_old
  
   # @url = Url.all
    short_url = Url.find_by(short: params[:short])
    
    redirect_to short_url.original
   end

  
    




  private

  def url_params
    params.require(:url).permit(:original).merge(short: Url.generate_short_url)
  end
end
