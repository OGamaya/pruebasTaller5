var {defineSupportCode} = require('cucumber');
var {expect} = require('chai');

defineSupportCode(({Given, When, Then}) => {
  Given('I go to losestudiantes home screen', () => {
    browser.url('/');
    if(browser.isVisible('button=Cerrar')) {
      browser.click('button=Cerrar');
    }
  });

  When('I open the login screen', () => {
    browser.waitForVisible('button=Ingresar', 5000);
    browser.click('button=Ingresar');
  });

  When('I fill a wrong email and password', () => {
    var cajaLogIn = browser.element('.cajaLogIn');

    var mailInput = cajaLogIn.element('input[name="correo"]');
    mailInput.click();
    mailInput.keys('wrongemail@example.com');

    var passwordInput = cajaLogIn.element('input[name="password"]');
    passwordInput.click();
    passwordInput.keys('123467891')
  });

  When('I try to login', () => {
    var cajaLogIn = browser.element('.cajaLogIn');
    cajaLogIn.element('button=Ingresar').click()
  });

  Then('I expect to not be able to login', () => {
    browser.waitForVisible('.aviso.alert.alert-danger', 5000);
  });

  Then('I expect to login and to see my user button', () => {
    browser.waitForVisible('button[id="cuenta"', 5000);
  });

  When(/^I fill with (.*) and (.*)$/ , (email, password) => {
     var cajaLogIn = browser.element('.cajaLogIn');

    var mailInput = cajaLogIn.element('input[name="correo"]');
    mailInput.click();
    mailInput.keys(email);

    var passwordInput = cajaLogIn.element('input[name="password"]');
    passwordInput.click();
    passwordInput.keys(password)
  });

  Then('I expect to see {string}', error => {
      browser.waitForVisible('.aviso.alert.alert-danger', 5000);
      var alertText = browser.element('.aviso.alert.alert-danger').getText();
      expect(alertText).to.include(error);
  });

  When(/^I fill the name whit (.*)$/ , (name) => {
    var cajaSignUp = browser.element('.cajaSignUp');
    var nameInput = cajaSignUp.element('input[name="nombre"]');
    nameInput.click();
    nameInput.keys(name);
  });
  When(/^I fill the last name whit (.*)$/ , (last_name) => {
    var cajaSignUp = browser.element('.cajaSignUp');
    var lastNameInput = cajaSignUp.element('input[name="apellido"]');
    lastNameInput.click();
    lastNameInput.keys(last_name);
  });
  When(/^I fill the email whit (.*)$/ , (email) => {
    var cajaSignUp = browser.element('.cajaSignUp');
    var emailInput = cajaSignUp.element('input[name="correo"]');
    emailInput.click();
    emailInput.keys(email);
  });
  When(/^I fill the password whit (.*)$/ , (password) => {
    var cajaSignUp = browser.element('.cajaSignUp');
    var passwordInput = cajaSignUp.element('input[name="password"]');
    passwordInput.click();
    passwordInput.keys(password);
  });
  When(/^I select the (.*) university$/ , (text) => {
    var cajaSignUp = browser.element('.cajaSignUp');
    var selectUniversity = cajaSignUp.element('select[name="idUniversidad"]');
    selectUniversity.selectByVisibleText(text);
  });
  When('I check the mastery study', () => {
    //browser.element('//*[text()="Estudio una maestria"]').click();
    browser.element('/html/body/div[3]/div[2]/div/div/div/div/div/div[1]/div/form/div/label/input').click();
  });
  When(/^I select the (.*) program$/ , (text) => {
    var cajaSignUp = browser.element('.cajaSignUp');
    var selecProgram = cajaSignUp.element('select[name="idPrograma"]');
    selecProgram.selectByVisibleText(text);
  });
  When('I agree the terms and conditions', () => {
    var cajaSignUp = browser.element('.cajaSignUp');
    var checkTerms = cajaSignUp.element('input[name="acepta"]');
    checkTerms.click();
  });
  When('I try to register', () => {
    var cajaSignUp = browser.element('.cajaSignUp');
    cajaSignUp.element('button=Registrarse').click()
    browser.pause(5000)
  });
  When('I expect that the {string} university was selected', option => {
    browser.pause(4000);
    var selected = browser.element('select[name="idUniversidad"]').getValue();
    var selectedText =  browser.element('option[value="'+selected+'"]').getText();
    expect(option).to.include(selectedText);
  });
  Then('I want to see the message {string}', message => {
    browser.waitForVisible('//h2', 5000);
    var alertText = browser.element('//h2').getText();
    expect(alertText).to.include(message);
  });
  Then(/^I expect that the (.*) field show a red line around$/ , (field) => {
    browser.waitForExist('.has-error');
    var name = browser.element('.has-error').getAttribute('input', 'name')
    expect(name.toLowerCase()).to.include(field.toLowerCase());
  });
  Then('I expect that the program choice show a red line around', () => {
    browser.waitForExist('.has-error');
    var name = browser.element('.has-error').getAttribute('select', 'name')
    expect(name).to.include('idPrograma');
  });

});
