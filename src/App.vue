<template>
  <div class="row">
    <div class="col-md-2 adsense-left"></div>
    <div class="col-12 col-md-8">
      <router-view />
      <div class="row">
        <div class="col-12 fixed-bottom bg-dark">sdfsd</div>
      </div>
    </div>
    <div class="col-md-2 adsense-right"></div>
  </div>
</template>

<style>
html, * {
  margin: 0px !important;
  padding: 0px !important;
  box-sizing: border-box !important;
}

#app {
  font-family: Roboto, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
}
</style>
