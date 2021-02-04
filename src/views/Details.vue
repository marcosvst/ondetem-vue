<template>
  <div class="home bg-dark" v-for="company in results" :key="company.id">
    <header class="row">
      <div id="header-menu" class="col-12 px-4 pt-3 text-start">
        <router-link to="/">
          <i class="bi bi-arrow-left text-white" style="font-size: 2rem"></i>
        </router-link>
      </div>
      <div id="header-title" class="col text-white text-start p-4">
        <div>
          <h1>
            {{ company.trading_name }}
          </h1>
          <p class="fw-light">
            <i class="bi bi-geo-alt"></i>
            {{ company.city }} - {{ company.uf }}
          </p>
        </div>
      </div>
    </header>
    <main id="results-area" class="col-12 p-4" style="border-top-left-radius: 30px; border-top-right-radius: 30px; background-color: #fefaee">
      <div class="spinner-border text-center" v-if="loading" role="status">
        <span class="visually-hidden">Loading...</span>
      </div>
      <div id="vertical-scroll-results">
        <div class="col-12">
          <p class="text-start">Produtos nessa loja que coincidem com sua busca por <strong>{{ productName }}</strong>:</p>
          <br />
          <div class="row" v-for="product in company.products" :key="product.id">
            <div class="col-12 p-2 text-start">
              <h5>{{ product.name }}</h5>
              <p class="fw-light">
                {{ product?.description ?? "Sem descrição" }}
              </p>
              <br />
              <div class="d-flex justify-content-between text-align-center mb-3">
                <span class="fw-bold">
                  R$ {{ parseFloat(product.price).toFixed(2).toString().replace('.', ',') }}
                </span>
                <a v-if="company.phoneNumber" :href="
                  'https://api.whatsapp.com/send?phone='
                  + company.phoneNumber + 
                  '&text=Olá!%20Vocês%20ainda%20tem%20o%20produto%20*' 
                  + product.name + 
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
import api from '../services/ondetem-api.js'

export default {
  name: 'Home',
  components: {
    // HelloWorld
  },
  data() {
    return {
      productName: this.$route.query.product,
      searchInput: null,
      results: {},
      loading: false
    }
  },
  async mounted() {
    this.loading = true
    const response = await api.get("products/company", {
          params: {
            "city": "Lorena",
            "uf": "SP",
            "productName": this.$route.query.product,
            "companyId": this.$route.params.store,
          }
        })
    
    this.results = response.data.companiesAndProducts
    this.loading = false
  },
}
</script>
