<template>
  <div class="bg-dark">
    <header class="row">
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
      <div class="col-12 text-start" id="step-1" v-if="currentStep == 1">
        <h4>Antes de tudo, vamos criar uma conta pra você.</h4>
        <br>
        <div class="mb-3">
          <label for="emailInput" class="form-label">Primeiro, digite seu e-mail</label>
          <input type="email" class="form-control p-1" id="emailInput" placeholder="E-mail">
        </div>
        <div class="mb-3">
          <label for="passwordInput" class="form-label">Agora, uma senha</label>
          <input type="password" class="form-control p-1" id="passwordInput" placeholder="Senha">
          <div id="emailHelp" class="form-text">Tenha certeza que seja uma senha segura</div>
        </div>
        <div class="mb-3">
          <label for="secretInput" class="form-label">Por último, uma palavra secreta</label>
          <input type="password" class="form-control p-1" id="secretInput" placeholder="Palavra secreta">
          <div id="emailHelp" class="form-text">Pode ser qualquer palavra, ela vai ser utilizada caso você perca o acesso à sua conta</div>
        </div>
        <button type="submit" class="btn btn-dark p-2 form-control">Cadastrar minha conta</button>
      </div>

      <div class="col-12 text-start" id="step-2" v-if="currentStep == 2">
        <h4>Pronto! Acabamos de enviar um código de verificação para o seu e-mail.</h4>
        <br>
        <div class="mb-3">
          <label for="codeInput" class="form-label">Por favor, confirme o código enviado</label>
          <input type="email" class="form-control p-1" id="emailInput" placeholder="Código de verificação">
        </div>
        <button type="submit" class="btn btn-dark p-2 form-control">Confirmar código de verificação</button>
      </div>

      <div class="col-12 text-start" id="step-3" v-if="currentStep == 3">
        <h4>Tudo certo! Agora, no último passo, basta cadastrar sua loja.</h4>
        <br>
        <div class="row">
        <div class="mb-3">
          <label for="passwordInput" class="form-label">Nome fantasia</label>
          <input type="password" class="form-control p-1" id="passwordInput" placeholder="Digite o nome fantasia">
        </div>
        <div class="mb-3">
          <label for="secretInput" class="form-label">CNPJ/CPF</label>
          <input type="password" class="form-control p-1" id="secretInput" placeholder="Digite o CNPJ/CPF">
          <div id="emailHelp" class="form-text">Caso você seja autônomo e não possua CNPJ, digite seu CPF.</div>
        </div>
        <div class="mb-3">
          <label for="secretInput" class="form-label">CEP</label>
          <input type="password" class="form-control p-1" id="secretInput" placeholder="Digite o CEP">
          <!-- <div id="emailHelp" class="form-text">Caso não saiba, pode deixar em branco.</div> -->
        </div>
        <div class="mb-3">
          <label for="secretInput" class="form-label">Endereço</label>
          <input type="password" class="form-control p-1" id="secretInput" placeholder="Digite o endereço">
          <div id="emailHelp" class="form-text">Por exemplo: Rua Amélia Pereira, 1198, Bairro da Cruz, Apto. 11</div>
        </div>       
        <div class="row">
          <div class="mb-3 col-8">
            <label for="secretInput" class="form-label">Cidade</label>
            <input type="password" class="form-control p-1" id="secretInput" placeholder="Digite a cidade">
          </div>
          <div class="mb-3 col-4">
            <label for="secretInput" class="form-label">UF</label>
            <select class="form-select p-1" aria-label="Default select example">
              <!-- <option selected disabled>UF</option> -->
              <option selected value="1">SP</option>
            </select>     
          </div>
        </div>
        </div>
        <button type="submit" class="btn btn-dark p-2 form-control">Cadastrar loja e completar cadastro</button>
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
// import api from '../services/ondetem-api.js'

export default {
  name: 'Home',
  components: {
    // HelloWorld
  },
  data() {
    return {
      currentStep: 3
    }
  },
  methods: {
  }
}
</script>
