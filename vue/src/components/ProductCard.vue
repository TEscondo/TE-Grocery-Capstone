<template>
  <div>
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
        <div class="price" v-if="product.sale != true">
          ${{ product.price }}.00
        </div>
        <div class="sale-price" v-else>
          was ${{ product.price }}.00 now ${{ product.discountedPrice }}0
        </div>
        {{ product.weight }}oz
      </a>
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
  max-width: 10em;
  max-height: 10em;
}

.price {
  font-size: 1.4rem;
}
</style>