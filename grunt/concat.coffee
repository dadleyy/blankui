locations = require "./locations"

debug =
  options: {}
  nonull: true
  src: [
    "#{locations.bower}/q/q.js"
    "#{locations.bower}/page/page.js"
    "#{locations.bower}/vue/dist/vue.js"
    "#{locations.bower}/requirejs/require.js"
  ]
  dest: "#{locations.out}/vendor/bundle.js"

module.exports = {debug}
