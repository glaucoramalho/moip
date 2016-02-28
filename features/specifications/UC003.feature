#! encoding: UTF-8
#! /usr/bin/env ruby
Feature: UC003 - Payment creation.

Scenario: UC003PTS001TC001 - Check if is possible to create a payment using all required fields.
  Given Create a New Payment using all required fields and payment method as CREDIT_CARD.
  When sending the Request to endpoint using all required fields and payment method as CREDIT_CARD.
  Then the Payment using all required fields and payment method as CREDIT_CARD is created.

Scenario: UC003PTS002TC001 - Check if is possible to create a payment using stallments.
  Given Create a New Payment using all required fields and installmentCount as 10.
  When sending the Request to endpoint using all required fields and installmentCount as 10.
  Then the Payment using all required fields and installmentCount as 10 is created.

Scenario: UC003PTS004TC001 - Check if is possible to create a payment using BOLETO.
  Given Create a New Payment using all required fields and method as BOLETO.
  When sending the Request to endpoint using all required fields and method as BOLETO.
  Then the Payment using all required fields and method as BOLETO is created.

Scenario: UC003NTS001TC001 - Check if is possible to create a payment without all required fields.
  Given Create a New Payment without using all required fields.
  When sending the Payment Request to endpoint without using all required fields.
  Then the Payment without using all required fields is not created.
