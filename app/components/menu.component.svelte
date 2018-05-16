<:Window on:scroll="onAppScroll(this.scrollY)" />
<div>
  <div class="MenuComp--overlay {{(isOpen) ? 'active' : ''}}" ref:overlay on:click="fire('mobilemenu', {action: 'CLOSE'})"></div>
  <div class="MenuComp {{(isOpen) ? 'open' : ''}}" ref:menu on:swipeleft="fire('mobilemenu', {action: 'CLOSE'})">
    <img src="img/logo-green.svg" alt="Peercoin Docs" class="logo">
    <ul class="menu">
      {{#each menuItems as item}}
        <li id="menu-{{item.id}}" class="{{item.type}}">
          <a on:click="scrollToItem(item, event)" href="#{{item.id}}">{{item.label}}</a>
            {{#if item.children.length > 0}}
              <ul class="subsection">
                {{#each item.children as subitem}}
                  <li id="menu-{{subitem.id}}" class="{{subitem.type}}">
                    <a on:click="scrollToItem(subitem, event)" href="#{{subitem.id}}">{{subitem.label}}</a>
                  </li>
                {{/each}}
              </ul>
            {{/if}}
        </li>
      {{/each}}
    </ul>
  </div>
</div>

<script>
  import Hammer from 'hammerjs';

  export default {
    oncreate () {
      window.onhashchange = () => {
        this.scrollToURLMenu();
      }
    },

    events: {
      swipeleft(node, callback) {
        let h = new Hammer(node);
        h.on('swipeleft', callback);
      },
      swiperight(node, callback) {
        let h = new Hammer(node);
        h.on('swiperight', callback);
      }
    },

    data () {
      return {
        menuItems: [],
        menuItemsFlat: [],
        isOpen: false,
        prevY: 0
      }
    },

    methods: {
      onAppScroll (y) {
        let menuItems = this.get('menuItemsFlat');
        
        for(let [key, item] of menuItems.entries()) {
          let el = document.getElementById(item.id);
          let elemTop = el.getBoundingClientRect().top;
          let elemBottom = el.getBoundingClientRect().bottom;

          // Is on screen
          if ((elemTop >= 0) && (elemBottom <= window.innerHeight)) {
            // Remove active from all menu items
            [...document.querySelectorAll('.menu li.active')].map(i => i.classList.remove('active'));

            // Get item to highlight
            let menuToHighlight = document.getElementById(`menu-${item.id}`);
            
            // Highlight item
            menuToHighlight.classList.add('active');

            let sectionToShow = menuToHighlight.parentNode;

            // If its an item inside subsection, make subsection (father) visible
            if(sectionToShow.classList.contains('subsection')) {
              [...document.querySelectorAll('.menu .subsection')].map(i => i.classList.remove('show'));
              sectionToShow.classList.add('show');
            }

            // If its an item father of a subsection, make subsection (child) visible
            if(menuToHighlight.querySelectorAll('.subsection').length > 0) {
              [...document.querySelectorAll('.menu .subsection')].map(i => i.classList.remove('show'));
              menuToHighlight.querySelector('.subsection').classList.add('show');
            }

            // Stop loop
            break;
          }
        }
      },
      startMenu (menuOpts) {
        this.set(menuOpts);
        setTimeout(() => {
          this.scrollToURLMenu();
        }, 10);
      },
      scrollTop() {
        window.scrollTo(0, 0);
        this.close();
      },
      scrollToURLMenu () {
        let hash = window.location.hash.substr(2);
        let filtered = this.get('menuItemsFlat').filter(item => item.id === hash);

        if (filtered.length > 0) {
          let heading = document.getElementById(filtered[0].id);
          let top = window.scrollY + heading.getBoundingClientRect().top - 70;
          window.scrollTo(0, top);
        } else {
          window.scrollTo(0, 1);
        }
      },
      toggle () {
        this.set({isOpen: !this.refs.menu.isOpen});
        return this.refs.menu.isOpen;
      },
      close () {
        this.set({isOpen: false});
      },
      open () {
        this.set({isOpen: true});
      },
      scrollToItem (item, e) {
        if(e) {
          e.preventDefault();
        }

        window.location.hash = '/' + item.id;
        let menuItems = this.get('menuItemsFlat');
        let top = window.scrollY + document.getElementById(item.id).getBoundingClientRect().top - 70;
        window.scrollTo(0, top);

        this.fire('mobilemenu', {action: 'CLOSE'});
      }
    }
  }
</script>