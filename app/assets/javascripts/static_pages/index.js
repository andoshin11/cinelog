import Vue from 'vue';
import page from './../utils/page';

import posts from './../posts/posts.vue';

page('static_pages', 'index', () => {
  new Vue({
    el: '#posts_field',
    render(createElement) {
      return createElement(posts);
    }
  });
});
