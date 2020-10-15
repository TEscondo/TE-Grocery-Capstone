<template>
  <div id="app">
    <div class="top">
      <div id="banner">
        <banner />
      </div>
      <div id="nav">
        <router-link v-bind:to="{ name: 'home' }">Home</router-link
        >&nbsp;|&nbsp;
        <router-link v-bind:to="{ name: 'all-products' }"
          >View All Products</router-link
        >&nbsp;|&nbsp;
        <router-link v-bind:to="{ name: 'cart' }"
          >Cart &lt; {{ this.$store.state.cart.length }} &gt;</router-link
        >
        <router-link
          v-bind:to="{ name: 'logout' }"
          v-if="$store.state.token != ''"
          >Logout</router-link
        >
      </div>
    </div>
    <router-view />
  </div>
</template>

<script>
import Banner from "@/components/Banner";
import productService from "@/services/ProductService.js";
export default {
  components: {
    Banner,
  },
  data() {
    return {
      searchTerm: "",
      categories: [],
    };
  },
  methods: {
    search() {
      console.log(this.searchTerm);
      this.$router.push({ name: "search", params: { query: this.searchTerm } });
    },
  },
  created() {
    productService.getAllCategories().then((response) => {
      this.categories = response.data;
    });
  },
};
</script>

<style>
.search-btn {
  display: inline-block;
  background-color: #03989e;
  color: white;
  border: 1px solid black;
  padding: 10px 60px;
  margin: 5px;
  font-weight: bold;
  max-width: 350px;
  text-align: center;
  font-size: 16px;
}

#banner {
  height: 70%;
}

#nav {
  text-align: center;
  color: #03989e;
  font-weight: bold;
  font-size: 1.2em;
  margin-top: 5px;
}

a {
  text-decoration: none;
  color: #000000;
  font-family: sans-serif;
}
.top {
  position: sticky;
  top: 0;
  background: white;
  z-index: 1;
}

#search-and-nav {
  background-color: #d3d3d3;
}
</style>