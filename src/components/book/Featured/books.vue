<template lang="pug">
  div
    .books_outer
      b-scroll(
              :data="bookList",
              ref="scollView",
          )
        img(@load="scollRefresh", src="../../../assets/img/goods/hd.png").books_bg
        button( class="books_btn", @click="to" ,type="button")
        button(class="books_btn_1",@click="tojy",type="button")
      toast(v-model="toast" type="success") {{confrim}}
</template>

<script>
import { Toast } from 'vux';
import { mapGetters } from 'vuex';
import BScroll from 'vue-betterscroll';
import { API, getQuery } from '../../../services';
export default {
  data() {
    return {
      confrim: "",
      toast: false,
      bookList: []
    }
  },
  components: {
    BScroll,
    Toast
  },
  computed: {
    ...mapGetters([
      'getUserInfoUserId',
      'getUserInfoToken',
    ]),
  },
  activated() {
    setTimeout(() => {
      this.scollRefresh();
    }, 20);
  },
  methods: {
    /* 滚动列表重置刷新 */
    scollRefresh() {
      this.$refs.scollView.scroll.refresh();
    },tojy(){
    this.$router.push('book/main')
    },
    to() {
      let user = window.localStorage.getItem("userInfo");
      if (!user) {
        this.$router.push({path:'/login',query:{return_url:window.location.href}});
        return false;
      }
      this.getStore();
    },
    getStore() {
      API.person.getUserZMScore({
        user_id: this.getUserInfoUserId,
        source: 3,
        zmtype: 3
      }).then((res) => {
        /**@argument
         * status 0,2:进入芝麻授权   1:判断分数大小 分数小于650不享用这个券  4：返回地址 
         */
        let status = res.body.data.status;
        if (status == 0 || status == 2) {
          if (status == 0 && res.body.data.type) {
            window.location.href = res.body.data.auth_url;
          } else {
            this.$router.push({
              path: "/authPage"
            })
          }
        } else if (status == 1) {
          if (res.body.data.zmscore < 650) {
            this.confrim = "只有芝麻信用分数高于650才可领取该优惠券";
            this.toast = true;
          } else {
            API.book.getFreeCard({
              user_id: this.getUserInfoUserId,
              token: this.getUserInfoToken,
            }).then((res) => {
              if (res.body.code == 200) {
                this.$router.push({
                  path: "/mine_plan",
                })
              } else {
                this.confrim = res.body.msg;
                this.toast = true;
              }
            });
          }
        }
      });
    },
  }

}
</script>
<style scoped lang="scss">
.books_outer {
  height: 100%;
  overflow: auto;
}

.books_bg {
  width: 100%;
  display: block;
}

.books_box {
  width: 100%;
  position: relative;
}

 .books_btn,.books_btn_1 {
       
    position: absolute;
    height: 56px;
    line-height: 35px;
    color: #fff;
    text-align: center;
    background-color: transparent;
    top: 64%;
    width: 89.33%;
    font-size: 16px;
    border-radius: 5px;
    left: 5.33%;
  }
  .books_btn_1{
    top: 71%;
  }
</style>