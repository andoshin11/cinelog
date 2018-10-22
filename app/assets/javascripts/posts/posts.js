import HTTP from './../http';
import { neatDate } from './../vue/filter';

import $ from 'jquery';

export default {
  computed: {
  },
  filters: {
    neatDate,
  },
  data() {
    return {
      posts: [],
      thumbnailHeight: "300px",
    };
  },
  methods: {
    async fetch() {
      try {
        const { posts: posts } = await HTTP.get('/api/posts');
        this.posts = posts;
        this.setThumbnailHeight();
      } catch (e) {
        console.error(e);
      }
    },
    setThumbnailHeight() {
      this.$nextTick(function() {
        const width = document.getElementsByClassName('post')[0].clientWidth;
        this.thumbnailHeight = (width / 2 * 3) + "px";
        this.fadeIn();
      });
      // console.log(this.$el);
      // this.thumbnailHeight = $('.post').width() / 2 * 3+'px';
    },
    fadeIn() {
      setTimeout(this.addFade(), 1000);
    },
    addFade() {
      $('.post').each(function(){
        $(this).addClass("fadeInUp");
      })
    }
  },
  watch: {
  },
  mounted() {
    this.fetch();
  },
};
