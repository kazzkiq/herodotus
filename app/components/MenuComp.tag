<comp-menu>
  <div class="MenuComp--overlay" ref="overlay" onclick="{ close }"></div>
  <div class="MenuComp" ref="menu">
    <div class="logo">
      <img src="img/logo.svg" alt="PeerAssets WhitePaper">
    </div>
    <ul class="menu">
      <li each="{ menu }" onclick="{ scroll }" class="{ type } { active: active }">{ label }</li>
    </ul>
  </div>

  <script>
    this.isOpen = false;
    this.menu = [];
    this.on('mount', () => {
      window.onscroll = (e) => {
        let currY = window.scrollY;
        let stop = false;

        this.menu.forEach((item, i) => {
          let currTop = window.scrollY + document.getElementById(item.id).getBoundingClientRect().top - 120;
 
          if (stop) {
            return;
          }

          if (i <= 0) {
            i = 1;
          }

          if (currTop > window.scrollY) {
            this.removeActiveState();
            this.menu[i-1].active = true;
            stop = true;
          } else {
            item.active = false;
          }
        });

        this.update();

        this.prevY = currY;
      }
    });

    generateMenu (documentationElement) {
      let docEl = documentationElement;
      let menuItems = docEl.querySelectorAll('h1, h2');

      menuItems.forEach((item) => {
        let itemObj = {
          type: item.nodeName.toLowerCase(),
          label: item.textContent,
          id: item.id
        };

        this.menu.push(itemObj);

        // Flush object
        itemObj = null;
      });

      this.update();
    }

    scroll (e) {
      let item = e.item
      let top = window.scrollY + document.getElementById(item.id).getBoundingClientRect().top - 70;
      console.log(top)
      window.scrollTo(0, top);

      this.removeActiveState();
      this.close();
      e.item.active = true;
      this.update();
    }

    removeActiveState () {
      this.menu.map(item => item.active = false);
    }

    open () {
      this.refs.menu.classList.add('open');
      this.refs.overlay.classList.add('active');
      this.isOpen = true;
      this.update();
      this.parent.refs.topbarComp.update();
    }

    close () {
      this.refs.menu.classList.remove('open');
      this.refs.overlay.classList.remove('active');
      this.isOpen = false;
      this.update();
      this.parent.refs.topbarComp.update();
    }
  </script>
</comp-menu>