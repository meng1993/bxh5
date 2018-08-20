<style lang="scss">
.orderInfon_main{
     .weui-cell__ft{
            color: #ff0000;
            font-size: 15px;
        }
        .vux-cell-bd .vux-label{
            font-size:15px !important;
            color:#666;
        }
}
</style>

<style lang="scss" scoped>
.orderInfon_main_priceColl {
    margin: 10px 0 50px;
    .vux-x-textarea {
        height: auto;
    }
}
.orderInfon_main_defaultAddress{
    padding: 12px 15px;
    box-sizing: border-box;
    font-size: 15px;
    color: #333;
    background-color: #fff;
    border-bottom: 1px solid #dfdfdf;
    >span{
        color: #ff0000;        font-size: 15px;
        margin-left: 10px;
    }
}
.orderInfon {
    &_main {
        .weui-cell__ft{
            color: #ff0000;
            font-size: 16px;
        }

        height: calc(100% - 101px);
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
            // border-top: 1px solid #eee;
        }
        &_address {
            background-color: #fff;
            .weui-cell {
                &:nth-of-type(1) {
                    height: 60px;
                }
                &:nth-of-type(2) {
                    height: 60px;
                }
            }
            .nodefault {
                height: 60px !important;
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
            // margin-bottom: 0;
            display: flex;
            justify-content: space-between;
        }
        &_plan{
            height: 44px;
            margin-bottom: 15px;
            .weui-cell{
                padding: 12px 15px;
            }
            .weui-cells{
                &:after{
                    display: none;
                }
            }
        }
    }
    /*&_footer {*/
        /*z-index: 999;*/
        /*height: 50px;*/
        /*line-height: 50px;*/
        /*position: fixed;*/
        /*bottom: 0;*/
        /*left: 0;*/
        /*width: 100%;*/
        /*background-color: #fff;*/
        /*box-shadow: 0 0 2px 1px rgba(0, 0, 0, 0.1);*/
        /*display: flex;*/
        /*&_price {*/
            /*font-size: 18px;*/
            /*color: #333;*/
            /*display: flex;*/
            /*padding: 5px 15px;*/
            /*box-sizing: border-box;*/
            /*line-height: 20px;*/
            /*flex-wrap: wrap;*/
            /*> span {*/
                /*height: 20px;*/
                /*color: #333;*/
                /*&:last-of-type {*/
                    /*color: #ff0000;*/
                /*}*/
            /*}*/
            /*> p {*/
                /*width: 100%;*/
                /*height: 20px;*/
                /*font-size: 14px;*/
                /*color: #999;*/
            /*}*/
        /*}*/
        /*&_btn {*/
            /*font-size: 18px;*/
            /*color: #fff;*/
            /*line-height: 50px;*/
            /*width: 120px;*/
            /*text-align: center;*/
            /*height: 50px;*/
            /*background-color: #2196f3;*/
        /*}*/
        /*&_noControl{*/
            /*font-size: 18px;*/
            /*color: #fff;*/
            /*line-height: 50px;*/
            /*width: 150px;*/
            /*text-align: center;*/
            /*height: 50px;*/
            /*background-color: #a9a9a9;*/
        /*}*/
    /*}*/
    &_footer {
        z-index: 999;
        height: 50px;
        line-height: 50px;
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
                height: 20px;
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
            line-height: 50px;
            width: 120px;
            text-align: center;
            height: 50px;
            background-color: #2196f3;
        }
    }

}
.bookMain_carContent_list{
    // margin-top: 10px;
}
.bookMain_carContent_single{
                height: 75px;
                box-sizing: border-box;
                background-color: #fff;
                padding: 7.5px 15px;
                display: flex;
                align-items: center;
                position: relative;
                border-top: 1px solid #dfdfdf;
                >img{
                    height: 60px;
                    width: 60px;
                    margin-right: 15px;
                }
                >i{
                  color: #666;
                  font-size: 16px;
               }
                >h3{
                    font-size: 16px;
                    color: #666;
                    line-height: 20px;
                    flex-grow: 1;
                }
            }
.orderInfo_main_content {
    height: calc(100% - 107px);
    overflow-y: auto;
    -webkit-overflow-scrolling: touch;
}
</style>

