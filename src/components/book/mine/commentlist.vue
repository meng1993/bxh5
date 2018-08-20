<template lang="pug">
    ViewBox.containter
        header-cop(:heder_title="htitle" :toB='1').header
        ul.order_bookList
            li(v-for="(item, index) in booklist").order_bookitem
                .order_bookSingle
                    img(:src="imgFormat(item.book_img)").order_bookSingle_img
                    .order_bookSingle_content
                        h4.book_common_title.twonowarp {{ item.book_title }}
                .order_bookcomment
                    img(:src="imgFormat(item.userface)").order_bookcomment_self_face
                    .order_bookcomment_content
                        .order_bookcomment_content_txt
                            .order_bookcomment_content_txt_name {{item.nickname}}
                            .order_bookcomment_content_txt_time {{item.comment_time | orderdata}}
                        .order_bookcomment_content_con
                            p.order_single_contentcont_p {{item.comment_content}}
</template>

<script>
    import HeaderCop from '../common/header.vue';
    import {ViewBox, XHeader } from 'vux';
    import { mapGetters } from 'vuex';
    import { API, getQuery } from '../../../services';
    export default {
        name: "setcomment",
        data(){
            return{
                htitle: '我的评价',
                order_id: this.$route.params.order_id,
                booklist:[]
            }
        },
        computed: {
            ...mapGetters([
                'getUserInfoUserId',
                'getUserInfoToken',
            ]),
        },
        components:{
            ViewBox,
            HeaderCop
        },
        methods:{
            getcomment(){
                const self = this
                API.order.myOrderComment({
                    user_id: self.getUserInfoUserId,
                    token: self.getUserInfoToken,
                    order_id: self.$route.params.order_id,
                }).then((res) => {
                    if (res.body.code == 200) {
                        self.booklist = res.body.data
                    }
                });
            },
            getorder(){
                const self = this
                API.book.orderDetail({
                    user_id: self.getUserInfoUserId,
                    token: self.getUserInfoToken,
                    order_id: self.$route.params.order_id
                }).then((res)=>{
                    if (res.body.code == 200) {
                        self.booklist = res.body.data.books
                    }
                })
            },

        },

        activated(){
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
    .order_bookitem{
        margin-bottom: 20px;
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
        padding-top: 10px;
        padding-bottom: 10px;
        display: flex;
        border-bottom: 5px solid #f3f3f3;
        &_self_face{
                width: 40px;
                height: 40px;
            }
        &_content{
            width: 100%;
            padding-left: 10px;
            padding-right: 20px;
            &_txt{
                height: 40px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                &_name{
                    flex-basis: 150px;
                    overflow: hidden;
                    line-height: 40px;
                    height: 40px;
                }
            }
            &_con{
                width: 100%;
            
            }
        }

    }
</style>