class UsersController < ApplicationController
	before_filter :authenticate_user!, :only => [:edit, :update, :destroy]
	 
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  
  def show
    @user = User.find(params[:id])  
	@portfolio = @user.portfolio
	@contact_info = @user.contact_info
	@users = User.all
	@title = @user.name
	
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end 
  
  def new
    @user = User.new
	@title = 'Register'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end
 
  def edit
    @user = User.find(params[:id]) 
	redirect_to root_url unless current_user == @user
	
	@title = 'Editing ' + @user.name
	@portfolio = @user.portfolio
	@contact_info = @user.contact_info
  end
 
  def create
    @user = User.new(params[:user])  

    respond_to do |format|
      if @user.save
        format.html { redirect_to edit_user_path(@user), notice: 'User was successfully created.' }
        format.json { render json: edit_user_path(@user), status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
 
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to edit_user_path(@user), notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
 
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :ok }
    end
  end
end
