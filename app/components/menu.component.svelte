<div>
  <div class="MenuComp--overlay" ref:overlay on:click="closeMenu()"></div>
  <div class="MenuComp" ref:menu>
    <div class="logo">
      <img src="img/logo.svg" alt="PeerAssets WhitePaper">
    </div>
    <ul class="menu">
      {{#each menuItems as item}}
        <li on:click="scrollToItem(item)" class="{{(item.active) ? 'active ' : ''}}{{item.type}}">{{item.label}}</li>
      {{/each}}
    </ul>
  </div>
</div>

<script>
  export default {
    oncreate () {
    },

    data () {
      return {
        menuItems: [],
        isOpen: false,
        prevY: 0
      }
    },

    methods: {
      closeMenu () {
        alert(1);
      },

      startMenu (menuItems) {
        this.set({menuItems: menuItems});
        this.handleActivatedMenuOnScroll();
      },

      activeClass (active) {
        if(active === true) {
          return 'active';
        } else {
          return '';
        }
      },

      removeActiveState () {
        let menuItems = this.get('menuItems').map(item => {
          item.active = false;
          return item;
        });
        this.set({menuItems: menuItems});
      },

      handleActivatedMenuOnScroll () {
        let menuItems = this.get('menuItems');

        window.onscroll = (e) => {
          let currY = window.scrollY;
          let stop = false;

          menuItems.forEach((item, i) => {
            let currTop = window.scrollY + document.getElementById(item.id).getBoundingClientRect().top - 120;
  
            if (stop) {
              return;
            }

            if (i <= 0) {
              i = 1;
            }

            if (currTop > window.scrollY) {
              this.removeActiveState();
              menuItems[i-1].active = true;
              stop = true;
            } else {
              item.active = false;
            }
          });

          this.set({
            menuItems: menuItems,
            prevY: currY
          });
        }
      },

      scrollToItem (item) {
        let menuItems = this.get('menuItems');
        let top = window.scrollY + document.getElementById(item.id).getBoundingClientRect().top - 70;
        window.scrollTo(0, top);
        //this.close();

        this.removeActiveState();
        menuItems.map(loopItem => {
          if(loopItem == item) {
            loopItem.active = true;
          }
          return loopItem;
        });

        this.set({menuItems: menuItems});
      }
    }
  }
</script>