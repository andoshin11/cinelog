<template>
  <div class="movie row">
    <div class="movie__thumbnail col-md-4" :style="{ backgroundImage: 'url(' + thumbnailUrl + ')' }"></div>
    <div class="col-md-8">
      <div class="movie__title">{{ title }}</div>
      <div class="movie__overview">{{ overview }}</div>
    </div>
    {{ data }}
  </div>
</template>


<script>
  import movieField from './movie_field';

  export default movieField;
</script>