class UsersController < ApplicationController
  before_action :require_login
  before_action :require_correct_user
  def index
    @user_sales = User.find(params[:id]).sales
    @user_purchases = User.find(params[:id]).purchases
    @sales_amount = 0
    @user_sales.each do|s|
      if s.buyer_id != nil
        @sales_amount +=s.amount
      end
    end
  end
end
