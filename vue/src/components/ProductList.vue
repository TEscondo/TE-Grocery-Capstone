<template>
  <div>
    <div id="search">
      <input
        type="text"
        class="search-bar"
        placeholder="Search for an item" v-model="filter.title"/>&nbsp;

      <label for="checkbox" id="sale-box"
        >Sale Items Only<input type="checkbox" v-model="filter.sale"
      /></label><br/>
    </div>

    <div class="navigation"> <div v-for="cat in categories" v-bind:key="cat.categoryId">
    <router-link v-bind:to="{ name: 'category', params: { categoryId : cat.categoryId }}">{{cat.categoryName}}</router-link></div></div>

    <br />
    <div class="splash-container">
      <div id="splash-text">
        <h1 class="fresh-food-text">Fresh Food Brought To Your Door</h1>
        <h2 class="delivery-fee-text">
          No delivery fee for your first order -->
        </h2>
      </div>
      <div id="splash-image"><img  src="/deliverystockart.jpg" /></div>
    </div>
    <div id="top-products-label">
      <h1>Top Products</h1>
    </div>
    <div class="main">
      <div
        class="container"
        v-for="product in filteredList.slice(24, 32)"
        v-bind:key="product.id"
      >
        <div class="product-card">
          <router-link v-bind:to="{ name: 'product-details', params: { id : product.id }}">
            <img
              class="sale-banner"
              v-if="product.sale"
              src="/salebanner.png"
            />
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
            <div class="cart-button" v-on:click.prevent="addToCart(product)">Add To Cart</div>
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
      categories: [],
      products: [],
      filter: {
        title: "",
        sale: false,
        categoryId: "",
      },
    };
  },
  methods: {
    findSalePrice() {
      if (this.product.sale) {
        this.product.price = this.product.price * 0.9;
      }
      console.log(this.product.price);
      return this.product.price;
    },
    addToCart(item) {
      this.$store.commit("ADD_PRODUCT", item);
      window.alert("Added!");
    },
  },
  computed: {
    filteredList() {
      let filteredProducts = this.products;
      if (this.filter.title != "") {
        filteredProducts = filteredProducts.filter(
          (item) => item.title.toLowerCase().includes(this.filter.title.toLowerCase())
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
};
</script>

<style>


.main {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
  background-color: #f9fafb;
}

.container {
  background-color: white;
  border-radius: 1em;
  width: 15em;
  height: 22em;
  gap: 10em;
  margin: 1rem;
  text-align: center;
}
.product-title {
  font-size: 1.5rem;
}

.thumbnail {
  max-width: 10em;
  max-height: 10em;
}

.price {
  font-size: 1.5em;
}

.before-sale-price {
  color: rgb(253, 97, 97);
  font-size: 1em;
}

.product-card {
  display: flex;
}

#search {
  display: flex;
  justify-content: space-around;
  position: sticky;
  text-align: left;
  background-color:#d3d3d3;
  margin-top: 0.5em;
  padding-top: 1em;
  padding-bottom: 1em;
}

input[type="checkbox"] {
  transform: scale(3);
}

.search-bar {
  display: flex;
  block-size: 2em;
  display: flex;
  width: 80%;
  border-radius: 28px;
  font-size: 1.5em;
  padding-left: 10px;
}

.category-dropdown {
  display: flex;
  block-size: 3em;
}

.category-label {
  display: flex;
  align-items: center;
}

#sale-box {
  display: flex;
  align-items: center;
  justify-content: space-around;
  flex-direction: column;
  font-weight: bold;
}

#splash-image {
  display: flex;
  padding-left: 10em;
  justify-content: right;
  
}

#splash-text {
  margin-left: 15em;
}

.splash-container {
  display: flex;
  height: 14em;
  justify-content: space-around;
  border-style: solid;
  border-width: 0.15em;
  
}
.delivery-fee-text {
  color: #03989e;
}

#top-products-label {
  display: flex;
  justify-content: center;
  font-size: 1em;
  background-color: #d3d3d3;
}

.navigation {
  margin-top: 5px;
  display: flex;
  font-size: .85em;
  font-weight: bold;
  justify-content: space-evenly;
}
</style>