<template>
  <div>
    <h3>PRODUCTS</h3>
    <input type="text" id="Search" v-model="filter.title" /><br />
    <input type="checkbox" v-model="filter.sale" />
    <label for="checkbox"> Sale Items Only</label>
    <div class="filter">
  <label for="basic-dropdown">Categories: </label>
  <select name="basic-dropdown" v-model="selectedFruit">
    <option>frozen</option>
    <option>produce</option>
    <option>internatinal</option>
    <option>beverages</option>
    <option>pets</option>
    <option>dry goods pasta</option>
    <option>personal care</option>
    <option>meat seafood</option>
    <option>pantry</option>
    <option>breakfast</option>
    <option>canned goods</option>
    <option>snacks</option>
  </select>
</div>
    <div class="main">
      <div
        class="container"
        v-for="product in filteredList"
        v-bind:key="product.id"
      >
        <div class="product-title">{{ product.title }}</div>
        <img
          class="thumbnail"
          v-if="product.image != null"
          v-bind:src="product.image"
        />
        <img
          class="thumbnail"
          v-else
          src="https://storage.needpix.com/rsynced_images/grocery-store-2119702_1280.jpg"
        />
        <br />
        ${{ product.price }}.00 {{ product.weight }}oz
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
          title:"",
          sale: false,
        },
      }
    },
    
    computed: {
filteredList() {
let filteredProducts = this.products;
if (this.filter.title != "") {
filteredProducts = filteredProducts.filter((item) =>
item.title.toLowerCase().includes(this.filter.title.toLowerCase()));
}
if (this.filter.sale != "") {
filteredProducts = filteredProducts.filter((item) =>
item.sale === this.filter.sale
);
}

return filteredProducts;
},
},
    created() {
    productService.getAllProducts().then((response) => {
      this.products = response.data;
    });
  }}
</script>

<style>
.main {
  display: flex;
  justify-content: space-evenly;
  flex-wrap: wrap;
}

.container {
  border: 2px solid black;
  border-radius: 10px;
  width: 250px;
  height: 270px;
  gap: 1rem;
  margin: 1rem;
  text-align: center;
  vertical-align: middle;
}
.product-title {
  font-size: 1.5rem;
}
.thumbnail {
  max-width: 200px;
  max-height: 150px;
}
</style>