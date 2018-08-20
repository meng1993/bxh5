<style lang="scss" >
  .serevr .sever_header{
    background: #fff;
    margin-bottom:10px;
  .vux-header-title{
    color: #1e1e1e;
    font-weight:700;

  }


  }
  .serevr .vux-header.sever_header .vux-header-left .left-arrow:before{
    border-color:#000;
  }
  .serevr .weui-cell.item{
    padding: 15px 15px;
  }
  .serevr .weui-cell:before{
    left:-10px;
  }
   #router-container.serevr{
    background: #e6e6e6;
  }
</style>
<template>
  <div class="serevr">

    <div class="help_common_title" v-if="flgType">
      <x-header title="规则与政策" :left-options="{backText: ''}" class="sever_header"></x-header>
    </div>

    <group >
      <cell class="item" title="借阅费用" is-link link="serverItem/0"></cell>
      <cell class="item" title="借阅流程" is-link link="serverItem/1"></cell>
      <cell class="item" title="赔偿政策" is-link link="serverItem/2"></cell>
      <cell class="item" title="免押金政策" is-link link="serverItem/11"></cell>
      <cell class="item" title="续租政策" is-link link="serverItem/3"></cell>
      <cell class="item" title="借阅时间" is-link link="serverItem/10"></cell>
      <cell class="item" title="购买政策" is-link link="serverItem/4"></cell>
      <cell class="item" title="卫生保障" is-link link="serverItem/5"></cell>
      <cell class="item" title="退款退货政策" is-link  link="serverItem/6"></cell>
      <cell class="item" title="物流配送归还" is-link link="serverItem/7"></cell>
      <cell class="item" title="支持地区" is-link link="serverItem/8"></cell>
      <cell class="item" title="联系我们" is-link link="serverItem/9"></cell>
    </group>
  </div>

</template>

<script>
  import BScroll from '../book/common/scrollView.vue';
  import { Cell, Group,XHeader} from 'vux';
  export default {
    components:{
      BScroll,
      Cell,
      Group,
      XHeader
    },
    data() {
      return {
        bookList: [],
        flgType: false
      }
    },
    created(){
      console.log('111111111--------->'+navigator.userAgent)
      if(navigator.userAgent.toLowerCase().indexOf('miniprogram') != -1){
        console.log("微信小程序");
        this.flgType = false
      }
      else if (navigator.userAgent.toLowerCase().indexOf('ios_app') != -1){
        console.log("app内部");
        this.flgType = false
      }
      else {
        console.log('其他登录的')
        this.flgType = true
      }
    },
    methods: {
      /* 滚动列表重置刷新 */
      scollRefresh() {
        this.$refs.scollView.scroll.refresh();
      },
    }
  }
</script>
