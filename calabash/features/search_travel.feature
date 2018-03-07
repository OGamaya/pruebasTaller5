# language: en

# ==========================================================
# This feature must run with the GPS device off for optain
# the wanted result
# ==========================================================

Feature: Search the routes between Portal Norte and Portal 80

Scenario: As a user I want to get suggestions of what I'm typing in origin point
   Given I press "Rutas"
   When I press "Planear viaje"
   And I touch the "Punto de origen" text
   And I wait for progress
   And I touch the "Punto de origen" text
   And I enter text "Portal" into field with id "etSearch"
   Then I should see "Portal Norte"

 Scenario: As a user I want to get a error message when not select destination station
    Given I press "Planear viaje"
    When I touch the "Punto de origen" text
    And I wait for progress
    And I enter text "Portal" into field with id "etSearch"
    And I touch the "Portal Norte" text
    And I wait for progress
    And I press "fabGo"
    Then I should see "Debe seleccionar punto de destino."

 Scenario: As a user I want to search some route that go from Portal Norte to Portal de la 80
   Given I press "Planear viaje"
   When I touch the "Punto de origen" text
   And I wait for progress
   And I enter text "Portal" into field with id "etSearch"
   And I touch the "Portal Norte" text
   And I touch the "Punto de destino" text
   And I wait for progress
   And I enter text "Portal" into field with id "etSearch"
   And I touch the "Portal de la 80" text
   And I press "fabGo"
   And I wait for progress
   Then I should see "D10"
