
<style lang="scss" >
.bookMain {
  &_iconList {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    padding-bottom: 15px;
    background-color: #fff;
    margin-bottom: 10px;
  }
  &_iconsingle {
    margin-top: 15px;
    width: 25%;
    > img {
      display: block;
      width: 40px;
      height: 40px;
      margin: 0 auto;
      margin-bottom: 15px;
    }
    > h3 {
      font-size: 14px;
      color: #333;
      text-align: center;
    }
  }

  /* 主体部分 */
  .topPadding {
    height: 56px;
    width: 100%;
  }
  &_content {
    > h3 {
      padding: 0 15px;
      box-sizing: border-box;
      font-size: 18px;
      line-height: 40px;
      height: 40px;
      color: #2196f3;
      background-color: #fff;
    }
  }

  &_toolbar {
    background-color: #fff;
    height: 56px;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 2;
    width: 100%;
    &_date {
      height: 100%;
      width: 25%;
      float: left;
      .weui-cells {
        height: 56px;
        line-height: 56px;
      }
      .weui-cell {
        padding: 5px 0 0;
      }
      .vux-cell-value {
        color: #000000;
      }
    }
    &_search {
      height: 100%;
      width: 60%;
      float: left;
      line-height: 56px;
      text-align: center;
      > a >input {
          border: none;
          background-color: #EFEFEF;
          height: 38px;
          width: 94%;
          border-radius: 16px;
          text-indent: 40px;
          color: #8E938D;
          background-image: url('~@/assets/img/common/search.png');
          background-repeat: no-repeat;
          background-size: 20px;
          background-position: 5% center;
      }
    }
    &_message {
      height: 100%;
      width: 15%;
      float: left;
      font-size: 12px;
      text-align: center;
      line-height: 90px;
      background-image: url('~@/assets/img/common/xiaoxi.png');
      background-repeat: no-repeat;
      background-size: 28px;
      background-position: center 10px;
    }
  }
}

.book_swiper {
  height: 200px !important;
  .vux-swiper {
    height: 200px !important;
  }
  .vux-swiper-item {
    position: relative;
    width: 100%;
    height: 200px !important;
  }
  .vux-swiper-item img {
    height: 100% !important;
    width: 100%;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
  }
}
.book_card {
  height: 80px;
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 12px;
  /*background:#fff;*/
  /*padding:10px 0;*/
  &_left {
    width: 50%;
    height: 100%;
    padding: 5px;
    img {
      height: 100%;
      width: 100%;
    }
  }
}
</style>


<template lang="pug">
  //- 首页主体
  .bookMain
      .bookMain_toolbar
        .bookMain_toolbar_date
            group
                calendar(
                    @on-change="onChange"
                    v-model="time"
                    title=""
                    show-popup-header
                    popup-header-title="请首先选择开始借阅时间"
                    :placeholder="time"
                    :start-date="startTime"
                    :end-date="endTime"
                    :replace-text-list="replaceTextList"
                    :weeks-list="weeksList"
                    :display-format="displayFormat"
                )
        .bookMain_toolbar_search
            router-link(to="/indexSearch")
                input(placeholder="绘本搜索", disabled)
        //- .bookMain_toolbar_message 消息
      .topPadding
      b-scroll(
      :data="bookList",
      pullup=true,
      pulldown=true,
      @pulldown="getIcon",
      @scrollToEnd="getBookList",
      ref="scollView",
      :swiper_pullUp="swiper_pullUp",
      :swiper_nodata="swiper_nodata")
          swiper( class="book_swiper" :loop='true' :auto='true' :interval='2000' dots-position="center"  height="300"  :aspect-ratio="300/750"  @on-index-change="onSwiperItemIndexChange")
              swiper-item(class="swiper-demo-img" ,v-for="(item, index) in bannerlist", :key="index")
                  img(@click="bannerClick(item.h5_path)" ,:src="imgFormat(item.img)")
          .bookMain_header
              ul.bookMain_iconList
                  li(v-for="item,index in iconList",@click="iconClick(item.icon_id,item.type,item.content)").bookMain_iconsingle
                      img(:src="imgFormat(item.img)",alt="img")
                      h3 {{item.name}}
          .book_card
              .book_card_left(v-for="item in twoBanner")
                  a(:href="item.content")
                      img(:src="imgFormat(item.img)")
              //- .book_card_left
              //-     a(href='https://m.zujiekeji.cn/share3.html?type=H5')
              //-         img(src="http://oss.zujiekeji.cn/img/banner/xinrenlibao20171130.png")
          .bookMain_content
              h3 热门推荐
              book-list(:commonBookList="bookList",type="0",:refresh.native="scollRefresh")
              //-推荐书本列表

