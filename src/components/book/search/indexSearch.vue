<style lang="scss" scoped>
    .bookMain {
      background-color: #F2F2F2 !important;
    }
    .bookMain_toolbar {
      &_type {
        height: 100%;
        width: 25%;
        float: left;
        .select {
          margin-top: 9px;
          height: 38px;
          border-top-left-radius: 16px;
          border-bottom-left-radius: 16px;
          background-color: #EFEFEF;
          width: 80%;
          margin-right: 0;
          float: right;
          text-align: center;
          .text {
            height: 20px;
            line-height: 20px;
            font-size: 14px;
            margin-top: 9px;
            border-right: #8E938D solid 1px;
          }
        }
      }
      &_search {
        height: 100%;
        width: 60%;
        float: left;
        line-height: 56px;
        > form > input {
            border: none;
            background-color: #EFEFEF;
            height: 38px;
            width: 100%;
            // border-radius: 16px;
            border-top-right-radius: 16px;
            border-bottom-right-radius: 16px;
            text-indent: 40px;
            color: #8E938D;
            background-image: url('~@/assets/img/common/search.png');
            background-repeat: no-repeat;
            background-size: 20px;
            background-position: 5% center;
        }
      }
      &_close {
        height: 100%;
        width: 15%;
        float: left;
        font-size: 18px;
        line-height: 54px;
        text-align: center;
      }
    }

    .history_title {
      height: 40px;
      &_text {
        float: left;
        height: 40px;
        width: 40%;
        text-align: center;
        line-height: 40px;
      }
      &_clear {
        float: right;
        height: 40px;
        width: 40%;
        text-align: center;
        line-height: 40px;
      }
    }

    .history_list {
      width: 100%;
      padding: 0 10px;
      &_keyword {
        width: auto;
        float: left;
        background-color: #ffffff;
        padding: 5px 15px;
        border-radius: 5px;
        margin: 5px 10px;
      }
    }
  
    .type_select {
      position: absolute;
      top: 58px;
      left: 7%;
      width: 70px;
      background-color: #000000;
      border-radius: 5px;
      &_type {
        color: #ffffff;
        font-size: 14px;
        text-align: center;
        height: 30px;
        line-height: 30px;
        border-bottom: #8E938D 1px solid;
        margin: 0 10px;
      }
    }
</style>




<template lang="pug">
  .bookMain
      .bookMain_toolbar
        .bookMain_toolbar_type(@click="showType = true")
            .select 
              .text {{type}}
        .bookMain_toolbar_search
          form(@submit.prevent="search")
            input(placeholder="绘本搜索", type="search", v-model="keyword")
        .bookMain_toolbar_close(@click='goBack') 取消
      .topPadding
      .history_title
          .history_title_text 历史搜索
          .history_title_clear(@click="clear", v-show="keyword_list.length != 0") 清空
      .history_list
          .history_list_keyword(v-for="item in keyword_list", @click="history_search(item)") {{ item }}
      .type_select(v-show="showType")
        .type_select_type(@click="typeSelect('书名')") 书名
        .type_select_type(@click="typeSelect('系列')") 系列
        .type_select_type(@click="typeSelect('作者')") 作者
        .type_select_type(@click="typeSelect('出版社')") 出版社
</template>

<script>
import BScroll from "vue-betterscroll";
import { mapGetters } from "vuex";
import { API, getQuery } from "../../../services";
import {
  Toast,
  Icon,
  XHeader,
  Actionsheet,
  TransferDom,
  ButtonTab,
  ButtonTabItem,
  Group,
  Calendar
} from "vux";
export default {
  directives: {
    TransferDom
  },
  components: {
    XHeader,
    Actionsheet,
    ButtonTab,
    ButtonTabItem,
    BScroll,
    Calendar,
    Group,
    Icon,
    Toast
  },
  computed: {
    ...mapGetters(["getUserInfoUserId", "getUserInfoToken"])
  },
  data() {
    return {
      keyword: "",
      keyword_list: "",
      type: "书名",
      showType: false,
    };
  },
  methods: {
    typeSelect: function (type) {
      this.type = type;
      this.showType = false;
    },
    goBack: function() {
            this.$router.push({
                path: "/book/main"
            });
    },
    history_search: function(keyword) {
        this.keyword = keyword;
        this.search();
    },
    search: function() {
        if(this.keyword == ""){
          return false;
        }
        let k = JSON.parse(localStorage.getItem("keyword"));
        if (k == null) {
          k = new Array;
          k.push(this.keyword);
        }else if(k.indexOf(this.keyword) == -1){
          k.push(this.keyword);
        }
        localStorage.setItem("keyword", JSON.stringify(k));
        this.keyword_list = JSON.parse(localStorage.getItem("keyword"));
        let type = 1;
        switch(this.type) {
            case '书名':
                type = 1;
                break;
            case '系列':
                type = 2;
                break;
            case '作者':
                type = 3;
                break;
            case '出版社':
                type = 4;
                break;
        }
        let param= {
          type: type,
          keywords: this.keyword,
          page: 1,
          page_number: 10,
          order_method: 0,
        }
        this.showType = false;
        this.$router.push({
            path:'/book_indexSearchRe',
            query:{
                param:JSON.stringify(param)
            }
        })
        return false;
    },
    clear: function() {
      let k = new Array;
      localStorage.setItem("keyword", JSON.stringify(k));
      this.keyword_list = JSON.parse(localStorage.getItem("keyword"));
    }
  },
  mounted() {},
  activated() {
    this.showType = false;
    let k = JSON.parse(localStorage.getItem("keyword"));
    if (k == null) {
      k = new Array;
    }
    this.keyword = "";
    localStorage.setItem("keyword", JSON.stringify(k));
    this.keyword_list = JSON.parse(localStorage.getItem("keyword"));
  }
};
</script>
