class MainController < ApplicationController
  def index
  	@mainnewsitem = Newsitem.where(priority:0).first
    @newsitems = Newsitem.where(priority:1)
    @records = ActiveRecord::Base.connection.execute("select * from get_currency_rates(840)")

  end
end
