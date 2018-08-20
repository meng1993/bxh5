<template lang="pug">
div
  XHeader(title="物流信息",:left-options="{backText:''}",class="sl-header")
  p.sl-p.sl-first
    span 物流公司：
    span(v-text="name")
  p.sl-p
    span 运单号：
    span(v-text="number")
  view-box
    b-scroll(:data="info",ref="scollView" class="sl-b")
      .sl-box(v-for="item in info")
        .sl-time
          span(v-text="item.time")
        .sl-context(v-text="item.context")
      .sl-topState
        span(v-text="startTitle")

</template>
<script>
import {Flow, FlowState, FlowLine, XHeader,ViewBox  } from 'vux';
import API from '../../services';
import BScroll from 'vue-betterscroll';
import { mapGetters } from 'vuex'
  export default{
    components: {
       Flow,
    FlowState,
    FlowLine,
     XHeader,
     ViewBox,
     BScroll
    },
    data(){
      return {
       name:"",
       number:"",
       start:"",
       info:[],
       startTitle:"已揽件",
      }
    },
    computed: {
        ...mapGetters([
            'getUserInfoUserId',
            'getUserInfoToken',
        ])
    },
    motheds: {
      },
    activated(){
       setTimeout(() => {

     this.$refs.scollView.scroll.refresh();
    }, 500);
      this.name=this.$route.params.company;
      this.number=this.$route.params.id
       API.API.order.expressInfo({
        userId:this.getUserInfoUserId,
        token:this.getUserInfoToken,
        nu:this.$route.params.id,
        com:this.$route.params.name
      }).then((body)=>{
        if (body.data.code==300) {
           this.startTitle="暂无物流信息";
        };
        if (body.data.code==200) {
            this.info=body.data.data;
        };
       })

    }
  }


</script>

<style lang="scss">
.sl-header{
  height: 50px; // position: fixed;
  width: 100%;
  .left-arrow::before {
    border-color: #1e1e1e!important;
  }
  background: #fff;
  .vux-header-title {
    span {
      font-size: 20px;
      color: #1e1e1e;
    }
  }
}.sl-first {
border-top:1px solid #d2d2d2;
border-bottom:1px solid #d2d2d2;
}
.sl-p{
  width: 100%;
  height: 50px;
  display: flex;
  padding-left: 10px;
  span:nth-of-type(1){
  flex:1;
  line-height: 50px;
  }
  span:nth-of-type(2){
  flex:3;
   line-height: 50px;
  }
}
.sl-logistics.weui-wepay-flow{
  // height: 550px;
  padding: 10px;
  .weui-wepay-flow__bd{
    float: left;}
.sl-line{
  height:50px;
}

}
.sl-box{
  height: 100px;
  width: 100%;
  .sl-time{
    height: 10px;
    width: 10px;
    background:#ebebeb;
    border-radius: 50%;
    margin-left: 10px;
    span{
      margin-left: 20px;
      width: 400px;
      display: inline-block;
    }


  }
   .sl-context{
      height: 100px;
      width:500px;
      border-left:1px solid #ebebeb;
      position: relative;
      left: 15px;
      padding-left: 10px;
      padding-top: 10px;
    }

}

 .sl-box:nth-of-type(1){
      color: #3390d8;
      .sl-time{
        background:#2e92e5;
      }
    }
   .sl-topState{
    height: 10px;
    width: 10px;
    background:#ebebeb;
    border-radius: 50%;
    margin-left: 10px;
    background:#ebebeb;
    margin-top:10px;
    // margin-bottom: 200px;
    span{
      width: 400px;
      height: 100px;
      position: relative;
      left: 30px;
      display: inline-block;

    }
   }
 .sl-b>.wapper_content{
   padding-bottom: 200px;
  }
</style>
