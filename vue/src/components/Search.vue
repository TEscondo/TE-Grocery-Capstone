<template>
    <div>
      <div id="search-title">
        <h2>Searching for {{ this.$route.params.query }}</h2>
      </div>
  <div class="main">
    <div
      class="container"
      v-for="product in filteredList"
      v-bind:key="product.id"
    >
      <div class="product-card">
        <router-link
          v-bind:to="{ name: 'product-details', params: { id: product.id } }"
        >
          <img class="sale-banner" v-if="product.sale" src="/salebanner.png" />
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
          <div v-else class="sale-price">
            <span class="discounted-price"
              >${{ (0.9 * product.price).toFixed(2) }}</span
            >
            &nbsp;
            <span class="before-sale-price"
              ><s>${{ product.price.toFixed(2) }}</s></span
            >
          </div>
          <div class="product-weight">{{ product.weight }}</div>
          <div class="cart-button" v-on:click.prevent="addToCart(product)">
            Add To Cart
          </div>
        </router-link>
      </div>
    </div>
  </div>
  </div>
</template>

<script>
import productService from "../services/ProductService.js";
export default {
  data() {
    return {
      searchTerm: "",
      categories: [],
      products: [],
      filter: {
        searchTerm: "",
        sale: false,
        categoryId: "",
      },
    };
  },
  created() {
    console.log("hello????");
    this.filter.searchTerm = this.$route.params.query;
    console.log("got to the search" + this.searchTerm);

    productService.getAllProducts().then((response) => {
      this.products = response.data;
      this.products.forEach((product) => {
        product.discountedPrice = product.price * 0.9;
      });
    });
    productService.getAllCategories().then((response) => {
      this.categories = response.data;
    });
  },
  computed: {
    filteredList() {
      let filteredProducts = this.products;
      if (this.filter.searchTerm != "") {
        filteredProducts = filteredProducts.filter((item) =>
          item.title
            .toLowerCase()
            .includes(this.filter.searchTerm.toLowerCase())
        );
      }

      return filteredProducts;
    },
  },
};
</script>

<style>
#search-title {
  display: flex;
  line-height: 1em;
  font-size: large;
  align-items: center;
  flex-wrap: wrap;
  justify-content: space-around;
}
</style>