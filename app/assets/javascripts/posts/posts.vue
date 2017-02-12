<template>
  <div class="posts row">
    <a :href="'/posts/' + post.id" class="post" v-for="post in posts">
      <div class="post__thumbnail" :style="{ backgroundImage: 'url(' + thumbnailUrl + ')' }"></div>
      <div class="post__info">
        <div class="post__date">{{ post.updatedAt }}</div>
        <div class="post__title">{{ title }}</div>
        <div class="post__movie">{{ title }}</div>
        <div class="post__comment">{{ post.comment }}</div>
      </div>
    </a>
  </div>
</template>


<script>
  import posts from './posts';

  export default posts;
</script>