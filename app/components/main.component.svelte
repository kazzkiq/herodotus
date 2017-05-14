<div class="MainComp">
  <Menu ref:menu />

  <div class="doc-container" ref:docContainer>
    {{{ documentationHTML }}}
  </div>
</div>

<script>
  import Menu from './menu.component';
  import marked from 'marked';
  import ajax from '@fdaciuk/ajax';

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
      Menu
    },

    methods: {
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