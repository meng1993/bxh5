<template>
    <div class="notice-wrap">      
        <header-cop :heder_title="title"></header-cop>
        
    </div>
</template>

<script>
import BScroll from 'vue-betterscroll';
import HeaderCop from '../book/common/header.vue';

export default {
   components: {
    HeaderCop,
    BScroll
  },
  data(){
      return {
         title:"系统通知"
      }
  },
  mounted(){

  },
  methods:{
      
  },
}
</script>

<style lang="scss">
    
</style>


