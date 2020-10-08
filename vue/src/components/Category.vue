<template>
  <section class="product-by-category">
    <div class="category-title">
      <h1>categoryName</h1>
    </div>
    <p class="category-description">Description Here</p>
    <div class="main">
      <div
        class="container"
        v-for="product in products"
        v-bind:key="product.id"
      >
        <img
          class="thumbnail"
          v-if="product.image"
          v-bind:src="product.image"
          onerror="this.onerror=null; this.src='https://grocerymonk.com/image_placeholder.png'"
        />
        <img
          class="thumbnail"
          v-else
          src="https://grocerymonk.com/image_placeholder.png"
        />
        <div class="product-title">{{ product.title }}</div>
        <div class="price" v-if="product.sale != true">
          ${{ product.price }}.00
        </div>
        <div class="sale-price" v-else>
          was ${{ product.price }}.00 now ${{ product.discountedPrice }}0
        </div>
        {{ product.weight }}oz
      </div>
    </div>
  </section>
</template>

<script>
import productService from "../services/ProductService.js";
export default {
  data() {
    return {
      products: [],
    };
  },
  created() {
    productService
      .getProductsByCategory(this.$route.params.categoryId)
      .then((response) => {
        this.products = response.data;
        this.products.forEach((product) => {
          product.discountedPrice = product.price * 0.9;
        });
      });
  },
};
</script>

<style>
.main {
  display: flex;
  justify-content: space-evenly;
  flex-wrap: wrap;
  background-color: #f9fafb;
}

.category-title {
  line-height: 2em;
  font-size: xx-large;
  display: flex;
  align-items: center;
  flex-wrap: wrap;
  justify-content: space-around;
}

.category-description {
    font-size: x-large;
    display: flex;
    align-items: center;
    flex-wrap: wrap;
    justify-content: space-around;
}
</style>