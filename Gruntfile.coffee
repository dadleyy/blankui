dotenv = require "dotenv"

module.exports = (grunt) ->

  dotenv.load()

  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-jade"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-requirejs"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-karma"

  grunt.initConfig
    karma: require "./grunt/karma"
    clean: require "./grunt/clean"
    concat: require "./grunt/concat"
    watch: require "./grunt/watch"
    jade: require "./grunt/jade"
    copy: require "./grunt/copy"
    coffee: require "./grunt/coffee"
    uglify: require "./grunt/uglify"
    sass: (require "./grunt/sass") grunt
    server: (require "./grunt/server") grunt
    requirejs: require "./grunt/requirejs"

  grunt.registerTask "build:debug", [
    "clean:temp"
    "clean:vendor"
    "clean:index"
    "clean:scripts"
    "clean:styles"
    "clean:templates"
    "concat:debug"
    "jade:debug"
    "copy:templates"
    "sass:debug"
    "coffee:debug"
    "requirejs:debug"
  ]

  grunt.registerTask "build:release", [
    "clean:temp"
    "clean:vendor"
    "clean:index"
    "clean:scripts"
    "clean:styles"
    "clean:templates"
    "concat:debug"
    "uglify:release"
    "jade:release"
    "sass:release"
    "coffee:debug"
    "requirejs:release"
  ]

  grunt.registerTask "develop", [
    "build:debug"
    "server:develop"
    "watch"
  ]

  grunt.registerTask "default", [
    "build:debug"
    "karma:unit"
  ]
