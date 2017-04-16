import { MainComp } from './components/MainComp';
import { MenuComp } from './components/MenuComp';
import { TopbarComp } from './components/TopbarComp';

document.addEventListener('DOMContentLoaded', main);

function main () {
  window.mainComp = riot.mount('comp-main');
}
