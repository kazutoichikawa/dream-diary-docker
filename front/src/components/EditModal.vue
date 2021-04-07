<template>
<div>
  <li class="menu" @click="openModal">編集</li>
  <div id="overlay" v-if="modal">
    <div id="content">
      <p>編集</p>
        <input class="title-input" v-model="dream.title" placeholder="夢のタイトルを入力">
        <textarea
          class="discription-input"
          v-model="dream.discription" 
          placeholder="夢の内容を入力" cols="50" rows="10">
        </textarea>
      <div class="button-wrapper">
        <a class="modal-btn btn-pink" @click="closeModal">Close</a>
        <a @click="updateDream(id)" class="modal-btn btn-pink">
          <span>
            編集する
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
    id: Number,
    title: String,
    discription: String,
    getDream: Function
  },
  data(){
    return {
      dream: {
        title: this.title,
        discription: this.discription
        },
      modal: false,
    }
  },
  update(){
    this.getDream
  },
  methods: {
    openModal() {
      this.modal = true
    },
    closeModal(){
      this.modal = false
    },
    updateDream(id){
    if(!this.dream.title) return;
    axios.put(`http://localhost:3000/dreams/${id}`, { dream: this.dream })
    .then(function(res) {
        console.log(res);
      })
    .catch(function(err) {
        console.log(err);
      })
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
  display: block;
}

.button-wrapper{
  display: flex;
  justify-content: space-around;
  align-items: flex-end;
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

li {
  font-size: 14px;
  border-bottom: 1px solid #666666;
  padding:0px  5px;
}

.modal-btn {
  width: 80px;
  text-align: center;
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
