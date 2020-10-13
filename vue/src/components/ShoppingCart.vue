<template>
  
      <div class="your-cart">
          <h2>YOUR CART</h2>
          
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
    productService.viewCartInventory().then((response) => {
      this.cart = response.data;
      this.cart.discountedPrice = this.cart.price * 0.9;
    });
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