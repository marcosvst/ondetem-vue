<template>
  <div class="home bg-primary">
    <header class="row">
      <div id="header-menu" class="col-12 px-4 pt-3 text-start">
        <i class="bi bi-grid-3x3-gap-fill text-white" style="font-size: 2rem"></i>
      </div>
      <div id="header-title" class="col text-white text-start p-4">
        <h1>Encontre produtos perto de você</h1>
      </div>
      <div id="search-area" class="col-12 px-4">
        <div class="input-group mb-3">
          <div class="input-group">
            <i class="bi bi-search input-group-text text-primary bg-white p-2" style="font-size: 1.2rem"></i>
            <input type="text" v-model="product" v-on:input="searchProduct(product)" class="form-control p-2" placeholder=" Digite o nome do produto">
          </div>
        </div>
      </div>
      <div id="horizontal-scroll-menu" class="col-12 mb-2">
        <div class="scrolling-wrapper row flex-row flex-nowrap p-2">
          <!-- Category cards -->
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
      </div>
    </header>
    <main id="results-area" class="col-12 bg-white p-4" style="border-top-left-radius: 30px; border-top-right-radius: 30px">
      <div id="vertical-scroll-results">
        <div class="col-12">
          <p class="text-start">Lojas que possuem produtos que conicidem com sua busca por <strong>{{ product }}</strong>:</p>
          <br />
          <div class="row" v-for="item in results" :key="item.companyName">
            <div class="col-12 p-2 text-start">
              <h5>{{ item.companyName }}</h5>
              <p class="fw-light">
                <i class="bi bi-geo-alt"></i>
                {{ item.companyAddress }}
              </p>
              <br />
              <div class="d-flex justify-content-between mb-3">
                <span class="fw-bold" style="display: hidden">
                  R$ {{ Math.min.apply(Math, item.products.map(function(o) { return o.productPrice; })).toFixed(2).toString().replace('.', ',') }}
                  -
                  R$ {{ Math.max.apply(Math, item.products.map(function(o) { return o.productPrice; })).toFixed(2).toString().replace('.', ',') }}
                </span>
                <router-link :to="{ name: 'Details', params: { store: item.companySlug }, query: { product: product, category: category }}">
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

export default {
  name: 'Home',
  components: {
    // HelloWorld
  },
  data() {
    return {
      product: 'tomate',
      category: 'mercado',
      results: [
        {
          "companyName": "Mercadinho do seu Zé",
          "companyAddress": "Rua Amélia Pereira, 1198, Bairro da Cruz",
          "companySlug": "mercadinho-do-seu-ze",
          "products": [
            {
              "productName": "Molho de tomate Elefante",
              "productPrice": "5.49"
            },
            {
              "productName": "Molho de tomate Dona Moça",
              "productPrice": "4.50"
            }
          ]
        },
        {
          "companyName": "Mercadinho da dona Neuza",
          "companyAddress": "Rua Santa Catarina, 1013, Vila Hepacaré",
          "companySlug": "mercadinho-da-dona-neuza",
          "products": [
            {
              "productName": "Molho de tomate Elefante",
              "productPrice": 10
            },
            {
              "productName": "Molho de tomate Dona Moça",
              "productPrice": 40.50
            }
          ]
        },
      ]
    }
  },
  methods: {
    searchProduct(string) {
      console.log(string)
    }
  }
}
</script>
