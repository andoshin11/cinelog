<template>
  <div class="post row">  
    <div class="post__thumbnail" :style="{ backgroundImage: 'url(' + 'https://image.tmdb.org/t/p/w185_and_h278_bestv2' + post.movie.posterPath + ')' }"></div>
    <div class="post__info">
      <div class="post__date">{{ post.updatedAt | neatDate }}</div>
      <div class="post__title">{{ post.title }}</div>
      <div class="post__movie">{{ post.movie.title }}</div>
      <div class="post__comment">{{ post.comment }}</div>
    </div>
  </div>
</template>


<script>
  import post from './post';

  export default post;
</script>