<template>
  <div class="bg-dark">
    <header class="row">
      <!-- <div id="header-menu" class="col-12 px-4 pt-3 text-start">
        <i class="bi bi-grid-3x3-gap-fill text-white" style="font-size: 2rem"></i>
      </div> -->
      <div id="header-title" class="col text-white text-start p-4">
        <h1>Encontre produtos perto de você </h1>
        
        <router-link to="/register" class="text-white" style="text-decoration: none">
          Ou cadastre sua loja
          &nbsp;
          <i class="bi bi-arrow-right"></i>
        </router-link>
      </div>
      <div id="search-area" class="col-12 px-4">
        <div class="col-12 mb-2">
          <select class="form-select p-2" v-model="city" @change="searchProduct(searchInput)">
            <option disabled value="">Selecione a cidade</option>
            <option value="Lorena">Lorena</option>
            <option value="Guaratingueta">Guaratinguetá</option>
            <option value="Aparecida">Aparecida</option>
          </select>
        </div>
        <div class="input-group mb-3">
          <div class="input-group">
            <i class="bi bi-search input-group-text text-dark bg-white p-2" style="font-size: 1.2rem"></i>
            <input type="text" v-on:input="debounceInput" class="form-control p-2" placeholder=" Digite o nome do produto">
          </div>
        </div>
      </div>
      <!-- <div id="horizontal-scroll-menu" class="col-12 mb-2">
        <div class="scrolling-wrapper row flex-row flex-nowrap p-2">
          <div class="col-3 ms-2 text-white text-center">
            <div class="card card-block text-primary">
              <i class="bi bi-building" style="font-size: 1.5rem"></i>
            </div>
            <span class="small">Construção</span>
          </div>
          <div class="col-3 ms-2 text-white text-center">
            <div class="card card-block text-primary">
              <i class="bi bi-cart3" style="font-size: 1.5rem"></i>
            </div>
            <span class="small">Mercado</span>
          </div>
          <div class="col-3 ms-2 text-white text-center">
            <div class="card card-block bg-dark text-white">
              <i class="bi bi-cpu" style="font-size: 1.5rem"></i>
            </div>
            <span class="small">Tecnologia</span>
          </div>
          <div class="col-3 ms-2 text-white text-center">
            <div class="card card-block text-primary">
              <i class="bi bi-gift" style="font-size: 1.5rem"></i>
            </div>
            <span class="small">Festas</span>
          </div>
          <div class="col-3 ms-2 text-white text-center">
            <div class="card card-block text-primary">
              <i class="bi bi-tools" style="font-size: 1.5rem"></i>
            </div>
            <span class="small">Ferramentas</span>
          </div>
        </div>
      </div> -->
    </header>
    <main id="results-area" class="row p-4" style="border-top-left-radius: 30px; border-top-right-radius: 30px; background-color: #fefaee">
      <div id="vertical-scroll-results">
        <div class="col-12">
          <p v-if="results && results.length > 0" class="text-start">Lojas que possuem produtos que coincidem com sua busca por <strong>{{ searchInput }}</strong>:</p>
          <img v-if="!loading && results && results.length <= 0 || showSearchText == false" src="../assets/fox.jpg" style="opacity: 0.4" alt="Search placeholder" class="img-fluid mx-auto d-block mt-4">
          <div class="spinner-border text-center" v-if="loading" role="status">
            <span class="visually-hidden">Loading...</span>
          </div>
          <br />
          <div class="row" v-for="item in results" :key="item.id">
            <div class="col-12 p-2 text-start">
              <h5>{{ item.trading_name }}</h5>
              <p class="fw-light">
                <i class="bi bi-geo-alt"></i>
                {{ item.city }} - {{ item.uf }}
              </p>
              <br />
              <div class="d-flex justify-content-between mb-3">
                <span class="fw-bold" style="display: hidden">
                  R$ {{ Math.min.apply(Math, item.products.map(function(o) { return o.price; })).toFixed(2).toString().replace('.', ',') }}
                  <span v-if="item.products.length > 1"> 
                    -
                    R$ {{ Math.max.apply(Math, item.products.map(function(o) { return o.price; })).toFixed(2).toString().replace('.', ',') }}
                  </span>
                </span>
                <router-link :to="{ name: 'Details', params: { store: item.id }, query: { product: searchInput, category: category }}">
                  <i class="bi bi-box-arrow-up-right"></i>
                </router-link>
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
      searchInput: '',
      debounce: null,
      showSearchText: false,
      category: 'mercado',
      results: null,
      city: '',
      location: null,
      loading: false
    }
  },
  methods: {
    debounceInput(event) {
      this.searchInput = null
      this.showSearchText = true

      clearTimeout(this.debounce)

      this.debounce = setTimeout(() => {
        this.searchInput = event.target.value

        this.searchProduct(this.searchInput)
      }, 600)
    },
    async searchProduct(searchString) {
      let response = []
      
      try {
        this.loading = true

        if (this.searchInput != '') {
          response = await api.get("products", {
            params: {
              "city": this.city,
              "uf": "SP",
              "productName": searchString
            }
          })

          this.results = response.data.companiesAndProducts
          this.loading = false
        }

        this.loading = false
      } catch(err) {
        console.log("Search product failed because " + err)
      }
    }
  }
  // created() {
  //   if (navigator.geolocation) {
  //     navigator.geolocation.getCurrentPosition( (position) => {
  //       this.location = position.coords.latitude, position.coords.longitude
  //     });
  //   }
  // }
}
</script>
