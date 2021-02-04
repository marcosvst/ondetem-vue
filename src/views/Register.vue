<template>
  <div class="bg-dark">
    <header class="row">
      <div id="header-menu" class="col-12 px-4 pt-3 text-start">
        <router-link to="/">
          <i class="bi bi-arrow-left text-white" style="font-size: 2rem"></i>
        </router-link>
      </div>
      <!-- <div id="header-menu" class="col-12 px-4 pt-3 text-start">
        <i class="bi bi-grid-3x3-gap-fill text-white" style="font-size: 2rem"></i>
      </div> -->
      <div id="header-title" class="col text-white text-start p-4">
        <h1>E aí, seja muito bem-vindo!</h1>
        <router-link to="/register" class="text-white">
        </router-link>
        <p>Cadastre sua loja e ganhe visibilidade em seu negócio.</p>
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

      <!-- Register account -->
      <div class="col-12 text-start" id="step-1" v-if="currentStep == 1">
        <h4>Antes de tudo, vamos criar uma conta pra você.</h4>
        <br>
        <div class="mb-3">
          <label for="emailInput" class="form-label">E-mail</label>
          <input type="email" class="form-control p-1" id="emailInput" placeholder="Ex. ondetem@gmail.com" v-model="email">
        </div>
        <div class="mb-3">
          <label for="passwordInput" class="form-label">Senha</label>
          <div id="emailHelp" class="form-text">Deve ter no mimino 6 caracteres</div>
          <input type="password" class="form-control p-1" id="passwordInput" placeholder="Ex. sc$6lsR@j" v-model="password">
        </div>
        <div class="mb-3">
          <label for="secretInput" class="form-label">Palavra secreta</label>
          <div id="emailHelp" class="form-text">Será utilizada caso você perca o acesso à sua conta</div>
          <input type="password" class="form-control p-1" id="secretInput" placeholder="Ex. coelho" v-model="secretWord">
        </div>
        <button type="submit" class="btn btn-dark p-2 form-control d-flex justify-content-evenly row" @click="submitCredentials">
          <div class="col-2">
            <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true" v-if="loading"></span>
          </div>
          <div class="col-8 text-middle">
          Cadastrar minha conta
          </div>
          <div class="col-2">
          </div>
        </button>
      </div>
      
      <!-- Confirm verification code -->
      <div class="col-12 text-start" id="step-2" v-if="currentStep == 2">
        <h4>Pronto! Acabamos de enviar um código de verificação para o seu e-mail.</h4>
        <br>
        <div class="mb-3">
          <label for="codeInput" class="form-label">Por favor, confirme o código enviado</label>
          <input type="email" class="form-control p-1" id="emailInput" placeholder="Código de verificação" v-model="verificationCode">
        </div>
        <button type="submit" class="btn btn-dark p-2 form-control d-flex justify-content-evenly row" @click="submitVerificationCode">
          <div class="col-2">
            <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true" v-if="loading"></span>
          </div>
          <div class="col-8 text-middle">
          Confirmar código de verificação
          </div>
          <div class="col-2">
          </div>
        </button>
      </div>

      <!-- Register company -->
      <div class="col-12 text-start" id="step-3" v-if="currentStep == 3">
        <h4>Tudo certo! Agora, no último passo, basta cadastrar sua loja.</h4>
        <br>
        <div class="row">
        <div class="mb-3">
          <label for="tradingNameInput" class="form-label">Nome fantasia</label>
          <input type="text" class="form-control p-1" id="tradingNameInput" placeholder="Ex. Mercadinho do seu Zé" v-model="tradingName">
        </div>
        <div class="mb-3">
          <label for="einInput" class="form-label">CNPJ/CPF</label>
          <div id="emailHelp" class="form-text">Não adicione pontos ou vírgulas. Caso você seja autônomo e não possua CNPJ, digite seu CPF.</div>
          <input type="text" class="form-control p-1" id="einInput" placeholder="Ex. 123456789" v-model="ein">
        </div>
        <div class="mb-3">
          <label for="zipCodeInput" class="form-label">CEP</label>
          <div id="emailHelp" class="form-text">Não adicione pontos ou vírgulas.</div>
          <input type="text" class="form-control p-1" id="zipCodeInput" placeholder="Ex. 12606280" v-model="zipCode">
          <!-- <div id="emailHelp" class="form-text">Caso não saiba, pode deixar em branco.</div> -->
        </div>
        <div class="mb-3">
          <label for="addressInput" class="form-label">Endereço</label>
          <input type="text" class="form-control p-1" id="addressInput" placeholder="Ex. Rua Amélia Pereira, 1198, Bairro da Cruz" v-model="address">
          <div id="emailHelp" class="form-text">Separe por vírgulas. Por exemplo: Rua, Número, Bairro, Complemento</div>
        </div>       
        <div class="row">
          <div class="mb-3 col-8">
            <label for="cityInput" class="form-label">Cidade</label>
            <!-- <input type="text" class="form-control p-1" id="cityInput" placeholder="Digite a cidade"> -->
            <select class="form-select p-1" aria-label="cityInput" v-model="city">
              <option selected disabled>Selecione uma cidade</option>
              <option value="lorena">Lorena</option>
              <option value="guaratingueta">Guaratingueta</option>
              <option value="aparecida">Aparecida</option>
            </select>
          </div>
          <div class="mb-3 col-4">
            <label for="ufInput" class="form-label">UF</label>
            <select class="form-select p-1" aria-label="ufInput" v-model="uf">
              <option selected disabled>UF</option>
              <option value="sp">SP</option>
            </select>     
          </div>
        </div>
        </div>
        <button type="submit" class="btn btn-dark p-2 form-control d-flex justify-content-evenly row" @click="submitCredentials">
          <div class="col-2">
            <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true" v-if="loading"></span>
          </div>
          <div class="col-8 text-middle">
          Finalizar cadastro
          </div>
          <div class="col-2">
          </div>
        </button>
        <br>
      </div>

      <!-- Go to company dashboard -->
      <div class="col-12 text-start" id="step-4" v-if="currentStep == 4">
        <h4>Muito bem, sua loja foi cadastrada com sucesso!</h4>
        <br>
        Agora a única coisa que você precisa fazer é cadastrar os produtos dela. Assim, todos saberão o que você vende.
        <router-link to="/" type="submit" class="btn btn-dark p-2 form-control d-flex justify-content-evenly row mt-3" @click="submitVerificationCode">
          <div class="col-2">
            <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true" v-if="loading"></span>
          </div>
          <div class="col-8 text-middle">
          Quero cadastrar meus produtos
          </div>
          <div class="col-2">
          </div>
        </router-link>
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
      currentStep: 1,
      loading: false,
      email: '',
      password: '',
      secretWord: '',
      verificationCode: '',
      tradingName: '',
      ein: '',
      zipCode: '',
      address: '',
      city: '',
      uf: ''
    }
  },
  methods: {
    async submitCredentials() {
      let response = []
      
      try {
        this.loading = true

        if (this.email != '' && this.password != '' && this.secretWord != '') {
          response = await api.post("credentials", {
            "email": this.email,
            "password": this.password,
            "secretWord": this.secretWord
          })

          this.results = response
        }

        if (response) {
          this.currentStep = 2
        }

        this.loading = false
      } catch(err) {
        console.log("Create credentials failed because " + err)
      }
    },
    async submitVerificationCode() {
      let response = []
      
      try {
        this.loading = true

        if (this.verificationCode != '') {
          response = await api.post("credentials/confirm", {
            "email": this.email,
            "code": this.verificationCode
          })

          this.results = response
        }

        if (response) {
          this.currentStep = 3
        }

        this.loading = false
      } catch(err) {
        console.log("Confirm credentials failed because " + err)
      }
    },
    async submitCompany() {
      let response = []
      
      try {
        this.loading = true

        if (this.verificationCode != '') {
          response = await api.post("companies", {
            "tradingName": this.tradingName,
            "ein": this.ein,
            "zipCode": this.zipCode,
            "address": this.address,
            "city": this.city,
            "uf": this.uf
          })

          this.results = response
        }

        if (response) {
          this.currentStep = 4
        }

        this.loading = false
      } catch(err) {
        console.log("Confirm credentials failed because " + err)
      }
    }
  }
}
</script>
