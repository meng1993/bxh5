<template lang="pug">
    ViewBox.containter
        header-cop(:heder_title="htitle").header
        ul.order_bookList
            li(v-for="(item, index) in booklist")
                .order_bookSingle
                    img(:src="imgFormat(item.book_img)").order_bookSingle_img
                    .order_bookSingle_content
                        h4.book_common_title.twonowarp {{item.book_title}}
                group
                    x-textarea(:title="title" , v-model="comments[index].content", :placeholder= "item.default_comment"  ).order_bookcomment
        x-button(text="提交评论", @click.native='commentsub()').btn

</template>

<script>
    import HeaderCop from '../common/header.vue';
    import {ViewBox, XTextarea, Group, XButton } from 'vux'
    import { mapGetters } from 'vuex'
    import { API, getQuery } from '../../../services'
    export default {
        name: "setcomment",
        data(){
            return{
                htitle: '绘本评价',
                booklist:[],
                value: '绘本很新，书很好',
                title: '评价:',
                comments:[] 
            }
        },
        computed : {
            ...mapGetters([
                'getUserInfoUserId',
                'getUserInfoToken',
            ]),
        },
        components:{
            ViewBox,
            Group,
            XTextarea,
            XButton,
            HeaderCop
        },
        methods:{
            commentsub(){
                const self = this
                for(let i= 0; i<this.booklist.length; i++){
                    if(this.comments[i].content === null ){
                        this.comments[i].content = this.booklist[i].default_comment
                    }
                }
                API.book.orderComment({
                    user_id: self.getUserInfoUserId,
                    token: self.getUserInfoToken,
                    order_id: self.$route.params.order_id,
                    comments: self.comments
                }).then(res=>{
                    console.log(res, '+++++++++++++++res+++++++++++')
                    if(res.body.code === 200){
                        this.$router.push({
                            name: 'B_mine_commentlist',
                            params:{'order_id':self.$route.params.order_id }
                        });
                    }
                })
            },
            getcomment(){
                const self = this
                API.order.myOrderComment({
                    user_id: self.getUserInfoUserId,
                    token: self.getUserInfoToken,
                    order_id: self.$route.params.order_id,
                }).then((res) => {
                    if (res.body.code == 200) {
                        self.booklist = res.body.data
                        for(let i= 0; i<self.booklist.length; i++){
                            self.comments[i] = {}
                            self.comments[i].book_id = self.booklist[i].book_id
                            self.comments[i].content = null
                        }
                    }
                });
            },
        },

        activated(){
            this.$nextTick(() => {
                var aa = document.getElementsByTagName('textarea')
                for(var i = 0; i < aa.length; i++) {
                aa[i].value = ''
            }
            })
            // this.getorder();
            this.getcomment();
        }
    }
</script>

<style scoped lang="scss">
    .header{
        width: 100%;
        position: fixed;
        top: 0
    }
    .order_bookList{
        padding-top: 55px;
    }
    .btn{
        position: fixed;
        bottom: 0;
        left: 0;
        background-color: #2196f3;
        color: white;
    }
    .order_bookSingle{
        padding: 20px;
        display: flex;
        padding-bottom: 20px;
        border-bottom: 1px solid #f3f3f3 ;
        &_img{
            width: 130px;
            height: 160px;
        }
        &_content{
            display: flex;
            justify-content: center;
            align-items: center;
            padding-left: 20px;
        }
    }
    .order_bookcomment{
        width: 100%;
        height: 100px;
    }
        
</style>
