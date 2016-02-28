@@i = 0
Given(/^Create a New Order Request using all required and non\-required fields using existent Customer\.$/) do
  @order = @app.ordersList[@@i]
  @@i += 1
end

When(/^sending the Request to endpoint using all required and non\-required fields using existent Customer\.$/) do
  @response = @app.rest.createOrder(@order)
end

Then(/^the Order using all required and non\-required fields using existent Customer is created\.$/) do
  expect(@response.code).to equal(201)
end

Given(/^Create a New Order Request using all required fields using new Customer\.$/) do
  @order = @app.getOrdersForNewCustomers[@@i]
  @@i += 1
end

When(/^sending the Request to endpoint using all required fields using new Customer\.$/) do
  @response = @app.rest.createOrder(@order) 
end

Then(/^the Order using all required fields using new Customer is created\.$/) do
  puts @response.to_str
  expect(@response.code).to equal(201)
end

Given(/^Create a New Order Request using all required fields using escrow mode\.$/) do
  @order = @app.getOrdersForHoldInEscrow[0]
end

When(/^sending the Request to endpoint using all required fields using escrow mode\.$/) do
  @response = @app.rest.createOrder(@order) 
end

Then(/^the Order using all required fields using escrow mode is created\.$/) do
  expect(@response.code).to equal(201)
end

Given(/^Create a New Order Request without using all required fields\.$/) do
  @order = @app.ordersList[@@i]
  @@i += 1
  @order.items = nil
end

When(/^sending the Request to endpoint without using all required fields\.$/) do
  @response = @app.rest.createOrder(@order)
end

Then(/^the Order without using all required fields is created\.$/) do
  expect(@response.code).to be_between(400,499).inclusive
end
