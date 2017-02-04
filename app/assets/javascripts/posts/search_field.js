import HTTP from './../http';

export default {
  computed: {
  },
  data() {
    return {
      text: "ブランク",
    };
  },
  methods: {
    async fetch() {
      try {
        this.text = "成功";
      } catch (e) {
      }
    },
  },
  watch: {
  },
  mounted() {
    this.fetch();
  },
};
