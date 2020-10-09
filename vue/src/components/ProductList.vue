<template>
  <div>
    <h3>PRODUCTS</h3>
    <input type="text" id="Search" v-model="filter.title" /><br />
    <input type="checkbox" v-model="filter.sale" />
    <label for="checkbox"> Sale Items Only</label>
    <div class="filter">
      <label for="basic-dropdown">Categories: </label>
      <select name="basic-dropdown" v-model="filter.categoryId">
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
      </select>
    </div>
    <div class="main">
      <div
        class="container"
        v-for="product in filteredList"
        v-bind:key="product.id"
      >
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
        <div class="sale-price" v-else><s><div class="before-sale-price">${{product.price.toFixed(2)}}</div></s> ${{ product.discountedPrice.toFixed(2) }}</div>
        {{ product.weight }}oz
        </a>
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

.price {
  font-size: 1.4rem;
}

.before-sale-price {
    color: rgb(253, 97, 97);
}
</style>