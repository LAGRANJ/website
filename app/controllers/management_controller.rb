class ManagementController < ApplicationController
  def index
  	@managers = Manager.all
  end
end
