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
      post: {
        movie: {},
      },
    };
  },
  methods: {
    async fetch() {
      try {
        const { post: post } = await HTTP.get(`/api/posts/${gon.postId}`);
        this.post = post;
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
