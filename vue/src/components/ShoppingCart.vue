<template>
  <div class="your-cart">
    <div id="test">
      <h2>YOUR CART</h2>

      <div
        class="items"
        v-for="product in $store.state.cart"
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
        <div class="prod-price">{{ product.price.toFixed(2) }}</div>
        <textarea id="notes" placeholder="Notes for your shopper"></textarea>
      </div>
    </div>

    <div>
      <div class="order-summary">
        <div v-for="product in $store.state.cart" v-bind:key="product.id">
          <div class="sum-prod-price">
            Price: {{ product.price.toFixed(2) }}
          </div>
        </div>
        <div class="tax">Tax:</div>
        <div class="total">Total:</div>
        <div class="checkout-icon">Checkout</div>
        <div>{{total.toFixed(2)}}</div>
      </div>
    </div>
  </div>
</template>

<script>
import productService from "../services/ProductService.js";
export default {
  data() {
    return {
      total: 0,
      cart: [],
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
    cartTotal() {
        let total = 0.00;
      this.$store.state.cart.forEach((product) => {
        total += product.price;

      });
      return total;
    },
  },
};
</script>

<style>
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
  padding: 80px 80px;
  margin-top: 70px;
  justify-content: space-between;
  background-color: white;
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