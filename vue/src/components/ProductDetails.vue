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
        ${{ currentProduct.price }}.00 | 
      </span>
      <span class="sale-price" v-else>
        <s><div class="before-sale-price">${{ currentProduct.price }}.00</div></s> ${{
          currentProduct.discountedPrice
        }}0
      </span> {{ currentProduct.weight }} <br/>
      {{ currentProduct.details }} <br/>
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
  display: block;
  
}

.details-container {
  max-width: 500px;
  text-align: center;
  margin-left: auto;
  margin-right: auto;
}

h2 {
    color: #03989e;
}

.before-sale-price {
    color: rgb(253, 97, 97);
}
</style>