<style lang="scss" >
 *{
        -webkit-overflow-scrolling: touch;
    }
    body{
        background-color: #f3f3f3;
        .weui-cell{
            height: 50px;
            padding: 8px 15px;
            box-sizing: border-box;
        }
        .vux-label{
            font-size: 15px;
            color: #272727;
        }
        .mine_container{
            .iconfont{
                font-size: 20px;
                margin-right: 10px;
            }
        }
    }
    .iconfont{
        position: relative;
    }
    .badge{
        position: absolute;
        top:-5px;
        //right:2px;
    }
    .mine{
        &_container{
            height: 100%;
            background-color: #f1f1f1;
            .weui-cells{
                margin-top: 0;
            }
        }
        &_header{
            height: 200px;
            background-image: url("../../assets/img/index/minebc.png");
            overflow: hidden;
        }
        &_avatar{
            display: block;
            height: 75px;
            width: 75px;
            border-radius: 50%;
            padding: 5px;
            border: 2px solid #fff;
            margin: 0 auto;
            margin-top: 45px;
        }
        &_name{
            display: block;
            margin: 10px auto;
            overflow: hidden;
            font-size: 18px;
            color: #fff;
            white-space: nowrap;
            text-overflow: ellipsis;
            width: 200px;
            text-align: center;
        }
    }
    .book_order{
        width: 100%;
        height: 144px;
        padding-top: 13px;
        background:#fff;
        display: flex;
        flex-wrap:wrap;
        margin-bottom:13px;
        >li{
            height: 72px;
            width: 25%;
            // background:#aaa;
            text-align: center;
            .book_order_item{
                >i{color: #5E5E5E;
                    font-size: 25px!important;
                    margin-right:0!important;
                }
                >span{
                    color: #5E5E5E;
                    font-size: 12px;
                }
            }

        }
    }
    .book_order_top{
        height: 40px;
        line-height: 40px;
        padding-left:  10px;
        background: #fff;
        border-bottom: 1px solid #C8C7CC;
    }
    .book_order_content{
        margin-bottom: 10px;
    }
</style>

