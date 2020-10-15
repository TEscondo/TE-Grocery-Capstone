<template>
  <div>
    <div id="search-and-nav">
      <div id="search">
        <input
          type="text"
          class="search-bar"
          name="search"
          placeholder="Search for an item"
          v-model="searchTerm"
        />&nbsp;
        <button class="search-btn" v-on:click.prevent="search">Search</button>
      </div>
      <div class="navigation">
        <div v-for="cat in categories" v-bind:key="cat.categoryId">
          <router-link
            v-bind:to="{
              name: 'category',
              params: { categoryId: cat.categoryId },
            }"
            ><div class="navigation">
              {{ cat.categoryName }}
            </div></router-link
          >
        </div>
      </div>
    </div>
    <div class="certification-title">
      <h1>{{ returnCertificationName }}</h1>
    </div>
    <br />
    <div class="main">
      <p class="category-description">{{ returnCategoryDescription }}</p>
      <div
        class="container"
        v-for="product in products"
        v-bind:key="product.id"
      >
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
          <div class="sale-price" v-else>
            <span class="discounted-price"
              >${{ product.discountedPrice.toFixed(2) }}</span
            >&nbsp;
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
</template>

<script>
import productService from "../services/ProductService.js";
export default {
  name: "certification",
  data() {
    return {
      searchTerm: "",
      products: [],
      categories: [],
    };
  },
  computed: {
    returnCertificationName() {
      if (this.$route.params.id == 1) {
        return "Vegan";
      }
      if (this.$route.params.id == 2) {
        return "Kosher";
      }
      if (this.$route.params.id == 3) {
        return "Halal";
      }
      if (this.$route.params.id == 4) {
        return "Fair Trade";
      }
      if (this.$route.params.id == 5) {
        return "Organic";
      }
      if (this.$route.params.id == 6) {
        return "Non-GMO";
      }
      if (this.$route.params.id == 7) {
        return "Gluten-Free";
      }
      return null;
    },
  },

  created() {
    productService
      .getProductsByCertificationId(this.$route.params.id)
      .then((response) => {
        this.products = response.data;
        this.products.forEach((product) => {
          product.discountedPrice = product.price * 0.9;
        });
      });
    productService.getAllCategories().then((response) => {
      this.categories = response.data;
    });
  },
  methods: {
    addToCart(item) {
      this.$store.commit("ADD_PRODUCT", item);
      window.alert("Added!");
    },
    search() {
      this.$router.push({ name: "search", params: { query: this.searchTerm } });
    },
  },
};
</script>

<style>
.product-card {
  display: flex;
}

.certification-title {
  display: flex;
  line-height: 2em;
  font-size: xx-large;
  align-items: center;
  flex-wrap: wrap;
  justify-content: space-around;
}
</style>