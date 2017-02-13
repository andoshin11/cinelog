import Vue from 'vue';
import page from './../utils/page';

import newPost from './new_post.vue';

page('posts', 'new', () => {
  new Vue({
    el: '#new_post',
    render(createElement) {
      return createElement(newPost);
    }
  });
});
