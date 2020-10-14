<template>
  <div>
    <div
      class="container"
      v-for="product in filteredList"
      v-bind:key="product.id"
    >
      <router-link v-bind:to="{ name: 'product-details', params: { id : product.id }}">
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
       <div>
        <span class="price" v-if="product.sale != true">${{ product.price.toFixed(2) }}</span>
        <div v-else class="sale-price">
          <span class="discounted-price">${{ product.discountedPrice.toFixed(2) }}</span>
          <s><span class = "before-sale-price">${{product.price.toFixed(2)}}</span></s></div>
        {{ product.weight }}oz
      </router-link>
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
  background-color: white;
  border-radius: 10px;
  width: 250px;
  height: 200px;
  gap: 1rem;
  margin: 1rem;

}
.product-title {
  font-size: 1.5rem;
}
.thumbnail {
  max-width: 10em;
  max-height: 10em;
}

.price {
  font-size: 1.4rem;
}
</style>