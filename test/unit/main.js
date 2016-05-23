(function() { 

  var karma = window.__karma__,
      loaded = karma.loaded,
      noop = function() {},
      files = karma.files,
      tests = [];

  for(var name in files) {
    var hash = files[name],
        has_own = files.hasOwnProperty(name),
        is_test = /\.spec\./i.test(name);

    if(!has_own)
      continue;

    if(is_test) tests.push(name);
  }

  finish = function() {
    require(tests, karma.start);
  }

  requirejs.config({
    baseUrl: "/base/tmp/js",
    callback: finish
  });

  karma.loaded = noop;

})();
