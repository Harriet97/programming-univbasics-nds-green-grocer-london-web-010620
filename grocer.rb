def find_item_by_name_in_collection(name, collection)
  index = 0 
  while index < collection.length do 
    if collection[index][:item] == name
      return collection[index]
    end
    index += 1
  end 
end

def consolidate_cart(cart)
  new_cart = []
  counter = 0 
  
  while counter < cart.length 
    new_cart_item = find_item_by_name_in_collection(cart[counter][:item], new_cart) #returns item or nil
    if new_cart_item != nil
      new_cart_item[:count] += 1 
    else new_cart_item = {
      :item => cart[counter][:item], 
      :price => cart[counter][:price], 
      :clearance => cart[counter][:clearance], 
      :count => 1
    }
      new_cart << new_cart_item
    end
    counter += 1
  end 
  new_cart
end

def apply_coupons(cart, coupons)
  counter = 0 
  while counter < coupons.length  
    cart_item = find_item_by_name_in_collection(coupons[counter][:item], cart)
    couponed_item_name = "#{coupons[counter][:item]} W/COUPON"
    cart_item_with_coupon = find_item_by_name_in_collection(couponed_item_name, cart)
    if cart_item && cart_item[:count] >= coupons[counter][:num]
      if cart_item_with_coupon 
        cart_item_with_coupon[:count] += coupons[counter][:num]
        cart_item[:count] -= coupons[counter][:num]
      else
        cart_item_with_coupon = {
          :item => couponed_item_name,
          :price => coupons[counter][:cost] / coupons[counter][:num],
          :count => coupons[counter][:num],
          :clearance => cart_item[:clearance],
        }
        cart << cart_item_with_coupon
        cart_item[:count] -= coupons[counter][:num]
      end 
    end 
    counter += 1 
  end
cart
end

def apply_clearance(cart)
clearanced_cart = []
counter = 0 
  while counter < cart.length 
  item = apply_coupons(cart, coupons)
  if item[:clearance => true]
    item 
  clearanced_cart += 
  counter += 1 
  end 
clearanced_cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
