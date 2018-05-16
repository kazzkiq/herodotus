const ghpages = require('gh-pages');
const path = require('path');

ghpages.publish('public', err => {
  if(err) {
    console.log('Error while trying to deploy the docs to gh-pages:');
    console.log(err);
  } else {
    console.log('\x1b[35mStatus:\x1b[0m Deployed.');
  }
});