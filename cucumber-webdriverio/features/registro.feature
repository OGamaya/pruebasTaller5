# language: en

Feature: Login into losestudiantes
    As an user I want to authenticate myself within losestudiantes website in order to rate teachers

Scenario: Open login view and the university was selected
  Given I go to losestudiantes home screen
    When I open the login screen
    Then I expect that the Universidad de los Andes university was selected

Scenario: Failed registration without inputs
  Given I go to losestudiantes home screen
    When I open the login screen
    And I expect that the Universidad de los Andes university was selected
    And I try to register
    Then I expect that the nombre field show a red line around

Scenario: Failed registration only name input
  Given I go to losestudiantes home screen
    When I open the login screen
    And I expect that the Universidad de los Andes university was selected
    And I fill the name whit Pedro
    And I try to register
    Then I expect that the apellido field show a red line around

Scenario: Failed registration only name and last_name input
  Given I go to losestudiantes home screen
    When I open the login screen
    And I expect that the Universidad de los Andes university was selected
    And I fill the name whit Pedro
    And I fill the last name whit Perez
    And I try to register
    Then I expect that the correo field show a red line around

Scenario: Failed registration only name and last_name and email input
  Given I go to losestudiantes home screen
    When I open the login screen
    And I expect that the Universidad de los Andes university was selected
    And I fill the name whit Pedro
    And I fill the last name whit Perez
    And I fill the email whit e03@mail.com
    And I try to register
    Then I expect that the program choice show a red line around

Scenario: Failed registration only name and last_name, email and program input
  Given I go to losestudiantes home screen
    When I open the login screen
    And I expect that the Universidad de los Andes university was selected
    And I fill the name whit Pedro
    And I fill the last name whit Perez
    And I fill the email whit e03@mail.com
    And I check the mastery study
    And I select the Maestría en Ingeniería de Software program
    And I try to register
   Then I expect that the password field show a red line around

Scenario: Failed registration only name and last_name, email, program and password input
 Given I go to losestudiantes home screen
   When I open the login screen
   And I expect that the Universidad de los Andes university was selected
   And I fill the name whit Pedro
   And I fill the last name whit Perez
   And I fill the email whit e03@mail.com
   And I check the mastery study
   And I select the Maestría en Ingeniería de Software program
   And I fill the password whit 123456789
   And I try to register
  Then I expect to see Debes aceptar los términos y condiciones


Scenario Outline: Full data registration
  Given I go to losestudiantes home screen
    When I open the login screen
    And I expect that the Universidad de los Andes university was selected
    And I fill the name whit <name>
    And I fill the last name whit <last_name>
    And I fill the email whit <email>
    And I check the mastery study
    And I select the Maestría en Ingeniería de Software program
    And I fill the password whit 123456789
    And I agree the terms and conditions
    And I try to register
    Then I want to see the message <message>
    Examples:
    | name |last_name |email       | password | message                              |
    | Pedro|Perez     |e02@mail.com|12345678  | Ocurrió un error activando tu cuenta |
    | Juan |Ramos     |e07@mail.com|12345678  | Registro exitoso!                    | # Change email to success
