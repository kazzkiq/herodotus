  <div class="TopbarComp">
    <div class="menu-button" on:click="fire('mobilemenu', {action: 'TOGGLE'})">
      <img class="{{ (!isMenuOpen) ? '' : 'off' }}" src="img/icon-menu-open.svg" width="20" alt="Open Menu">
    </div>
    <div class="btn-group">
      <div class="btn v-center" on:click="fire('fontsize', {action: 'DECREASE'})">
        <svg class="svg-icon" xmlns="http://www.w3.org/2000/svg" role="img" viewBox="0 0 26 20">
          <use xlink:href="img/icon-font-minus.svg#icon" preserveAspectRatio="xMidYMid" />
        </svg>
      </div>
      <div class="btn v-center" on:click="fire('fontsize', {action: 'INCREASE'})">
         <svg class="svg-icon" xmlns="http://www.w3.org/2000/svg" role="img" viewBox="0 0 26 20">
          <use xlink:href="img/icon-font-plus.svg#icon" preserveAspectRatio="xMidYMid" />
        </svg>
      </div>
    </div>

    <a href="https://github.com/PeerAssets/WhitePaper" class="btn">Visit Github Project</a>
  </div>