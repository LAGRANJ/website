class OfficeController < ApplicationController
  add_breadcrumb "Главная страница", :root_path  
  def index
  	@office = OFFICES.select{|x| x["ID"] == 19 }.first
  end

  def show
  	respond_to do |format|
      format.html { render plain: "custom action" }
      format.js {}
      format.json { render json: { "interest" => 18, "payment" => 5699 } }
    end
  end

end
