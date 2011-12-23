class Revendas::UsersController < ApplicationController
layout 'application',:except => :index 
before_filter :navegadorie6
before_filter :check_reseller_id, :except => [:edit, :update]
before_filter :check_login, :except => [:new, :create]


def index
  redirect_to revendas_cnpj_index_path
end

def new
  @user = User.new
end

def create
  @user = User.new(params[:user])
  @user.role = "user"
  if !@user.save
    @user.errors
  end
end

def edit
  @user = current_user
end

def update
  @user = current_user
  if !@user.update_attributes(params[:user])
    @user.errors
  end
end

def check_reseller_id
  if !session[:reseller_id]
    redirect_to revendas_cnpj_index_path
  end
end

end
