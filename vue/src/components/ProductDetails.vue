<template>
  <div class="details-main">
    <banner />
    <h2>{{ currentProduct.title }} Details</h2>
    <br />
    <div class="details-container">
      <img
        class="thumbnail"
        v-if="currentProduct.image"
        v-bind:src="currentProduct.image"
        onerror="this.onerror=null; this.src='https://grocerymonk.com/image_placeholder.png'"
      />
      <img
        class="thumbnail"
        v-else
        src="https://grocerymonk.com/image_placeholder.png"
      />
      <div>{{ currentProduct.title }}</div>
      <div class="price" v-if="currentProduct.sale != true">
        ${{ currentProduct.price }}.00
      </div>
      <div class="sale-price" v-else>
        was ${{ currentProduct.price }}.00 now ${{
          currentProduct.discountedPrice
        }}0
      </div>
      {{ currentProduct.details }}
      {{ currentProduct.weight }}oz
    </div>
  </div>
</template>

<script>
import productService from "../services/ProductService.js";
import Banner from "@/components/Banner";
export default {
  components: {
    Banner,
  },
  name: "details",
  data() {
    return {
      currentProduct: {},
    };
  },
  created() {
    productService.getProductById(this.$route.params.id).then((response) => {
      this.currentProduct = response.data;
      this.currentProduct.discountedPrice = this.currentProduct.price * 0.9;
    });
  },
};
</script>

<style>
.details-main {
  display: grid;
}

.details-container {
  max-width: 500px;
  text-align: center;
}
</style>