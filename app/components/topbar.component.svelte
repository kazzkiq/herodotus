  <div class="TopbarComp">
    <div class="menu-button" onclick="{ fire('mobilemenu', {action: 'TOGGLE'}) }">
      <img class="{ off: parent.refs.menuComp.isOpen }" src="img/icon-menu-open.svg" width="20" alt="Open Menu">
      <img class="{ off: !parent.refs.menuComp.isOpen }" src="img/icon-menu-close.svg" width="15" alt="Close Menu">
    </div>
    <div class="btn-group">
      <div class="btn" on:click="fire('fontsize', {action: 'DECREASE'})">
        <svg class="ac-svg" role="img" title="Preview Mode" width="22">
          <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="img/icon-font-minus.svg"></use>
        </svg>
        <img src="" alt="Smaller font">
      </div>
      <div class="btn" on:click="fire('fontsize', {action: 'INCREASE'})">
        <svg class="ac-svg" role="img" title="Preview Mode" width="22">
          <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="img/icon-font-plus.svg"></use>
        </svg>
      </div>
    </div>

    <a href="https://github.com/PeerAssets/WhitePaper" class="btn">Visit Github Project</a>
  </div>