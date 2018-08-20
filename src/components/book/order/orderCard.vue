
<style lang="scss" scoped type="text/scss">
.orderInfon {
  &_main {
    height: calc(100% - 80px);
    box-sizing: border-box;
    overflow-y: auto;
    background-color: #f3f3f3;
    .weui-cells {
      margin: 0;
    }
    .weui-cell:before {
      left: 0;
    }
    .main_since_single {
      margin: 0;
      border-top: 1px solid #eee;
    }
    &_address {
      background-color: #fff;
      .weui-cell {
        &:nth-of-type(1) {
          height: 54px;
        }
        &:nth-of-type(2) {
          height: 34px;
        }
      }
      .nodefault {
        height: 34px !important;
      }
    }
    &_timeRange {
      box-sizing: border-box;
      padding: 0 15px;
      height: 44px;
      line-height: 44px;
      color: #272727;
      font-size: 15px;
      background-color: #fff;
      margin-top: 10px;
      margin-bottom: 0;
      display: flex;
      justify-content: space-between;
    }
    &_plan {
      height: 44px;
      .weui-cell {
        padding: 12px 15px;
      }
      .weui-cells {
        &:after {
          display: none;
        }
      }
    }
  }

  &_footer {
    z-index: 999;
    height: 65px;
    line-height: 65px;
    position: fixed;
    bottom: 0;
    left: 0;
    width: 100%;
    background-color: #fff;
    box-shadow: 0 0 2px 1px rgba(0, 0, 0, 0.1);
    display: flex;
    &_price {
      font-size: 18px;
      color: #333;
      display: flex;
      padding: 5px 15px;
      box-sizing: border-box;
      line-height: 20px;
      flex-wrap: wrap;
      > span {
        height: 15px;
        color: #333;
        &:last-of-type {
          color: #ff0000;
        }
      }
      > p {
        width: 100%;
        height: 20px;
        font-size: 14px;
        color: #999;
      }
    }
    &_btn {
      font-size: 18px;
      color: #fff;
      line-height: 65px;
      width: 120px;
      text-align: center;
      height: 66px;
      background-color: #6fd14e;
    }
  }
}

