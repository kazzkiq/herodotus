  <div class="TopbarComp">
    <div class="menu-button" onclick="{ toggleMenu }">
      <img class="{ off: parent.refs.menuComp.isOpen }" src="img/icon-menu-open.svg" width="20" alt="Open Menu">
      <img class="{ off: !parent.refs.menuComp.isOpen }" src="img/icon-menu-close.svg" width="15" alt="Open Menu">
    </div>
    <div class="btn-group">
      <div class="btn" on:click="fire('fontsize', {action: 'DECREASE'})">
        <img src="img/icon-font-minus.svg" alt="Smaller font">
      </div>
      <div class="btn" on:click="fire('fontsize', {action: 'INCREASE'})">
        <img src="img/icon-font-plus.svg" alt="Smaller font">
      </div>
    </div>

    <a href="https://github.com/PeerAssets/WhitePaper" class="btn">Visit Github Project</a>
  </div>

<script>
  export default {
    methods: {
      fontMinus () {
        console.log(1);
      }
    }
  }
/*
  fontMinus () {
    if(this.parent.fontSize > 1) {
      this.parent.fontSize--;
      this.parent.refs.docContainer.classList.remove('font-1', 'font-2', 'font-3', 'font-4');
      this.parent.refs.docContainer.classList.add('font-' + this.parent.fontSize);
    }
  }

  fontPlus () {
    if(this.parent.fontSize < 4) {
      this.parent.fontSize++;
      this.parent.refs.docContainer.classList.remove('font-1', 'font-2', 'font-3', 'font-4');
      this.parent.refs.docContainer.classList.add('font-' + this.parent.fontSize);
    }
  }

  toggleMenu () {
    if(this.parent.refs.menuComp.isOpen) {
      this.parent.refs.menuComp.close();
    } else {
      this.parent.refs.menuComp.open();
    }
  }*/
</script>