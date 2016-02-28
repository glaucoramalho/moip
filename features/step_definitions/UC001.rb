@@i = 0
Given(/^Create a New Customer Request using all required and non\-required fields\.$/) do
  @customer = @app.customersList[@@i]
  puts @customer.to_json
  @@i += 1
end

When(/^Send the Request to the customers endpoint with all fields\.$/) do
  @response = @app.rest.createCustomer(@customer) 
end

Then(/^User created with all fields\.$/) do
  puts @response.to_str
  expect(@response.code).to equal(201)
end

Given(/^Create a New Customer Request using only required fields\.$/) do
  @customer = @app.customersList[@@i]
  puts @customer.fullname
  @@i += 1
  @customer.birthDate = nil
  @customer.shippingAddress = nil
  @customer.phone = nil
  @customer.taxDocument = nil
  @customer.fundingInstruments = nil
end

When(/^Send the Request to the customers endpoint without non\-required fields\.$/) do
  @response = @app.rest.createCustomer(@customer)
end

Then(/^User created without non\-required fields\.$/) do
  expect(@response.code).to equal(201)
end

Given(/^Create a New Customer Request using all required and non\-required fields without a Phone\.$/) do
  @customer = @app.customersList[@@i]
  puts @customer.fullname
  @@i += 1
  @customer.phone = nil
end

When(/^Send the Request to the customers endpoint without a Phone\.$/) do
  @response = @app.rest.createCustomer(@customer)
end

Then(/^User created without a Phone\.$/) do
  expect(@response.code).to equal(201)
end

Given(/^Create a New Customer Request using all required and non\-required fields without a Birth Date\.$/) do
  @customer = @app.customersList[@@i]
  puts @customer.fullname
  @@i += 1
  @customer.birthDate = nil
end

When(/^Send the Request to the endpoint without Birth Date\.$/) do
  @response = @app.rest.createCustomer(@customer)
end

Then(/^User created without Birth Date\.$/) do
  expect(@response.code).to equal(201)
end

Given(/^Create a New Customer Request using all required and non\-required fields without a Tax Document\.$/) do
  @customer = @app.customersList[@@i]
  puts @customer.fullname
  @@i += 1
  @customer.taxDocument = nil
end

When(/^Send the Request to the endpoint without a Tax Document\.$/) do
  @response = @app.rest.createCustomer(@customer)
end

Then(/^User created without a Tax Document\.$/) do
  expect(@response.code).to equal(201)
end

Given(/^Create a New Customer Request using all required and non\-required fields without a shippingAddress\.$/) do
  @customer = @app.customersList[@@i]
  puts @customer.fullname
  @@i += 1
  @customer.shippingAddress = nil
end

When(/^Send the Request to the endpoint without a shippingAddress\.$/) do
  @response = @app.rest.createCustomer(@customer)
end

Then(/^User created without a shippingAddress\.$/) do
  expect(@response.code).to equal(201)
end

Given(/^Create a New Customer Request using all required and non\-required fields without a fundingInstrument\.$/) do
  @customer = @app.customersList[@@i]
  puts @customer.fullname
  @@i += 1
  @customer.fundingInstruments = nil
end

When(/^Send the Request to the endpoint without a fundingInstrument\.$/) do
  @response = @app.rest.createCustomer(@customer)
end

Then(/^User created without a fundingInstrument\.$/) do
  expect(@response.code).to equal(201)
end

Given(/^Create a New Customer Request without required fields\.$/) do
  @customer = @app.customersList[@@i]
  puts @customer.fullname
  @@i += 1
  @customer.ownId = nil
  @customer.fullname = nil
  @customer.email = nil
end

When(/^Send the Request to the endpoint without required fields\.$/) do
  @response = @app.rest.createCustomer(@customer)
end

Then(/^User not created without required fields\.$/) do
  expect(@response.code).to be_between(400,499).inclusive
end

Given(/^Create a New Customer Request without ownId\.$/) do
  @customer = @app.customersList[@@i]
  puts @customer.fullname
  @@i += 1
  @customer.ownId = nil
end

When(/^Send the Request to the endpoint without ownId\.$/) do
  @response = @app.rest.createCustomer(@customer)
end

Then(/^User not created without ownId\.$/) do
  expect(@response.code).to be_between(400,499).inclusive
end

Given(/^Create a New Customer Request without fullname\.$/) do
  @customer = @app.customersList[@@i]
  puts @customer.fullname
  @@i += 1
  @customer.fullname = nil
end

When(/^Send the Request to the endpoint without fullname\.$/) do
  @response = @app.rest.createCustomer(@customer)
end

Then(/^User not created without fullname\.$/) do
  expect(@response.code).to be_between(400,499).inclusive
end

Given(/^Create a New Customer Request without email\.$/) do
  @customer = @app.customersList[@@i]
  puts @customer.fullname
  @@i += 1
  @customer.email = nil
end

When(/^Send the Request to the endpoint without email\.$/) do
  @response = @app.rest.createCustomer(@customer)
end

Then(/^User not created without email\.$/) do
  expect(@response.code).to be_between(400,499).inclusive
end
