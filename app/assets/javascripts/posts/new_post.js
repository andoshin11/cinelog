import HTTP from './../http';
import modal from './../vue/modal.vue';
import loading from './../vue/loading.vue';

var API_KEY = 'b006bdba5ec6e27f69db63250d5cede8';

export default {
  components: {
    modal,
    loading,
  },
  data() {
    return {
      title: null,
      comment: null,
      query: null,
      data: null,
      results: [],
      showModal: false,
      searching: false,
      movie: {
        title: null,
        posterPath: null,
        releaseDate: null,
        id: null,
        overview: null,
        originalTitle: null,
        originalLanguage: null,
        backdropPath: null,
      }
    };
  },
  methods: {
    async create() {
      try {
        if (this.title == null){
          alert("Fill the title!");
          throw new Error("Title is blank");
        };
        const { post: post } = await HTTP.post('/api/posts', {
          title: this.title,
          comment: this.comment,
          movie: this.movie,
        });
        document.location.href = `/posts/${post.id}`;
      } catch (e) {
        console.error(e);
      }
    },
    async search() {
      try {
        this.searching = true;
        this.results = null;
        const data = await HTTP.get2(`https://api.themoviedb.org/3/search/movie?api_key=${API_KEY}&language=ja-JP&query=${this.query}&include_adult=true`);
        this.searching = false;
        this.results = data.results;
      } catch (e) {
        console.error(e);
        this.searching = false;
        alert("No result");
      }
    },
    async select(result) {
      try {
        this.movie = result;
        this.showModal = false;
      } catch (e) {
        console.error(e);
      }
    },
    deleteMovie() {
      this.movie = {  
        title: null,
        posterPath: null,
        releaseDate: null,
        id: null,
        overview: null,
        originalTitle: null,
        originalLanguage: null,
        backdropPath: null,
      }
    },
  },
  mounted() {
  },
};