.bookMain_carContent_list {
  background-color: #f1f1f1;
}
.bookMain_carContent_message {
  padding: 15px;
  box-sizing: border-box;
  > h3 {
    font-size: 16px;
    color: #666;
    margin-bottom: 15px;
  }
  > p {
    font-size: 15px;
    line-height: 20px;
    color: #666;
    margin-bottom: 15px;
    > a {
      color: #2196f3;
    }
  }
  > span {
    line-height: 18px;
    font-size: 14px;
    color: #999;
  }
}
.bookMain_carContent_single {
  background-color: #fff;
  padding: 10px 15px;
  padding-bottom: 5px;
  position: relative;
  margin-bottom: 10px;
  >p{
    font-size: 13px;
    padding: 10px 0;
    color: #777;
    >span{
      color: #f5ab1b;
      font-size: 14px;
    }
  }
  > h2 {
    font-size: 16px;
    color: #333;
    line-height: 35px;
    display: flex;
    align-items: center;
    justify-content: center;
    > i {
      font-size: 18px;
      margin-left: 10px;
      background-color: #f5ab1b;
      color: #fff;
      line-height: 15px;
      height: 18px;
      border-radius: 50%;
    }
  }
  &_content {
  background-image: url('~@/assets/img/common/bg.png');
  background-repeat: no-repeat;
  border-radius: 5px;
  background-size: 100% auto;
  box-sizing: border-box;
    padding: 15px 10px;
    margin-bottom: 10px;
    position: relative;
    > label {
      position: absolute;
      z-index: 999;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
    }
  }
  &_bottom {
    > h3{
      display: flex;
      justify-content: space-between;
      padding: 5px 40px;
      font-size: 16px;
      color: #926b0d
    }
     > h2{
      display: flex;
      justify-content: space-between;
      font-size: 14px;
      padding: 0px 32px;
      color: #b68215
    }
  }
  &_top {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 8px 10px;
    
    // > span {
    // background-color: #2196f3;
    // }
    > input {
      margin-right: 10px;
    }
    > h2 {
      font-size: 18px;
      color: #fff;
      font-weight: 500;
    }
    > h3 {
      flex-grow: 1;
      text-align: right;
      color: red;
    }
    >h4{
      color: #fff;
      padding-left: 3px;
      text-decoration: line-through;
    }
  }
}
.mui-checkbox{
  border: none;
  background-image: url('~@/assets/img/common/checked.png');
  background-size: 100% auto;
  background-repeat: no-repeat;
}
.mui-checkbox--select {
  width: 25px;
  height: 25px;
  display: block;
  position: relative;
  border-radius: 50%;
  background-image: url('~@/assets/img/common/check.png');
  background-size: 100% auto;
  background-repeat: no-repeat;
}
.bookMain_carContent_price {
  height: 44px;
  border-bottom: 1px solid #dadada;
  display: flex;
  justify-content: space-between;
  padding: 0 15px;
  box-sizing: border-box;
  align-items: center;
  background-color: #fff;
  font-size: 16px;
  color: #333;
  > span {
    color: #ff0000;
  }
}
.bookMain_carContent_despote {
  height: 44px;
  border-bottom: 1px solid #dadada;
  display: flex;
  justify-content: space-between;
  padding: 0 15px;
  box-sizing: border-box;
  align-items: center;
  background-color: #fff;
  font-size: 16px;
  color: #333;
  > h3 {
    flex-grow: 1;
    display: flex;
    justify-content: space-between;
    color: #ff0000;
    box-sizing: border-box;
    padding: 0 10px;
    font-size: 14px;
    align-items: center;
    > span:last-of-type {
      font-size: 16px;
    }
  }
  > i {
    color: #999;
    font-size: 18px;
  }
}
.orderInfo_main_content {
  height: calc(100% - 107px);
  overflow-y: auto;
  -webkit-overflow-scrolling: touch;
  >p{
    background-color: #fdf3df;
    text-align: center;
    height: 50px;
    line-height: 50px;
    color:#f09f00;
    >span{
      background-image: url('~@/assets/img/common/light.png');
      background-size: 100% auto;
      background-repeat: no-repeat;
      display: inline-block;
      width: 20px;
      height:20px;
      line-height: 20px;
  }
  }
}
</style>

<template lang="pug">
    div
        header-cop(:heder_title="title")
        div.orderInfon_main
            b-scroll(
                :data="data.card",
                ref="scollView"
                    )
                div.orderInfo_main_content
                    p <span></span> 往返包邮，芝麻免押，正版图书，全面消毒
                    ul.bookMain_carContent_list
                        li(v-for="ite,index in data.card" ,v-show="ite.name").bookMain_carContent_single
                            h2 {{ite.name}}
                                i(@click="enterInfo(ite)").iconfont &#xe602;
                            .bookMain_carContent_single_content(v-for="item,inde in ite.child",@click="itemChange(index,inde)")
                                .bookMain_carContent_single_top(style="position:relative;")
                                    h2 {{item.name}}                                
                                    h3 {{item.price | currency('￥')}}
                                    h4 {{item.origin_price | currency('￥')}}
                                    span(style="position:absolute;right:-10px;top:-12px").mui-checkbox
                                      span(:class="{'mui-checkbox--select':item.click==1}").smlle
                                .bookMain_carContent_single_bottom
                                    h3
                                        span {{item.one_rent_num}}本  
                                        span {{item.total_use_times==0?'无限':item.total_use_times}}次
                                        span {{item.type==1?"1":item.type==2?"90":item.type==3?"6":"365"}}天
                                    h2 
                                        span 每次可借  
                                        span 借阅次数
                                        span 有效天数
                            p(v-show="ite.g==4") <span>无限次卡借阅须知：</span>用户同时在途订单（未结算）最多不超过两单。在途订单达到两单以后，用户需要归还部分在途订单并由平台确认结算后才能继续借阅。 
                            p(v-show="ite.g!=4") <span>次卡借阅须知：</span>在不超过总次数的情况下，用户可以同时借阅多单，每月借阅次数没有限制。
                    .bookMain_carContent_price
                        |价格
                        span  {{returnPrice | currency('￥')}}
                    .bookMain_carContent_despote(@click="authorization")
                        |押金
                        h3(v-show="zmScore<600")
                            span 芝麻信用600分以上免押金
                            span {{returnDesopte | currency('￥')}}
                        h3(v-show="zmScore>=600")
                            span 芝麻信用已为您减免押金{{returnDesopte}}元
                            span ￥0.00
                        i.iconfont &#xe6d7;
                    .bookMain_carContent_message
                        h3 说明
                        p 订阅计划一旦购买生效使用后，不可退订。购买前请详细阅读
                            router-link(to="/book_rule?type=H5",class="") 订阅计划使用规则与政策
        footer.orderInfon_footer
            div.orderInfon_footer_price
                span 总价：
                span {{returnTotal | currency('￥')}}
                p 押金可退: {{zmScore>650?0:returnDesopte | currency('￥')}}
            button(@click.stop="buygoods", type="button").orderInfon_footer_btn 开通并支付
        toast(v-model="toast",type="success")  {{confrim}}
