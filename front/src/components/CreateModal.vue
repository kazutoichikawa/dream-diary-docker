<template>
<div>
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
</div>
</template>

<script>
import axios from 'axios';
export default {
  props: {
    getDream: Function
  },
  data(){
    return {
      modal: false,
      dream: {
        title: this.title,
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
    }
  }
  
}
</script>
<style scoped>
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
.index-btn {
  width: 150px;
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
</style>
