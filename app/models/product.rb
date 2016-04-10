class Product < ActiveRecord::Base
  def self.all_sum
    all.inject(0){ |sum, product| product.sum_money + sum }
  end

  def paypal_url(return_path)
    values = {
        business: "jumpsmerf-facilitator@gmail.com",
        cmd: "_xclick",
        upload: 3,
        return: return_path,
        invoice: nr,
        amount: price,
        item_name: name,
        item_number: 1,
        quantity: 1,
        notify_url: "#{return_path}notify"
       # notify_url: "http://localhost:3000/notification"
        #notify_url: "#{Rails.application.secrets.app_host}/hook"
    } 
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end
