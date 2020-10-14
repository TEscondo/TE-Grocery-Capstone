<template>
  <div class="your-cart">
    <div id="test">
      <h2>YOUR CART</h2>

      <div
        class="items"
        v-for="product in this.$store.state.cart"
        v-bind:key="product.id"
      >
        <img
          class="thumbnail"
          v-if="product.image"
          v-bind:src="product.image"
        />
        <div class="prod-title">{{ product.title }}</div>
        <select
          class="qty"
          v-on:change="updateCart(product, $event.target.value)"
        >
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
        </select>
        <div class="prod-price" v-if="!product.sale">{{ product.price.toFixed(2) }}</div>
        <div class="prod-price" v-else>{{product.discountedPrice.toFixed(2)}}</div>
        <textarea id="notes" placeholder="Notes for your shopper"></textarea>
      </div>
    </div>

    <div>
      <div class="order-summary">
        <div class="original-price">Original Price: {{originalPrice.toFixed(2)}}</div>
        <div class="tax">Tax: {{cartTax.toFixed(2)}}</div>
        <div class="total">Total: {{cartTotal.toFixed(2)}}</div>
        <div class="checkout-icon">Checkout</div>
        </div>
        
      </div>
    </div>
  
</template>

<script>
// import productService from "../services/ProductService.js";
export default {
  data() {
    return {
    
      cart: [],
    };
  },
  created() {
    // productService.viewCartInventory().then((response) => {
    //   this.cart = response.data;
    //   this.cart.discountedPrice = this.cart.price * 0.9;
    // });
    // this.cart = this.$store.state.cart;
  },
  methods: {
    addToCart(item) {
      this.$store.cart.commit("ADD_PRODUCT", item);
    },
    isInCart(item) {
      const product = this.cart.find((product) => product.id === item.id);
      return product ? true : false;
    },
    pay() {
      this.cart = [];
      alert("Thanks for shopping with us!");
    },
    updateCart(product, qty) {
      product.qty = qty;
      this.$store.commit("UPDATE_ITEM_QTY", product);
    },
  },
  computed: {
    originalPrice() {
        let newTotal = 0.00;
        let i=0;
        let productPrice = 0.00;
        for (i=0; i<this.$store.state.cart.length;i++) {
            if (this.$store.state.cart[i].sale == true){
                productPrice = this.$store.state.cart[i].discountedPrice;
            }
            else {
                productPrice = this.$store.state.cart[i].price;
            }
            newTotal = newTotal + productPrice;
        }

      return newTotal;
    },
    
    cartTax() {
        let newTotal = 0.00;
        let i=0;
        let productPrice = 0.00;
        for (i=0; i<this.$store.state.cart.length;i++) {
            if (this.$store.state.cart[i].sale == true){
                productPrice = this.$store.state.cart[i].discountedPrice;
            }
            else {
                productPrice = this.$store.state.cart[i].price;
            }
            newTotal = newTotal + productPrice;
        }
        newTotal = newTotal*0.08;
      return newTotal;
    },
     cartTotal() {
        let newTotal = 0.00;
        let i=0;
        let productPrice = 0.00;
        for (i=0; i<this.$store.state.cart.length;i++) {
           if (this.$store.state.cart[i].sale == true){
                productPrice = this.$store.state.cart[i].discountedPrice;
            }
            else {
                productPrice = this.$store.state.cart[i].price;
            }
            newTotal = newTotal + productPrice;
        }
        let tax = newTotal*0.08;
        newTotal = newTotal+tax;
      return newTotal;
    },
  },
};
</script>

<style>
.total{
    display: flex;
    justify-content: space-between;
}
.tax{
    display: flex;
    justify-content: space-between;
}
.original-price{
    display: flex;
    justify-content: space-between;
}

.checkout-icon {
  display: inline-block;
  background-color: #f0d922;
  color: #03989e;
  border-radius: 4px;
  border: 1px solid black;
  padding: 3px 8px 3px 8px;
  margin: 5px;
  font-weight: bold;
  max-width: 100px;
  text-align: center;
}
.your-cart {
  display: flex;
  flex-direction: row;
  justify-content: space-around;
  background-color: #d3d3d3;
}

.items {
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-template-areas:
    "thumbnail title"
    "thumbnail qty"
    "thumbnail price"
    "notes notes";
  justify-content: space-between;
  max-width: 70%;
  margin-left: auto;
  margin-right: auto;
  padding: 5px;
  background-color: white;
}

.prod-title {
  margin-top: 20px;
  grid-area: title;
}

.order-summary {
  display: flex;
  flex-direction: column;
  position: sticky;
  top: 0;
  padding: 80px;
  margin-top: 70px;
  justify-content: space-between;
  background-color: white;
  box-sizing: border-box;
      font: 20px bold;
    font-family: Arial, Helvetica, sans-serif;
}
.prod-price {
  grid-area: price;
}

#notes {
  margin-left: 40px;
  padding-top: 20px;
  grid-area: notes;
  max-width: 300px;
}

.thumbnail {
  grid-area: thumbnail;
}

.qty {
  max-width: 50px;
  max-height: 30px;
  grid-area: qty;
}
</style>