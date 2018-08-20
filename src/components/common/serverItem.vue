<style lang="scss" >

  .serevrItem .sever_header{
    background: #fff;
    margin-bottom:10px;
    border-bottom:1px solid #ccc;
  .vux-header-title{
    color: #1e1e1e;
    font-weight:700;
    font-family:"微软雅黑";
  }}

  .serevrItem .item_a{
    　-webkit-overflow-scrolling: touch;
    /*overflow: auto;*/
    overflow: touch;


    padding:10px;
  padding-top:0;

    p{font-family:"微软雅黑";
      margin-top: 10px;
    font-size:14px;
      >span{
         font-weight:600;

       }
    }
  h3{font-family:"微软雅黑";
       font-weight:600;
    margin: 10px 0;
     }
  table{
    font-family:"微软雅黑";
    margin-top:10px;
    width:100%;
    background:#fff;
  th{font-family:"微软雅黑";
    /*font-size:12px;*/
    background:#f2f2f2;
    padding:8px;
    box-sizing: border-box;
    >td{
       font-size:18px;


     }
  }
    td{


      /*font-size:16px;*/
      background:#f2f2f2;
      padding:8px;
      box-sizing: border-box;
      border: 4px solid #fff;
    }
  }
  }


  .serevrItem .item_b{
  padding:10px;
    img{
      width:100%;
    }
  }
  .serevrItem .item_c{
    p{font-family:"微软雅黑";
      padding:10px;
      height:40px;
      line-height:30px;
      font-weight:500;
      text-indent: 30px;
    }

  }
  .serevrItem .item_d{
  p{font-family:"微软雅黑";
    padding:10px;
    height:40px;
    line-height:30px;
    font-weight:500;
    text-indent: 30px;
  }
  }
  .serevrItem .item_e{
  p{font-family:"微软雅黑";
    padding:10px;
    height:40px;
    line-height:30px;
    font-weight:500;
    text-indent: 30px;
  }
  }
  .serevrItem .item_f{
  p{font-family:"微软雅黑";
    padding:10px;
    height:40px;
    line-height:30px;
    font-weight:500;
    text-indent: 30px;
  }
  }
  .serevrItem .item_g{
  p{font-family:"微软雅黑";
    padding:10px;
    height:40px;
    line-height:30px;
    font-weight:500;
    text-indent: 30px;
  }
  }
  .serevrItem .item_h{
  p{font-family:"微软雅黑";
    padding:10px;
    height:40px;
    line-height:30px;
    font-weight:500;
    text-indent: 30px;
  }
  }
  .serevrItem .item_i{
  p{font-family:"微软雅黑";
    padding:10px;
    height:40px;
    line-height:30px;
    font-weight:500;
    text-indent: 30px;
  }
  }
  .serevrItem .item_j{
  p{font-family:"微软雅黑";
    padding:10px;
    height:40px;
    line-height:30px;
    font-weight:500;
    text-indent: 30px;
  }
  }
  .serevrItem .item_k{
  p{font-family:"微软雅黑";
    padding:10px;
    height:40px;
    min-height:140px;
    line-height:30px;
    font-weight:500;
    text-indent: 30px;
  }
  }
  .serevrItem .item_l{
  p{font-family:"微软雅黑";
    padding:10px;
    height:40px;
    min-height:140px;
    line-height:30px;
    font-weight:500;
    text-indent: 30px;
  }
  }
.red{
  color: #ff1915;
}
.overflow-y{
  height: 100%;
  overflow-y: auto;
}

