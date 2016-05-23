locations = require "./locations"

clean =
  temp: [locations.temp]
  vendor: ["#{locations.out}/vendor"]
  index: ["#{locations.out}/index.html", "#{locations.temp}/html"]
  scripts: ["#{locations.out}/js", "#{locations.temp}/js"]
  styles: ["#{locations.out}/css"]
  templates: ["#{locations.out}/templates"]

module.exports = clean
