import Vue from 'vue';
import page from './../utils/page';

import post from './post.vue';

page('posts', 'show', () => {
  new Vue({
    el: '#movie_field',
    render(createElement) {
      return createElement(post);
    }
  });
});
