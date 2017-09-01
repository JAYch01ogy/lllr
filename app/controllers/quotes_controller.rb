class QuotesController < ApplicationController
  def index
    @quotes = Quote.all
  end

  def show
    @quote = Quote.find(params[:id])
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)
    if @quote.save
      flash[:info] = 'Your quote has been submitted.  Someone will reach out to you shortly.'
      redirect_to quotes_path
    else
      render 'new'
    end
  end

  private
    def quote_params
      params.require(:quote).permit(:first, :last, :email, :phone)
    end
end
