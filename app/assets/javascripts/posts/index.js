import Vue from 'vue';
import page from './../utils/page';

import posts from './posts.vue';

page('posts', 'index', () => {
  new Vue({
    el: '#posts_field',
    render(createElement) {
      return createElement(posts);
    }
  });
});
