@@o = 0
@@p = 0
Given(/^Create a New Payment using all required fields and payment method as CREDIT_CARD\.$/) do
  @order = @app.ordersList[@@o]
  @@o += 1
  @payment = @app.paymentsList[@@p]
  @@p += 1
end

When(/^sending the Request to endpoint using all required fields and payment method as CREDIT_CARD\.$/) do
  @response = @app.rest.createOrder(@order)
  @orderResponse = @app.createOrderResponse(JSON.parse(@response.to_str))
  @paymentResponse = @app.rest.payOrder(@orderResponse.id,@payment)
end

Then(/^the Payment using all required fields and payment method as CREDIT_CARD is created\.$/) do
  expect(@paymentResponse.code).to be(201)
end

Given(/^Create a New Payment using all required fields and installmentCount as 10.$/) do
  @order = @app.ordersList[@@o]
  @@o += 1
  @payment = @app.paymentsList[@@p]
  @@p += 1
  @payment.installmentCount = 10
end

When(/^sending the Request to endpoint using all required fields and installmentCount as 10\.$/) do
  @response = @app.rest.createOrder(@order)
  @orderResponse = @app.createOrderResponse(JSON.parse(@response.to_str))
  @paymentResponse = @app.rest.payOrder(@orderResponse.id,@payment)
end

Then(/^the Payment using all required fields and installmentCount as 10 is created\.$/) do
  expect(@paymentResponse.code).to be(201)
end

Given(/^Create a New Payment using all required fields and method as BOLETO\.$/) do
  @order = @app.ordersList[@@o]
  @@o += 1
  @payment = @app.getBoletoPaymentsList[@@p]
  @@p += 1
end

When(/^sending the Request to endpoint using all required fields and method as BOLETO\.$/) do
  @response = @app.rest.createOrder(@order)
  @orderResponse = @app.createOrderResponse(JSON.parse(@response.to_str))
  @paymentResponse = @app.rest.payOrder(@orderResponse.id,@payment)
end

Then(/^the Payment using all required fields and method as BOLETO is created\.$/) do
  expect(@paymentResponse.code).to be(201)
end

Given(/^Create a New Payment without using all required fields\.$/) do
  @order = @app.ordersList[@@o]
  @@o += 1
  @payment = @app.paymentsList[@@p]
  @@p += 1
  @payment.fundingInstrument = nil 
end

When(/^sending the Payment Request to endpoint without using all required fields\.$/) do
  @response = @app.rest.createOrder(@order)
  @orderResponse = @app.createOrderResponse(JSON.parse(@response.to_str))
  @paymentResponse = @app.rest.payOrder(@orderResponse.id,@payment)
end

Then(/^the Payment without using all required fields is not created\.$/) do
  expect(@paymentResponse.code).to be_between(400,499).inclusive
end
