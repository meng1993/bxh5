<style lang="scss" scoped>
.order {
    &_container {
        height: calc(100% - 50px);
        background-color: #f1f1f1;
    }
    &_list {
        position: static;
    }
    &_single {
        &_bookList {
            transition: all 0.15s ease-in;
            &--height {
                height: 105px;
                overflow: hidden;
            }
        }
        &_shop {
            height: 44px;
            display: flex;
            justify-content: space-between;
            padding: 0 15px;
            align-items: center;
            font-size: 16px;
            color: #333;
            box-sizing: border-box;
            >span {
                color: #ff0000;
            }
        }
        &_bookSingle {
            height: 105px;
            box-sizing: border-box;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            background-color: #efefef;
            border-bottom: 1px solid #fff;
            >img {
                height: 85px;
                width: 85px;
                display: block;
                margin-right: 10px;
            }
        }
        &_content {
            border: none;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            width: calc(100% - 95px);
            height: 100%;
            padding: 0;
            >h4 {
                color: #666;
                font-size: 14px;
                line-height: 16px;
            }
            >p {
                font-size: 12px;
                color: #999;
            }
            >ul {
                height: 15px;
                display: flex;
                width: calc(100% - 95px);
                padding: 0;
                >h4 {
                    color: #666;
                    font-size: 16px;
                    line-height: 16px;
                }
                >p {
                    font-size: 12px;
                    color: #999;
                }

                >li {
                    height: 15px;
                    border-radius: 3px;
                    padding: 0 5px;
                    font-size: 13px;
                    color: #999;
                    background-color: #fbfbfb;
                    line-height: 15px;
                    margin-right: 5px;
                }
                >button {
                    width: 50px;
                    height: 15px;
                    border: 1px solid #2196f3;
                    box-sizing: border-box;
                    position: absolute;
                    right: 0;
                    font-size: 9px;
                    color: #2196f3;
                    bottom: 0;
                    border-radius: 5px;
                    text-align: center;
                    line-height: 13px;
                }
            }
            &_haveMore {
                height: 25px;
                line-height: 25px;
                display: flex; flex-direction: column;
                justify-content: space-between;
                width: calc(100% - 95px);
                height: 100%;
                padding: 0;
                >h4 {
                    color: #666;
                    font-size: 16px;
                    line-height: 16px;
                }
                >p {
                    font-size: 12px;
                    color: #999;
                }
                >ul {
                    height: 15px;
                    display: flex;
                    position: relative;
                    >li {
                        height: 15px;
                        border-radius: 3px;
                        padding: 0 5px;
                        font-size: 16px;
                        color: #999;
                        background-color: #eee;
                        line-height: 15px;
                        margin-right: 5px;
                    }
                    >button {
                        width: 50px;
                        height: 15px;
                        border: 1px solid #2196f3;
                        box-sizing: border-box;
                        position: absolute;
                        right: 0;
                        font-size: 9px;
                        color: #2196f3;
                        bottom: 0;
                        border-radius: 5px;
                        text-align: center;
                        line-height: 13px;
                    }
                }
            }
            &_haveMore {
                height: 25px;
                line-height: 25px;
                display: flex;align-items: center;
                justify-content: center;
                border-bottom: 1px solid #efefef;
                >i {
                    font-size: 20px;color: #999;
                    background-color: #eee;
                    line-height: 15px;
                    margin-right: 5px;
                }
                >button {
                    width: 50px;
                    height: 15px;
                    border: 1px solid #2196f3;
                    box-sizing: border-box;
                    position: absolute;
                    right: 0;
                    font-size: 9px;
                    color: #2196f3;
                    bottom: 0;
                    border-radius: 5px;
                    text-align: center;
                    line-height: 13px;
                }
            }
        }
        &_haveMore {
            height: 25px;
            line-height: 25px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-bottom: 1px solid #efefef;
            >i {
                font-size: 20px;
                color: #999;
            }
            &--height {
                transform: rotate(180deg);
            }
        }
        &_btnlist {
            height: 35px;
            padding: 0 15px;
            box-sizing: border-box;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            >button {
                margin-left: 15px;
                height: 25px;
                width: 75px;
                border: 1px solid #2196f3;
                color: #2196f3;
                font-size: 13px;
                line-height: 25px;
                text-align: center;
                border-radius: 4px;
            }
        }
    }
}

