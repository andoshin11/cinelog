import Vue from 'vue';
import page from './../utils/page';

import searchField from './search_field.vue';

page('posts', 'new', () => {
  new Vue({
    el: '#search_field',
    render(createElement) {
      return createElement(searchField);
    }
  });
});