</template>

<script>
import HeaderCop from "./common/header.vue";
import BookList from "./common/bookList.vue";
import BScroll from "vue-betterscroll";
import { mapGetters } from "vuex";
import { API, getQuery } from "../../services";
import {
  XHeader,
  Actionsheet,
  TransferDom,
  ButtonTab,
  ButtonTabItem,
  Swiper,
  SwiperItem,
  Group,
  Calendar,
  Sticky
} from "vux";
export default {
  directives: {
    TransferDom
  },
  components: {
    BookList,
    XHeader,
    Actionsheet,
    ButtonTab,
    ButtonTabItem,
    HeaderCop,
    BScroll,
    Swiper,
    SwiperItem,
    Calendar,
    Group,
    Sticky,
  },
  data() {
    return {
      /* 上拉加载更多 */
      swiper_pullUp: false, //显示加载
      swiper_nodata: false, //没有更多数据
      bookList: [],
      title: "绘本",
      iconList: [],
      page: 1,
      loading: false,
      bannerlist: [],
      twoBanner: [],
      time: "",
      weeksList: ["日", "一", "二", "三", "四", "五", "六 "],
      replaceTextList: { TODAY: "今" },
      startTime: "",
      endTime: "",
      displayFormat (value, type) {
        if(value != null) {
          let date = value.slice(5, value.length);
          return value.length ? date.split("-")[0] + '月' + date.split("-")[1] + '日' : ''
        }
      },
    };
  },
  computed: {
    ...mapGetters(["getUserInfoUserId", "getUserInfoToken"])
  },
  methods: {
    /* 时间更改函数 */
    onChange(val) {
      console.log(val);
      console.log(this.time);
      console.log(window);
      window.startTime = this.time;
      localStorage.setItem('time', this.time)
    },
    setDate(days){//设置时间
      let date = new Date();
      date.setDate(date.getDate()+days);
      let year = date.getFullYear();
      let month = date.getMonth()+1;
      let day = date.getDate();
      if(day<10){day = "0" + day;}
      if(month<10){month = "0" + month;}
      return year + '-'+ month+'-'+day;
    },
    getDate() {
      API.book.getMinMaxDays().then(res => {
          if (res.body.code == 200) {
            this.max = res.body.data.max_book_num;
            //let current = new Date().getTime();
            this.startTime = this.setDate(res.body.data.min_days);//初始可选时间
            if (window.localStorage.getItem('time') != this.startTime) {//选中的时间
              this.time = this.startTime
              localStorage.setItem('time', this.time)
            } else {
              this.time = localStorage.getItem('time')
            }
            // if(this.time == "" && (localStorage.getItem('time') != 'null') && (localStorage.getItem('time') != null)){
            //   console.log(localStorage.getItem('time'));
            //   let stringTime = localStorage.getItem('time') + " 00:00:00";
            //   let timestamp2 = Date.parse(new Date(stringTime));
            //   if (timestamp2 < (current + (res.body.data.min_days - 1) * 864e5)) {
            //     this.time = this.dateFormat(current + 6 * 864e5, "YYYY-MM-DD");
            //     localStorage.setItem('time', this.time)
            //   }else {
            //     this.time = localStorage.getItem('time');
            //   }
            // }else if(this.time == "") {
            //   this.time = this.dateFormat(current + 6 * 864e5, "YYYY-MM-DD");
            //   localStorage.setItem('time', this.time)
            // }else {
            //   this.time = localStorage.getItem('time');
            // }
            this.endTime = this.setDate(res.body.data.max_days);//最远可选时间
            // this.endTime = this.dateFormat(
            //   current + res.body.data.max_days * 864e5,
            //   "YYYY-MM-DD"
            // );
            this.noPlan = false;
          } else {
            this.noPlan = true;
          }
        });
    },

    onSwiperItemIndexChange() {
      //switer
    },
    /**
       * 获取iconlist
       */
    getIcon() {
      this.page = 1;
      this.bookList = [];
      API.book
        .getIcon()
        .then(res => {
          if (res.body.code == 200) {
            this.iconList = res.body.data;
          }
        })
        .then(() => {
          this.getBookList();
        });
    },
    /**
       * 获取首页两个广告banner
       */
    getTwoBanner() {
      API.book.getTwoBanner().then(res => {
        if (res.data.code == 200) {
          this.twoBanner = res.data.data;
        }
      });
    },
    /**
       * 获取首页推荐列表
       */
    getBookList() {
      if (this.loading) {
        return false;
      }
      this.loading = true;
      if (this.bookList.length >= 10) {
        this.swiper_pullUp = true;
        this.swiper_nodata = false;
      }
      API.book
        .getRecommd({
          page: this.page,
          page_number: 10,
          user_id: this.getUserInfoUserId,
          token: this.getUserInfoToken,
          start_date: window.startTime
        })
        .then(res => {
          if (res.body.code == 200) {
            let time = 0;
            if (this.bookList.length != 0) {
              time = 500;
            }
            setTimeout(() => {
              if (res.body.data.length > 0 || this.page == 1) {
                this.swiper_pullUp = false;
                this.bookList = this.bookList.concat(res.body.data);
                this.page++;
              } else {
                this.swiper_pullUp = false;
                if (this.bookList.length >= 6) {
                  this.swiper_nodata = true;
                }
              }
              this.$nextTick(() => {
                this.scollRefresh();
                this.loading = false;
              });
            }, time);
          }
        });
    },
    /* 滚动列表重置刷新 */
    scollRefresh() {
      this.$refs.scollView.refresh();
    },
    /**@argument
       * icon点击函数 ，5种类型
       */
    iconClick(id, index, content = "") {
      switch (index) {
        case 1:
          this.$router.push({
            path: "/book_bookSearch"
          });
          break;
        case 2:
          this.$router.push({
            path: "/book_bookHot"
          });
          break;
        case 3:
          this.$router.push({
            path: "/book_bookSeries",
            query: {
              icon_id: id
            }
          });
          break;
        case 4:
          this.$router.push({
            path: "/book_bookNew",
            query: {
              icon_id: id
            }
          });
          break;
        case 5:
          this.$router.push({
            path: "/book_bookEnglish",
            query: {
              icon_id: id
            }
          });
          break;
        case 6:
          this.$router.push({
            path: "/book_bookPerSearch",
            query: {
              icon_id: id
            }
          });
          break;
        case 7:
          this.$router.push({
            path: "/book_bookCard",
            query: {
              icon_id: id
            }
          });
          break;
        case 8:
          window.location.href = content;
          break;
      }
    },
    /* 轮播图点击函数 */
    bannerClick(e) {
      window.location.href = e;
      /* 1：店铺 2：商品 3：url */
      // if (type == 1) {
      //   this.$router.push({
      //     path: "/shop/" + id
      //   });
      // } else if (type == 2) {
      //   localStorage.setItem("goodsInfo", "11");
      //   this.$router.push({
      //     path: "/goodsInfo/" + id
      //   });
      // }
      // else if(type == 4){
      // this.$router.push({
      // path: "/shouyehuodong2"
      //   });
      //   }
      //  else {
        //          if(id.indexOf('wap')>-1){
        //            id=id.replace("wap","m");
        //          }
        // window.location.href = id;
      // }
    }
  },
  mounted() {
    /* 获取轮播图信息 */
    API.main.getBanner({}).then(Response => {
      this.bannerlist = Response.body.data;
      // this.bannerlist.push(Response.body.data.bannerList);
    });
    this.getDate();
  },
  activated() {
    if (window.stopReload) {
      setTimeout(() => {
        this.$refs.scollView.scrollTo(
          0,
          localStorage.getItem("bookScroll") - 0,
          10
        );
      }, 20);
      window.stopReload = false;
    } else {
      this.getIcon();
      this.getTwoBanner();
    }
    this.scollRefresh()
    this.getDate();
  }
};
</script>
