#! encoding: UTF-8
#! /usr/bin/env ruby

Feature: UC002 - Order Creation.

Scenario: UC002PTS001TC001 - Check if order can be created with all fields.
  Given Create a New Order Request using all required and non-required fields using existent Customer.
  When sending the Request to endpoint using all required and non-required fields using existent Customer.
  Then the Order using all required and non-required fields using existent Customer is created.
  
Scenario: UC002PTS003TC001 - Check if Order can be created using a new customer.
  Given Create a New Order Request using all required fields using new Customer.
  When sending the Request to endpoint using all required fields using new Customer.
  Then the Order using all required fields using new Customer is created.

Scenario: UC002PTS004TC001 - Check if order can be created as escrow.
  Given Create a New Order Request using all required fields using escrow mode.
  When sending the Request to endpoint using all required fields using escrow mode.
  Then the Order using all required fields using escrow mode is created.

Scenario: UC002NTS001TC001 - Check if order can be created without required fields.
  Given Create a New Order Request without using all required fields.
  When sending the Request to endpoint without using all required fields.
  Then the Order without using all required fields is created.
