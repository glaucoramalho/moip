@@i = 0
Given(/^Create a New Customer Request using all required and non\-required fields\.$/) do
  @customer = @app.customersList[@@i]
  @@i += 1
end

When(/^Send the Request to the customers endpoint with all fields\.$/) do
  @response = @app.rest.createCustomer(@customer) 
end

Then(/^User created with all fields\.$/) do
  expect(@response.code).to equal(201)
end

Given(/^Create a New Customer Request using only required fields\.$/) do
  @customer = @app.customersList[@@i]
  @@i+=1
  @customer.birthDate = ""
  @customer.shippingAddress = ""
  @customer.phone = ""
  @customer.taxDocument = ""
  @customer.fundingInstrument = ""
end

When(/^Send the Request to the customers endpoint without non\-required fields\.$/) do
  @response = @app.rest.createCustomer(@customer)
end

Then(/^User created without non\-required fields\.$/) do
  expect(@response.code).to equal(201)
end

Given(/^Create a New Customer Request using all required and non\-required fields without a Phone\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^Send the Request to the customers endpoint without a Phone\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^User created without a Phone\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^Create a New Customer Request using all required and non\-required fields without a Birth Date\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^Send the Request to the endpoint without Birth Date\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^User created without Birth Date\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^Create a New Customer Request using all required and non\-required fields without a Tax Document\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^Send the Request to the endpoint without a Tax Document\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^User created without a Tax Document\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^Create a New Customer Request using all required and non\-required fields without a shippingAddress\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^Send the Request to the endpoint without a shippingAddress\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^User created without a shippingAddress\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^Create a New Customer Request using all required and non\-required fields without a fundingInstrument\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^Send the Request to the endpoint without a fundingInstrument\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^User created without a fundingInstrument\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^Send the Request to the endpoint using all required and non\-required fields\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^User created using all required and non\-required fields\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^Create a New Customer Request without required fields\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^Send the Request to the endpoint without required fields\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^User not created without required fields\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^Create a New Customer Request without ownId\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^Send the Request to the endpoint without ownId\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^User not created without ownId\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^Create a New Customer Request without fullname\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^Send the Request to the endpoint without fullname\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^User not created without fullname\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^Create a New Customer Request without email\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^Send the Request to the endpoint without email\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^User not created without email\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

