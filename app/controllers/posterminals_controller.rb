class PosterminalsController < ApplicationController
  add_breadcrumb "Главная страница", :root_path
  def index
  	@cash_terminals = CashTerminal.all
  end
end
