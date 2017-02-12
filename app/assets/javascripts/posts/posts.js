import HTTP from './../http';

export default {
  computed: {
  },
  data() {
    return {
      posts: [],
      data: null,
      text: "ブランク",
      thumbnailUrl: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/hE24GYddaxB9MVZl1CaiI86M3kp.jpg",
      title: "Spectre",
      overview: "ボンドは、少年時代の思い出が詰まった生家“スカイフォール”で焼け残った写真を受け取る。彼はMが止めるのも無視して、その写真の謎を解き明かすため単身メキシコとローマを訪れる。死んだ犯罪者の妻ルチアと滞在先で巡り合ったボンドは、悪の組織スペクターの存在を確信する。"
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
