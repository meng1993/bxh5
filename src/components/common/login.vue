<style  lang="scss">
#router-container{
  height: 100%;
  background-color: #fff;
}
  #login_main{
     .left-arrow{
        display: none;
    }
      width: 100%;
       .vux-header-right{
          right: 20px;
        }
        .vux-header-left{
          left:20px;
        }
        .vux-header-right,.vux-header-left{
          height: 45px;
            line-height:45px;
            top: 0;
        }
        .vux-no-group-title{
            margin-top: 0;
        }
        .vux-header-title{
            color: #333;
            font-size: 18px;
            height: 45px ;
            line-height: 45px  ;
        }
        .vux-header{
          padding:0;
        }
        .iconfont{
          margin-right: 20px;
          font-size: 25px;
        }
        .weui-cell{
            &:after{
              display: none;
          }
          &:before{
            display: none;
          }
        }
        .weui-cells{
          &:after{
              display: none;
          }
          &:before{
            display: none;
          }
        }
        .vux-header-back,.vux-header-right{
          padding: 0;
            color: #333;
            font-size: 16px;
            &>a{
              color: #333;

            }
        }
        .vux-x-input{
            clear: both;
          margin-top: 7.5px;
          height: 45px;
          line-height: 45px;
          .weui-cell__hd {color: #c1c1c1};
          border: 1px solid #dddddd;
          box-sizing: border-box;
         font-size: 14px;
          border-radius: 5px;
        }
        .login_link{
          float: left;
          margin-left: 15px;
          color:#349ced;
          margin-top: 7.5px;
         font-size: 14px;
        }
        .login_lforget{
          float: right;
          margin-right: 15px;
          margin-top: 7.5px;
          color:#999;
         font-size: 14px;
        }
        .login{
        &_header{
            background-color: #fff;
            height: 45px;
            color: #333;
            border-bottom:1px solid #dddddd;
            }
        &_img{
          display: block;
          height: 160px;;
          margin: 15px  auto;
          margin-bottom: 0;
        }
        &_group{
          box-sizing: border-box;
          padding: 15px;
        }
        &_getcode{
            width: 60%;
            float: left;
        }
        &_btn{
           height: 45px;
            background-color: #2196f3;
            margin-top: 15px;
            font-size: 15px;
            color: #fff;
             border-radius: 5px;
        }
        &_code{
          width: 37%;
          float: right;
          margin-top:7.5px!important;
          background-color: #f3f3f3;
          color: #333;
        }
        &_book{
            font-size: 13px;
            color: #999;
            margin-top:10px;
            >a{
                color: #2196f3;
            }
        }
        }


    }
    .touming{
      position: fixed;
      width: 100%;
      height: 100%;
      background-color: rgba($color: #000000, $alpha: 0.5);
      z-index: 10000;
    }
</style>
<template>
<div >
  <div v-bind:class="{'touming':loading}">
  </div>
	<div id="login_main">
    <x-header class="login_header"  @on-click-back="routerback" :left-options="{backText:'取消',showBack: true,preventGoBack:true}">
        密码登录
        <span @click="regist"  slot="right"> 注册</span>
    </x-header>
    <img src="../../assets/img/common/logo.png" class="login_img"  alt="logo">
    <group class="login_group">
      <x-input  placeholder="请输入手机号" type="text"  v-model="form.user_phone" required>
          <i class="iconfont" slot="label">&#xe666;</i>

      </x-input>
      <x-input  placeholder="请输入密码"  type="password"  v-model="form.user_password" required>
        <i class="iconfont" slot="label">&#xe600;</i>
      </x-input>
      <x-button class="login_btn"  @click.native="login">登录</x-button>
    </group>

    <router-link :to="logincode" class="login_link">验证码登录</router-link>
    <router-link to="/forget" class="login_lforget">忘记密码</router-link>
    <toast v-model="toast"  type="cancel">{{confrim}}</toast>
    <vue-loading v-if="loading" type="bars" color="#333333" :size="{ width: '250px', height: '250px' }"></vue-loading>
	</div>
  
</div>
</template>
<script>
import {XInput, Group, XButton,XHeader,Toast } from 'vux'
import {API,getQuery} from '../../services';
import vueLoading from 'vue-loading-template';
  export default {
      data() {
        return {
           confrim:"",
           toast:false,
           state:true,
           logincode:"/logincode",
           type:"",
           form:{
             user_phone:"",
             user_password:""
           },
           touming:"",
           loading:false
        }
      },
    components: {
     XInput,
     Group,
     XButton,
     XHeader,
     Toast,
     vueLoading
    },
    mounted : function() {

    },
    methods :{
      routerback(){
        this.$router.goBack();
      },
      login(){
        var self=this;
        // /* 用户名格式检验 */
        // let tel = /^[1][3,4,5,6,7,8,9][0-9]{9}$/
        if(this.form.user_phone==''||this.form.user_phone.length!=11){
           this.confrim="请输入正确的用户名";
            this.toast=true;
            return false;
        }
        /* 用户密码格式校验 */
        if(this.form.user_password==''||this.form.user_password.length<6){
            this.confrim="请输入正确的用户密码不能小于6位";
            this.toast=true;
            return false;
        }
        self.form.user_password=self.md5(self.md5(self.md5(self.form.user_password))+"boxiang");
        /* 进行接口登录 */
        API.login.pwdLogin(this.form).then((Response)=>{
          if(Response.body.code==200){
          Response=Response.body.data;
            /* 触发vuex登录状态更改操作 */
          let token=Response.token;
          let userInfo={
            loginname : Response.nickname,
            avatar : Response.face,
            id : Response.user_id,
            token : token,
          };
          localStorage.setItem("userInfo",JSON.stringify(userInfo));
          /* 设置当前认证状态 */
          localStorage.setItem("isCertify",Response.isCertify);
          this.$store.dispatch('IsCertify');
          this.$store.dispatch('SetUserInfo',userInfo);

         // window.location.href=this.$route.query.return_url;
         console.log(this.$route.query.back)
         if(this.$route.query.back!=undefined&&this.$route.query.back=='zmshouquan'){
           this.$router.replace({
            path: "/authPage",
            query:{plan:"book_bookCard"}
            });
            return false;
         }
          if(!this.type){
            if (this.$route.query.return_url) {
              window.location.href=this.$route.query.return_url
            }else{
            window.history.go(-1)
            }

            /*this.$router.push({
                path:'/book/main',
              })*/
            }else{
              localStorage.setItem("goodsInfo","login");
              this.$router.push({
                path:this.type
              })
            }
          }else{
              self.confrim=Response.body.msg;
              this.toast=true;
          }
        })

      },
      regist(){
        if (this.type) {
           this.$router.push({
          path:'/register',
        query:{redirect:this.type}})
         }else if(this.$route.query.return_url){
          this.$router.push({
          path:'/register',
        query:{return_url:this.$route.query.return_url}})
         }else {
          this.$router.push({
          path:'/register',
        query:{noData:'no'}})
         }

      }
    },
    activated(){
       
        this.type=this.$route.query.redirect;
        if(this.type){
            this.logincode="/logincode?type="+this.type;
        }
        if(this.$route.query.oauth){//三方
            this.loading = true;
            var json = {
                oauth : this.$route.query.oauth,
                p : this.$route.query.p
            }
            API.login.otherLogin(json).then((Response)=>{
                if(Response.body.code==200){
                Response=Response.body.data;
                  /* 触发vuex登录状态更改操作 */
                let token=Response.token;
                let userInfo={
                  loginname : Response.nickname,
                  avatar : Response.face,
                  id : Response.user_id,
                  token : token,
                };
                localStorage.setItem("userInfo",JSON.stringify(userInfo));
                /* 设置当前认证状态 */
                localStorage.setItem("isCertify",Response.isCertify);
                this.$store.dispatch('IsCertify');
                this.$store.dispatch('SetUserInfo',userInfo);
                console.log(this.type)
                this.$router.push({
                      path:"book/main"
                    })
                }else{
                    self.confrim=Response.body.msg;
                    this.toast=true;
                }
            })
        }
    }
  }
</script>
