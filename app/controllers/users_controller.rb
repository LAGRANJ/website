class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Newsitem was successfully created.' }
        format.js {}
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  def custom
  	respond_to do |format|
        format.html { redner "custom action" }
        format.js {}
        format.json { render "custom action" }
	end
  end 
  private
  # Never trust parameters from the scary internet, only allow the white list through.
	  def user_params
	    params.require(:user).permit(:name)
	  end
end