<template lang="pug">
    div
        header-cop(:heder_title="title")
        div.orderInfon_main
            b-scroll(
                :data="localdata.data",
                pulldown=true,
                ref="scollView"
                    )
                div.orderInfo_main_content
                    h3.orderInfon_main_defaultAddress(v-if="!$route.query.id") 配送地址
                      span {{service_area}}
                    group(class="orderInfon_main_address" v-if="!$route.query.id")
                      //-- 用户收货地址 -->
                      cell(v-show="haveDefault" ,:title="getNamePhone",:link="{path:'/addressList?chose=1'}" ,:inline-desc='getAddress')
                      cell(v-show="!haveDefault", class="nodefault", title="请选择收货地址" ,:link="{path:'/addressList?chose=1'}")
                      //-- 选择物流方式 -->
                    //-- 订单列表 -->
                    group(class="orderInfon_main_address" v-if="$route.query.id")
                      cell(v-show="haveDefault" ,:title="getNamePhone",:inline-desc='getAddress')
                    //-- 订单列表 -->
                    ul.bookMain_carContent_list
                        li(v-for="item,index in localdata.data").bookMain_carContent_single
                            img(@load="scollRefresh",:src="imgFormat(item.img_medium)")
                            h3.twonowarp {{item.title}}
                            i(@click="delItem(index)" v-if="!$route.query.id").iconfont &#xe618;
                    //-- 租赁时间 -->
                    div.orderInfon_main_timeRange(v-show="planValue!='小博士季卡' && planValue!='小博士年卡'") 借阅时间：{{rentRange.start}}&nbsp;至&nbsp;{{rentRange.end}}
                        span 共1个月
                    group.orderInfon_main_plan
                        cell(title="选择会员计划",
                        is-link,
                        :link="planLink",
                        :value="planValue"
                        )
                    group(v-show="choosePlan.name")
                        cell(title="运费", :value="0 | currency('￥')")
                        cell(title="商品租金", :value="0 | currency('￥')")
                        cell(title="优惠券", :is-link="true", disabled)
                            span(slot="default", style="color:#999999") 暂无可用
                        cell(title="实际押金", :value="0 | currency('￥')")
                            span(slot="inline-desc", style="color:blue", @click="goAuthInfo()", v-if="zmScore==0") 芝麻信用可减免押金,去授权
                            span(slot="inline-desc", style="color:red", @click="goAuthInfo()", v-else) 平台已为您减免0.00元押金
                    group(v-show="!choosePlan.name")
                        cell(title="运费", :value="freight | currency('￥')")
                        cell(title="商品租金", :value="rent_price | currency('￥')")
                        cell(title="优惠券", :is-link="true",@click.native="cardshow(1)")
                            span(slot="default", style="color:#999999",v-show="this.zjList.length ==0") {{this.zjList.length == 0 ? '暂无可用' : this.zjList.length + '张可用'}}
                            span(slot="default",v-show="this.zjList.length !=0") {{currentPrice < rent_price*-1 ? rent_price*-1 : currentPrice | currency('￥')}}
                        <div v-transfer-dom>
                            <popup style="border-top:1px solid #eee;background:#fff;z-index:99999 ;overflow:hidden" v-model="cardShow" position="bottom" max-height="60%">
                                <ul style="box-sizing:border-box;padding-bottom:60px;max-height:500px;overflow-y:auto;" class="card_main_list">
                                    <li class="card_main_single" v-for="item in cardList" @click="goShop(item,0)">
                                        <img src="~@/assets/img/common/cardbg.png" alt="card">
                                        <div class="card_main_single_box">
                                            <div class="card_main_single_left">
                                                <h3 class="card_main_single_price">￥
                                                    <span>{{item.amount}}</span>
                                                </h3>
                                            </div>
                                            <div class="card_main_single_right">
                                                <template v-if="item.use_range==1">
                                                    <h3 class="card_main_single_title">博鸟绘本红包</h3>
                                                </template>
                                                <template v-else>
                                                    <h3 class="card_main_single_title">店铺红包</h3>
                                                    <h3 class="card_main_single_store">{{item.store_name}}</h3>
                                                </template>
                                                <p class="card_main_single_time nowarp">使用期限：{{item.use_start_time | dataform}}-{{item.use_end_time | dataform}}</p>
                                                <button class="card_main_single_btn" type="button">去使用</button>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                                <button class="orderInfon_main_cardclose" type="button" @click="closeCard">不使用优惠券</button>
                            </popup>
                        </div>
                        cell(title="实际押金", :value="deposit * antDerate | currency('￥')" v-if="!$route.query.id")
                            span(slot="inline-desc", style="color:blue", @click="goAuthInfo()", v-if="zmScore<600") 芝麻信用可减免押金,去授权
                            span(slot="inline-desc", style="color:red", @click="goAuthInfo()", v-else) 平台已为您减免{{deposit - deposit * antDerate}}元押金
                    //-- 收货地址和物流方式 -->
                    group.orderInfon_main_priceColl
                        x-textarea(:max="20", v-model="option", placeholder="买家留言")

        footer.orderInfon_footer
            div.orderInfon_footer_price(v-show="choosePlan.id") 合计：
                span {{localdata.data.length}}本
            button(@click="buygoods", type="button",v-show="canPay && choosePlan.id&&!$route.query.id").orderInfon_footer_btn 借阅
            button(@click="xuzuyongka", type="button",v-show="canPay && choosePlan.id&&$route.query.id").orderInfon_footer_btn 借阅
            button(type="button",v-show="!canPay && !choosePlan.id").orderInfon_footer_noControl 暂不支持该地区
            <!--div.orderInfon_footer_price-->
            <!--span 应付总额：-->
            <!--span {{returnTotal | currency('￥')}}-->
            <!--p 押金可退: {{zmScore>650?0:returnDesopte | currency('￥')}}-->
            <!--button(@click.stop="buygoods", type="button").orderInfon_footer_btn 结算-->
            div.orderInfon_footer_price(v-show="!choosePlan.id")
                span 合计：
                span {{goodsTotolPrice | currency('￥')}}
                p 押金可退：{{deposit * antDerate | currency('￥')}}
            button.orderInfon_footer_btn(@click="buygoods", type="button", v-show="canPay && !choosePlan.id&&!$route.query.id") 提交订单
            button.orderInfon_footer_btn(@click="xuzudingdan", type="button", v-show="canPay && !choosePlan.id&&$route.query.id") 提交订单
            button(type="button",v-show="!canPay && !choosePlan.id").orderInfon_footer_noControl 暂不支持该地区
        toast(v-model="toast",type="success")  {{confrim}}
        actionsheet(v-model="payShow" ,show-cancel ,:menus="menus", @on-click-menu="browserPay" )
