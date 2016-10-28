class MiniSpecialOffersController < ApplicationController
  add_breadcrumb "Главная страница", :root_path  
  def index
  	@mini_special_offers = MiniSpecialOffer.all
  end

  def show
  	add_breadcrumb "Все акции", mini_special_offers_path  
  	 @mini_special_offer = MiniSpecialOffer.find(params[:id])
  end
end