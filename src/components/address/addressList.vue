<style lang="scss">
.weui-dialog__btn_primary {
    color: #2196f3 !important;
}

.addressList {
    &_main {
        background-color: #f3f3f3;
        height: 100%;
        overflow-y: auto;
         -webkit-overflow-scrolling : touch;
        .vux-check-icon>.weui-icon-success:before,
        .vux-check-icon>.weui-icon-success-circle:before {
            color: #2196f3;
        }
        .weui-dialog__btn_primary {
            color: #2196f3;
        }
        .weui-loadmore_line .weui-loadmore__tips{
            background-color: #f3f3f3 !important;
        }
    }
    &_confrim {
        height: 70%;
        display: flex;
        flex-direction: column;
        align-items: center;
        font-size: 15px;
        justify-content: center;
        color: #272727;
        >i {
            font-size: 150px;
            color: #c1c1c1;
        }
    }
    &_addBtn {
        height: 50px;
        font-size: 18px;
        background: #2196f3;
        line-height: 50px;
        text-align: center;
        width: 100%;
        display: block;
        position: fixed;
        bottom: 0;
        left: 0;
        color: #fff;
        z-index:99999;
    }
    &_list {
        padding-bottom: 70px;
    }
    &_single {
        display: flex;
        flex-wrap: wrap;
        max-height: 150px;
        min-height: 120px;
        background-color: #fff;
        box-sizing: border-box;
        padding: 0 15px;
        justify-content: center;
        margin-bottom: 10px;
        font-size: 15px;
        align-items: center;
        color: #272727;
        &_name {
            display: block;
            width: 50%;
            line-height: 50px;
            height: 50px;
        }
        &_phone {
            display: block;
            width: 50%;
            line-height: 50px;
            text-align: right;
            height: 50px;
        }
        &_address {
            display: block;
            width: 100%;
            max-height: 60px;
            min-height: 30px;
            line-height: 30px;
        }
        &_action {
            height: 40px;
            width: calc(100% + 30px);
            margin: 0 -15px;
            box-sizing: border-box;
            padding: 0 15px;
            display: flex;
            border-top: 1px solid #eee;
            align-items: center;
            >span:nth-of-type(1) {
                flex-grow: 1;
                display: flex;
            }
            >span:nth-of-type(2) {
                flex-grow: 0;
                width: 60px;
                display: flex;
                align-items: center;
                justify-content: space-between;
                box-sizing: border-box;
                margin-right: 10px;
            }
            >span:nth-of-type(3) {
                flex-grow: 0;
                width: 55px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                box-sizing: border-box;
            }
        }
        &_icon {
            height: 18px;
            width: 18px;
            border: 2px solid #dddddd;
            border-radius: 3px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 5px;
            >i {
                display: none;
            }
            &--default {
                border-color: #2196f3;
                background-color: #2196f3;
                >i {
                    color: #fff;
                    display: block;
                }
            }
        }
    }
}
</style>

