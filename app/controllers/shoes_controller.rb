class ShoesController < ApplicationController
 before_action :require_login, only: [:index, :create, :buy, :destroy]
  def index
    @shoes = Product.all
    @user = current_user
  end

  def create
    product = Product.new(name:params[:name],amount:params[:amount],post_date:params[:post_date],seller:current_user)
    if product.save
    
    else
      flash[:errors] = product.errors.full_messages
    end
    redirect_to :back
  end

  def buy
    shoe = Product.find(params[:id])
    shoe.update(buyer:current_user,bought_date:params[:bought_date])
    redirect_to :controller =>'users', :action=>'index', :id =>current_user[:id]
  end

  def destroy
    shoe = Product.find(params[:id])
    shoe.destroy
    redirect_to :back
  end
end
