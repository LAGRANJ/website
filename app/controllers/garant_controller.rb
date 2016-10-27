class GarantController < ApplicationController
  add_breadcrumb "Главная страница", :root_path
  def index
  	@garants = Garant.all
  end
  def show 
  	add_breadcrumb "Реализация залогового обеспечения", garants_path()
  	@garant = Garant.first
  end 
end
