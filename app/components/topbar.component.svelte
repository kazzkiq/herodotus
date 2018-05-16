  <div class="TopbarComp">
    <div class="menu-button" on:click="fire('mobilemenu', {action: 'TOGGLE'})">
      <svg class="svg-icon {{ (!isMenuOpen) ? '' : 'off' }}" xmlns="http://www.w3.org/2000/svg" role="img" viewBox="0 0 40 28">
        <use xlink:href="img/icon-menu-open.svg#icon" preserveAspectRatio="xMidYMid" />
      </svg>
    </div>

    <div class="logo" on:click="scrollTop()">
      <img src="img/logo.svg" alt="Docs" width="35">
    </div>

    {{#if settings.allow_font_size_control}}
    <div class="btn-group">
      <div class="btn btn-svg v-center" on:click="fire('fontsize', {action: 'DECREASE'})">
        <svg class="svg-icon" xmlns="http://www.w3.org/2000/svg" role="img" viewBox="0 0 26 20">
          <use xlink:href="img/icon-font-minus.svg#icon" preserveAspectRatio="xMidYMid" />
        </svg>
      </div>
      <div class="btn btn-svg v-center" on:click="fire('fontsize', {action: 'INCREASE'})">
        <svg class="svg-icon" xmlns="http://www.w3.org/2000/svg" role="img" viewBox="0 0 26 20">
          <use xlink:href="img/icon-font-plus.svg#icon" preserveAspectRatio="xMidYMid" />
        </svg>
      </div>
    </div>
    {{/if}}

    <hr>

    <SearchList ref:searchlist />

    {{#if settings.allow_topbar_link}}
    <a href="{{settings.topbar_link_url}}" class="btn btn-last-link"><span>Contribute to</span><b>{{settings.topbar_link_label}}</b></a>
    {{/if}}
  </div>

  <script>
    import SearchList from './searchlist.component';
    import Settings from '../herodotus-settings.js';

    export default {
      data () {
        return {
          settings: Settings
        }
      },
      components: {
        SearchList,
      },
    }
  </script>