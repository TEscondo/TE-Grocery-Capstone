<template>

  <div class="home">
    <div id="search-and-nav">
          <div id="search">
            <input
              type="text"
              class="search-bar"
              name="search"
              placeholder="Search for an item"
              v-model="searchTerm"
            />&nbsp;
            <button class="search-btn" v-on:click.prevent="search">
              Search
            </button>
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
    <div v-for="prodCat in prodByCat" v-bind:key="prodCat.categoryName">
      <h1>
        <router-link
          v-bind:to="{ name: 'category', params: { categoryId: prodCat.categoryId } }"
        >
          {{ prodCat.categoryName }}
          <span class="view-all">View All</span></router-link
        >
      </h1>
      <div class="main">
        <div
          class="container"
          v-for="prod in prodCat.productsList.slice(0, 4)"
          v-bind:key="prod.id"
        >
          <router-link
            v-bind:to="{ name: 'product-details', params: { id: prod.id } }"
          >
            <img class="sale-banner" v-if="prod.sale" src="/salebanner.png" />
            <img
              class="thumbnail"
              v-if="prod.image"
              v-bind:src="prod.image"
              onerror="this.onerror=null; this.src='https://grocerymonk.com/image_placeholder.png'"
            />
            <img
              class="thumbnail"
              v-else
              src="https://grocerymonk.com/image_placeholder.png"
            />
            <div id="details">
              <div class="product-title">{{ prod.title }}</div>
              <div class="price" v-if="prod.sale != true">
                ${{ prod.price.toFixed(2) }}
              </div>
              <div class="sale-price" v-else>
                <span class="discounted-price"
                  >${{ (0.9 * prod.price).toFixed(2) }}</span
                >
                &nbsp;
                <span class="before-sale-price"
                  ><s>${{ prod.price.toFixed(2) }}</s></span
                >
              </div>
              <div class="product-weight">{{ prod.weight }}</div>
            </div>
          </router-link>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import productService from "@/services/ProductService.js";
export default {
  data() {
    return {
      products: [],
      filter: {
        title: "",
        sale: false,
        categoryId: "",
      },
      categories: [],
      prodByCat: [],
      searchTerm: "",
    };
  },
  components: {},
  created() {
    productService.loadHomePageData().then((response) => {
      this.prodByCat = response.data;
      this.prodByCat.forEach((cat) => {
        cat.forEach((prod) => {
          prod.discountedPrice = prod.price * 0.9;
        });
      });
    });
     productService.getAllCategories().then((response) => {
      this.categories = response.data;
    });
  },
  methods: {
    clickMethod() {
      this.$router.push("all-products");
    },
    search() {
      this.$router.push({ name: "search", params: { query: this.searchTerm } });
    },
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
};
</script>

<style>
.main {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
  background-color: lightgray;
}

.container {
  display: flex;
  align-content: space-evenly;
  background-color: white;
  border-radius: 10px;
  width: 250px;
  height: 200px;
  gap: 0.5rem;
  margin: 1rem;
}
body {
  font-family: sans-serif;
}
.category {
  display: flex;
  margin-top: 5rem;
  border: 5px;
  padding: 1px;
  font-size: 30px;
}

.thumbnail {
  display: flex;
  margin: 50px;
  width: 200px;
  height: 200px;
  object-fit: cover;
}

.view-all {
  font-size: 12px;
}
</style>
