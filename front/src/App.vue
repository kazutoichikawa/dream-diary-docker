<template>
<div id="app">
  <Header />
    <CreateModal
    show="modal"
    :getDream="getDream"
     />
    <h4>夢日記一覧</h4>
    <div class="card-wrapper">
      <DreamCard
        :key="dream.id"
        v-for="dream in dreams"
        :dream="dream"
        :getDream="getDream"
      />
    </div>
</div>
</template>

<script>
import axios from 'axios';
import Header from './components/Header'
import CreateModal from './components/CreateModal'
import DreamCard from './components/DreamCard'
export default {
  name: 'App',
  components: {
    Header,
    CreateModal,
    DreamCard
  },
  data(){
    return {
      dreams: "dreams",
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
</style>
