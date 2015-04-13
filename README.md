# README

Had some issues understanding how proxyquire worked. This project helped me to understand it a little better. Turns out proxyquire is matching global dependencies by name, instead of location. 

So, if module `leave1` and `leave2` both live in a leaves directory, and `leave1` depends on `leave2`, then proxyquire will *only* replace it with global dependency replacement if it matches the path used inside `leave1`. 

If this is in `leave1.js`:

```javascript
var leave2 = require('leave2');
```

and this is in `top.js`:

```javascript
var leave1 = require('leaves/leave1')
```

… then none of works in a file that is at the same level as `top.js`:

```javascript
var rewired = proxyquire('top', {
  './leaves/leave2': {}
  '../leaves/leave2': {}
  …
});
```