<template>
    <div>
        <div class="addressList_main">
            <div class="help_common_title">
                <x-header @on-click-back="routerBack" :left-options="{backText: '',preventGoBack:true}">我的地址</x-header>
            </div>
            <!-- 我的收获地址列表 -->
            <ul class="addressList_list">
                <li v-for="(item,index) in addressList.data" @click="chooseAddress(item)" class="addressList_single">
                    <span class="addressList_single_name">{{item.address_name}}</span>
                    <span class="addressList_single_phone">{{item.mobile}}</span>
                    <span class="addressList_single_address twonowarp">
                        {{item.province}}{{item.city}}{{item.district}}{{item.address}}
                    </span>
                    <div class="addressList_single_action">
                        <span>
                            <span @click.stop="checkDefault(item.id,index)" :class="{'addressList_single_icon--default':item.is_set_default==1}" class="addressList_single_icon">
                                <i class="iconfont">&#xe60d;</i>
                            </span> 默认地址
                        </span>
                        <span @click.stop="editAddress(item.id)">
                            <i class="iconfont">&#xe609;</i>
                            编辑
                        </span>
                        <span @click.stop="deletAddress(item.id,index)">
                            <i class="iconfont">&#xe618;</i>
                            删除
                        </span>
                    </div>
                </li>
            </ul>
            <div v-show="addressList.data.length<=0" class="addressList_confrim">
                <i class="iconfont">&#xe60b;</i>
                目前您还没有收货地址哦~
            </div>
            <a href="javascript:;" class="addressList_addBtn" v-show="this.$route.query.chose != 1" @click="dizhi">新增收货地址</a>
            <a href="javascript:;" class="addressList_addBtn" v-show="this.$route.query.chose == 1" @click="dizhi">新增收货地址</a>
            <toast v-model="toast" type="success">{{confrim}}</toast>
            <load-more style="margin-bottom:70px;" v-show="loadshow" tip="加载更多"></load-more>
            <load-more style="margin-bottom:70px;" v-show="!loadshow && addressList.data.length>8" :show-loading="false" tip="到底了" background-color="#fbf9fe"></load-more>
        </div>
    </div>
</template>
<script>

import { XHeader, Cell, Group, Confirm, Toast, LoadMore } from 'vux'
import { mapGetters } from 'vuex'
import { API, getQuery } from '../../services';

