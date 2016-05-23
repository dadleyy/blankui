define [
  "templates/components/login_form"
], (template) ->

  methods =

    attempt: ->

  LoginForm = Vue.extend {template, methods}

  Vue.component "login-form", LoginForm

  LoginForm
