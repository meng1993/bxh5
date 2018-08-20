
<style lang="scss">
  .weui-textarea{
    font-size: 15px;
  }
  .weui-cells:after {
    display: none;
  }
  .aa{
    position:relative;
  }
  .aa::after{
    content: "";
    display: inline-block;
    height: 6px;
    width: 6px;
    border-width: 2px 2px 0 0;
    border-color: #C8C8CD;
    border-style: solid;
    -webkit-transform: matrix(0.71, 0.71, -0.71, 0.71, 0, 0);
    transform: matrix(0.71, 0.71, -0.71, 0.71, 0, 0);
    top: -2px;
    position: absolute;
    top: 50%;
    margin-top: -4px;
    right: 2px;
  }
</style>

<template >
  <div>
    <header-cop :heder_title="title"></header-cop>
    <div style="display:flex;height:120px;padding: 25px 15px;box-sizing: border-box;background:#fff;margin-bottom: 10px;">
      <div style="text-align:center;font-size: 50px;display: flex;justify-content:center;align-items: center;width:70px;height:70px;background:#2196f3;border-radius: 10px;flex-grow: 0;">
        <i class="iconfont" style="color:#fff;font-size:50px;">&#xe60f</i>
      </div>
      <div style="flex:1">
        <p style="font-size: 16px;color:rgb(51,51,51);margin-left:15px;margin-bottom:10px;">快递预约中.....</p>
        <p style="margin-left:15px; font-size:12px;">如遇快递未及时上门取件，请您联系快递选择到付寄回即可。</p>
      </div>
    </div>
    <div style="height:5px;background:rgb(243,243,243)"></div>
    <group >
      <!--<popup-picker title="取件时间" :data="date2" v-model="dateValue" @on-shadow-change="haha" style="border-left:6px solid rgb(73,148,236);"></popup-picker>-->
      <cell title="取件时间" :value="dateValue"></cell>
    </group>
    <div style="height:5px;background:rgb(243,243,243)"></div>
    <!--<div class="content" @click="xuanzedizhi">-->
    <!--<p style="padding-left:15px;box-sizing: border-box;margin-top: 10px;">{{nameAndPhone}}</p>-->
    <!--<p style="padding-left:15px;box-sizing: border-box;font-size:14px;color:#6d6d6d;margin-top: 10px;">{{shengshiqu}}</p>-->
    <!--<p style="padding-left:15px;box-sizing: border-box;font-size:14px;color:#6d6d6d;margin-top:10px;">{{address}}</p>-->
    <!--</div>-->
    <div style="height:50px" >
      <div style="height:100%;border-left:6px solid rgb(73,148,236);line-height: 50px;font-size:15px;">
        <span style="color:rgb(51,51,51);margin-left:13px;margin-right:10px;">寄件人地址</span><span style="color:rgb(255,149,54)">(按照此地址上门取件)</span>
      </div>
    </div>
    <div style="height:5px;background:rgb(243,243,243)"></div>
    <div>
      <group style="height:100%;border-left:6px solid rgb(73,148,236);line-height: 50px;">
        <cell title="寄件人" :value="name"></cell>
      </group>
    </div>
    <div style="height:5px;background:rgb(243,243,243)"></div>
    <div>
      <group style="height:100%;border-left:6px solid rgb(73,148,236);line-height: 50px;">
        <cell title="手机号码" :value="mobile"></cell>
      </group>
    </div>
    <div style="height:5px;background:rgb(243,243,243)"></div>
    <div>
      <group style="height:100%;border-left:6px solid rgb(73,148,236);line-height: 50px;">
        <cell title="所在省市区" :value="shengshiqu"></cell>
      </group>
    </div>
    <div style="height:5px;background:rgb(243,243,243)"></div>
    <div style="height:50px">
      <group style="height:100%;border-left:6px solid rgb(73,148,236);line-height: 50px;">
        <cell title="详细地址" :value="address"></cell>
      </group>
    </div>
    <div style="height:5px;background:rgb(243,243,243)"></div>
    <div style="height:60px;width:100%;">
      <img src="../../assets/img/common/shunfeng.png" alt="" height="50"style="margin-top: 5px;margin-left:6px;">
      <a href="tel:95338" style="float:right;margin-top:20px;margin-right:14px;color:rgb(73,148,236)">联系快递</a>
      <!--<group style="height:100%;border-left:6px solid rgb(73,148,236);line-height: 50px;">-->
      <!--<cell title="详细地址" :value="address"></cell>-->
      <!--</group>-->
    </div>
    <div style="height:5px;background:rgb(243,243,243)"></div>
    <div style="position:fixed;bottom:0;left:0;width:100%;">
      <box gap="10px 10px">
        <x-button type="primary" style="background:rgb(73,148,236);" @click.native="chongxinyuyue">重新预约</x-button>
      </box>
    </div>
  </div>
</template>

<script>
  import HeaderCop from '../book/common/header.vue';
  import BScroll from '../book/common/scrollView.vue';
  import { mapGetters } from 'vuex';
  import { Scroller, XImg, Masker,Box, XTextarea,Actionsheet, Spinner,Datetime,PopupPicker, XButton, Group, Cell, LoadMore, Toast,XInput,ChinaAddressV4Data, XAddress,dateFormat} from 'vux';
  export default {
    components: {
      XImg,
      Actionsheet,
      Group,
      Cell,
      Toast,
      BScroll,
      HeaderCop,
      XTextarea,
      XInput,
      Box,
      PopupPicker,
      XAddress,
      XButton,
    },
    computed:{
      ...mapGetters([
        'getUserInfoUserId',
        'getUserInfoToken',
      ])
    },
    methods: {
      chongxinyuyue () {
        this.$router.push(`/jiaokuaidi?orderId=${this.$route.query.orderId}`)
      }
    },
    activated () {
      this.dateValue=JSON.parse(this.$route.query.xinxi).start_time,
        this.name=JSON.parse(this.$route.query.xinxi).sender_address.address_name,
        this.mobile=JSON.parse(this.$route.query.xinxi).sender_address.mobile,
        this.shengshiqu=JSON.parse(this.$route.query.xinxi).sender_address.province + ' '+ JSON.parse(this.$route.query.xinxi).sender_address.city+ ' '+ JSON.parse(this.$route.query.xinxi).sender_address.district,
        this.address=JSON.parse(this.$route.query.xinxi).sender_address.address
    },
    data() {
      return {
        title: "归还中",
        userInfo: [],
        shengshiqu: '',
        address:'',
        dateValue: JSON.parse(this.$route.query.xinxi).start_time,
        name: JSON.parse(this.$route.query.xinxi).sender_address.address_name,
        mobile: JSON.parse(this.$route.query.xinxi).sender_address.mobile,
        shengshiqu: JSON.parse(this.$route.query.xinxi).sender_address.province + ' '+ JSON.parse(this.$route.query.xinxi).sender_address.city+ ' '+ JSON.parse(this.$route.query.xinxi).sender_address.district,
        address: JSON.parse(this.$route.query.xinxi).sender_address.address
      }
    }
  }
</script>

