Feature: Trade Tariff

  Background:
    Given I might need authorising

  @normal
  Scenario: supports declarable headings
    When I visit "/trade-tariff/headings/4017"
    Then I should see "The commodity code for importing is"
      And I should see "4017000000"
      And I should see a selector like "#commodity-4017000000"

  @normal
  Scenario: should have measures for Blackcurrants at 5th June 2012 from Montenegro and Albania
    When I visit "/trade-tariff/commodities/0810301000" for "2012-06-05"
    Then I should see "Montenegro"
      And I should see "Albania"

  @normal
  Scenario: should have measures for Dried Plantains at 5th June 2012 from Eastern and Southern African states
    When I visit "/trade-tariff/commodities/0803109000" for "2012-06-05"
    Then I should see "Eastern and Southern Africa States"

  @normal
  Scenario: should not have measure for Aluminium radiators at 5th June
    When I visit "/trade-tariff/commodities/7616999091" for "2012-06-05"
    Then I should not see "Autonomous suspension under end use"

  @normal
  Scenario: should have measure for Polyethylene | Other | Other at 5th June with Iran restriction
    When I visit "/trade-tariff/commodities/3901109090" for "2012-06-05"
    Then I should see a measure for a country:
      | code | type |
      | IR   | BERR Import Licensing Firearms and Ammunition |

  @normal
  Scenario: should have measure for 9619005100 at 5th June with VAT standard rate
    When I visit "/trade-tariff/commodities/9619005100" for "2012-06-05"
    Then I should not see "Goods are subject to VAT reduced rate 5%"
      And I should see "Goods are subject to VAT standard rate"

  @normal
  Scenario: should have measure for 9619004900 at 5th June with VAT reduced rate
    When I visit "/trade-tariff/commodities/9619004900" for "2012-06-05"
    Then I should see "Goods are subject to VAT reduced rate 5%"
      And I should see "Goods are subject to VAT standard rate"

  @normal
  Scenario: 0810100000 at 2nd Oct should have "HMI Conformity Certificate" measure
    When I visit "/trade-tariff/commodities/0810100000" for "2012-10-02"
    Then I should see "HMI Conformity Certificate"

  @normal
  Scenario: 4401310000 at 12th Dec should have VAT Standard rate
    When I visit "/trade-tariff/commodities/4401310000" for "2012-12-12"
    Then I should see "Goods are subject to VAT standard rate"

  @normal
  Scenario: 8401100000 at 12th Dec should have VAT Standard rate
    When I visit "/trade-tariff/commodities/8401100000" for "2012-12-12"
    Then I should see "Goods are subject to VAT standard rate"

  @normal
  Scenario: 4601211000 at 12th Dec should have VAT Standard rate
    When I visit "/trade-tariff/commodities/4601211000" for "2012-12-12"
    Then I should see "Goods are subject to VAT standard rate"

  @normal
  Scenario: 8401400000 at 12th Dec should have VAT Standard rate
    When I visit "/trade-tariff/commodities/8401400000" for "2012-12-12"
    Then I should see "Goods are subject to VAT standard rate"

  @normal
  Scenario: 8423811000 at 12th Dec should have VAT Standard rate
    When I visit "/trade-tariff/commodities/8423811000" for "2012-12-12"
    Then I should see "Goods are subject to VAT standard rate"

  @normal
  Scenario: 8516101100 at 12th Dec should have VAT Standard rate
    When I visit "/trade-tariff/commodities/8516101100" for "2012-12-12"
    Then I should see "Goods are subject to VAT standard rate"

  @normal
  Scenario: 8418211000 at 12th Dec should have VAT Standard rate
    When I visit "/trade-tariff/commodities/8418211000" for "2012-12-12"
    Then I should see "Goods are subject to VAT standard rate"

  @normal
  Scenario: Sewing Machines under €65 at 12th Dec should have VAT Standard rate
    When I visit "/trade-tariff/commodities/8452101100" for "2012-12-12"
    Then I should see "Goods are subject to VAT standard rate"

  @normal
  Scenario: 8452300000 at 12th Dec should have VAT Standard rate
    When I visit "/trade-tariff/commodities/8452300000" for "2012-12-12"
    Then I should see "Goods are subject to VAT standard rate"

  @normal
  Scenario: Show a meursing commodity
    When I visit "/trade-tariff/commodities/1704909919?day=25&month=1&year=2013"
    Then I should see "meursing"

  @normal
  Scenario: Show a commodity with Quota Order Number association
    When I visit "/trade-tariff/commodities/1702201000"
    Then I should see "Maple sugar and maple syrup"

  @normal
  Scenario: Show a commodity with Quota Order Number association
    When I visit "/trade-tariff/commodities/1701910000" for "2006-02-01"
    Then I should see "Containing added flavouring or colouring matter"

  @pending
  @normal
  Scenario: Non-declarable commodities aren't accessible (visiting will raise a Net::HTTPNotFound exception)
    When I visit "/trade-tariff/commodities/3903909000"
    Then I should get a page not found response

  @normal
  Scenario: Renders Measure Conditions with condition code "M"
    When I visit "/trade-tariff/commodities/0304954000" for "2013-12-06"
    Then I should see "M1: Import price must be equal to or greater than the minimum price/reference price (see components)"

  @normal
  Scenario: Renders Measure Conditions with condition code "C"
    When I visit "/trade-tariff/commodities/9403903010" for "2013-12-06"
    Then I should see "C1: Presentation of a certificate/licence/document"

  @normal
  Scenario: Renders Measure Conditions with condition code "Q"
    When I visit "/trade-tariff/commodities/7323100000" for "2013-12-06"
    Then I should see "Q1: Presentation of an endorsed certificate/licence"

  @normal
  Scenario: Renders Measure Conditions with condition code "S"
    When I visit "/trade-tariff/commodities/1001990014" for "2013-12-06"
    Then I should see "S1: Lodgement of a security"

  @normal
  Scenario: Renders Measure Conditions with condition code "F"
    When I visit "/trade-tariff/commodities/8305100035" for "2013-12-06"
    Then I should see "F1: The net free at frontier price before duty must be equal to or greater than the minimum price (see components)"

  @normal
  Scenario: Renders Measure Conditions with condition code "Y"
    When I visit "/trade-tariff/commodities/4407109800" for "2013-12-06"
    Then I should see "Y1: Other conditions"

  @normal
  Scenario: Renders Measure Conditions with condition code "V"
    When I visit "/trade-tariff/commodities/2204309200" for "2013-12-06"
    Then I should see "V1: Import price must be equal to or greater than the entry price (see components)"

  @normal
  Scenario: Renders Measure Conditions with condition code "B"
    When I visit "/trade-tariff/commodities/4302309900" for "2013-12-06"
    Then I should see "B1: Presentation of a certificate/licence/document"

  @normal
  Scenario: Renders Measure Conditions with condition code "A"
    When I visit "/trade-tariff/commodities/7318210031" for "2013-12-06"
    Then I should see "A1: Presentation of an anti-dumping/countervailing document"

  @normal
  Scenario: Renders Measure Conditions with condition code "L"
    When I visit "/trade-tariff/commodities/1602321100" for "2013-12-06"
    Then I should see "L1: CIF price must be higher than the minimum price (see components)"

  @normal
  Scenario: Renders Measure Conditions with condition code "H"
    When I visit "/trade-tariff/commodities/1602509500" for "2013-12-06"
    Then I should see "H1: Presentation of a certificate/licence/document"

  @normal
  Scenario: Renders Measure Conditions with condition code "E"
    When I visit "/trade-tariff/commodities/1602509500" for "2013-12-06"
    Then I should see "E1: The quantity or the price per unit declared, as appropriate, is equal or less than the specified maximum, or presentation of the required document"

  @normal
  Scenario: Renders Measure Conditions with condition code "R"
    When I visit "/trade-tariff/commodities/3921906095" for "2013-12-06"
    Then I should see 'R1: Ratio "net weight/supplementary unit" is equal to or higher than the condition amount'

  @normal
  Scenario: Renders Measure Conditions with condition code "U"
    When I visit "/trade-tariff/commodities/2208403100" for "2013-12-06"
    Then I should see 'U1: Ratio "declared value/supplementary unit" should be higher than the condition amount'