</template>
<script>
import { XHeader, Cell, Group, XTextarea, dateFormat ,Actionsheet, Toast,TransferDom, CellBox, Popup } from 'vux';
import { mapGetters } from 'vuex'
import { API, getQuery } from '../../../services';
import HeaderCop from '../common/header.vue';
import BScroll from '../common/scrollView.vue';
export default {
    directives: {
        TransferDom
    },
    components: {
        XHeader,
        Group,
        Cell,
        XTextarea,
        Actionsheet,
        Toast,
        CellBox,
        BScroll,
        HeaderCop,
        Popup,
    },
    data() {
        return {
            canPay:true,
            payShow: false,
            menus: {
              menu1: '微信支付',
              menu2: '支付宝支付'
            },
            confrim: "请选择地址",
            /* 提示信息 */
            toast: false,
            orderLogistics: '/orderLogistics/',
            /* 是否拥有默认数据 */
            haveDefault: false,
            /* 订单详情数据 */
            localdata: {
                data:[]
            },
            /* 买家留言 */
            option: "",
            payMethod: 4,
            title:"确认订单",
            choosePlan:{},
            service_area:"", //支持的地址,
            freight: 0, //运费
            rent_price: 0, //租金
            deposit: 0, //押金
            zmScore: 0, //信用分
            goodsTotolPrice: 0, //合计金额
            antDerate: 1,
            planCount: 0,
            currentPrice: 0, //优惠金额
            cardList: [],
            zjList: [],
            cardShow: false,
            cardstate: {
                id: "",//平台红包
                storeId: "",//店铺红包
            },
            planValue: '',
            planLink: '',
            currentCardType: 0,
        }
    },
    computed: {
        ...mapGetters([
            'getUserInfoUserId',
            'getUserInfoToken',
            'getAddress',
            'getNamePhone'
        ]),
        /* 返回初始和结束周期 */
        rentRange() {
            let self = this;
            let start = this.localdata.time;
            let num = 1;
            /* 获取日月季 */
            let year = new Date(start).getFullYear(),
                month = new Date(start).getMonth() + 1,
                /* 当前天数 */
                day = new Date(start).getDate(),
                /* 获取当前时间数（毫秒） */
                time = new Date(start).getTime();
            let year_3 = Math.floor((month + num) / 12);
            let month_3 = (month + num) % 12;
            if (month_3 == 0) {
                month_3 = 12;
                year_3--;
            }
            let monthTime=new Date(year + year_3 + "/" + month_3 + "/" +day).getTime();
            let end =dateFormat(monthTime-24 * 3600 * 1000, 'YYYY-MM-DD');
            return { start, end };
        },
    },
    methods: {
        // 续租用卡
        xuzuyongka () {
          this.$http.post(`${window.BASE_ROOT}/order/createRenewOrder`, {
            user_id: this.getUserInfoUserId,
            token: this.getUserInfoToken,
            order_id: this.$route.query.id,
            order_type: 1,
            card_id: this.choosePlan.id
          }).then(res => {
            if (res.body.code == 200) {
              this.confrim = res.body.msg;
              this.toast = true;
              setTimeout(() => {
                this.$router.push('/mine_order?status=4')
              }, 2000)
            } else {
              this.confrim = res.body.msg;
              this.toast = true;
            }
          }).catch(res => {

          })
        },
        // 续租用钱
        xuzudingdan () {
          this.$http.post(`${window.BASE_ROOT}/order/createRenewOrder`, {
            user_id: this.getUserInfoUserId,
            token: this.getUserInfoToken,
            order_id: this.$route.query.id,
            order_type: 2
          }).then(res => {
            var  self = this
            API.book.H5Pay({
              userId: this.getUserInfoUserId,
              token: this.getUserInfoToken,
              orderSn: res.body.data.order_sn,
              payMethod: 3,
              openId: window.localStorage.getItem('openId'),
              type: 1,
            }).then((res) => {
              if (res.body.code == 250) {

                self.confrim = "支付完成";
                self.toast = true;
                setTimeout(() => {
                  self.$router.push({
                    path: '/mine_order?status=4'
                  });
                }, 1500);
              } else if (res.body.code == 300) {
                self.confrim = res.body.msg;
                self.toast = true;
                setTimeout(() => {
                  self.$router.push({
                    path: '/mine_order?status=4'
                  });
                }, 1500);
              } else {
                self.payTypeData = res.body;
                self.paydata = res.body;
                if (typeof WeixinJSBridge == "undefined") {
                  if (document.addEventListener) {
                    document.addEventListener('WeixinJSBridgeReady', self.onBridgeReady, false);
                  } else if (document.attachEvent) {
                    document.attachEvent('WeixinJSBridgeReady', self.onBridgeReady);
                    document.attachEvent('onWeixinJSBridgeReady', self.onBridgeReady);
                  }
                } else {
                  self.onBridgeReady();
                }
              }

            }).catch(res => {
              self.confrim = "支付异常";
              self.toast = true;
              self.$router.push({
                path: '/mine_order'
              })
            })
          }).catch(res => {
            self.confrim = "支付异常";
            self.toast = true;
            self.$router.push({
              path: '/mine_order'
            })
          })

        },
        /* 优惠券选择 */
        cardshow(type) {
            this.currentCardType = type;
            type == 1 ? this.cardList = this.zjList : this.cardList = this.storeList;
            if (this.cardList.length == 0) {
                this.confrim = "暂无可用红包";
                this.toast = true;
                return false;
            }
            this.cardShow = true;
        },
      getCardList() {
        /* 平台红包 */
        API.card.storeCard({
          userId: this.getUserInfoUserId,
          token: this.getUserInfoToken,
          goods_type: 1,
          type: 1
        }).then((res) => {
          if (res.body.code == 200) {
            this.cardList = res.body.data
            this.zjList = res.body.data;
          }
        });
      },
        delItem(index){
            let self = this;
            this.$vux.confirm.show({
                /* title: 'Title', */
                content: '确定删除该绘本',
                onConfirm() {
                    /* 点击确认时执行具体删除操作 */
                   self.localdata.data.splice(index,1);
                    localStorage.setItem(
                        "bookOrder",
                        JSON.stringify(self.localdata)
                    );
                   if(self.localdata.data.length==0){
                       self.routerBack();
                   }
                }
            });

        },
        /* 选择完成 */
        // goShop(item) {
        //     /* 当前数据类型为店铺红包 */
        //     if (this.currentCardType == 0) {
        //         this.cardstate.storeId = item.coupon_no;
        //         this.storePrice = 0 - item.amount;
        //         if (this.storePrice + this.goodsAllPrice <= 0) {
        //             this.storePrice = 0 - this.goodsAllPrice;
        //         }
        //         /* 平台红包已经选择的情况下 */
        //         if (this.currentPrice != 0) {
        //             if (this.storePrice + this.goodsAllPrice == 0) {
        //                 this.currentPrice = 0;
        //                 this.cardstate.id = "";
        //             } else {
        //                 this.currentPrice = 0 - (this.goodsAllPrice + this.storePrice);
        //             }
        //         }
        //     } else {
        //         if (this.storePrice + this.goodsAllPrice == 0) {
        //             this.confrim = "已达最大优惠额度";
        //             this.toast = true;
        //             this.cardShow = false;
        //             return false;
        //         } else {
        //             this.cardstate.id = item.coupon_no;
        //             this.currentPrice = 0 - item.amount;
        //             if (this.currentPrice + this.storePrice + this.goodsAllPrice <= 0) {
        //                 this.currentPrice = 0 - (this.goodsAllPrice + this.storePrice);
        //             }
        //         }
        //     }
        //     /* 当前优惠价格 */
        //     let allPrice = this.rent_price + this.currentPrice;
        //     allPrice = (allPrice <= 0 ? 0 : allPrice);
        //     this.goodsTotolPrice =  allPrice + this.freight + (this.deposit * this.antDerate);
        //     this.priceShow = true;
        //     this.cardShow = false;
        // },
      goShop(item, type) {
        /* 当前数据类型为店铺红包 */
        if (type === 1) {
          this.cardstate.id = item.coupon_no;
          this.currentPrice = 0 - item.amount;
          if (this.currentPrice + this.storePrice + this.goodsAllPrice <= 0) {
            this.currentPrice = 0 - (this.goodsAllPrice + this.storePrice);
          }
        } else {
          if (this.currentCardType == 0) {
            this.cardstate.storeId = item.coupon_no;
            this.storePrice = 0 - item.amount;
            if (this.storePrice + this.goodsAllPrice <= 0) {
              this.storePrice = 0 - this.goodsAllPrice;
            }
            /* 平台红包已经选择的情况下 */
            if (this.currentPrice != 0) {
              if (this.storePrice + this.goodsAllPrice == 0) {
                this.currentPrice = 0;
                this.cardstate.id = "";
              } else {
                this.currentPrice = 0 - (this.goodsAllPrice + this.storePrice);
              }
            }
          } else {
            if (this.storePrice + this.goodsAllPrice == 0) {
              this.confrim = "已达最大优惠额度";
              this.toast = true;
              this.cardShow = false;
              return false;
            } else {
              // 这里是点击选中优惠券的地方
              this.cardstate.id = item.coupon_no;
              this.currentPrice = 0 - item.amount;
              if (this.currentPrice + this.storePrice + this.goodsAllPrice <= 0) {
                this.currentPrice = 0 - (this.goodsAllPrice + this.storePrice);
              }
            }
          }
          /* 当前优惠价格 */
          let allPrice = this.rent_price + this.currentPrice;
          allPrice = (allPrice <= 0 ? 0 : allPrice);
          this.goodsTotolPrice =  allPrice + this.freight + this.deposit * this.antDerate;
          this.priceShow = true;
          this.cardShow = false;
        }
      },
        /* 关闭红包选择框 */
        closeCard() {
            /* 撤销店铺红包 */
            if (this.currentCardType == 0) {
                /* 存在平台红包的情况下 */
                if (this.currentPrice != 0) {
                    if (this.currentPrice + this.goodsAllPrice <= 0) {
                        this.currentPrice = 0 - this.goodsAllPrice;
                    } else {
                        for (let item of this.zjList) {
                            if (item.coupon_no == this.cardstate.id) {
                                this.currentPrice = 0 - item.amount;
                            }
                        }
                    }
                }
                this.storePrice = 0;
                this.cardstate.storeId = "";
            } else {
                this.cardstate.id = "";
                this.currentPrice = 0;
            }
            let allPrice = this.rent_price + this.currentPrice;
            allPrice = (allPrice <= 0 ? 0 : allPrice);
            this.goodsTotolPrice =  allPrice + this.freight + (this.deposit * this.antDerate);
            this.cardShow = false;
        },
        goAuthInfo(){
            if (this.zmScore>=600) {
              this.$router.push('/authInfo')
            } else {
              this.$router.push({
                path:"/authPage",
                query: {plan: 'book_bookOrderInfo'}
              })
            }
        },
        /* 滚动列表重置刷新 */
        scollRefresh(){
            /* this.$refs.scollView.scroll.refresh(); */
        },
        routerBack() {
            this.$router.goBack();
        },
        userZMScore() {
            API.person.getUserZMScore({
                user_id: this.getUserInfoUserId
            }).then((res) => {
                if (res.body.code == 200) {
                    if(res.body.msg == "获取成功"){
                        this.zmScore = res.body.data.zmscore;
                        if (this.zmScore >= 600) {
                          this.antDerate = 0;
                        } else {
                          this.antDerate = 1;
                        }
                    }
                }
            })
        },
      browserPay(key) {
        if (key == 'menu1') {
          /* 微信支付 */
          this.payMethod = 2;
        } else if (key == 'menu2') {
          this.payMethod = 4;
        } else {
          return false;
        }
        let self = this;
        let book_ids=[];
        for (const item of this.localdata.data) {
          book_ids.push(item.book_id);
        }
        API.book.createBookOnceOrder({
          address_id:self.$store.state.addressData.id||self.$store.state.addressData.address_id,
          user_id: self.getUserInfoUserId,
          token: self.getUserInfoToken,
          rent_price: this.rent_price,
          deposit: this.deposit * this.antDerate,
          coupon_no: this.cardstate.id,
          freight: this.freight,
          books: book_ids,
          start_date: self.rentRange.start,
          end_date: self.rentRange.end,
          message: self.option,
        }).then((res) => {
          if(res.body.code==200){
            API.book.H5Pay({
              userId: this.getUserInfoUserId,
              token: this.getUserInfoToken,
              orderSn: res.body.data.order_sn,
              payMethod: this.payMethod,
              type: 1,
            }).then((res) => {
              if (res.body.code == 250) {

                self.confrim = "支付完成";
                self.toast = true;
                setTimeout(() => {
                  self.$router.push({
                    path: '/mine_order'
                  });
                }, 1500);
              } else if (res.body.code == 300) {
                self.confrim = res.body.msg;
                self.toast = true;
                setTimeout(() => {
                  self.$router.push({
                    path: '/mine_order'
                  });
                }, 1500);
              } else {
                self.payTypeData = res.body;
                if (key == 'menu1') {
                  window.location.href = this.payTypeData;
                } else if (key == 'menu2') {
                  const div = document.createElement('div');
                  div.innerHTML = this.payTypeData;
                  document.body.appendChild(div);
                  document.forms.alipaysubmit.submit();
                }
              }

            }, (err) => {
              self.confrim = "支付异常";
              self.toast = true;
              self.$router.push({
                path: '/mine_order'
              })
            });
          }else{
            self.confrim = res.body.msg;
            self.toast = true;
            return false;
          }
        })

      },
      onBridgeReady() {
        let self = this;
        WeixinJSBridge.invoke(
          'getBrandWCPayRequest', self.paydata,
          function(res) {
            localStorage.setItem("reload", "1");
            if (res.err_msg == "get_brand_wcpay_request:fail") {
              self.confrim = "支付异常";
              self.toast = true;
              setTimeout(() => {
                self.$router.push({
                  path: '/mine_order'
                })
              }, 1000);
            }
            if (res.err_msg == "get_brand_wcpay_request:cancel") {
              self.$router.push({
                path: '/mine_order'
              })
            }
            if (res.err_msg == "get_brand_wcpay_request:ok") {
              self.confrim = "支付成功";
              self.toast = true;
              setTimeout(() => {
                self.$router.push({
                  path: '/mine_order'
                })
              }, 500);
            }     // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回    ok，但并不保证它绝对可靠。
          }
        );
      },
      // 判断当前浏览器类型
      isAlipay() {
        var userAgent = navigator.userAgent.toLowerCase();
        if (userAgent.match(/Alipay/i) == "alipay") {
          this.payMethod = 4;
          return 1;
        } else if (userAgent.match(/MicroMessenger/i) == "micromessenger") {
          this.payMethod = 3;
          return 0;
        } else {
          return 2;
        }},
        /* 提交订单 */
        buygoods() {
            /* 数值校验 */
            if (this.getAddress == "") {
                this.confrim = "请选择地址";
                this.toast = true;
                return false;
            }
            let self = this;
            let book_ids=[];
            for (const item of this.localdata.data) {
                book_ids.push(item.book_id);
            }
            if (!this.choosePlan.id) {
              if (this.isAlipay() == 0) {
                API.book.createBookOnceOrder({
                  address_id:self.$store.state.addressData.id||self.$store.state.addressData.address_id,
                  user_id: self.getUserInfoUserId,
                  token: self.getUserInfoToken,
                  rent_price: this.rent_price,
                  deposit: this.deposit * this.antDerate,
                  coupon_no: this.cardstate.id,
                  freight: this.freight,
                  books: book_ids,
                  start_date: self.rentRange.start,
                  end_date: self.rentRange.end,
                  message: self.option,
                }).then((res) => {
                  if(res.body.code==200){
                    
                    API.book.H5Pay({
                      userId: this.getUserInfoUserId,
                      token: this.getUserInfoToken,
                      orderSn: res.body.data.order_sn,
                      payMethod:  this.payMethod,
                      openId: window.localStorage.getItem('openId'),
                      type: 1,
                    }).then((res) => {
                      if (res.body.code == 250) {

                        self.confrim = "支付完成";
                        self.toast = true;
                        setTimeout(() => {
                          self.$router.push({
                            path: '/mine_order'
                          });
                        }, 1500);
                      } else if (res.body.code == 300) {
                        self.confrim = res.body.msg;
                        self.toast = true;
                        setTimeout(() => {
                          self.$router.push({
                            path: '/mine_order'
                          });
                        }, 1500);
                      } else {
                        self.paydata = res.body;
                        if (typeof WeixinJSBridge == "undefined") {
                          if (document.addEventListener) {
                            document.addEventListener('WeixinJSBridgeReady', self.onBridgeReady, false);
                          } else if (document.attachEvent) {
                            document.attachEvent('WeixinJSBridgeReady', self.onBridgeReady);
                            document.attachEvent('onWeixinJSBridgeReady', self.onBridgeReady);
                          }
                        } else {
                          self.onBridgeReady();
                        }
                      }

                    }, (err) => {
                      self.confrim = "支付异常";
                      self.toast = true;
                      self.$router.push({
                        path: '/mine_order'
                      })
                    });
                  }else{
                    self.confrim = res.body.msg;
                    self.toast = true;
                    return false;
                  }
                })
              } else if (this.isAlipay() == 1) {

              } else {
                this.payShow = true;
              }

            }else {
                API.book.createOrder({
                    user_id: self.getUserInfoUserId,
                    token: self.getUserInfoToken,
                    address_id:self.$store.state.addressData.id||self.$store.state.addressData.address_id,
                    card_id:self.choosePlan.id,
                    start_date:self.rentRange.start,
                    end_date:self.rentRange.end,
                    books:book_ids,
                    message:self.option,
                }).then((res)=>{
                    if(res.body.code==200){
                        self.$router.push({
                            path:"/book_bookSuccess"
                        })
                    }else{
                        self.confrim = res.body.msg;
                        self.toast = true;
                        return false;
                    }
                })
            }
        },
        /* 数据初始化 */
        Initialization() {
            this.getDefaultAddress();
            if (this.$route.query.id) {

            } else {
              this.getCardList();
            }
        },
        noPlan() {
            let book_ids=[];
            for (const item of this.localdata.data) {
                book_ids.push(item.book_id);
            }
            API.book.getPurchasePackage({
                books: book_ids
            }).then((res) => {
                this.deposit = res.body.data.deposit;
                this.freight = res.body.data.freight;
                if (!this.$route.query.id) {
                  this.rent_price = res.body.data.rent_price;
                } else {
                  this.rent_price = res.body.data.rent_price * 0.8;
                }
                let allPrice = this.rent_price + this.currentPrice;
                allPrice = (allPrice <= 0 ? 0 : allPrice);
                this.goodsTotolPrice =  allPrice + this.freight + (this.deposit * this.antDerate);
            });
        },
        /* 获取用户默认地址，并且出发vuex更新 */
      getDefaultAddress() {
        // API.person.getAddressList({
        //     userId: this.getUserInfoUserId,
        //     token: this.getUserInfoToken,
        // }).then((res) => {
        //     if (res.body.code == 200) {
        //         // for(let key in res.body.data.addressList.data){
        //         //     if(res.body.data.addressList.data[key]['is_set_default'] === 1) {
        //         //         this.haveDefault = true;
        //         //         this.$store.dispatch('SetAddress', res.body.data.addressList.data[key]);
        //         //     }
        //         // }
        //     }
        // });
        API.book.defaultAddress({
          user_id: this.getUserInfoUserId,
          token: this.getUserInfoToken,
        }).then((res) => {
          if (res.body.code == 200) {
            this.service_area=res.body.data.service_area;
            if (res.body.data.default_address == null) {
              this.haveDefault = false
            } else {
              this.haveDefault = true;
              this.$store.dispatch('SetAddress',  res.body.data.default_address);
            }
          }
        });
      },

    },
    mounted() {
      this.Initialization();
      this.getCardList()
    },
  watch: {
    cardList (news) {
      if (news.length === 1) {
        this.goShop(news[0], 1)
      }
    }
  },
  activated() {
    if (this.$route.query.id) {
      this.$http.get(`${window.BASE_ROOT}order/orderDetail?user_id=${this.getUserInfoUserId}&token=${this.getUserInfoToken}&order_id=${this.$route.query.id}`, {
        user_id: this.getUserInfoUserId,
        token: this.getUserInfoToken,
        order_id: this.$route.query.id
      }).then(res => {
        this.$set(this.localdata, 'time',dateFormat(new Date(res.body.data.rent_end_time*1000), 'YYYY-MM-DD'))
        this.$set(this.localdata, 'data',res.body.data.books)
        let  choosePlan=localStorage.getItem("choosePlan");
        if(choosePlan && choosePlan != 'none'){
          this.choosePlan=JSON.parse(choosePlan);
          this.planValue = this.choosePlan.show_name;
          let book_num = this.localdata.data.length;
          this.planLink = '/mine_plan?choose=1&&num='+ book_num;
        } else {
          API.book.myValidCards({
            user_id: this.getUserInfoUserId,
            token: this.getUserInfoToken,
            book_num:this.localdata.data.length,
          }).then((res) => {
            if(res.body.code==200){
              if(JSON.stringify(res.body.data) == "{}"){
                this.planValue = '立即加入会员';
                this.planLink = '/book_bookCard';
                this.noPlan();
              }else {
                let book_num = this.localdata.data.length;
                this.planCount = res.body.data.cards_num;
                if(res.body.data.cards_num == 1 && choosePlan != 'none'){
                  this.choosePlan={
                    name:res.body.data.default_card.name,
                    id:res.body.data.default_card.user_card_id
                  }
                  this.planValue = res.body.data.default_card.show_name;
                  this.planLink = '/mine_plan?choose=1&&num='+ book_num;
                }else{
                  this.planValue = res.body.data.cards_num + '张可选';
                  this.noPlan();
                  this.planLink = '/mine_plan?choose=1&&num='+ book_num;
                }
              }
            }
          })
        }
      }).catch(res => {
        console.log(res)
      })
    }
    this.userZMScore()
    /* 地址点击函数 */
    if (localStorage.getItem('addressClick')) {
      localStorage.setItem('addressClick', '');
      API.book.checkAddress({
        user_id: this.getUserInfoUserId,
        token: this.getUserInfoToken,
        address_id:this.$store.state.addressData.id||this.$store.state.addressData.address_id
      }).then((res) => {
        if (res.body.code != 200) {
          this.confrim=res.body.msg;
          this.canPay=false;
          this.toast=true;
        }else{
          this.canPay=true;
        }
      });
      this.haveDefault = true;
    }
    /* 获取当前数据 */
    if (!this.$route.query.id) {
      this.localdata=JSON.parse(localStorage.getItem("bookOrder"));
    }
    this.choosePlan={};
    if (!this.$route.query.id) {
      let  choosePlan=localStorage.getItem("choosePlan");
      if(choosePlan && choosePlan != 'none'){
        this.choosePlan=JSON.parse(choosePlan);
        this.planValue = this.choosePlan.name;
        let book_num = this.localdata.data.length;
        this.planLink = '/mine_plan?choose=1&&num='+ book_num;
      }else{
        API.book.myValidCards({
          user_id: this.getUserInfoUserId,
          token: this.getUserInfoToken,
          book_num:this.localdata.data.length,
        }).then((res) => {
          if(res.body.code==200){
            if(JSON.stringify(res.body.data) == "{}"){
              this.planValue = '立即加入会员';
              this.planLink = '/book_bookCard';
              this.noPlan();
            }else {
              let book_num = this.localdata.data.length;
              this.planCount = res.body.data.cards_num;
              if(res.body.data.cards_num == 1 && choosePlan != 'none'){
                this.choosePlan={
                  name:res.body.data.default_card.name,
                  id:res.body.data.default_card.user_card_id
                }
                this.planValue = res.body.data.default_card.show_name;
                this.planLink = '/mine_plan?choose=1&&num='+ book_num;
              }else{
                this.planValue = res.body.data.cards_num + '张可选';
                this.noPlan();
                this.planLink = '/mine_plan?choose=1&&num='+ book_num;
              }
            }
          }
        })
      }
    }
  }
}
</script>
