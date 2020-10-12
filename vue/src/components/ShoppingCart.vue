<template>
  <div class="main">
      <div class="item-container">
          
      </div>
    </div>
</template>

<script>
import productService from "../services/ProductService.js"
export default {
    data() {
        return {
            cart: []
        };
    },
    created() {
    productService.getProductById(this.$route.params.id).then((response) => {
      this.currentProduct = response.data;
      this.currentProduct.discountedPrice = this.currentProduct.price * 0.9;
    });
       productService
      .getCertifications(this.$route.params.id)
      .then((response) => (this.certification = response.data));
    },
    methods: {
        addToCart(item) {
            this.cart.push(item);
        },
        isInCart(item) {
            const product = this.cart.find(product => product.id === item.id);
            return (product ? true : false);
       },
       pay() {
           this.cart = [];
           alert("Thanks for shopping with us!");
       },
    },
};
</script>

<style>
</style>