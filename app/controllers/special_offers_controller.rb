class SpecialOffersController < ApplicationController
  add_breadcrumb "Главная страница", :root_path  
  def index
  	@special_offers = SpecialOffer.all
  end

  def show
  	add_breadcrumb "Все акции", special_offers_path  
  	 @special_offer = SpecialOffer.find(params[:id])
  end
end
