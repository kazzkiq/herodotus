import Main from './components/main.component';

document.addEventListener('DOMContentLoaded', main);

function main () {
  window.mainComponent = new Main({
    target: document.querySelector('main'),
    data: {}
  });
}
