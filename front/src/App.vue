<template>
<div id="app">
  <header>
    <img alt="Header logo" src="./assets/header-logo.png" height="80">
  </header>
    <a class="index-btn btn-pink" @click="openModal">夢を登録する</a>
    <div id="overlay" v-if="modal">
      <div id="content">
        <p>夢の記録しよう！</p>
            <input class="title-input" v-model="dream.title" placeholder="夢のタイトルを入力">
          <div>
            <textarea
            class="discription-input" 
            v-model="dream.discription" 
            placeholder="夢の内容を入力" cols="50" rows="10"></textarea>
          </div>
          <div class="button-wrapper">
            <a class="modal-btn btn-pink" @click="closeModal">Close</a>
            
            <a @click="createDream" class="modal-btn btn-pink">
              <span>
                登録する
              </span>
            </a>
          </div>
      </div>
    </div>
    <h4>夢日記一覧</h4>
    <div class="card-wrapper">
      <div class="card" v-for=" dream in dreams" :key="dream.id">
        <div class="title">
          タイトル: {{ dream.title }}
        </div>
        <div class="discription">
          ディスクリプション: {{ dream.discription }}
        </div>
        <div class="button-wrapper">
          <div class="card-btn btn-pink">
             編集
          </div>
          <div @click="deleteDream(dream.id)" class="card-btn btn-pink">
             削除
          </div>
        </div>
      </div>
    </div>
</div>
</template>

<script>
import axios from 'axios';
export default {
  name: 'App',
  data(){
    return {
      dreams: "dreams",
      modal: false,
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
    openModal() {
      this.modal = true
    },
    closeModal(){
      this.modal = false
    },
    getDream(){
      axios.get('http://localhost:3000/dreams')
      .then(res => (this.dreams = res.data,
      console.log(res)
      ))
      .catch(err => {
        console.log(err)
      })
    },
    createDream(){
     axios.post('http://localhost:3000/dreams',{
       dream: this.dream
     })
     .then(function (response){
       console.log(response);
     })
     .catch(function (error){
       console.log(error);
     });
     this.dream.title = '';
     this.dream.discription = '';
     this.modal = false;
     this.getDream()
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
#overlay{
  z-index:1;
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background-color:rgba(0,0,0,0.5);

  display: flex;
  align-items: center;
  justify-content: center;
}
#content{
  z-index:2;
  width:50%;
  padding: 1em;
  background:#fff;
  border: 3px solid #666666;
  border-radius: 10px;
}

.title-input{
  margin: 0 5px 5px 5px;
}



.button-wrapper{
  display: flex;
  justify-content: space-around;
  align-items: flex-end;
}

.modal-btn {
  width: 80px;
}

.btn-pink,
a.btn-pink {
  color: #fff;
  background-color: #FF66CC;
  padding: 6px;
  border-radius: 5px;
}
.btn-pink:hover,
a.btn-pink:hover {
  color: #fff;
  background: #FF66FF;
}
.index-btn {
  width: 150px;
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
}
.card-btn {
  width: 50px;
  text-align: center;
  font-size: 13px;
}
</style>
