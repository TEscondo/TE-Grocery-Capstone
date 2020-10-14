<template>
  <div class="main">
      <div
        class="container"
        v-for="product in products"
        v-bind:key="product.id"
      >
        <router-link
          v-bind:to="{ name: 'product-details', params: { id: product.id } }"
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
            ${{ product.price.toFixed(2) }}
          </div>
          <div class="sale-price" v-else>
            <span class="discounted-price"
              >${{ product.discountedPrice.toFixed(2) }}</span
            >&nbsp;
            <span class="before-sale-price"
              ><s>${{ product.price.toFixed(2) }}</s></span
            >
          </div>
          <div class="product-weight">{{ product.weight }}</div>
          <div class="cart-button" v-on:click.prevent="addToCart(product)">Add To Cart</div>
          </router-link
        >
      </div>
      </div>
</template>

<script>
import productService from '../services/ProductService.js';
export default {
    data() {
    return {
      categories: [],
      products: [],
      filter: {
        title: "",
        sale: false,
        categoryId: "",
      },
    };
  },
    created() {
    productService.getAllProducts().then((response) => {
      this.products = response.data;
      this.products.forEach((product) => {
        product.discountedPrice = product.price * 0.9;
      });
    });
    productService.getAllCategories().then((response) => {
      this.categories = response.data;
    })
  },
    computed: {
        
    filteredList() {
      let filteredProducts = this.products;
      if (this.filter.title != "") {
        filteredProducts = filteredProducts.filter((item) =>
          item.title.toLowerCase().includes(this.filter.title.toLowerCase())
        );
      }
      if (this.filter.sale != "") {
        filteredProducts = filteredProducts.filter(
          (item) => item.sale === this.filter.sale
        );
      }
      if (this.filter.categoryId != "") {
        filteredProducts = filteredProducts.filter(
          (item) => item.categoryId == this.filter.categoryId
        );
      }
      return filteredProducts;
    },
  },

}
</script>

<style>

</style>