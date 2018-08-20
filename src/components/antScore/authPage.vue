<style lang="scss">
@import "./authinfo.scss";
</style>

<template>
    <div>
        <header class="ant_header" style="height:260px;background:none;">
            <div class="ant_header_title" style="color: black">
                <i class="iconfont" @click="routerBack">&#xe611;</i>
                芝麻信用授权
            </div>
            <div class="ant_header_zujie">
                <div class="logo"><img src="../../assets/img/common/logo.png">
                <!-- 博鸟绘本 -->
                </div>
                <!-- <div>博鸟绘本，让孩子的明天更美好</div> -->
            </div>
        </header>
        <div class="ant_logo">
            <img src="../../assets/img/common/zmxy_icon.png" width="33" height="37">
            <p>芝麻信用</p>
        </div>
        <div class="ant_form">
            <group>
                <x-input name="username" placeholder="真实姓名" v-model="name" is-type="china-name">
                    <i class="iconfont" slot="label">&#xe614;</i>
                </x-input>
            </group>
            <group>
                <x-input name="username" placeholder="身份证号" v-model="certNo">
                    <i class="iconfont" slot="label">&#xe675;</i>
                </x-input>
            </group>
            <div style="padding:15px;">
                <x-button type="primary" @click.native="userIdentityInfo"> 确认授权</x-button>
            </div>
        </div>
        <div class="zujie_state">
            <p style="color:#2196f3;margin-bottom:15px;">博鸟绘本将根据您的芝麻信用分数减免产品押金</p>
            <p>您的认证信息只用于芝麻免押金认证，</p>
            <p>博鸟绘本不会用作任何其他用途</p>
        </div>
        <toast v-model="toast" type="cancel">{{confrim}}</toast>
    </div>
</template>

<script>
import { mapGetters } from 'vuex';
import { XInput, Group, XButton, Cell, Toast } from 'vux';
import { API, getQuery } from '../../services';
//import { constants } from 'http2';

export default {
    data() {
        return {
            name: '',
            certNo: '',
            toast: false,
            confrim: "",
            backindex:0,
            backindex2:0
        }
    },
    components: {
        XInput,
        XButton,
        Group,
        Cell,
        Toast
    },
    computed: {
        ...mapGetters([
            'getUserInfoUserId',
            'getUserInfoToken',
        ])
    },
    created () {
        
    },
    activated() {
        if (!localStorage.getItem("userInfo")) {//没登录,  关闭授权页打开登录页  
            this.$router.replace({
            path: "/login?type=good",
            query: { return_url: window.location.href,back:'zmshouquan'}
            });
      }else{//登录成功 查看授权状态
            this.userZMScore();  
      }    
    },

    methods: {
        userZMScore() {//判断是否授权
                API.person.getUserZMScore({
                    user_id: this.getUserInfoUserId
                }).then((res) => {
                    //已授权的关闭授权页，打开芝麻信用详情页，未授权的停在当前页
                    if (res.body.code == 200&&res.body.data.status==1) {
                        this.$router.replace({
                        path: "/authInfo"
                        });
                    }
                })
        },
        routerBack() {
            this.$router.goBack();
        },
        userIdentityInfo() {
            var self = this
            if (!this.name || !this.certNo) {
                if (!this.name) {
                    this.confrim = "请输入姓名";
                } else {
                    this.confrim = "请输入身份证号";
                }

                this.toast = true;
            } else {
              var type = 0
              if (this.$route.query.plan === 'book_bookCard') {
                type = 3
              } else if (this.$route.query.plan === 'book_bookOrderInfo') {
                type = 4
              } else  if (this.$route.query.plan === 'mine'){
                type = 5
              } else {
                type  = 2
              }
                console.log(this.getUserInfoUserId);
                API.person.handleUserIdentityInfo({
                    user_id: this.getUserInfoUserId,
                    name: this.name,
                    certNo: this.certNo,
                    option: 1,
                    zmtype: type
                }).then((res) => {
                    console.log(res.body);
                    if (res.body.code == 200) {
                        /**@argument
                         * status 0:芝麻信用评估过低 1: 4:
                         */
                        let status = res.body.data.status;
                        if (status == 0) {

                            if(res.body.data.type){
                                window.location.href = res.body.data.auth_url;
                            }else{
                                this.confrim = "芝麻信用评估过低";
                                this.toast = true;
                                return false;

                            }
                        } else if (status == 1) {
                            if (res.body.data.zmscore > 600) {//条状
                                this.userZMScore();
                            } else {
                                this.confrim = res.body.msg;
                                this.toast = true;
                            }
                        }
                        localStorage.setItem("isCertify", "4");
                        this.$store.dispatch('IsCertify');
                    }else{
                        this.$vux.alert.show({
                            /* title: 'Title', */
                            content: res.body.msg,
                            onConfirm () {
                                
                            }
                        })
                        }   
                })
            }
        }
    },
    mounted() {

    }
}
</script>
