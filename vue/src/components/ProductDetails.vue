<template>
  <div class="details-main">
    <br />
    <div class="details-container">
    <h2>{{ currentProduct.title }}</h2>
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
     
      <span class="price" v-if="currentProduct.sale != true">
        ${{ currentProduct.price.toFixed(2)  }} | 
      </span>
      <span class="sale-price" v-else>
        <s><div class="before-sale-price">${{ currentProduct.price.toFixed(2) }}</div></s></span>
       <div class="discounted-price"> ${{ currentProduct.discountedPrice.toFixed(2) }}</div>
      <div class = "product-weight"> {{ currentProduct.weight }} </div><br/>
      <div class = "product-details">{{ currentProduct.details }} </div><br/>
      <div v-if="certification">Certifications: {{certification}}</div>
      
    </div>
  </div>
</template>

<script>
import productService from "../services/ProductService.js";
export default {
  
  name: "details",
  data() {
    return {
      currentProduct: {},
      certification: {}
    };
  },
  created() {
    productService.getProductById(this.$route.params.id).then((response) => {
      this.currentProduct = response.data;
      this.currentProduct.discountedPrice = this.currentProduct.price * 0.9;
    });
    productService.getCertifications(this.$route.params.id).then((response) =>
      this.certification = response.data)
  },
};
</script>

<style>
.details-main {
  display: flex;
  
}

.details-container {
  max-width: 500px;
  text-align: center;
  margin-left: auto;
  margin-right: auto;
}

.thumbnail {
  display: flex;
  align-items: center;
  justify-items: center;
  margin: auto;
}

h2 {
    color: black;
}

.product-details {
  font-size: 16px;
  line-height: 22px;;
}

</style>