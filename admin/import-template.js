const fs = require('fs');

fs.cp('../client/src/template', './src/template', { recursive: true }, (err) => {
    console.log(err);
});
