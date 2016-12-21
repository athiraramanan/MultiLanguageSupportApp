##
# Class for handling User
class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  
  ##
  # Show User
  def show
  end

  ##
  #New User Redering
  def new
    @user = User.new
  end

  ##
  #User Creation
  def create
    p params[:locale]
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    ##
    #Set User on Show
    def set_user
      @user = User.find(params[:id])
    end
    
    ##
    #User strong Params
    def user_params
      params.require(:user).permit(:first_name, :email, :last_name, :age)
    end
end
