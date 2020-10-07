<template>
  <div>
    <h3>PRODUCTS</h3>
    <div class="product" v-for="product in productList" 
    v-bind:key="product.id">
      {{ product.title }}
      <img class="thumbnail" v-if="product.image" v-bind:src="product.image"/>
      <div class="price"> ${{product.price}}</div>
      <div>{{product.weight}}oz</div>
    </div>
  </div>
</template>

<script>
import productService from "../services/ProductService.js";

export default {
    name: "all-products",
  data() {
    return {
      productList: [],
    };
  },
  methods: {
    //get a batch of products and append to the product div
    loadProducts(numProducts = 5){
      let i=0;
      let j=0;
      const prodCont = document.querySelector('.product')
      while(i<numProducts) {
        const prod = document.createElement('prod');
        prod.src = `${this.$route.params}/${j}`;
        prodCont.appendChild(prod);
        j++;
        i++;
      }
    window.addEventListener('scroll', () => {
      if (window.scrollY + window.innerHeight >= document.documentElement.scrollHeight) {
        this.loadProducts()
      }
    })
    }
  },
  computed: {
  },
  created() {
    productService.getAllProducts().then((response) => {
      this.productList = response.data;
    });
  },
};
</script>

<style>
.product {
  display: flex;
  flex-flow: column wrap;
  align-items: center;
  margin-bottom: 40px;
}

.thumbnail {
    max-width: 200px;
}
</style>