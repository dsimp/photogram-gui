class UsersController < ApplicationController
  def index
    @users = User.all.order({:username => :asc})
    render({template: "user_displays/index"})
  end

  def show
    the_username = params.fetch("path_username")
    @user = User.where({:username => the_username}).first

    render({template: "user_displays/show"})
  end

  def create
    @user = User.new
    @user.username = params.fetch("entered_name")

    if @user.valid?
      @user.save
      redirect_to("/users/#{@user.username}", { :notice => "User created successfully." })
    else
      redirect_to("/users/#{@user.username}", { :notice => "User failed to create successfully." })
    end
  end

  def update
    the_username = params.fetch("path_username")
    @user = User.where({:username => the_username}).first
    @user.username = params.fetch("entered_name2")
    
    if @user.valid?
      @user.save
      redirect_to("/users/#{@user.username}", { :notice => "User created successfully." })
    else
      redirect_to("/users/#{@user.username}", { :notice => "User failed to create successfully." })
    end
  end

  
end
