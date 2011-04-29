require 'find_address'

CheckoutController.class_eval do

  private

  def before_address
    #puts "BEFORE ADDRESS2 called user= #{@order}  #{@order.email}"
    @order.bill_address , @order.ship_address = FindAddressHelper.find_address(@order.email) unless @order.user.anonymous?
    # in case none found
    @order.bill_address ||= current_user.try(:bill_address) || Address.new(:country_id => default_country_id)
    @order.ship_address ||= current_user.try(:ship_address) || Address.new(:country_id => default_country_id)
  end


end
