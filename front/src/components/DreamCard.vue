<template>
    <div class="card">

      <div class="title">
        タイトル: {{ dream.title }}
        <div>
          <img alt="Header logo" src="../assets/menu.png"
          @click="isActive = !isActive"
          height="18">
          <div class="pulldown-menu" v-if="isActive">
              <EditModal />
              <li><a @click="deleteDream(dream.id)" class="menu">削除</a></li>
          </div>
        </div>
      </div>
      <div class="discription">
        ディスクリプション: {{ dream.discription }}
      </div>
    </div>
</template>

<script>
import axios from 'axios';
import EditModal from './EditModal'
export default {
  components: {
    EditModal
  },
  name: 'card',
  props: {
    dream: Object,
    getDream: Function
  },
  data() {
    return {
      isActive: false,
    }
  },
  methods: {
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

  }
}
</script>

<style scoped>
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
