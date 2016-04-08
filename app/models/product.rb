class Product < ActiveRecord::Base
  def self.all_sum
    all.inject(0){ |sum, product| product.sum_money + sum }
  end

  def paypal_url(return_path)
    values = {
        business: "jumpsmerf-facilitator@gmail.com",
        cmd: "_product",
        upload: 1,
        return: return_path,
        invoice: id,
        amount: self.price,
        item_name: self.name,
        item_number: self.id,
        quantity: '1'
        #notify_url: "#{Rails.application.secrets.app_host}/hook"
    } 
    #"https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.map {|k, v| "#{k}=#{v}"}.join("&")
    #"https://www.sandbox.paypal.com/cgi-bin/webscr?"+ values.to_query
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_json
  end
end