</style>
<template>

  <div class="serevrItem" >

    <div class="help_common_title" v-if="flgType">
      <x-header :title="titleList[title]" :left-options="{backText: ''}" class="sever_header"></x-header>
    </div>

      <!-- <b-scroll ref="scollView"> -->
    <div class="overflow-y">
        <div :class="{item_a:itemList.item0}" v-if="itemList.item0" >
          <h3>一、借阅价格</h3>
          <p class="">绘本借阅分为两种方式：
            <span>单次借阅与会员计划。</span>
          </p>
          <h3>1、单次借阅</h3>
          <p>1)<span class="red">39元</span>/次：每次不超过5本，周期最多不超过一个月；</p>
          <p>2)<span class="red">59元</span>/次：每次不超过10本，周期最多不超过一个月；</p>
          <h3>2、会员计划 - 小博士次卡：</h3>
          <p>1)3次卡:<span class="red">169元</span>,可借3次，每次10本，来回包邮，周期最多不超过一个月；</p>
          <p>2)12次卡:<span class="red">599元</span>,可借12次，每次10本，来回包邮，周期最多不超过一个月；</p>
          <p>* 次卡在不超过总次数的情况下，每月可同时借阅多单，每月借阅次数没有限制；</p>
          <h3>3、会员计划 - 小博士无限次卡：</h3>
          <p>1)季卡：<span class="red">399元</span>,不限次数，每次10本，来回包邮，有效期内归还即可；</p>
          <p>2)年卡：<span class="red">1499元</span>,不限次数，每次10本，来回包邮，有效期内归还即可；</p>
          <p>* 无限次卡可以同时在途两单，到达两单之后，需要归还一单且待平台结算后方可继续借阅；</p>
          <p>所有借阅订单平台均来回包邮，用户在借阅结束后，点我的订单-归还即可完成快递预约，无需支付任何往返邮费；</p>
          <p>新人首次买卡有特殊优惠，可以享受额外折扣；</p>
          <p>具体可联系客服咨询：17706504754（同微信号）</p>
        </div>
        <div :class="{item_b:itemList.item1}" v-if="itemList.item1">
          <img src="../../assets/img/common/server2.png" alt="">
          <p>选择绘本-> 确认下单 -> 支付租金（使用会员卡）->商家发货->用户归还->商家确认 ->借阅结束</p>
        </div>
        <div :class="{item_c:itemList.item2}" v-if="itemList.item2">
          <p>轻微的损坏，只要不影响后续阅读与使用，不需要用户赔偿。如果绘本在使用过程中被人为损坏，影响了后续的借阅与使用，用户可能需要承担相应的赔偿。实际赔偿的价格不会高于其他电商平台零售价格（参考京东，天猫，亚马逊）。
          </p>
        </div>
        <div :class="{item_d:itemList.item3}" v-if="itemList.item3">
          <p>绘本借阅结束后，用户如果需要延长借阅周期，需要提前联系平台进行续租。续租的价格是正常借阅价格的50%。
          </p>
        </div>
        <div :class="{item_e:itemList.item4}" v-if="itemList.item4">
          <p>
            用户如果喜欢我们的绘本，可以选择买下。如需要购买的用户，可点击我的订单进入订单详情进行购买。

          </p>
        </div>
        <div :class="{item_f:itemList.item5}" v-if="itemList.item5">
          <p>
            所有绘本均有专人维护与保养，采用二级臭氧消毒，保障宝宝使用安全；<br>
          </p>
          <p>所有绘本均会更新与维护，确保绘本的整洁与完整；</p>
        </div>
        <div :class="{item_g:itemList.item6}" v-if="itemList.item6">
          <p>用户付款之后，平台没有发货之前，用户可以取消订单，取消订单不收取任何费用。
            <br>&emsp;&emsp;一旦平台发货之后，用户无法取消订单，提前归还不会退还已付租金。
          </p>
        </div>
        <div :class="{item_h:itemList.item7}" v-if="itemList.item7">
          <p>所有订单均往返包邮，无需用户承担任何邮费；绘本借阅到期后，在【我的】 -》【绘本订单】里点击归还，填写相关物流信息，预约快递上门取件就可以了，无需支付任何费用，足不出户，上门送书，上门取件
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;归还地址是系统默认的，不需要用户提供。
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;如果自主叫快递不成功，用户可以直接联系快递，跟快递员说特惠到付就好了。
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;归还地址： 浙江省杭州市余杭区仓前街道龙潭路7号未来研创园A幢307室。
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;收件人：庞雷（博鸟绘本）
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;联系电话： 17767111572
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;注：用户必须一次性归还所有图书，如果由于客户原因，导致图书遗漏或者少寄，用户需要买下相应的图书或者承担额外的快递费用。
          </p>
        </div>
        <div :class="{item_i:itemList.item8}" v-if="itemList.item8">
          <p>
            目前暂不支持新疆，西藏，青海，内蒙古，海南，云南，吉林，黑龙江等省区，后续我们会陆续开放。
          </p>
        </div>
        <div :class="{item_l:itemList.item11}" v-if="itemList.item11">
          <p>
            凡芝麻信用分高于600分的用户，经过平台认证后，均可享受免押金借书服务。用户可以在平台【我的】– 》【芝麻信用】里进行认证。
          </p>
        </div>
        <div :class="{item_j:itemList.item9}" v-if="itemList.item9">
          <p>客服电话：0571-86113050
          </p>
          <p>客服移动电话：17706504754 (同微信号)</p>
          <p>公司地址： 浙江省杭州市余杭区仓前街道龙潭路7号未来研创园A幢207室</p>
        </div>
        <div :class="{item_k:itemList.item10}" v-if="itemList.item10">
          <p>用户在下单可以自主选择借阅时间，借阅时间在首页右上方以及借书架上方均可调整。每次借阅的周期均为1个月。平台会根据用户选择的借阅日期之前，把绘本邮寄到用户手中；用户在借阅日期结束之后第二天绘本寄还给商家。
          </p>
          <p>来回的物流时间均不计算在借阅周期内。</p>

        </div>

    </div>
    <!-- </b-scroll> -->
  </div>
