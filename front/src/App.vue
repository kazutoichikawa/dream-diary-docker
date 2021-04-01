<template>
<div id="app">
  <Header />

    <CreateModal
    show="modal"
    :getDream="getDream"
     />
    <h4>夢日記一覧</h4>
    <div class="card-wrapper">
      <div class="card" v-for=" dream in dreams" :key="dream.id">

        <div class="title">
          タイトル: {{ dream.title }}
          <div>
            <img alt="Header logo" src="./assets/menu.png" @click="openMenu()" height="18">
            <div class="pulldown-menu" v-if="menu">
                <li><a class="menu">編集</a></li>
                <li><a @click="deleteDream(dream.id)" class="menu">削除</a></li>
            </div>
          </div>
        </div>
        <div class="discription">
          ディスクリプション: {{ dream.discription }}
        </div>
        <!-- <div class="button-wrapper">
          <div class="card-btn btn-pink">
             編集
          </div>
          <div @click="deleteDream(dream.id)" class="card-btn btn-pink">
             削除
          </div>
        </div> -->
      </div>
    </div>
</div>
</template>

<script>
import axios from 'axios';
import Header from './components/Header'
import CreateModal from './components/CreateModal'
export default {
  name: 'App',
  components: {
    Header,
    CreateModal
  },
  data(){
    return {
      dreams: "dreams",
      menu: false,
        dream: {
        title: this.title,
        discription: this.discription
        }
    }
  },
  mounted(){
    this.getDream();
  },
  methods: {
    getDream(){
      axios.get('http://localhost:3000/dreams')
      .then(res => (this.dreams = res.data,
      console.log(res)
      ))
      .catch(err => {
        console.log(err)
      })
    },
    deleteDream(id) {
      axios.delete(`http://localhost:3000/dreams/${id}`)
      .then(function(res){
        console.log(res)
      })
      .catch(function(err){
        console.log(err)
      })
      .finally(() => {
        console.info('削除完了')
        this.getDream()
      })
    },
    openMenu(){
      this.menu = true;
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 20px;
}
h4 {
  padding-left: 10px;
  text-align: left;
  width: 150px;
  border-bottom:1px solid #666666 ;
}
.card-wrapper {
  display: flex;
  flex-wrap : wrap;
}

.card {
  border: 1px solid #666666;
  margin: 5px;
  height: 200px;
  width: 300px;
  text-align: left;
  padding: 8px;
}

.title {
  border-bottom: 1px solid #666666;
  display: flex;
  justify-content: space-between;
}
.card-btn {
  width: 50px;
  text-align: center;
  font-size: 13px;
}

.pulldown-menu {
  list-style: none;
  background: #ffffff;
  border: 1px solid #666666;
  position: absolute;
  z-index:1.5;
}

li {
  font-size: 14px;
  border-bottom: 1px solid #666666;
  padding:0px  5px;
}
</style>
