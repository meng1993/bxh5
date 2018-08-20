
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
  .vux-popup-picker-select{
    text-align: left !important;
    text-indent: 16px;
  }
 .abc .weui-cell__ft{
   display: none;
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
        <p style="font-size: 16px;color:rgb(51,51,51);margin-left:15px;margin-bottom:10px;">在线预约快递</p>
        <p style="margin-left:15px; font-size:12px;">预约成功后快递公司会在<span style="color:rgb(242,74,67);font-size:14px;">预约时间内</span>内联系寄件人并上门揽件,如遇快递未及时上门取件，请您联系快递选择到付寄回即可</p>
      </div>
    </div>
    <div style="height:5px;background:rgb(243,243,243)"></div>
    <group style="position:relative;" class="abc">
      <popup-picker title="取件时间" :data="date2" v-model="dateValue" @on-shadow-change="haha" style="border-left:6px solid rgb(73,148,236);"></popup-picker>
      <span style="position:absolute; top:10px;right:0;margin-right:15px;color:#666666;font-size:15px;">点击修改时间</span>
    </group>
    <div style="height:5px;background:rgb(243,243,243)"></div>
    <!--<div class="content" @click="xuanzedizhi">-->
    <!--<p style="padding-left:15px;box-sizing: border-box;margin-top: 10px;">{{nameAndPhone}}</p>-->
    <!--<p style="padding-left:15px;box-sizing: border-box;font-size:14px;color:#6d6d6d;margin-top: 10px;">{{shengshiqu}}</p>-->
    <!--<p style="padding-left:15px;box-sizing: border-box;font-size:14px;color:#6d6d6d;margin-top:10px;">{{address}}</p>-->
    <!--</div>-->
    <div style="height:50px" @click="xuanzedizhi">
      <div style="height:100%;border-left:6px solid rgb(73,148,236);line-height: 50px;font-size:15px;">
        <span style="color:rgb(51,51,51);margin-left:13px;margin-right:10px;">寄件人地址</span><span style="color:rgb(255,149,54)">(按照此地址上门取件)</span>
        <span style="float:right;margin-right:15px;color:#666666;" >点击修改地址</span>
      </div>
    </div>
    <div style="height:5px;background:rgb(243,243,243)"></div>
    <div>
      <group style="height:100%;border-left:6px solid rgb(73,148,236);line-height: 50px;">
        <cell title="寄件人" :value="userInfo.address_name"></cell>
      </group>
    </div>
    <div style="height:5px;background:rgb(243,243,243)"></div>
    <div>
      <group style="height:100%;border-left:6px solid rgb(73,148,236);line-height: 50px;">
        <cell title="手机号码" :value="userInfo.mobile"></cell>
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
        <cell title="详细地址" :value="userInfo.address"></cell>
      </group>
    </div>
    <div style="height:5px;background:rgb(243,243,243)"></div>
    <box gap="10px 10px">
      <x-button type="primary" style="background:rgb(73,148,236)" @click.native="yuyuekuaidi">叫快递</x-button>
    </box>
    <toast v-model="showPositionValue" type="text" :time="1500" is-show-mask :text="tishixinxi" ></toast>
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
      chang(value) {
      },
      haha (a) {
        var hour = dateFormat(new Date(new Date().getTime()),'YYYY-MM-DD HH:mm').split(' ')[1].split(':')[0]
        if (a[0] == dateFormat(new Date(new Date().getTime()),'YYYY-MM-DD')) {
          if (hour == 9) {
            this.date2 = [[dateFormat(new Date(new Date().getTime()),'YYYY-MM-DD'),dateFormat(new Date(new Date().getTime() + 24*60*60*1000),'YYYY-MM-DD')],['09:00-10:00', '10:00-11:00','11:00-12:00','12:00-13:00','13:00-14:00','14:00-15:00','15:00-16:00','16:00-17:00']]
          } else if (hour == 10) {
            this.date2 = [[dateFormat(new Date(new Date().getTime()),'YYYY-MM-DD'),dateFormat(new Date(new Date().getTime() + 24*60*60*1000),'YYYY-MM-DD')],['10:00-11:00','11:00-12:00','12:00-13:00','13:00-14:00','14:00-15:00','15:00-16:00','16:00-17:00']]
          } else if (hour == 11) {
            this.date2 = [[dateFormat(new Date(new Date().getTime()),'YYYY-MM-DD'),dateFormat(new Date(new Date().getTime() + 24*60*60*1000),'YYYY-MM-DD')],['11:00-12:00','12:00-13:00','13:00-14:00','14:00-15:00','15:00-16:00','16:00-17:00']]
          } else if (hour == 12) {
            this.date2 = [[dateFormat(new Date(new Date().getTime()),'YYYY-MM-DD'),dateFormat(new Date(new Date().getTime() + 24*60*60*1000),'YYYY-MM-DD')],['12:00-13:00','13:00-14:00','14:00-15:00','15:00-16:00','16:00-17:00']]

          } else if (hour == 13) {
            this.date2 = [[dateFormat(new Date(new Date().getTime()),'YYYY-MM-DD'),dateFormat(new Date(new Date().getTime() + 24*60*60*1000),'YYYY-MM-DD')],['13:00-14:00','14:00-15:00','15:00-16:00','16:00-17:00']]
          } else if (hour == 14) {
            this.date2 = [[dateFormat(new Date(new Date().getTime()),'YYYY-MM-DD'),dateFormat(new Date(new Date().getTime() + 24*60*60*1000),'YYYY-MM-DD')],['14:00-15:00','15:00-16:00','16:00-17:00']]

          } else if (hour == 15) {
            this.date2 = [[dateFormat(new Date(new Date().getTime()),'YYYY-MM-DD'),dateFormat(new Date(new Date().getTime() + 24*60*60*1000),'YYYY-MM-DD')],['15:00-16:00','16:00-17:00']]
          } else if (hour == 16) {
            this.date2 = [[dateFormat(new Date(new Date().getTime()),'YYYY-MM-DD'),dateFormat(new Date(new Date().getTime() + 24*60*60*1000),'YYYY-MM-DD')],['16:00-17:00']]
          }
        } else {
          if (hour>=17&&hour<=23) {
            this.date2 = [[dateFormat(new Date(new Date().getTime() + 24*60*60*1000),'YYYY-MM-DD')],['09:00-10:00', '10:00-11:00','11:00-12:00','12:00-13:00','13:00-14:00','14:00-15:00','15:00-16:00','16:00-17:00']]
          } else {
            this.date2 = [[dateFormat(new Date(new Date().getTime()),'YYYY-MM-DD'),dateFormat(new Date(new Date().getTime() + 24*60*60*1000),'YYYY-MM-DD')],['09:00-10:00', '10:00-11:00','11:00-12:00','12:00-13:00','13:00-14:00','14:00-15:00','15:00-16:00','16:00-17:00']]
          }
        }
      },
      yuyuekuaidi () {
        this.$http.post(`${window.BASE_ROOT}user/expressOrder`, {
          user_id: this.getUserInfoUserId,
          token: this.getUserInfoToken,
          order_id: this.$route.query.orderId,
          shipper_code: this.code,
          address_id: this.addressId,
          start_time: this.dateValue[0]+" " + this.dateValue[1].split('-')[0]+':00'
        }).then(res => {
          console.log(res)
          if (res.body.code ==200) {
            this.showPositionValue = true
            this.tishixinxi = res.body.msg
            setTimeout( () => {
              this.$router.push({
                path: '/mine_order',
                query: {
                  status: 4
                }
              })
            },1500)
          } else {
            this.showPositionValue = true
            this.tishixinxi = res.body.msg
          }

        }).catch(res => {})
      },
      xuanzedizhi () {
        this.$router.push({
          path: '/addressList',
          query: {
            'chose': 1,
            'jiaokuaidi': 1,
            'orderId': this.$route.query.orderId
          }
        })
      },
      setTime (hour) {
        if (hour >= 17&&hour<=23) {
          this.dateValue.splice(0,1,dateFormat(new Date(new Date().getTime() + 24*60*60*1000),'YYYY-MM-DD'))
          this.date2.splice(0,1, [dateFormat(new Date(new Date().getTime() + 24*60*60*1000),'YYYY-MM-DD')])
          this.date2.splice(1,1,this.date1)
          this.dateValue.splice(1,1,'09:00-10:00')
        } else if (hour>=9&&hour<17) {
          if (hour == 9) {
            this.date2 = [[dateFormat(new Date(new Date().getTime()),'YYYY-MM-DD'),dateFormat(new Date(new Date().getTime() + 24*60*60*1000),'YYYY-MM-DD')],['09:00-10:00', '10:00-11:00','11:00-12:00','12:00-13:00','13:00-14:00','14:00-15:00','15:00-16:00','16:00-17:00']]
          } else if (hour == 10) {
            this.date2 = [[dateFormat(new Date(new Date().getTime()),'YYYY-MM-DD'),dateFormat(new Date(new Date().getTime() + 24*60*60*1000),'YYYY-MM-DD')],['10:00-11:00','11:00-12:00','12:00-13:00','13:00-14:00','14:00-15:00','15:00-16:00','16:00-17:00']]
          } else if (hour == 11) {
            this.date2 = [[dateFormat(new Date(new Date().getTime()),'YYYY-MM-DD'),dateFormat(new Date(new Date().getTime() + 24*60*60*1000),'YYYY-MM-DD')],['11:00-12:00','12:00-13:00','13:00-14:00','14:00-15:00','15:00-16:00','16:00-17:00']]
          } else if (hour == 12) {
            this.date2 = [[dateFormat(new Date(new Date().getTime()),'YYYY-MM-DD'),dateFormat(new Date(new Date().getTime() + 24*60*60*1000),'YYYY-MM-DD')],['12:00-13:00','13:00-14:00','14:00-15:00','15:00-16:00','16:00-17:00']]

          } else if (hour == 13) {
            this.date2 = [[dateFormat(new Date(new Date().getTime()),'YYYY-MM-DD'),dateFormat(new Date(new Date().getTime() + 24*60*60*1000),'YYYY-MM-DD')],['13:00-14:00','14:00-15:00','15:00-16:00','16:00-17:00']]
          } else if (hour == 14) {
            this.date2 = [[dateFormat(new Date(new Date().getTime()),'YYYY-MM-DD'),dateFormat(new Date(new Date().getTime() + 24*60*60*1000),'YYYY-MM-DD')],['14:00-15:00','15:00-16:00','16:00-17:00']]

          } else if (hour == 15) {
            this.date2 = [[dateFormat(new Date(new Date().getTime()),'YYYY-MM-DD'),dateFormat(new Date(new Date().getTime() + 24*60*60*1000),'YYYY-MM-DD')],['15:00-16:00','16:00-17:00']]
          } else {
            this.date2 = [[dateFormat(new Date(new Date().getTime()),'YYYY-MM-DD'),dateFormat(new Date(new Date().getTime() + 24*60*60*1000),'YYYY-MM-DD')],['16:00-17:00']]
          }
          this.dateValue.splice(0, 1,dateFormat(new Date(new Date().getTime()),'YYYY-MM-DD'))
          this.dateValue.splice(1,1,this.date2[1][0])
        } else {
          this.dateValue.splice(0,1,dateFormat(new Date(new Date().getTime()),'YYYY-MM-DD'))
          this.date2 = [[dateFormat(new Date(new Date().getTime()),'YYYY-MM-DD'),dateFormat(new Date(new Date().getTime() + 24*60*60*1000),'YYYY-MM-DD')],['09:00-10:00', '10:00-11:00','11:00-12:00','12:00-13:00','13:00-14:00','14:00-15:00','15:00-16:00','16:00-17:00']],
            this.dateValue.splice(1,1,'09:00-10:00')
        }
      }
    },
    data() {
      return {
        title: "一键叫快递",
        userInfo: [],
        flag: 1,
        showPositionValue: false,
        shengshiqu: '',
        address:'',
        date1: ['09:00-10:00', '10:00-11:00','11:00-12:00','12:00-13:00','13:00-14:00','14:00-15:00','15:00-16:00','16:00-17:00'],
        date2: [[dateFormat(new Date(new Date().getTime()),'YYYY-MM-DD'),dateFormat(new Date(new Date().getTime() + 24*60*60*1000),'YYYY-MM-DD')],['09:00-10:00', '10:00-11:00','11:00-12:00','12:00-13:00','13:00-14:00','14:00-15:00','15:00-16:00','16:00-17:00']],
        code: 'SF',
        dateValue: ['2018-01-16', '09:00-10:00'],
        nameAndPhone: '',
        addressId: '',
        tishixinxi: '',
        addressData: ChinaAddressV4Data
      }
    },
    activated () {
      var hour = dateFormat(new Date(new Date().getTime()),'YYYY-MM-DD HH:mm').split(' ')[1].split(':')[0]
      this.setTime(hour)
      if (this.$route.query.address) {
        this.userInfo = JSON.parse(this.$route.query.address)
        console.log(this.userInfo)
        this.shengshiqu = this.userInfo.province+ ' '+this.userInfo.city+ ' '+ this.userInfo.district
        this.nameAndPhone = this.userInfo.address_name + ' '+this.userInfo.mobile
        this.address = this.userInfo.address
        this.addressId = this.userInfo.id
      } else  {
        this.$http.post(`${window.BASE_ROOT}user/expressInitial`, {
          user_id: this.getUserInfoUserId,
          token: this.getUserInfoToken,
          order_id: this.$route.query.orderId
        }).then(res => {
          this.userInfo = ''
          this.shengshiqu = ''
          this.nameAndPhone = ''
          this.address = ''
          this.userInfo = res.body.data.sender_info
          this.shengshiqu += this.userInfo.province + ' '
          this.shengshiqu += this.userInfo.city + ' '
          this.shengshiqu += this.userInfo.district
          this.nameAndPhone += this.userInfo.address_name + ' '
          this.nameAndPhone += this.userInfo.mobile
          this.address = this.userInfo.address
          this.addressId = this.userInfo.address_id
        }).catch(res => {
        })
      }
    }
  }
</script>

