'use strict'

var tap = require('tap')

tap.test('bluebird', function(t) {
  t.autoend()
  var Bluebird = require('bluebird')
  t.beforeEach(function(done) {
    setImmediate(done)
  })
  t.test('new Promise() throw', function(t) {
    t.autoend()
    function testFunc(Promise) {
      try {
        return (new Promise(function() {
          throw new Error()
        })).then(function() {
        }, function() {
        })
      } catch (e) {
      }
    }
    testFunc(Bluebird)
      .finally(function() {

      })
      .then(function() {

      }, function() {

      })
  })
})
