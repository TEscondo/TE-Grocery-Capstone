<template>
  <div>
    <h3>PRODUCTS</h3>
    <div class="product" v-for="product in productList" v-bind:key="product.id">
      {{ product.title }} <br />
      <img class="thumbnail" v-if="product.image" v-bind:src="product.image"/> <br />
      <div class="price"> {{product.price}}</div> {{product.weight}}

    </div>
  </div>
</template>

<script>
import productService from "../services/ProductService.js";

export default {
    name: "all-products",
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

.thumbnail {
    max-width: 200px;
}
</style>