<template>
<div id="app">
  <header>
    <img alt="Header logo" src="./assets/header-logo.png" height="80">
  </header>
    <a class="index-btn btn-pink" @click="openModal">夢を登録する</a>
    <div id="overlay" v-if="modal">
      <div id="content">
        <p>夢の記録しよう！</p>
        
          
            <input class="title-input" v-model="dreams_tag.title" placeholder="夢のタイトルを入力">

            <input class="tag-input" v-model="dreams_tag.name" placeholder="タグを入力">
          <div>
            <textarea 
            class="discription-input" 
            v-model="dreams_tag.discription" 
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
</div>
</template>

<script>
import axios from 'axios';
export default {
  name: 'App',
  components: {
    
  },
  data(){
    return {
      dreams: [],
      modal: false,
        dreams_tag: {
        title: this.title,
        name: this.name,
        discription: this.discription
        }
    }
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
      .then(res => (this.dreams = res.data))
      .catch(err => {
        console.log(err)
      })
    },
    createDream(){
     axios.post('http://localhost:3000/dreams',{
       dreams_tag: this.dreams_tag
     })
     .then(function (response){
       console.log(response);
     })
     .catch(function (error){
       console.log(error);
     });
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

.tag-input{
  margin: 0 5px 5px 5px;
}

.button-wrapper{
  display: flex;
  justify-content: space-around;
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

</style>
