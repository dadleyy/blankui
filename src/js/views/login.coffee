define [
  "components/login_form"
  "templates/views/login"
], (LoginForm, template) ->

  Login = Vue.extend
    template: template

  Login
