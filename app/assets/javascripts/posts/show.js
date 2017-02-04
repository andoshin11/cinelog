import Vue from 'vue';
import page from './../utils/page';

import movieField from './movie_field.vue';

page('posts', 'show', () => {
  new Vue({
    el: '#movie_field',
    render(createElement) {
      return createElement(movieField);
    }
  });
});
