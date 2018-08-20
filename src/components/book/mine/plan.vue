
<style lang="scss" scoped>
.bookMain {
    /* 主体部分 */
    &_planBuy{
        height: 30px;
        width: 120px;
        text-align: center;
        line-height: 30px;
        border-radius: 5px;
        background-color: #2196f3;
        color: #fff;
        font-size: 15px;
        display: block;
        margin: 50px auto;
    }
    &_noPlan{
        position: fixed;
        bottom: 0;
        height: 50px;
        background-color: #2196f3;
        width: 100%;
        color: #fff;
        font-size: 18px;
        line-height: 50px;
        text-align: center;
    }
    &_content {
        height: calc(100% - 50px);
        overflow-y: auto;
    }
    &_planList{
        padding: 15px;
        padding-bottom: 0;
        box-sizing: border-box;
    }
    &_planSingle{
        width: 100%;
        position: relative;
        margin-bottom: 15px;
        &_else{
            color: #ff0b4a;
        }
         >img{
            width: 100%;
            display: block;
                }
        &_type{
            position: absolute;
            right: 68px;
            top: 25px;
             height: 20px;
             width: 40px;

        }
        &_fixed {
            position: absolute;
            height: 100px;
            width: 100px;
            border-radius: 50%;
            background-image: url("../../../assets/img/plan/planTime.png");
            right: 12.5px;
            bottom: 12.5px;
            background-size: contain;
            background-repeat: no-repeat;
           >h2{
                font-size: 26px;
                color: #ff0b4a;
                line-height: 100px;
                text-align: center;
            }
            >span{
                position: absolute;
                bottom: 0;
                display: block;
                left: 0;
                font-size: 12px;
                color: #ff0b4a;
                text-align: center;
                width: 100%;
            }
        }
        &_left{
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        &_content{
            position: absolute;
            width: 100%;
            height: 100%;
            left: 0;
            top: 0;
            box-sizing: border-box;
            padding: 25px;
                >img{
                   position: absolute;
                   left: 50%;
                   top: 50%;
                   width: 30%;
                   transform: translate(-50%,-50%);
                   display: block;
                }
                h2{
                    font-size: 18px;
                    font-weight: 300;
                    text-align: center;
                    color: #fff;
                }
                h3{
                display: flex;
                justify-content: space-between;
                padding: 17px 30px;
                font-size: 16px;
                color: #926b0d
                }
                h4{
                display: flex;
                justify-content: space-between;
                font-size: 14px;
                padding: 0px 10px;
                color: #b68215
                }
        }
        &--notime{
            .bookMain_planSingle_else{
                color: #666;
            }
           .bookMain_planSingle_content{
               color: #fff;

           } 
           .bookMain_planSingle_fixed{
            background-image: url("../../../assets/img/plan/panTime1.png");
               
               >h2{
                color: #666;
            }
            >span{
                color: #666;
            }
           }
        }
       
    }
    &_nodata {
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

}
</style>


<template lang="pug">
    .bookMain
        header-cop(:heder_title="title")
        .bookMain_content
            b-scroll(
                :data="bookList",
                @pulldown="refreshData",
                pulldown=true,
                ref="scollView"
                )
                .bookMain_nodata(v-show="haveData")
                    i(class="iconfont")  &#xe62a; 
                    h3.bookMain_nodata_title 您还没有借阅计划，快去添加吧
                    router-link(to="/book_bookCard",class="bookMain_nodata_link") 立即购买
                //-推荐书本列表
                ul.bookMain_planList
                    li(v-show="(item.status==1&&isChoose==1) || isChoose!=1" @click="choosePlan(item)",v-for="item in bookList",:class="{'bookMain_planSingle--notime':item.status!=1 || item.one_rent_num< book_num}").bookMain_planSingle
                        img(@load="scollRefresh",src="../../../assets/img/plan/panBc3.png")
                        .bookMain_planSingle_content
                            .bookMain_planSingle_left
                                h2 {{item.name}}
                                h3 
                                    span {{item.one_rent_num}}本  
                                    span(v-show="item.rank==4") 无限 
                                    span(v-show="item.rank!=4") {{item.total_remain}}次
                                    span {{item.shengyu}}
                                h4 
                                    span 每次可借本数  
                                    span 剩余借阅次数
                                    span 剩余可用天数
                            //- 失效 过期
                            img(src="../../../assets/img/plan/bukeyong.png",v-show="item.use_status==0")
                            img(src="../../../assets/img/plan/yishixiao.png",v-show="item.status==2")
                            //- 冻结
                            img(src="../../../assets/img/plan/frozen.png",v-show="item.status==3")
                router-link(to="/book_bookCard",v-show="!haveData && isChoose!=1").bookMain_planBuy 购买更多计划
                div(@click="choosePlan('none')", v-show="isChoose==1").bookMain_noPlan 不使用计划    
                toast(v-model="toast" , type="success") {{confrim}}

</template>

<script>
import HeaderCop from '../common/header.vue';
import BScroll from 'vue-betterscroll';
import { API, getQuery } from '../../../services';
import { mapGetters } from 'vuex';
import { XHeader,Alert, Actionsheet, TransferDom, ButtonTab, ButtonTabItem,Toast } from 'vux';
export default {
    directives: {
        TransferDom
    },
    components: {
        XHeader,
        Actionsheet,
        ButtonTab,
        ButtonTabItem,
        HeaderCop,
        BScroll,
        Toast,
        Alert
    },
    computed: {
        ...mapGetters([
            'getUserInfoUserId',
            'getUserInfoToken',
        ]),
    },
    data() {
        return {
            title: "我的计划",
            haveData: false,
            isChoose:0,//是否处于选择状态
            bookList: [{
                "total_use_times": 12,
                /* 总的可使用次数 */
                "type": 4,
                /* 类型：1-月卡2-季卡3-半年卡4-年卡 */
                "card_id": 2,
                /* card_id */
                "month_use_times": 2,
                /* 当月可使用次数 */
                "total_remain": 12,
                /* 总的剩余使用次数 */
                "one_rent_num": 8,
                /* 一次可借的书本数量 */
                "card_no": "1234567890",
                /* 卡号 */
                "price": "599.00",
                /* price */
                "name": "小博士计划",
                /* name */
                "invalid_time": 1888888888,
                /* 失效时间 */
                "rank": 2,
                /* 等级：1-金卡(状元计划)2-银卡(博士计划)3-普通卡 */
                "month_remain": 1,
                /* 当月剩余使用次数 */
                "effect_time": 0,
                /* 生效时间 */
                "status": 1, 
                /* 状态1-有效 2-无效 3-冻结*/
                "use_status":0
                /*可用状态*/
            }],
            confrim: "",
            toast: false,
            book_num: 0,
        }
    },
    methods: {
        toUse(){
            this.$router.push('/book/main');
        },
        routerBack() {
            this.$router.goBack();
        },
        /**@argument
         * 选择计划
         */
        choosePlan(item){
            if(item.use_status==0){
                this.$vux.alert.show({
                content: '无限次卡最多同时拥有两单,请先归还一单再使用',
        })
                return;
            }
            if(this.isChoose==1 && item!="none"){
                if(item.one_rent_num<this.book_num) {
                    return false;
                }
                let name=item.show_name;
                console.log(item.show_name);
                localStorage.setItem('choosePlan', JSON.stringify({
                    name:name,
                    id:item.user_card_id
                }));
                this.routerBack();
            }else if (item=="none") {
                localStorage.setItem('choosePlan', 'none');
                this.routerBack();
            }else{
                localStorage.setItem("cardInfo",JSON.stringify({
                    child:[item],
                    name:item.name
                }));
                this.$router.push({
                    path:'/book_planInfo'
                }) 
            }
        },
        getUserData(num){
            API.book.myValidCards({
                user_id: this.getUserInfoUserId,
                token: this.getUserInfoToken,
                book_num:num
            }).then((res) => {
               if(res.body.code==200){
                   res.body.data.cards.forEach((item)=>{
                       item.shengyu=item.invalid_time-item.effect_time;
                       item.shengyu=Math.ceil(item.shengyu/3600/24);
                       if(item.shengyu<0){
                           item.shengyu=0
                       }
                   })
                    this.bookList=res.body.data.cards;
                     if(this.bookList.length==0){
                            this.haveData=true;
                        }else{
                            this.haveData=false;
                        }
                 }
            });
        },
        /**@argument
         * 获取我的计划列表
         */
        getData() {
            API.book.getPlan({
                user_id: this.getUserInfoUserId,
                token: this.getUserInfoToken,
            }).then((res) => {
               if(res.body.code==200){
                   res.body.data.forEach((item)=>{
                       item.shengyu=item.invalid_time-item.effect_time;
                       item.shengyu=Math.ceil(item.shengyu/3600/24);
                       if(item.shengyu<0){
                           item.shengyu=0
                       }
                   })
                    this.bookList=res.body.data;
                    
                     if(this.bookList.length==0){
                            this.haveData=true;
                        }else{
                            this.haveData=false;
                        }
                 }
            })
        },
        refreshData() {
            this.isChoose=this.$route.query.choose||0;
            if(this.isChoose==1){
                this.title="请选择可用计划";
                this.getUserData(this.$route.query.num);
            }else{
                this.title="我的计划";
                this.getData();  
            }
        },
    /* 滚动列表重置刷新 */
    scollRefresh(){
      this.$refs.scollView.scroll.refresh();
    },
        /* 支付宝付款成功后的回调函数 */
        success(item) {
            let self=this;
            API.alipay.success({
                out_order_no: item.out_order_no,
                order_no: item.order_no,
                invoke_state: item.invoke_state,
                user_id: item.user_id,
                admit_state: item.admit_state,
            }).then((res) => {
                /* alert("借还注入") */
                if (res.body.code == 200) {
                    /* alert("进入支付"); */
                    API.book.H5Pay({
                        userId: self.getUserInfoUserId,
                        token: self.getUserInfoToken,
                        orderSn: JSON.parse(item.invoke_state).order_sn,
                        payMethod: 4,
                        openId: 0,
                    }).then((resopndy) => {
                        /* alert("调动支付"); */
                        if (resopndy.body.code == 250) {
                            self.confrim = "支付完成";
                            self.toast = true;
                        } else if (resopndy.body.code == 300) {
                            self.confrim = resopndy.body.msg;
                            self.toast = true;
                        } else {
                            const div = document.createElement('div');
                            div.innerHTML = resopndy.body;
                            document.body.appendChild(div);
                            document.forms.alipaysubmit.submit();
                        }
                    },(err)=>{
                        /* alert("支付请求失败"); */
                        alert(JSON.stringify(err));
                    });
                }else{
                    alert(res.body.msg);  
                }
            }, (err) => {
                alert("借还注入错误");
                alert(JSON.stringify(err));
            });
        },
    },
  
    mounted() {

    },
    activated () {
        this.data= JSON.parse(localStorage.getItem('cardInfo'));  
        this.title=this.data.name;
        this.book_num = this.$route.query.num;
        this.isChoose=this.$route.query.choose||0;
        if(this.isChoose==1){
            this.title="请选择可用计划";
            this.getUserData(this.$route.query.num);
        }else{
            this.title="我的计划";
            this.getData();  
        }
        /* 获取当前url参数 */
        let biz_content = this.$route.query.biz_content;
        /* 支付宝借还成功后的回调 */
        if (biz_content) {
            biz_content = JSON.parse(biz_content);
            let timetamp = JSON.parse(biz_content.invoke_state).timestamp;
            /* if (((new Date().getTime() / 1000) - timetamp) <= 30) { */
                this.success(biz_content);
            
     }
    }
}
</script>
