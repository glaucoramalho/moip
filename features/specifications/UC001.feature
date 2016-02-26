#! encoding: UTF-8
#! /usr/bin/env ruby

Feature: UC001 - Customer Creation

Scenario: UC001PTS001TC001 - Customer Creation with all required fields.
  Given Create a New Customer Request using all required and non-required fields.
  When Send the Request to the customers endpoint with all fields.
  Then User created with all fields.
  

Scenario: UC001PTS002TC001 - Check if customer can be createdd without non-required fields.
  Given Create a New Customer Request using only required fields.
  When Send the Request to the customers endpoint without non-required fields.
  Then User created without non-required fields.
  

Scenario: UC001PTS002TC002 - Check if a customer can be createdd without a Phone.
  Given Create a New Customer Request using all required and non-required fields without a Phone.
  When Send the Request to the customers endpoint without a Phone. 
  Then User created without a Phone. 
  

Scenario: UC001PTS002TC003 - Check if a customer can be createdd without a Birth Date.
  Given Create a New Customer Request using all required and non-required fields without a Birth Date.
  When Send the Request to the endpoint without Birth Date.
  Then User created without Birth Date.
  

Scenario: UC001PTS002TC004 - Check if a customer can be createdd without a Tax Document.
  Given Create a New Customer Request using all required and non-required fields without a Tax Document.
  When Send the Request to the endpoint without a Tax Document.
  Then User created without a Tax Document.
  

Scenario: UC001PTS002TC005 - Check if a customer can be createdd without a shippingAddress.
  Given Create a New Customer Request using all required and non-required fields without a shippingAddress.
  When Send the Request to the endpoint without a shippingAddress.
  Then User created without a shippingAddress.
  

Scenario: UC001PTS002TC006 - Check if a customer can be createdd without a fundingInstrument.
  Given Create a New Customer Request using all required and non-required fields without a fundingInstrument.
  When Send the Request to the endpoint without a fundingInstrument.
  Then User created without a fundingInstrument.
  

Scenario: UC001PTS003TC001 - Check if customer is eligible to Protected Sell with all eligible fields filled in during creation.
  Given Create a New Customer Request using all required and non-required fields.
  When Send the Request to the endpoint using all required and non-required fields.
  Then User created using all required and non-required fields.
  

Scenario: UC001NTS001TC001 - Check if customer can be createdd without required fields.
  Given Create a New Customer Request without required fields.
  When Send the Request to the endpoint without required fields.
  Then User not created without required fields.
  

Scenario: UC001NTS001TC002 - Check if customer can be createdd without ownId field.
  Given Create a New Customer Request without ownId.
  When Send the Request to the endpoint without ownId.
  Then User not created without ownId.
  

Scenario: UC001NTS001TC003 - Check if customer can be createdd without fullname field.
  Given Create a New Customer Request without fullname.
  When Send the Request to the endpoint without fullname.
  Then User not created without fullname.
  

Scenario: UC001NTS001TC004 - Check if customer can be createdd without email field.
  Given Create a New Customer Request without email.
  When Send the Request to the endpoint without email.
  Then User not created without email.
  
