class Admin::NewsController < ApplicationController
  layout "admin_application"
  before_action :set_newsitem, only: [:show, :edit, :update, :delete]
  def index
  	@newsitems = Newsitem.all
  end

  def new
    @newsitem = Newsitem.new
  end

  def show
  	
  end

  def create
    @newsitem = Newsitem.new(newsitem_params)

    respond_to do |format|
      if @newsitem.save
        format.html { redirect_to admin_newsitem_show_path(@newsitem), notice: 'Newsitem was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  	
  end

  def delete
  	@newsitem.destroy
    respond_to do |format|
      format.html { redirect_to admin_newsitems_path, notice: 'Newsitem was successfully destroyed.' }      
    end
  end

  def update
    respond_to do |format|
      if @newsitem.update(newsitem_params)
        format.html { redirect_to admin_newsitem_show_path(@newsitem), notice: 'Newsitem was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  private 
  	def set_newsitem
      @newsitem = Newsitem.find(params[:id])
    end
    def newsitem_params
      params.require(:newsitem).permit(:caption, :description, :body, :creation_date, :priority)
    end
end
