<template>
  <div class="home bg-primary">
    <header class="row">
      <div id="header-menu" class="col-12 px-4 pt-3 text-start">
        <router-link to="/">
          <i class="bi bi-arrow-left text-white" style="font-size: 2rem"></i>
        </router-link>
      </div>
      <div id="header-title" class="col text-white text-start p-4">
        <div>
          <h1>
            Mercadinho do seu Zé
          </h1>
          <p class="fw-light">
            <i class="bi bi-geo-alt"></i>
            Rua Amélia Pereira, 1198, Bairro da Cruz
          </p>
        </div>
      </div>
    </header>
    <main id="results-area" class="col-12 bg-white p-4" style="border-top-left-radius: 30px; border-top-right-radius: 30px">
      <div id="vertical-scroll-results">
        <div class="col-12">
          <p class="text-start">Produtos nessa loja que coincidem com sua busca por <strong>{{ productName }}</strong>:</p>
          <br />
          <div class="row" v-for="item in results" :key="item.productName">
            <div class="col-12 p-2 text-start">
              <h5>{{ item.productName }}</h5>
              <p class="fw-light">
                {{ item?.productDescription ?? "Sem descrição" }}
              </p>
              <br />
              <div class="d-flex justify-content-between text-align-center mb-3">
                <span class="fw-bold">
                  R$ {{ item.productPrice.toFixed(2).toString().replace('.', ',') }}
                </span>
                <a :href="
                  'https://api.whatsapp.com/send?phone='
                  + companyPhoneNumber + 
                  '&text=Olá!%20Vocês%20ainda%20tem%20o%20produto%20*' 
                  + item.productName + 
                  '*%20disponível?%20&#128512;'"
                >
                  <i class="bi bi-whatsapp"></i>
                </a>
              </div>
              <hr />
            </div>
          </div>
        </div>
      </div>
    </main>
    <!-- <footer class="bg-white">
      <i class="bi bi-google"></i>
    </footer> -->
    <!-- <img alt="Vue logo" src="../assets/logo.png"> -->
    <!-- <HelloWorld msg="Welcome to Your Vue.js App"/> -->
  </div>
</template>

<style scoped>
.scrolling-wrapper {
	overflow-x: auto;
}

.card-block {
	height: 60px;
	border: none;
	transition: all 0.2s ease-in-out !important;
	border-radius: 10px;
}

.card {
  /* margin-left: 10px; */
  display: flex;
  justify-content: center;
}

.result-card {
  height: 100px;
}
</style>

<script>
// @ is an alias to /src
// import HelloWorld from '@/components/HelloWorld.vue'

export default {
  name: 'Home',
  components: {
    // HelloWorld
  },
  setup() {
  },
  data() {
    return {
      storeName: this.$route.params.store,
      productName: this.$route.query.product,
      productCategory: this.$route.query.category,
      companyPhoneNumber: "5512997299100",
      results: [
      {
        "productName": "Molho de tomate Elefante",
        "productDescription": "É um ótimo molho de tomate pq é top demais",
        "productPrice": 5.49
      },
      {
        "productName": "Molho de tomate Dona Moça",
        "productPrice": 4.50
      }
      ]
    }
  },
  beforeMount() {

  },
  mounted() {
    // console.log(this.productName)
  }
}
</script>
