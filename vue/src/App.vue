<template>
  <div id="app">
    <banner />
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'all-products' }"
        >View All Products</router-link
      >&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'cart' }">Cart &lt; {{this.$store.state.cart.length}} &gt;</router-link>
      <router-link
        v-bind:to="{ name: 'logout' }"
        v-if="$store.state.token != ''"
        >Logout</router-link
      >

      
    </div>
    
    <router-view />
  </div>
</template>

<script>
import Banner from "@/components/Banner";
export default {
  components: {
    Banner,
  },
};
</script>

<style>
#nav {
  text-align: center;
  color: #03989e;
  font-weight: bold;
  font-size: 1.2em;
}

a {
  text-decoration: none;
  color: #000000;
  font-family: sans-serif;
}
</style>