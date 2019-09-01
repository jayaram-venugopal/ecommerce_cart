module Api::V1::OrdersHelper

  def find_products
    order_products = params.dig(:order, :order_items)
    product_ids = order_products.map { |value| value[:product_id]}
    products = Product.where(:id => product_ids)
    raise ActiveRecord::RecordNotFound unless @products.count.eql?(order_products.count)
  end

end
