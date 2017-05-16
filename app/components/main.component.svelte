<div class="MainComp">
  <Topbar ref:topbar on:fontsize="handleFontSize(event)" />
  <Menu ref:menu />

  <div class="doc-container font-{{fontSize}}" ref:docContainer>
    {{{ documentationHTML }}}
  </div>
</div>

<script>
  import Menu from './menu.component';
  import Topbar from './topbar.component';
  import marked from 'marked';
  import ajax from '@fdaciuk/ajax';
  import Prism from 'prismjs';

  export default {
    oncreate () {
      this.registerDocumentation();
    },

    data () {
      return {
        fontSize: 2,
        documentation: '',
        documentationHTML: ''
      }
    },

    components: {
      Menu,
      Topbar
    },

    methods: {
      handleFontSize (event) {
        let action = event.action;
        switch (action) {
          case 'INCREASE':
          this.increaseFont();
          break;
          case 'DECREASE':
          this.decreaseFont();
          break;
        }
      },
      increaseFont () {
        let fontSize = this.get('fontSize');
        if (fontSize >= 4) {
          return;
        }
        this.set({fontSize: fontSize + 1});
      },
      decreaseFont () {
        let fontSize = this.get('fontSize');
        if (fontSize <= 1) {
          return;
        }
        this.set({fontSize: fontSize - 1});
      },
      registerDocumentation () {
        const DOC_URL = 'documentation.md';

        ajax().get(DOC_URL).then((res, xhr) => {
          // Print documentation HTML
          this.set({
            documentation: res,
            documentationHTML: marked(res)
          });

          // Send menu to menu component
          this.refs.menu.startMenu(this.generateMenu());

          // Highlight code
          Prism.highlightAll();
        });
      },
      generateMenu () {
        let docElements = this.refs.docContainer;
        let headingItems = docElements.querySelectorAll('h1, h2');
        let menuItems = [];

        headingItems.forEach((item) => {
          menuItems.push({
            type: item.nodeName.toLowerCase(),
            label: item.textContent,
            id: item.id
          });
        });

        return menuItems;
      }
    }
  }
</script>