export default {
    components: {
        XHeader,
        Group,
        Cell,
        Confirm,
        Toast,
        LoadMore
    },
    data() {
        return {
            canBottom: true,
            loadshow: false,
            haveData: true,
            confrim: "删除成功",
            toast: false,
            /* 默认选中index */
            currentIndex: 0,
            /* 当前列表index 集合 */
            valList: [],
            /* 地址列表 */
            addressList: {
                data: []
            },
            currentPage: 1,
        }
    },
    computed: {
        ...mapGetters([
            'getUserInfoUserId',
            'getUserInfoToken',
        ])
    },
    methods: {
        routerBack() {
            this.$router.goBack();
        },
      dizhi () {
        if (this.$route.query.jiaokuaidi == 1) {
          if (this.$route.query.chose == 1) {
            this.$router.push(`/editAddress/add?chose=1&jiaokuaidi=1&orderId=${this.$route.query.orderId}`)
          } else {
            this.$router.push(`/editAddress/add?jiaokuaidi=1&orderId=${this.$route.query.orderId}`)
          }
        } else {
          if (this.$route.query.chose == 1) {
            this.$router.push('/editAddress/add?chose=1')
          } else {
            this.$router.push('/editAddress/add')
          }
        }
      },
        /* 默认地址选中项更改 */
        checkDefault(id, index) {
            API.person.addressDefault({
                userId: this.getUserInfoUserId,
                token: this.getUserInfoToken,
                id: id
            }).then((res) => {
                if (res.body.code == 200) {
                    this.addressList.data[this.currentIndex].is_set_default = 0;
                    this.addressList.data[index].is_set_default == 1 ? this.addressList.data[index].is_set_default = 0 : this.addressList.data[index].is_set_default = 1;
                    this.currentIndex = index;
                }
            })
        },
        /* 地址编辑 */
        editAddress(id) {
            /* 进入地址编辑页面 */
            this.$router.push({
                path:'/editAddress/'+id,
            })
        },
        /* 地址删除 */
        deletAddress(id, index) {
            var self = this;
            this.$vux.confirm.show({
                /* title: 'Title', */
                content: '确定要删除该地址吗？',
                onConfirm() {
                    /* 点击确认时执行具体删除操作 */
                    API.person.addressDelete({
                        userId: self.getUserInfoUserId,
                        token: self.getUserInfoToken,
                        id: id
                    }).then((res) => {
                        if (res.body.code == 200) {
                            self.confirm = "删除成功";
                            self.toast = true;
                            self.addressList.data.splice(index, 1);
                        }
                    })
                }
            })
        },
        /* 获取用户地址列表 */
        getAddress() {
            if (this.haveData) {
                this.loadshow = true;
                /* 获取默认地址数据 */
                API.person.getAddressList({
                    userId: this.getUserInfoUserId,
                    token: this.getUserInfoToken,
                    pageSize: 10,
                    page: this.currentPage,
                }).then((res) => {
                    if (res.body.code == 200) {
                        if (this.currentPage == 1) {
                            this.addressList = res.body.data.addressList;
                             if (res.body.data.addressList.data.length == 10) {
                                    this.haveData = true;
                                    this.currentPage++;
                                } else {
                                    this.haveData = false;
                                }
                            this.canBottom = true;
                            this.loadshow = false;
                        } else {
                                 this.addressList.data = this.addressList.data.concat(res.body.data.addressList.data);
                                let checkValue = new Array(this.addressList.data.length);
                                for (let i = 0; i < this.addressList.data.length; i++) {
                                    let result = false;
                                    if (this.addressList.data[i].is_set_default === 1) {
                                        this.currentIndex = i;
                                        result = true;
                                    }
                                    checkValue[i] = result;
                                    this.valList.push(result);
                                }
                                this.canBottom = true;
                                this.loadshow = false;
                            if (res.body.data.addressList.data.length == 10) {
                                    this.haveData = true;
                                    this.currentPage++;
                                } else {
                                    this.haveData = false;
                                }
                        }

                    }
                });
            } else {
                this.canBottom = false;
            }

        },
        /* 用户列表点击选择 */
        chooseAddress(res) {
                this.$store.dispatch('CurrentTpl', 0);
                this.$store.dispatch('SetAddress', res);
                console.log(res);
                localStorage.setItem('addressClick','11');
                /* 路由回退 */
              if (this.$route.query.jiaokuaidi) {
                console.log(res)
                this.$router.push({
                  path: '/jiaokuaidi',
                  query: {
                    orderId: this.$route.query.orderId,
                    address: JSON.stringify(res)
                  }
                })
              } else {
                this.routerBack();
              }
        }
    },
    mounted() {
        overscroll(document.querySelector('.addressList_main'));
        let self = this;
        function getScrollTop() {
            var scrollTop = 0, bodyScrollTop = 0, documentScrollTop = 0;
            if (document.body) {
                bodyScrollTop = document.body.scrollTop;
            }
            if (document.documentElement) {
                documentScrollTop = document.documentElement.scrollTop;
            }
            scrollTop = (bodyScrollTop - documentScrollTop > 0) ? bodyScrollTop : documentScrollTop;
            return scrollTop;
        }
        //文档的总高度
        function getScrollHeight() {
            var scrollHeight = 0, bodyScrollHeight = 0, documentScrollHeight = 0;
            if (document.body) {
                bodyScrollHeight = document.body.scrollHeight;
            }
            if (document.documentElement) {
                documentScrollHeight = document.documentElement.scrollHeight;
            }
            scrollHeight = (bodyScrollHeight - documentScrollHeight > 0) ? bodyScrollHeight : documentScrollHeight;
            return scrollHeight;
        }
        //浏览器视口的高度
        function getWindowHeight() {
            var windowHeight = 0;
            if (document.compatMode == "CSS1Compat") {
                windowHeight = document.documentElement.clientHeight;
            } else {
                windowHeight = document.body.clientHeight;
            }
            return windowHeight;
        }
        window.onscroll = function() {
            if (getScrollTop() + getWindowHeight() >= (getScrollHeight()-10)) {
                if (self.canBottom == true) {
                    self.canBottom = false;
                    self.getAddress();
                }
            }
        };

    },
    activated() {
        overscroll(document.querySelector('.addressList_main'));
        this.currentPage = 1;
        this.canBottom = true;
        this.haveData = true;
        this.getAddress();
    }
}
</script>
