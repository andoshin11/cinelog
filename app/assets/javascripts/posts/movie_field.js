import HTTP from './../http';

export default {
  computed: {
  },
  data() {
    return {
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
        console.log("フェッチ");
        const data = await HTTP.get('https://api.themoviedb.org/3/movie/206647?language=ja-JP&api_key=b006bdba5ec6e27f69db63250d5cede8');
        this.data = data;
      } catch (e) {
        console.error(e);
      }
    },
  },
  watch: {
  },
  mounted() {
  },
};
