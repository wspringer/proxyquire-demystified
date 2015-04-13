proxyquire = require 'proxyquire'

rewired = proxyquire './top', 
  './leaves/leave1': 
    goforit: -> 
      console.info 'WTH'
      console.info 'REWIRED'

rewired.tonsoffun()