.bookMain_nodata {
    height: 100%;
    display: flex;
    align-items: center;
    flex-direction: column;
    >i {
        margin-top: 150px;
        font-size: 160px;
        font-weight: 100;
        color: #dadada;
        display: block;
    }
    >h3 {
        font-size: 16px;
        margin-top: 25px;
        margin-bottom: 40px;
        color: #666;
        text-align: center;
    }
    >a {
        height: 50px;
        width: 150px;
        border-radius: 10px;
        background-color: #2196f3;
        font-size: 16px;
        color: #fff;
        text-align: center;
        line-height: 50px;
    }
}
</style>
<template lang="pug">
    .order_main
        header-cop(:heder_title="title")
        .order_container
            b-scroll(
                    :data="bookList",
                    pullup=true,
                    pulldown=true,
                    @pulldown="listRefresh",
                    @scrollToEnd="getList",
                    ref="scollView",
                    :swiper_pullUp="swiper_pullUp",
                    :swiper_nodata="swiper_nodata"
                    )
                .bookMain_nodata(v-show="haveData")
                    i(class="iconfont")  &#xe62a;
                    h3.bookMain_nodata_title 您还没有任何订单，快去借阅吧

                ul.order_list
                    li(v-for="item in bookList").order_single
                        .order_single_shop
                            h2 {{item.store_name}}
                            h2 {{item.card_name}}
                            span {{typeList[item.status]}}
                        ul.order_single_bookList(@click="getInfo(item.order_id)",:class="{'order_single_bookList--height':!item.isHeight}")
                            li(v-for="ite in item.books").order_single_bookSingle
                                img(:src="imgFormat(ite.img_medium)").order_single_img
                                .order_single_content
                                    h4.book_common_title.twonowarp {{ite.title}}
                                    p.book_common_info.nowarp  {{ite.summary}}
                                    ul.book_common_typeList
                                        li.book_common_typeSingle {{ite.age_range}}
                                        li.book_common_typeSingle(v-show="ite.category") {{ite.category}}
                        .order_single_haveMore(v-show="item.books.length>1")
                            i.iconfont(@click="maxHeight(item)",:class="{'order_single_haveMore--height':item.isHeight}") &#xe619;
                        .order_single_time(v-show="item.rank!=4")
                            span {{item.rent_start_time | dataform}} 至 {{item.rent_end_time | dataform }}
                            span {{item.name}}共1个月
                        .order_single_time(v-show="item.rank==4")
                            span 借阅时间 : {{item.rent_start_time | dataform}}
                        .order_single_btnlist
                            button(type=button,@click="remind(item.order_id,1)",v-show="item.status==2")  提醒发货
                            button(type=button,@click="cancelOrder(item.order_id)",v-if="item.status==2&&item.pay_type==0")  取消订单
                            button(type=button,@click="xuzu(item.order_id)",v-if="item.status==4&&item.returning==0") 续租
                            button(type=button,@click="jiaokuaidi(item.order_id)",v-if="item.status==4&&item.returning==0") 归还
                            button(type=button,@click="guihuanzhong(item.express_order,item.order_id)",v-if="item.status==4&&item.returning==1") 归还中
                            <!--button(type=button,@click="jiaokuaidi(item.order_id)",v-if="item.status==4")  一键叫快递-->
                            <!--button(type=button,@click="shenqingtuikuan (item.order_id)",v-if="item.pay_type>0&&item.status==2")  申请退款-->
                            <!--button(type=button,@click="seeLogistics(item.order_deliver_expressid,item.order_logistics_name,item.order_deliver_company)",v-show="item.status==3")  查看物流-->
                            button(type=button,@click="seeLogistics(item.order_deliver_expressid,item.order_logistics_name,item.order_deliver_company)"
                            ,v-show="item.status==3") 查看物流
                            button(type=button,@click="confrimOrder(item.order_id)",v-show="item.status==3")  确认收货
                            <!--button(type=button,@click="confirmReturn(item)",v-show="item.status==4")  归还-->
                            button(type=button,@click="remind(item.order_id,2)",v-show="item.status==5")  提醒结算
                            button(type=button,@click="comment(item.order_id)",v-show="item.status==7")  去评价
                            button(type=button,@click="deletOrder(item.order_id)",v-show="item.status==8||item.status==9 || item.status==1 || item.status==12")  删除订单
                            button(type=button,@click.prevent="payOrder(item.order_sn)",v-show="item.status==1")  付款
                            button(type=button,@click="mycomment(item.order_id)",v-show="item.status==8")  我的评价

                toast(v-model="toast" , type="success") {{confrim}}
                actionsheet(v-model="payShow" ,show-cancel ,:menus="menus", @on-click-menu="browserPay" )
    </div>
</template>

