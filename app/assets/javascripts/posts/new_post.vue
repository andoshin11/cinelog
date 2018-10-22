<template>
  <form class="form">
    <div class="row">
      <div class="col-md-6">
        <label class="form__label">Title Test:</label>
        <input type="text" class="form__text" v-model="title" placeholder="Spectre">
        <label class="form__label">Comment</label>
        <textarea v-model="comment" placeholder="Add New Comment" class="form__text template-form__body"></textarea>
        <button type="button" class="button button_fill_true" @click="create()">Create Post</button>
      </div>
      <div class="col-md-6">
        <div class="button button_float_right button_fill_true" type="button" @click="showModal = true">+ Select Movie</div>
        <div class="movie-info" v-if="movie.title != null">
          <img :src="'https://image.tmdb.org/t/p/w370_and_h556_bestv2/' + movie.posterPath" class="movie-info__image">
          <div class="movie-info__box">
            <div class="movie-info__title">{{ movie.title }}</div>
            <div class="movie-info__release">{{ movie.releaseDate }}</div>
            <div class="movie-info__overview">{{ movie.overview }}</div>
          </div>
        </div>
        <div class="movie-info__delete" @click="deleteMovie()" v-if="movie.title != null">Delete</div>
      </div>
    </div>


    <modal :showModal="showModal" v-if="showModal" @close="showModal = false">
      <div slot="header">
        Select Movie
      </div>
      <div slot="body">
        <div class="search-form">
          <input class="search-form__input" type="text" v-model="query" placeholder="Input Movie Title" v-on:keyup.enter="search()">
          <button type="button" class="button button_fill_true search-form__button" @click="search()">Search</button>
        </div>
        <loading v-if="searching" />
        <ul class="search-form__results" v-if="!searching">
          <li class="search-form__result" v-for="result in results" @click="select(result)">
            <img :src="'https://image.tmdb.org/t/p/w370_and_h556_bestv2/' + result.posterPath" class="search-form__image">
            <div class="result__title">{{ result.title }}</div>
            <div class="result__release">{{ result.releaseDate }}</div>
          </li>
        </ul>
      </div>
      <div slot="footer">
        <div class="button button_fill_true button_float_right" @click="showModal = false">Close</div>
      </div>
    </modal>
  </form>
</template>


<script>
  import newPost from './new_post';

  export default newPost;
</script>