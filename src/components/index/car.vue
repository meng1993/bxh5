<style lang="scss">
  .shop_nofunction{
    display: flex;
    height: 80%;
    flex-direction: column;
    justify-content: center;
    position: fixed;
    top:0;
    align-items: center;
    left: 0;
    width: 100%;
    >p{
      text-align: center;
      line-height: 35px;
      color: #272727;
      font-size: 18px;
    }
    >i{
      font-size: 160px;
      color: #999;
    }
     &_download{
       display: block;
       width: 150px;
       height: 35px;
       line-height: 35px;
       text-align: center;
       font-size: 18px;
       color: #fff;
       border-radius: 5px;
       margin-top: 25px;
       background-color: #2196f3;
     }  
  }
</style>

<template>
    <div>
      <!--  -->
      <div class="shop_nofunction">
        <i class="iconfont">&#xe638;</i>
        <p>
         抱歉，暂不支持本功能
        </p>
      </div>
    </div>
</template>

<script>
  export default{
    data(){
      return{

      }
    }
  }
</script>