<div>
  <div class="MenuComp--overlay" ref:overlay on:click="closeMenu()"></div>
  <div class="MenuComp" ref:menu>
    <div class="logo">
      <img src="img/logo.svg" alt="PeerAssets WhitePaper">
    </div>
    <ul class="menu">
      {{#each menuItems as item}}
        <li>{{item.label}}</li>
      {{/each}}
    </ul>
  </div>
</div>

<script>
  export default {
    data () {
      return {
        menuItems: [],
        isOpen: false
      }
    },

    methods: {
      closeMenu () {
        alert(1);
      }
    }
  }
</script>