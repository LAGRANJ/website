class MainController < ApplicationController
  def index
  	@mainnewsitem = Newsitem.where(priority:0).first
    @newsitems = Newsitem.where(priority:1)
  end
end
