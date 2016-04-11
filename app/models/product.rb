class Product < ActiveRecord::Base
  def self.all_sum
    all.inject(0){ |sum, product| product.sum_money + sum }
  end

  def paypal_url(return_path)
    values = {
        business: "jumpsmerf-facilitator@gmail.com",
        cmd: "_xclick",
        return: "#{return_path}notify",
        amount: price,
        item_name: name,
        item_number: 1,
        quantity: 1,
        notify_url: "#{return_path}notify"
    } 
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end
