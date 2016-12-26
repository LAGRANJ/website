class MiniSpecialOffersController < ApplicationController
  add_breadcrumb "Главная страница", :root_path
    before_action :init_sidebar_data, only:[:index,:show]  
  def index
  	@mini_special_offers = MiniSpecialOffer.all
  	@special_offers = SpecialOffer.all
  end

  def show
  	add_breadcrumb "Все акции", mini_special_offers_path  
  	 @mini_special_offer = MiniSpecialOffer.find(params[:id]) 
  end
end