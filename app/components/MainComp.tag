<comp-main>
  <comp-menu ref="menuComp"></comp-menu>
  <comp-topbar ref="topbarComp"></comp-topbar>
  
  <div class="doc-container" ref="docContainer">
    <!-- documentation will be loaded here -->
  </div>

  <script>
    this.fontSize = 2;
    this.on('mount', () => {
      this.registerDocumentation();
    });

    registerDocumentation () {
      const docUrl = this.opts.docUrl || 'documentation.md';

      ajax().get(docUrl).then((res, xhr) => {
        this.documentation = res;
        this.documentationHTML = marked(res);
        this.refs.docContainer.innerHTML = this.documentationHTML;
        this.refs.menuComp.generateMenu(this.refs.docContainer);
      });
    }
  </script>
</comp-main>