</template>

<script>
//  import BScroll from 'vue-betterscroll';
  import { API} from '../../services';
  import { mapGetters } from 'vuex'
  import BScroll from '../book/common/scrollView.vue';
  import { Cell, Group,XHeader} from 'vux';
//addEventListener('touchmove',function(e){
//  var Y=e.targetTouches[0].clientY;
//  if(Y>100){
//    Y=100+'px'
//  }

//  console.log(document.querySelectorerySelector('.item_a').style.CSSStyleDeclaration );
//  console.log(e.targetTouches[0].clientY)
//  e.preventDefault()
//})
  export default {
    components:{
      BScroll,
      Cell,
      Group,
      XHeader
    },
    data() {
      return {
        address:"所有订单均往返包邮，无需用户承担任何邮费；用户借阅结束后，点击我的订单中归还按钮，预约快递上门取件即可，告诉快递小哥商家到付月结就可以了，无需支付物流费用。",
        titleList: [
          "借阅费用",
          "借阅流程",
          "赔偿政策",
          "续租政策",
          "购买政策",
          "卫生保障",
          "退款退货政策",
          "物流归还",
          "支持地区",
          "联系我们",
          "借阅时间",
          '免押金政策'
        ],
        title:"",
        itemList:{
          item0:false,
          item1:false,
          item2:false,
          item3:false,
          item4:false,
          item5:false,
          item6:false,
          item7:false,
          item8:false,
          item9:false,
          item10:false,
          item11: false
        },
        flgType: false,   //false则不显示头部返回、为true显示头部返回
//        paramId: -1,    //url中id参数值
      }
    },
    created() {
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
    moumted(){

    },
    computed: {
      ...mapGetters([
        'getUserInfoUserId',
        'getUserInfoToken',
        'getAddress',
        'getNamePhone'
      ])},
    activated(){
        this.itemList.item0=false;
        this.itemList.item1=false;
        this.itemList.item2=false;
        this.itemList.item3=false;
        this.itemList.item4=false;
        this.itemList.item5=false;
        this.itemList.item6=false;
        this.itemList.item7=false;
        this.itemList.item8=false;
        this.itemList.item9=false;
        this.itemList.item10=false;
        this.itemList.item11=false;
   setTimeout(()=>{
     this.title=this.$route.params.id;
     this.itemList["item"+this.title]=true;
    if (this.title==10){
      this.itemList.item10=true;
      this.title=10

    }


   },100)
    },
    methods: {
      /* 滚动列表重置刷新 */
      scollRefresh() {
       this.$refs.scollView.scroll.refresh();
      },
    }
  }
</script>
