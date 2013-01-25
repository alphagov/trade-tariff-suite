Feature: Trade Tariff

  @normal
  Scenario: supports declarable headings
    When I visit "/trade-tariff/headings/4017"
    Then I should see "The commodity code for importing is"
      And I should see "4017000000"
      And I should see a selector like "#commodity-4017000000"

  @normal
  Scenario: should have measures for Blackcurrants at 5th June 2012 from Montenegro and Albania
    When I visit "/trade-tariff/commodities/0810301000?as_of=2012-06-05"
    Then I should see "Montenegro"
      And I should see "Albania"

  @normal
  Scenario: should have measures for Dried Plantains at 5th June 2012 from Eastern and Southern African states
    When I visit "/trade-tariff/commodities/0803109000?as_of=2012-06-05"
    Then I should see "Eastern and Southern Africa States"

  @normal
  Scenario: should not have measure for Aluminium radiators at 5th June
    When I visit "/trade-tariff/commodities/7616999091?as_of=2012-06-05"
    Then I should not see "Autonomous suspension under end use"

  @normal
  Scenario: should have measure for Polyethylene | Other | Other at 5th June with Iran restriction
    When I visit "/trade-tariff/commodities/3901109090?as_of=2012-06-05"
    Then I should see a measure for a country:
      | code | type |
      | IR   | BERR Import Licensing Firearms and Ammunition |

  @normal
  Scenario: should have measure for 9619005100 at 5th June with VAT standard rate
    When I visit "/trade-tariff/commodities/9619005100?as_of=2012-06-05"
    Then I should not see "Goods are subject to VAT reduced rate 5%"
      And I should see "Goods are subject to VAT standard rate"

  @normal
  Scenario: should have measure for 9619004900 at 5th June with VAT reduced rate
    When I visit "/trade-tariff/commodities/9619004900?as_of=2012-06-05"
    Then I should see "Goods are subject to VAT reduced rate 5%"
      And I should see "Goods are subject to VAT standard rate"

  @normal
  Scenario: 0810100000 at 2nd Oct should have "HMI Conformity Certificate" measure
    When I visit "/trade-tariff/commodities/0810100000?as_of=2012-10-02"
    Then I should see "HMI Conformity Certificate"

  @normal
  Scenario: 4401310000 at 12th Dec should have VAT Standard rate
    When I visit "/trade-tariff/commodities/4401310000?as_of=2012-12-12"
    Then I should see "Goods are subject to VAT standard rate"

  @normal
  Scenario: 8401100000 at 12th Dec should have VAT Standard rate
    When I visit "/trade-tariff/commodities/8401100000?as_of=2012-12-12"
    Then I should see "Goods are subject to VAT standard rate"

  @normal
  Scenario: 4601211000 at 12th Dec should have VAT Standard rate
    When I visit "/trade-tariff/commodities/4601211000?as_of=2012-12-12"
    Then I should see "Goods are subject to VAT standard rate"

  @normal
  Scenario: 8401400000 at 12th Dec should have VAT Standard rate
    When I visit "/trade-tariff/commodities/8401400000?as_of=2012-12-12"
    Then I should see "Goods are subject to VAT standard rate"

  @normal
  Scenario: 8423811000 at 12th Dec should have VAT Standard rate
    When I visit "/trade-tariff/commodities/8423811000?as_of=2012-12-12"
    Then I should see "Goods are subject to VAT standard rate"

  @normal
  Scenario: 8516101100 at 12th Dec should have VAT Standard rate
    When I visit "/trade-tariff/commodities/8516101100?as_of=2012-12-12"
    Then I should see "Goods are subject to VAT standard rate"

  @normal
  Scenario: 8418211000 at 12th Dec should have VAT Standard rate
    When I visit "/trade-tariff/commodities/8418211000?as_of=2012-12-12"
    Then I should see "Goods are subject to VAT standard rate"

  @normal
  Scenario: Sewing Machines under €65 at 12th Dec should have VAT Standard rate
    When I visit "/trade-tariff/commodities/8452101100?as_of=2012-12-12"
    Then I should see "Goods are subject to VAT standard rate"

  @normal
  Scenario: 8452300000 at 12th Dec should have VAT Standard rate
    When I visit "/trade-tariff/commodities/8452300000?as_of=2012-12-12"
    Then I should see "Goods are subject to VAT standard rate"

  @normal:
  Scenario: Show a meursing commodity
    When I visit "/trade-tariff/commodities/1704909919?day=25&month=1&year=2013"
    Then I should see "meursing"