<script>
import HeaderCop from '../common/header.vue';
import BScroll from 'vue-betterscroll';
import { Scroller, XImg, Masker, Spinner, XButton, Actionsheet, Group, Cell, LoadMore, Toast } from 'vux';
import { mapGetters } from 'vuex';
import { API, getQuery } from '../../../services';

export default {
    components: {
        XImg,
        LoadMore,
        Actionsheet,
        Scroller,
        Masker,
        Spinner,
        XButton,
        Group,
        Cell,
        Toast,
        BScroll,
        HeaderCop
    },
    data() {
        return {
            payShow: false,
            menus: {
              menu1: '微信支付',
              menu2: '支付宝支付'
            },
            id: 0,
            title: "我的订单",
            haveData: false,//是否有数据
            page: 1,
            /* 上拉加载更多 */
            swiper_pullUp: false,//显示加载
            swiper_nodata: false,//没有更多数据
            bookList: [],//数据列表
            typeList: [
                "", "待付款", "待发货", "待确认收货", "待归还", "待结算", "", "待评价", "已完成", "订单取消", '', '退款处理中', '退款完成'
            ],//状态列表
            confrim: "",
            toast: false,
            scrollTop: 0,
            onFetching: false,
            page: 1,
            orderId: null,
            loading: false,
        }
    },
    computed: {
        ...mapGetters([
            'getUserInfoUserId',
            'getUserInfoToken',
        ]),
    },
    mounted() {

    },
    activated() {
        let qxcarList=localStorage.getItem("qxcarList");
        if(qxcarList!=""){
            this.qxcarList=localStorage.getItem("qxcarList");
            localStorage.removeItem("qxcarList");
        }else{
            this.qxcarList="";
        }
        

        this.listRefresh();
    },
    methods: {
      // 续租
      xuzu (id) {
        this.$router.push(`/book_bookOrderInfo?id=${id}`)
      },
      // 归还中
      guihuanzhong (item,id){
        this.$router.push(`/guihuanzhong?xinxi=${JSON.stringify(item)}&orderId=${id}`)
      },
      // 一键叫快递
      jiaokuaidi (item) {
        this.$router.push({
          path: '/jiaokuaidi',
          query: {'orderId': item}
        })
      },
        maxHeight(item) {
            item.isHeight = !item.isHeight;
            let data = this.bookList;
            this.bookList = [];
            this.bookList = data;
            setTimeout(()=>{
                this.scollRefresh();
            },20);
        },
        /**
         * 进入订单详情
         */
        getInfo(id) {
            this.$router.push({
                path: '/book_bookOrderMessage/' + id
            });
        },
        /**@argument
       * 列表刷新
       */
        listRefresh() {
            this.swiper_nodata = false;
            this.page = 1;
            this.bookList = [];
            this.getList();
        },
        /**@argument
          * 获取我的计划列表
          */
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
                setTimeout(() => {book
                  self.$router.push({
                    path: '/mine_order'
                  })
                }, 0);
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
        getList() {
            if (this.loading) {
                return false;
            }
            this.loading = true;
            if (this.bookList.length >= 10) {
                this.swiper_pullUp = true;
                this.swiper_nodata = false;
            }
            API.book.orderList({
                page: this.page,
                page_number: 10,
                user_id: this.getUserInfoUserId,
                token: this.getUserInfoToken,
                order_status:this.$route.query.status,
                cards:this.qxcarList
            }).then((res) => {
                if (res.body.code == 200) {
                    let time = 0;
                    if (this.bookList.length != 0) {
                        time = 500;
                    }
                    setTimeout(() => {
                        if (res.body.data.length > 0) {
                            this.swiper_pullUp = false;
                            this.bookList = this.bookList.concat(res.body.data);
                            this.page++;
                        } else {
                            this.swiper_pullUp = false;
                            if (this.bookList.length >= 10) {
                                this.swiper_nodata = true;
                            }
                        }
                        this.$nextTick(() => {
                            this.scollRefresh();
                            this.loading = false;
                        });

                        if (this.bookList.length == 0) {
                            this.haveData = true;
                        } else {
                            this.haveData = false;
                        }

                    }, time);
                }
            })
        },
        /* 滚动列表重置刷新 */
        scollRefresh() {
            this.$refs.scollView.scroll.refresh();
        },
        /* 删除订单 */
        deletOrder(id) {
            let self = this;
            this.$vux.confirm.show({
                /* title: 'Title', */
                content: '确定要删除该订单吗',
                onConfirm() {
                    /* 点击确认时执行具体删除操作 */
                    API.book.orderDel({
                        user_id: self.getUserInfoUserId,
                        token: self.getUserInfoToken,
                        order_id: id,
                    }).then((res) => {
                        if (res.body.code == 200) {
                            self.confrim = "删除成功";
                            self.toast = true;

                            self.listRefresh();
                        }
                    });
                }
            });

        },
        /**取消订单 */
        cancelOrder(id) {
            let self = this;
            this.$vux.confirm.show({
                /* title: 'Title', */
                content: '确定要取消该订单吗?',
                onConfirm() {
                    /* 点击确认时执行具体删除操作 */
                    API.book.orderCancel({
                        user_id: self.getUserInfoUserId,
                        token: self.getUserInfoToken,
                        order_id: id,
                    }).then((res) => {
                        if (res.body.code == 200) {
                            self.confrim = "取消成功";
                            self.toast = true;

                            self.listRefresh();
                        }
                    });
                }
            });
        },
        /* 确认收货 */
        confrimOrder(id) {
            let self = this;
            this.$vux.confirm.show({
                /* title: 'Title', */
                content: '是否确认收货',
                onConfirm() {
                    /* 点击确认时执行具体删除操作 */
                    API.book.orderreceipt({
                        user_id: self.getUserInfoUserId,
                        token: self.getUserInfoToken,
                        order_id: id,
                    }).then((res) => {
                        if (res.body.code == 200) {
                            self.confrim = "确认收货成功";
                            self.toast = true;
                            /**@argument
                           * 此处进行删除后的重置工作
                           */
                            self.listRefresh();
                        }
                    });
                }
            });
        },
        /* 确认归还 */
        confirmReturn(item) {
            /* * sinceId 自提点编号
            * expressId 物流单号
            * logisticsName 物流公司简拼
            * revertId 归还地址编号
            * company 物流公司名 */
            let self = this;
            this.$router.push({ path: '/orderReturn?orderId=' + item.order_id + '&from=book&book_id=' + item.books[0].book_id });
        },
        /* 提醒发货 ,结算 1-提醒发货2-提醒结算*/
        remind(id, type) {
            let self = this;
            API.book.subOrderMsg({
                user_id: self.getUserInfoUserId,
                token: self.getUserInfoToken,
                order_id: id,
                type: type,
            }).then((res) => {
                if (res.body.code == 200) {
                    if (type == 1) {
                        self.confrim = "提醒发货成功";
                    } else {
                        self.confrim = "提醒结算成功";
                    }
                    self.toast = true;
                }
            });
        },
              /* 评价, */
        comment(order_id) {
            this.$router.push({
            name: 'B_mine_putcomment',
            params:{'order_id': order_id}

            });
        },
            /* 评价内容 */
        mycomment(order_id) {
            this.$router.push({
            name: 'B_mine_commentlist',
            params:{'order_id': order_id}
            });
        },
        /* 查看物流,评价, */
        download(id) {
            this.$router.push({
                path: '/download'
            });
        },
        // 判断浏览器的类型
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
          API.book.H5Pay({
            userId: self.getUserInfoUserId,
            token: self.getUserInfoToken,
            orderSn: self.id,
            payMethod: self.payMethod,
            type: 1
          }).then((res) => {
            if (res.body.code == 250) {
              self.confrim = "支付完成";
              self.toast = true;
              setTimeout(() => {
               this.$router.go(0)
              }, 1500);
            } else if (res.body.code == 300) {
              self.confrim = res.body.msg;
              self.toast = true;
              setTimeout(() => {
                this.$router.go(0)
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
            this.$router.go(0)
          });
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
        /* 付款 */
        payOrder(id) {
          let self = this;
          this.id = id
          if (this.isAlipay() == 0) {
            API.book.H5Pay({
              userId: self.getUserInfoUserId,
              token: self.getUserInfoToken,
              orderSn: id,
              payMethod: self.payMethod,
              openId: localStorage.getItem('openId'),
              type: 1
            }).then((res) => {
              if (res.body.code == 250) {
                self.confrim = "支付完成";
                self.toast = true;
                setTimeout(() => {
                  this.$router.go(0)
                }, 1500);
              } else if (res.body.code == 300) {
                self.confrim = res.body.msg;
                self.toast = true;
                setTimeout(() => {
                  self.listRefresh();
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
              self.listRefresh();
            });
          } else if (this.isAlipay() ==1) {

          } else {
            this.payShow = true;
          }
        },
        seeLogistics(id,name,company){//查看物流
            this.$router.push({
              path: '/seeLogistics/'+id+'/'+name+'/'+company
            })
        }
    }
}



</script>

