  <div class="TopbarComp">
    <div class="menu-button" on:click="fire('mobilemenu', {action: 'TOGGLE'})">
      <img class="{{ (!isMenuOpen) ? '' : 'off' }}" src="img/icon-menu-open.svg" width="20" alt="Open Menu">
    </div>

    {{#if settings.allow_font_size_control}}
    <div class="btn-group">
      <div class="btn v-center" on:click="fire('fontsize', {action: 'DECREASE'})">
        <svg class="svg-icon" xmlns="http://www.w3.org/2000/svg" role="img" viewBox="0 0 26 20">
          <use xlink:href="img/icon-font-minus.svg#icon" preserveAspectRatio="xMidYMid" />
        </svg>
      </div>
      <div class="btn v-center" on:click="fire('fontsize', {action: 'INCREASE'})">
         <svg class="svg-icon" xmlns="http://www.w3.org/2000/svg" role="img" viewBox="0 0 26 20">
          <use xlink:href="img/icon-font-plus.svg#icon" preserveAspectRatio="xMidYMid" />
        </svg>
      </div>
    </div>
    {{/if}}

    {{#if settings.allow_topbar_link}}
    <a href="{{settings.topbar_link_url}}" class="btn">{{settings.topbar_link_label}}</a>
    {{/if}}
  </div>

  <script>
    import Settings from '../herodotus-settings.js';

    export default {
      data () {
        return {
          settings: Settings
        }
      }
    }
  </script>