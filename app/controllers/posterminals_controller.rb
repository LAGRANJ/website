class PosterminalsController < ApplicationController
  add_breadcrumb "Главная страница", :root_path
  def index
  	@bankomatpos = JSON.parse(Redis.current.get("bankomat_pos"))  	
  end
end
