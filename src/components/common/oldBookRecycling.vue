<template>
  <div class="oldBookRecycling" style="height: auto;">

    <x-header :title="titleText" :left-options="{backText: ''}" class="sever_header" v-if="flgType"></x-header>

    <div class="overflow-y" :class="{active: flgType}">
      <div class="title">一、什么是博鸟图书共享计划？</div>
      <div class="content">
        博鸟共享图书计划是针对博鸟会员推出的真正的图书资源共享项目，用户可以通过贡献自己闲置绘本的方式，置换博鸟平台免费借书等权益，实现闲置资源的真正有效利用，达到双赢的目的。
      </div>
      <div class="title">二、权益如何置换？</div>
      <div class="content">
        用户可以通过平台寄出闲置的图书，平台收到审核通过后，会根据绘本的价格，折算成等值的鸟蛋结算至用户的帐户，用户可以通过使用鸟蛋购买平台的各项服务与产品（暂不能用于赔偿与购买图书）。
      </div>
      <div class="title">三、哪些用户可以参加共享计划？</div>
      <div class="content">
        目前共享计划仅限于在博鸟借书的用户，共享的图书必须跟归还订单一并寄出。只要你在博鸟下单借书，就可以参加共享计划。
      </div>
      <div class="title">四、哪些图书可以参加共享计划？</div>
      <div class="content">
        目前平台支持数千种图书共享，您可以通过搜索查找 ，后续会逐步扩大图书范围。
      </div>
      <div class="title">五、什么是鸟蛋？</div>
      <div class="content">
        鸟蛋是平台针对图书共享计划推出的一种有价值的积分，100个鸟蛋相当于1元人民币，用户可以通过使用鸟蛋来抵现，购买平台的各项服务（暂不能用于赔偿与购买图书）。
      </div>

      <div class="title">六、书的价值如何确定？</div>
      <div class="content">
        图书价格会根据库存和市场价格情况动态调整，搜索后可以获取图书对应的鸟蛋数量。
      </div>

      <div class="title">七、鸟蛋有效期多久？</div>
      <div class="content">
        鸟蛋有效期为第二年的12月31日，逾期作废。如您的鸟蛋2018年7月28日获得的，你需要在2019年12月31日之前使用，否则将会失效。
      </div>

      <div class="title">八、什么书博鸟不收？</div>
      <div class="content">
        通过书名或ISBN码在博鸟平台搜索不到的书，有影响阅读及封面完整美观的书；有破损、污渍、老化、异味的书；非卖品、盗版书和非法出版物等。
      </div>
      <div class="title">九、图书审核判定标准是什么？</div>
      <div class="content">
        博鸟在收到用户寄来的书后，会进行人工审核（图书需8成新以上），当书籍已经影响下一位读者阅读体验，并且无法修复时，博鸟会拒绝回收（请参考审核标准图片示例）。
      </div>
      <div class="title">十、寄出物流费用谁来承担？</div>
      <div class="content">
        共享图书的物流费用由博鸟承担，目前平台不支持单独寄出，共享的图书必须跟博鸟绘本借阅订单一起寄回。只有在平台借了书的用户才能参加共享图书计划。
      </div>
      <div class="title">十一、审核后被拒绝的书如何处理？</div>
      <div class="content">
        审核后被拒绝的图书，用户可以申请在30天内寄回。平台可以免费随您的借书订单一起寄出，不支持单独寄出哦。超过30天以上的图书，平台将统一处理，不再支持用户取回。
        审核后通过的图书，平台会结算鸟蛋给用户，图书归属平台，不支持用户取回！
      </div>

      <div class="title">十二、共享图书如何结算？</div>
      <div class="content">
        我们会在收到图书的三个工作日完成结算，并把相应的鸟蛋结算至您的帐户。对于不符合条件的图书或者其他问题，我们客服会电话联系您沟通。
      </div>
      <div class="title">十三、共享图书订单是不可以取消？</div>
      <div class="content">
        在图书没有随归还订单寄出前可以取消，一旦快递取走，无法取消。
      </div>
    </div>

  </div>

</template>

<script>
  import {XHeader} from 'vux';
  export default {
    data() {
      document.title='共享图书规则';
      return {
        flgType: false,   //为false则是在app和小程序中打开网页，即不显示返回栏
        titleText: "旧书换权益规则",
      }
    },
    components:{
      XHeader
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

//      test开始
//      if (ua.indexof('MicroMessage') == -1) {//说明不在微信中
//        // 走不在小程序的逻辑
//      } else {
//        wx.miniProgram.getEnv(function(res) {
//          if (res.miniProgram) {
//            // 走在小程序的逻辑
//          } else {
//            // 走不在小程序的逻辑
//          }
//        })
//      }
//      test结束
    },
    methods: {
      jj (){

      }
    }
  }
</script>

<style lang="scss">

  .oldBookRecycling .sever_header{
    background: #fff;
    margin-bottom:10px;
    border-bottom:1px solid #ccc;
    .vux-header-title{
      span{
        color: #1e1e1e;
        font-weight:700;
        font-family:"微软雅黑";
      }

    }}

  .oldBookRecycling{
    width: 100%;
  }
  .overflow-y{
    height: 100%;
    overflow-y: auto;
    margin-bottom: 30px;
  }
  .active{
    /*margin-top: 40px;*/
  }
  .title{
    margin-top: 20px;
    margin-left: 10px;
    font-size: 15px;
    color: #333333;
  }
  .content{
    margin-top: 12px;
    margin-left: 10px;
    margin-right: 16px;
    font-size: 13px;
    color: #999999;
  }


</style>
