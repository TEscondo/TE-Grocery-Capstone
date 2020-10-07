<template>
  <div>
    <h3>PRODUCTS</h3>
    <input type="text" name="Search" value="Search for products" />
    <button v-on:click="filteredList()">SEARCH</button>
    <div class='container' v-for="product in products" :key="product.brandId">
      <img class="thumbnail" v-if="product.image!=null" v-bind:src="product.image" />
      <img class="thumbnail" v-else src='https://storage.needpix.com/rsynced_images/grocery-store-2119702_1280.jpg' />
      <br>
      {{product.title}} ${{product.price}}.00
    </div>
  </div>
</template>

<script>
import productService from "../services/ProductService.js";
export default {
    data() {
      return {
        products: [],
        filter: {
          title: "",
          price: ""

        }
      }
    },
    methods: {
    },
    created() {
    productService.getAllProducts().then((response) => {
      this.products = response.data;
    });
  },
    // computed: {
    //   filteredList() {
    //   }
    // }
}
</script>

<style>
.container {
  display : grid;
  grid-template-columns: 1fr 1fr;
  gap: 1rem;
  margin: 3rem 3rem;
  grid-template-rows: auto;
  align-items: center;
}
.thumbnail {
    max-width: 200px;
    max-height: 200px;
}


</style>