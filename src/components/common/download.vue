<template>
    <div>
      <!--  -->
      <div class="help_common_title">
             <x-header @on-click-back="routerBack" :left-options="{backText: '',preventGoBack:true}">很抱歉</x-header>
        </div>
      <div class="shop_nofunction">
        <i class="iconfont">&#xe638;</i>
        <p>
         抱歉,暂不支持该功能
        <br>
        </p>
      </div>
    </div>
</template>

<script>
import { XHeader} from 'vux'

  export default{
    data(){
      return{

      }
    },
    components: {
    XHeader,
  },
  methods:{
       routerBack(){
          this.$router.goBack();
      },
  }
  }
</script>