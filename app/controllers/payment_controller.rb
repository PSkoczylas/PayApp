class PaymentController < ApplicationController
  def index
    @products = Product.all
    @all_sum = Product.all_sum
  end

  def notify
    binding.pry
  end
end

