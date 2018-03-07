# language: en
Feature: Search the routes that stop in the Portal de la 80 station

Scenario: As a user I want search the Portal de la 80 station
   Given I press "Paraderos"
   When I press "Paraderos"
   And I press "TRANSMILENIO"
   And I press "Buscar"
   And I enter text "Portal" into field with id "search_src_text"
   And I press the enter button
   Then I should see "Portal de la 80"

Scenario: As a user I want search the Portal de la 80 station
   Given I press "Paraderos"
   And I press "TRANSMILENIO"
   And I press "Buscar"
   And I enter text "Portal" into field with id "search_src_text"
   And I press the enter button
   When I touch the "Portal de la 80" text
   And I should see "Detalle: Cll. 80 / Cra. 96"

Scenario: As a user I want search the Portal de la 80 station
   Given I press "Paraderos"
   And I press "TRANSMILENIO"
   And I press "Buscar"
   And I enter text "Portal" into field with id "search_src_text"
   And I press the enter button
   And I touch the "Portal de la 80" text
   When I touch the "1-1" text
   Then I should see "Recorrido: Álamos"
