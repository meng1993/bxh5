<template lang="pug">
<div class="a">
<img src="../../assets/img/goods/shouyehuodong2.png" class='i' @click='go'>
</img>
</div>
</template>
<style>
.a {
  position: relative;
  width: 100%;
  height: 100%;
}
.i {
  width: 100%;
}

</style>
<script>
export default {
  methods: {
    go() {
      if (!localStorage.getItem("userInfo")) {
        this.$router.push({
          path: "/login?type=good",
          query: { return_url: window.location.href }
        });
        return false;
      }
      this.$router.push({
        path: "/book_bookCard"
      });
    }
  }
};
</script>