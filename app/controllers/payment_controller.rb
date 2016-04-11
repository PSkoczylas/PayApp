class PaymentController < ApplicationController
  def index
    @products = Product.all
    @all_sum = Product.all_sum
  end

  def notify
    @product = Product.find_by(name: params[:item_name])
    @product.sum_money += params[:mc_gross].to_f
    @product.save
    redirect_to root_path
  end
end

