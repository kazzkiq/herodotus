<div class="SearchListComp">
  <div class="btn btn-svg">
    <svg class="svg-icon" xmlns="http://www.w3.org/2000/svg" role="img" viewBox="0 0 15 15" on:click="toggleSearch()">
      <use xlink:href="img/icon-search.svg#icon" preserveAspectRatio="xMidYMid" />
    </svg>
  </div>
  
  <div class="SearchListComp--overlay {{(isOpen) ? 'active' : ''}}" on:click="closeSearch()"></div>

  <div class="search-popup {{(isOpen)? 'open' : ''}}">
    <input type="text" ref:input class="filter-input" on:input="handleSearch(event)" on:keydown="isClosable(event)" placeholder="Search here...">
    {{#if filteredList.length > 1 }}
    <ul class="filtered-list">
      {{#each filteredList as item}}
      <li class="item">
        <a href="#/{{item.item.id}}" on:click="closeSearch()">
          <div class="section-title">{{item.item.title}}</div>
          <div class="section-text">{{item.item.content.substr(0, 100)}}...</div>
        </a>
      </li>
      {{/each}}
    </ul>
    {{/if}}

    {{#if filteredList.length < 1 }}
      <h2 class="empty-message">No matches found.</h2>
    {{/if}}
  </div>
</div>

<script>
  import Fuse from 'fuse.js';

  export default {
    oncreate() {
      this.observe('searchList', (list) => {
        this.fuse = this.setFuse(list);
      });
    },
    data() {
      return {
        searchList: [],
        filteredList: [],
        fuse: null,
        isOpen: false
      }
    },
    methods: {
      openSearch() {
        this.set({isOpen: true});
        this.refs.input.focus();
      },
      closeSearch() {
        this.set({isOpen: false});
      },
      toggleSearch() {
        if(this.get('isOpen')) {
          this.closeSearch();
        } else {
          this.openSearch();
        }
      },
      isClosable(e) {
        if (e.keyCode === 27) {
          this.closeSearch();
        }
      },
      setFuse(searchList) {
        if(searchList.length < 1) {
          return;
        }
        this.set({
          fuse: new Fuse(searchList, {
            shouldSort: true,
            findAllMatches: true,
            includeMatches: true,
            threshold: 0.3,
            location: 0,
            distance: 10000,
            maxPatternLength: 32,
            minMatchCharLength: 3,
            keys: [
              "content"
            ]
          })
        });
      },
      handleSearch(e) {
        const text = e.target.value;
        if(text.length > 3) {
          this.set({
            filteredList: this.get('fuse').search(e.target.value)
          });
        } else {
          this.set({
            filteredList: []
          });
        }
        console.log(this.get('filteredList'));
      }
    }
  }
</script>