path = require "path"

locations = {base: path.join __dirname, ".."}

locations.temp = path.join locations.base, "tmp"
locations.out = path.join locations.base, "dist"
locations.source = path.join locations.base, "src"
locations.test = path.join locations.base, "test"
locations.bower = path.join locations.base, "bower_components"

module.exports = locations