</template>
<script>
import {
  XHeader,
  Cell,
  Group,
  XTextarea,
  dateFormat,
  Toast,
  CellBox
} from "vux";
import { mapGetters } from "vuex";
import { API, getQuery } from "../../../services";
import HeaderCop from "../common/header.vue";
import BScroll from "vue-betterscroll";
export default {
  components: {
    XHeader,
    Group,
    Cell,
    XTextarea,
    Toast,
    CellBox,
    BScroll,
    HeaderCop
  },
  data() {
    return {
      // wxIsShow:true,//判读是否为微信浏览器
      confrim: "请选择地址",
      /* 提示信息 */
      toast: false,
      /* 是否拥有默认数据 */
      haveDefault: false,
      /* 订单详情数据 */
      data: {
        card: [
          {
            name: "新人体验计划",
            select: [],
            child: []
          },
          {
            name: "小状元计划说明",
            select: [],
            child: []
          },
          {
            name: "小博士计划说明",
            select: [],
            child: []
          }, 
          {
            name: "小博士套餐说明",
            select: [],
            child: []
          }
        ]
      },
      title: "选择会员计划",
      zmScore: 0
    };
  },
  computed: {
    ...mapGetters([
      "getUserInfoUserId",
      "getUserInfoToken",
      "getAddress",
      "getNamePhone",
      "getIsCertify"
    ]),
    returnDesopte() {
      let couter = 0;
      for (let item of this.data.card) {
        for (let ite of item.child) {
          if (ite.click == 1) {
            couter += ite.deposit - 0;
          }
        }
      }
      return couter;
    },
    returnPrice() {
      let couter = 0;
      for (let item of this.data.card) {
        for (let ite of item.child) {
          if (ite.click == 1) {
            couter += ite.price - 0;
          }
        }
      }
      return couter;
    },
    returnTotal() {
      if (this.zmScore == 0) {
        return this.returnPrice + this.returnDesopte;
      } else {
        return this.returnPrice;
      }
    }
  },
  methods: {
    itemChange(ite, index) {
      //ite是类别，index是卡号
      this.data.card[ite].child[index].click =
        this.data.card[ite].child[index].click || 0;
      this.data.card[ite].child[index].click =
        1 - this.data.card[ite].child[index].click;
        this.data.card.forEach((t,i)=>{
        t.child.forEach((t2,i2)=>{
        if(i==ite&&i2==index){}
          else{
          this.data.card[i].child[i2].click = 0;  
        } 
        })
        })
      let currentData = this.data;
      this.data = {};
      this.data = currentData;
    },
    /* 进入会员卡说明页面 */
    enterInfo(item) {
      localStorage.setItem("cardInfo", JSON.stringify(item));
      console.log(item)
      if(item.g==4){
        this.$router.push({
        path: "/book_rule?type=H52"
      });
      }else{
        this.$router.push({
        path: "/book_rule?type=H5"
      });
      }
    },
    /* 芝麻信用授权 */
    authorization() {
      if (this.zmScore >= 600) {
        this.$router.push({
          path: "/authInfo"
        });
      } else {
        this.$router.push({
          path: "/authPage",
          query: { plan: 'book_bookCard' }
        });
      }
    },
    /**@argument
         * 获取芝麻信用分
         */
    userZMScore() {
      API.person
        .getUserZMScore({
          user_id: this.getUserInfoUserId,
          zmtype: 2 //添加从绘本进入芝麻信用标记字段
        })
        .then(res => {
          if (res.body.code == 200) {
            if (res.body.msg == "获取成功") {
              this.zmScore = res.body.data.zmscore;
            }
          }
        });
    },
    /**@argument
         * 选择框改变
         */
    /**@argument
         * 滚动列表重置刷新
         */
    scollRefresh() {
      this.$refs.scollView.scroll.refresh();
    },
    routerBack() {
      this.$router.goBack();
    },
    /**@argument
         * 提交订单
         */
    buygoods() {
        let user = window.localStorage.getItem("userInfo");
        if (!user) {
            this.$router.push({path:'/login',query:{return_url:window.location.href}});
        } else {
            // if(this.getIsCertify!=2&&this.getIsCertify!=4){
            //     this.$router.push({
            //         path:'/authPage'
            //     });.
            //     return false;
            // }
            let resultList = [];
            for (let item of this.data.card) {
                for (let ite of item.child) {
                    if (ite.click == 1) {
                        resultList.push(ite);
                    }
                }
            }
            if (resultList.length == 0) {
                this.confrim = "您未选择任何套餐";
                this.toast = true;
                return false;
            }
            if (resultList.length > 1) {
                this.confrim = "最多只能购买1个套餐";
                this.toast = true;
                return false;
            }
            localStorage.setItem("resultList", JSON.stringify(resultList));
            window.location.href = "/?#/book_bookCardInfo";
        }
    },
    /**@argument
         * 数据格式化
         */
    dataForm(data) {
      let list = [
        {
          name: "",
          select: [],
          child: []
        },
        {
          name: "",
          select: [],
          child: []
        },
        {
          name: "",
          select: [],
          child: []
        },
         {
          name: "",
          select: [],
          child: []
        }
      ];
      for (let item of data) {
        if (item.rank == 4) {
          list[0].child.push(item);
          list[0].name = "小博士无限次卡";
          list[0].g=4;
        } else if (item.rank == 1) {
          list[2].child.push(item);
          list[2].name = "小状元计划";
          list[0].g=1;
        } else if (item.rank == 2) {
          list[1].child.push(item);
          list[1].name = "小博士计划";
          list[0].g=2;
        }else if(item.rank == 3){
          list[3].child.push(item);
          list[3].name = item.name;
        }
      }
      this.data.card = list;
    },
    /**@argument
         * 数据初始化
         */
    Initialization() {
      API.book
        .getCardList({
          user_id: this.getUserInfoUserId,
          token: this.getUserInfoToke,
          version:'2.0.2'
        })
        .then(res => {
          if (res.body.code == 200) {
            this.data = res.body.data;
            /* 把数据格式化 */
            this.dataForm(this.data.card);
          } else {
            alert(JSON.stringify(res.body));
          }
        })
        .then(() => {
          this.userZMScore();
        });
    } /* 判断当前；浏览器环境  0 微信 1 支付宝 2 其他浏览器*/
    //        isAlipay() {
    //            var userAgent = navigator.userAgent.toLowerCase();
    //            if (userAgent.match(/Alipay/i) == "alipay") {
    //                this.payMethod = 4;
    //                return 1;
    //            } else if (userAgent.match(/MicroMessenger/i) == "micromessenger") {
    //                this.payMethod = 3;
    //                return 0;
    //            } else {
    //                return 2;
    //            }
    //       }
  },
  mounted() {
    //    获取购买来源
    //             if (location.hash.indexOf('p=')!=-1) {
    //                let buyCardFrom=window.location.hash.substring(location.hash.indexOf('p=')-0);
    //                var reg = new RegExp("(^|&)" + "p" + "=([^&]*)(&|$)", "i");
    //                buyCardFrom=buyCardFrom.match(reg)[2]
    //                window.localStorage.setItem("buyCardFrom",buyCardFrom)

    //             }
    //        this.$http.post()
    this.Initialization();
    /* if(getQuery.isAlipay()==0){//判断浏览器是微信不显示
            // this.wxIsShow=false
            this.zmScore=0;
            }*/
  },
  activated() {}
};
</script>
