<template>
  <div>
    <h3>PRODUCTS</h3>
    <div id=search>
      <label for="basic-dropdown"> Categories: </label>
      <select name="basic-dropdown" class="category-dropdown" v-model="filter.categoryId">
        <option value="">View All</option>
        <option value="1">Frozen</option>
        <option value="4">Produce</option>
        <option value="6">International</option>
        <option value="7">Beverages</option>
        <option value="8">Pets</option>
        <option value="9">Dry Goods</option>
        <option value="11">Personal Care</option>
        <option value="12">Meat/Seafood</option>
        <option value="13">Pantry</option>
        <option value="15">Canned Goods</option>
        <option value="19">Snacks</option>
      </select>&nbsp;&nbsp;
    <input type="text" class="search-bar" placeholder="Search for an item" v-model="filter.title" />&nbsp;
    <input type="checkbox" v-model="filter.sale" />
    <label for="checkbox"> Sale Items Only </label>
    </div><br/>
    <div class="main">
      <div
        class="container"
        v-for="product in filteredList"
        v-bind:key="product.id"
      >
      <div class = "product-card">
      <a v-bind:href="'/product-details/' + product.id">
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
        <div class="price" v-if="product.sale != true">${{ product.price.toFixed(2) }}</div>
        <div v-else class="sale-price">
          <s><div class = "before-sale-price">${{product.price.toFixed(2)}}</div></s>
          <div class="discounted-price">${{ product.discountedPrice.toFixed(2) }}</div></div>
          <div class = "product-weight">{{ product.weight }}</div>
      </a>
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
  created() {
    productService.getAllProducts().then((response) => {
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

.container {
  background-color:white;
  border-radius: 1em;
  width: 15em;
  height: 25em;
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
  position:sticky;
  text-align: left;
  background-color: skyblue;
  padding-top: 2em;
  padding-bottom: 0.5em;
}

input[type=text] {
  display: flex;
  width: 30%;
}

.search-bar {
  display: flex;
  block-size: 6em;
}

.category-dropdown {
  display: flex;
  block-size: 2em;
  align-self: center;
}
</style>