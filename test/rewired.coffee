proxyquire = require 'proxyquire'

rewired = proxyquire '../src/top', 
  './leave2': 
    havefun: -> 
      console.info 'WTH'
      console.info 'REWIRED'
    '@global': true

rewired.tonsoffun()

