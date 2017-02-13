import HTTP from './../http';
import { neatDate } from './../vue/filter';

export default {
  computed: {
  },
  filters: {
    neatDate,
  },
  data() {
    return {
      posts: [],
    };
  },
  methods: {
    async fetch() {
      try {
        const { posts: posts } = await HTTP.get('/api/posts');
        this.posts = posts;
      } catch (e) {
        console.error(e);
      }
    },
  },
  watch: {
  },
  mounted() {
    this.fetch();
  },
};
