<style lang="scss" scoped>
.header{
    background-image: url('~@/assets/img/common/rule-bg.png');
    height: 88px;
    background-repeat: no-repeat;
    background-size: 100% auto;
    margin-top: 40px;
}
.headercop{
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
}
 .rule_content{
     height: calc(100% - 3px);
     padding: 15px;
     box-sizing: border-box;
     padding-bottom: 0;
     background-color: #fff;
     &--show{
         height: 100%;
     }
     p{
         font-size: 13px;
         color: #666;
         line-height: 20px;
     }
     h3{
         font-size: 16px;
         color: #333;
         margin: 15px 0;
     }
     .light{
          background-image: url('~@/assets/img/common/light.png');
          background-size: 100% auto;
          background-repeat: no-repeat;
          display: inline-block;
          width: 10px;
          height: 10px;
     }

 }
</style>

<style lang="scss">

</style>


<template>
<div>
    <div v-show="titleShow==true" >
         <header-cop :heder_title="title" class="headercop"></header-cop>
        <div class="header"></div>
        <div class="rule_content" :class="{'rule_content--show':!titleShow}">
                <p style="text-indent:2em">
                绘本订阅计划是博鸟绘本推出的会员制订阅服务，订阅计划分为小博士次卡计划，具体请参见计划购买页面说明。
            </p>
            <h3>订阅计划使用规则如下：</h3>
            <p>
            1、订阅计划一旦生效使用之后，即不可退订；
            <br>   2、订阅计划在用户购买后立即生效，有效期取决于不同的计划，分为3个月（季度）与12个月（年度）两种；
            <br>   3、有效期内，用户可以在计划权益内借阅相应次数的绘本，不同的计划有不同的借阅次数与借阅绘本数量限制，具体参见计划购买页面；
        <br>   4、由于物流时间的原因，用户至少要提前四天下单预定想要借阅的绘本；
            <br>   5、每次绘本借阅周期最多不得超过1个月，用户需要及时归还绘本；
            <br>   6、关于物流部分，平台负责往返包邮，用户无需承担任何物流费用；归还的时候，用户只需要在【待归还订单】里点击归还按纽，预约快递就可以了，无需付费。
        <br>   7、绘本借阅过程中，由于人为的原因造成了绘本的损坏，并影响了后续的使用与借阅，用户可能需要承担相应的赔偿。实际赔偿的金额不会高于绘本在其他电商平台的零售价格（参考京东，亚马逊，当当，淘宝，天猫）；
            <br>   8、一旦用户选择参加订阅计划，必须遵守平台的规则。如果出现违反平台规则的情况，平台有权停止相应服务。
            <br>   9、如果有任何问题，随时可以联系平台，联系电话：0571-86113050。
            <br>  10丶无限制卡会员再次下新订单时，需要会员预约归还旧书的时间，并且至少有一单完成结算才能继续租(即在途加在手不得超过2个)
            </p>
            <br>
            <p style="color:#ffa858"><span class="light"></span>温馨提示：完整归还上一个订单，是体验下一个订单的开始哦</p>
        </div>
    </div>

    <div v-show="titleShow==false">
         <header-cop :heder_title="title" class="headercop"></header-cop>
        <div class="header"></div>
        <div class="rule_content" :class="{'rule_content--show':!titleShow}">
                <p style="text-indent:2em">
                绘本订阅计划是博鸟绘本平台推出的会员制订阅服务，订阅计划分为小博士无限次计划及小博士次卡计划以，二者的权益不同，具体请参见计划购买页面说明。
            </p>
            <h3>订阅计划使用规则如下：</h3>
            <p>
            1、订阅计划一旦生效使用之后，即不可退订；
            <br>   2、订阅计划在用户购买后立即生效，有效期取决于不同的计划，分为3个月（季度）与12个月（年度）两种订阅计划在用户购买后立即生效，有效期分为3个月（季度）与12个月（年度）两种；；
            <br>   3、有效期内，用户可以不限次数的借阅绘本，每次可借阅的绘本数量为10本；每个计划最多允许用户同时有两个在途订单。一当用户的在途订单达到两个，用户需要归还部分订单并由平台结算后才能继续借阅。在途订单是指平台尚未结算的借阅订单；
        <br>   4、用户起始借阅的时间不能晚于计划的有效期；在计划到期后，用户需要在有效期结束后五天之内归还所有在途订单。逾期需要收取额外的租赁费用；
            <br>   5、由于物流时间的原因，用户至少要提前五天下单预定想要借阅的绘本；
            <br>   6、关于物流部分，平台负责往返包邮，用户无需承担任何物流费用；归还的时候，用户只需要在【待归还订单】里点击归还按纽，预约快递就可以了，无需付费；
        <br>   7、绘本借阅过程中，由于人为的原因造成了绘本的损坏，并影响了后续的使用与借阅，用户可能需要承担相应的赔偿。实际赔偿的金额不会高于绘本在其他电商平台正常的零售价格（参考京东，亚马逊，当当，淘宝，天猫）；
            <br>   8、一旦用户选择参加订阅计划，必须遵守平台的规则。如果出现违反平台规则的情况，平台有权停止相应服务。
            <br>   9、如果有任何问题，随时可以联系平台，联系电话：0571-86113050。
            </p>
            <br>
            <p style="color:#ffa858"><span class="light"></span>温馨提示：完整归还上一个订单，是体验下一个订单的开始哦</p>
        </div>
    </div>
</div>
</template>

<script>
import HeaderCop from '../common/header.vue';
import BScroll from 'vue-betterscroll';
import { API, getQuery } from '../../../services';
export default {

    components: {
        HeaderCop,
        BScroll,
    },
    computed: {

    },
    data() {
        return {
            typeList:[],
           title:"绘本订阅计划使用规则",
           titleShow:false,
        }
    },
    mounted () {
         if(this.$route.query.type=='H5'){
            this.titleShow=true;
        }else{
            this.titleShow=false;
        }
        setTimeout(()=>{
            this.typeList=[1,1];
            this.$refs.scollView.scroll.refresh();
        },100);
    },
    activated () {
        if(this.$route.query.type=='H5'){
            this.titleShow=true;
        }else{
            this.titleShow=false;
        }
        setTimeout(()=>{
            this.typeList=[1,1];
            this.$refs.scollView.scroll.refresh();
        },100);
    }

}
</script>
