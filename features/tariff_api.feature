Feature: Trade Tariff API

  Background:
    Given I might need API access authorising

  @normal
  Scenario Outline: comparing api responses
    When I fetch API show response for <CommodityCode> on live system
    And I fetch API show response for <CommodityCode> on demo system
    Then These reponses should be identical

    Examples:
      | CommodityCode  |
      | 1104291790     |
