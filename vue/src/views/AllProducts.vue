<template>
<div>
  <h3>PRODUCTS</h3>
  <div class="product" v-for="product in productList" v-bind:key="product.id">
    {{ product.title }}
  </div>
  </div>
</template>

<script>
import productService from "../services/ProductService.js";

export default {
  data() {
    return {
      productList: [],
    };
  },
  created() {
    productService.getAllProducts().then((response) => {
      this.productList = response.data;
    });
  },
};
</script>

<style>
</style>