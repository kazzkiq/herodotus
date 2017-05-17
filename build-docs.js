const fs = require('fs');
const rimraf = require('rimraf');

const DOCS_PATH = 'app/assets/docs';
const PUBLIC_PATH = 'public';

let files = fs.readdirSync(DOCS_PATH);
let filesContent = [];

// Save list of filenames (only those who ends in .md)
files
  .filter(file => file.indexOf('.md') > -1)
  .forEach(file => filesContent.push(fs.readFileSync(`${DOCS_PATH}/${file}`)));

// Concat files and write to PUBLIC folder
fs.writeFileSync(PUBLIC_PATH + '/documentation.md', filesContent.join('\n\n'));

// Freeing memory
delete files;
files = null;

delete filesContent;
filesContent = null;

// Delete unused /docs from PUBLIC folder
rimraf(`${PUBLIC_PATH}/docs`, () => { console.log('\x1b[35mHerodotus:\x1b[0m Documentation compiling finished.') });