<template>
    <div>

        <div class="mine_container">
            <header class="mine_header">
                <!-- :src="user.img"  -->
                
                    <img class="mine_avatar"   :src="imgFormat(this.$store.state.userInfo.avatar)"  alt="avatar" >
                
                <span class="mine_name">{{this.$store.state.userInfo.loginname}}</span>
            </header>
            <p class="book_order_top"> 绘本订单</p>
            <ul class="book_order">
                <li>
                    <router-link  to="/mine_order" class="book_order_item">
                        <i class="iconfont">&#xe63d;</i><span>绘本订单</span>
                    </router-link>
                </li>
                <li>
                    <router-link  to="/mine_order?status=1" class="book_order_item">
                    <i class="iconfont">&#xe632;<badge v-if='countdata[0]>0' class="badge" :text="countdata[0]"></badge> </i><span>待付款</span>
                    </router-link>
                </li>
                <li><router-link  to="/mine_order?status=2" class="book_order_item">
                    <i class="iconfont">&#xe61e;<badge v-if='countdata[1]>0' class="badge" :text="countdata[1]"></badge> </i><span>待发货</span>
                </router-link>
                </li>
                <li><router-link  to="/mine_order?status=3" class="book_order_item">
                    <i class="iconfont">&#xe627;<badge v-if='countdata[2]>0' class="badge" :text="countdata[2]"></badge> </i><span>待收货</span>
                </router-link>
                </li>
                <li><router-link  to="/mine_order?status=4" class="book_order_item">
                    <i class="iconfont">&#xe7d5;<badge v-if='countdata[3]>0' class="badge" :text="countdata[3]"></badge> </i><span>待归还</span>
                </router-link>
                </li>
                <li><router-link  to="/mine_order?status=5" class="book_order_item">
                    <i class="iconfont">&#xe61f;<badge v-if='countdata[4]>0' class="badge" :text="countdata[4]"></badge> </i><span>待结算</span>
                </router-link>
                </li>
                <li><router-link  to="/mine_order?status=7" class="book_order_item">
                    <i class="iconfont">&#xe61d;<badge v-if='countdata[5]>0' class="badge" :text="countdata[5]"></badge> </i><span>待评价</span>
                </router-link>
                </li>
                <li><router-link  to="/mine_order?status=11" class="book_order_item">
                    <i class="iconfont">&#xe64e;<badge v-if='countdata[6]>0' class="badge" :text="countdata[6]"></badge> </i><span>退款退货</span>
                </router-link>
                </li>

            </ul>
            <group style="display:none">
                <cell>
                </cell>
            </group>
            <group class="book_order_content">
                <cell  title="其他订单" is-link link="/bookorder">
                    <i slot="icon" class="iconfont">&#xe603;</i>
                </cell>
                <!--<cell  title="我的收藏" is-link link="/book/main/collect">-->
                <!--<i slot="icon" class="iconfont">&#xe605;</i>-->
                <!--</cell>-->
                <cell  title="我的会员" is-link link="/mine_plan">
                    <i slot="icon" style="width:20px" class="iconfont">&#xe622;</i>
                </cell>
            </group>
            <group>
                <cell  title="优惠券" is-link link="/card">
                    <i slot="icon" style="width:20px" class="iconfont">&#xe610;</i>
                </cell>
            </group>
            <group style="margin-top:0.6rem;margin-bottom:100px">
                <!--两种状态，已经认证和未认证状态-->
                <!-- <template v-if="getIsCertify==2 || getIsCertify==4 ">
                    <cell  title="实名认证">
                        <span style="font-size:12px;">已认证</span>
                        <i slot="icon" class="iconfont">&#xe63c;</i>
                    </cell>
                </template> -->
               <!--  <template v-else>
                    <cell  title="实名认证" is-link link="/authentication">
                        <span style="font-size:12px;padding-right:20px">未认证</span>
                        <i slot="icon" class="iconfont">&#xe63c;</i>
                    </cell>
                </template> -->

                <!--两种状态，授权状态和未授权状态-->
                <template v-if="getIsCertify==4 || getIsCertify==2 " >
                    <cell  title="芝麻信用" @click.native="authorization">
                        <!-- <span style="font-size:12px;color:red">{{relief_limit}}</span> -->
                        <span style="font-size:12px;color:red">已授权</span>
                        <i slot="icon" class="iconfont">&#xe60a;</i>
                    </cell>
                </template>
                <template v-else>
                    <cell  title="芝麻信用" @click.native="authorization">
                        <span style="font-size:12px;">未授权</span>
                        <i slot="icon" class="iconfont">&#xe60a;</i>
                    </cell>
                </template>

                <cell  title="设置" is-link link="/setting">
                    <i slot="icon" class="iconfont">&#xe63b;</i>
                </cell>
                <cell  title="帮助与客服" is-link link="/help">
                    <i slot="icon" class="iconfont">&#xe602;</i>
                </cell>
                <cell  title="意见反馈" is-link link="/opinion">
                    <i slot="icon" class="iconfont">&#xe64a;</i>
                </cell>
            </group>

        </div>
    </div>

</template>
<script>
  import {XHeader,Tabbar,TabbarItem,Cell,Group,Badge } from 'vux'
  import { mapGetters } from 'vuex';
  import { API, getQuery } from '../../services';

  export default {
    data() {
      return {
        user:{
          name:"网二",
          img:"../../assets//img//index//avatar.png"
        },
        zmed:false,
        relief_limit:'',
        countdata: []
      }
    },
    components: {
      XHeader,
      Tabbar,
      TabbarItem,
      Cell,
      Group,
      Badge
    },
    computed:{
      ...mapGetters([
        'getIsCertify',
        'getUserInfoUserId',
        'getUserInfoToken',
      ])
    },
    activated () {
      this.userZMReliefInfo();
      this.getOrderCount();
    },
    mounted(){
        /* 获取当前的认证状态 */
      this.userZMReliefInfo();
    },
    methods :{
        /*获取芝麻信用减免额度*/

        userZMReliefInfo(){
            API.person.getUserZMReliefInfo({
            user_id: this.getUserInfoUserId
            }).then((res) => {
            var isCertify = 0;
            if (res.body.code == 200) {
                this.zmed = true;
                this.relief_limit = '剩余免押金额度' + res.body.data.tmp_relief_limit + '元';
                isCertify = res.body.data.isCertify;
            }else{
                this.relief_limit = '去授权';
            }
            localStorage.setItem("isCertify",isCertify);
            this.$store.dispatch('IsCertify');
            })
        },
        authorization(){
            if (this.zmed) {
                this.$router.push({
                    path: "/authInfo"
                })
            } else {
                this.$router.push({
                    path: "/authPage",
                    query: { plan: 'mine' }
                });
            }
        },
        getOrderCount(){
            API.coust.getOrderCount({
                user_id: this.getUserInfoUserId,
                token: this.getUserInfoToken
            }).then(res=>{
                if (res.body.code == 200){
                    this.countdata = res.data.data
                } else{
                }
            })
        } 
    }
  }
</script>