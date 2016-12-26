class NewsController < ApplicationController
  add_breadcrumb "Главная страница", :root_path
  before_action :init_sidebar_data, only:[:index,:show]
  def index
    @newsonperpage = 10
    @newscount = Newsitem.count
    @lastpage = @newscount/@newsonperpage + (@newscount % @newsonperpage==0?0:1)
    @currentpage = params[:pageno].to_i
    @newsitems = Newsitem.order(:creation_date=>:desc).offset((@currentpage-1)*@newsonperpage).first(@newsonperpage)
    @startpage = @currentpage-2
    @startpage = 1 if @startpage <= 0
    @endpage = @startpage + 4
    if @endpage > @lastpage
      @endpage = @lastpage
      @startpage = @endpage - 4
      @startpage = 1 if @startpage <= 0
    end 
  end
  def show
    add_breadcrumb "Все новости", :news_path
    id = params[:id].to_i
    if(Newsitem.exists?(id))
      @newsitem = Newsitem.find(id)
    else
      @newsitem = Newsitem.first
    end
    @newsitems = Newsitem.order(:creation_date=>:desc).first(4)
  end
end
