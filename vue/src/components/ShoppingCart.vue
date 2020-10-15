<template>
  <div class="your-cart">
    <div id="test">
      <h2 id="your-cart">YOUR CART</h2>
      <div v-if="!cartTotal">
      <img id="empty-cart-image" src="https://tinyurl.com/y3wzf32v">
      </div>
      <div
        class="items"
        v-for="product in this.$store.state.cart"
        v-bind:key="product.id"
      >
       <img
              class="sale-banner"
              v-if="product.sale"
              src="/salebanner.png"
            />
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
        <div class="prod-title">{{ product.title }}</div>
        <select
          class="qty"
          v-on:change="addMoreToCart(product, $event.target.value)"
        >
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
        </select>
        <div class="remove">
          <a href="#" v-on:click.prevent="removeFromCart(product)">Remove</a>
        </div>
        <div class="prod-price" v-if="!product.sale">
          ${{ product.price.toFixed(2) }}
        </div>
        <div class="sale-price" v-else>
          <span class="prod-price"
            >${{ product.discountedPrice.toFixed(2) }}</span
          >&nbsp;
          <span id="cart-old-price"
            ><s>${{ product.price.toFixed(2) }}</s></span
          >
        </div>
        <textarea id="notes" placeholder="Notes for your shopper"></textarea>
      </div>
    </div>
    <div>
      <div class="order-summary">
        <div class="original-price">
          Subtotal: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
        <span id="order-sum-nums"> ${{ originalPrice.toFixed(2) }} </span>
        </div>
        <div class="tax">Tax: <span id="order-sum-nums">${{ cartTax.toFixed(2) }}</span></div>
        <div class="total">Total: <span id="order-sum-nums">${{ cartTotal.toFixed(2) }}</span></div>
        <div v-on:click="checkout = !checkout">
          <div class="checkout-icon">Checkout</div>
        </div>
        <div v-if="checkout" class="checkout">
          <form>
            <input
              id="name"
              class="checkout-input"
              type="text"
              placeholder="Name"
              required
            /><br />
            <input
              id="address"
              class="checkout-input"
              type="text"
              placeholder="Street Address"
              required
            /><br />
            <input
              id="city"
              class="checkout-input"
              type="text"
              placeholder="City"
              required
            />
            <select name="state" id="state" required>
              <option>Select State</option>
              <option value="IN">Indiana</option>
              <option value="MI">Michigan</option>
              <option value="OH">Ohio</option>
              <option value="PA">Pennsylvania</option>
            </select>

            <input
              id="zip"
              class="checkout-input"
              type="text"
              placeholder="Zip Code"
              required
              v-model.lazy="zip"
            />
            <div class="msg" v-if="msg.zip">{{ msg.zip }}</div>

            <br />
            <input
              id="tel"
              class="checkout-input"
              name="tel"
              type="tel"
              required
              placeholder="123-456-7890"
            /><br />

            When would you like to receive your delivery?
            <div id="deliverydate">
              <div>
                <input
                  type="radio"
                  id="today"
                  name="deldate"
                  value="today"
                  v-on:click="tomorrow = false"
                  checked
                />
                <label for="today">Today - Rush!</label>
              </div>
              <div>
                <input
                  type="radio"
                  id="tomorrow"
                  name="deldate"
                  value="tomorrow"
                  v-on:click="tomorrow = true"
                />
                <label for="tomorrow">Tomorrow</label>
              </div>
            </div>
            <div v-if="tomorrow">
              <select name="time" id="time" required>
                <option>Select Time</option>
                <option value="morning">Morning</option>
                <option value="afternoon">Afternoon</option>
                <option value="night">Night</option>
              </select>
            </div>

            <button id="cash" class="cart-button">Cash on Delivery</button>
            
            <button
              class="cart-button-disable"
              disable
              title="Sorry, currently unavailable"
            >
              Credit Card
            </button>
            <button
              class="cart-button-disable"
              disable
              title="Sorry, currently unavailable"
            >
              Paypal
            </button>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
// import productService from "../services/ProductService.js";
export default {
  data() {
    return {
      zip: null,
      msg: [],
      checkout: false,
      tomorrow: false,
      cart: [],
    };
  },
  watch: {
    zip(value) {
      this.zip = value;
      this.validateZip(value);
    },
  },
  created() {
    // productService.viewCartInventory().then((response) => {
    //   this.cart = response.data;
    //   this.cart.discountedPrice = this.cart.price * 0.9;
    // });
    // this.cart = this.$store.state.cart;
  },
  methods: {
    removeFromCart(product) {
      this.$store.commit("REMOVE_FROM_CART", product);
    },

    addMoreToCart(product, qty) {
      let i = 0;
      for (i = 1; i < qty; i++) {
        this.addToCart(product);
      }
    },
    clearCart() {
      this.$store.commit("CLEAR_CART");
    },
    addToCart(item) {
      this.$store.commit("ADD_PRODUCT", item);
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
      product.quantity = qty;
      this.$store.commit("UPDATE_ITEM_QTY", product);
    },
    validateZip(zip) {
      if (
        (zip > 10000 && zip > 44101 && zip < 44144) ||
        (this.zip > 45202 && this.zip < 45248) ||
        (this.zip > 43085 && this.zip < 43268) ||
        (this.zip > 48126 && this.zip < 48243)
      ) {
        this.msg["zip"] = "";
      } else {
        this.msg["zip"] =
          "Sorry, we only deliver to Tech Elevator metro areas!";
      }
      console.log(zip);
    },
    received(){
      let output = "Transaction sucessfull";
      return output;
    }
  },
  computed: {
    originalPrice() {
      let newTotal = 0.0;
      let i = 0;
      let productPrice = 0.0;
      for (i = 0; i < this.$store.state.cart.length; i++) {
        if (this.$store.state.cart[i].sale == true) {
          productPrice = this.$store.state.cart[i].discountedPrice;
        } else {
          productPrice = this.$store.state.cart[i].price;
        }
        newTotal = newTotal + productPrice;
      }

      return newTotal;
    },

    cartTax() {
      let newTotal = 0.0;
      let i = 0;
      let productPrice = 0.0;
      for (i = 0; i < this.$store.state.cart.length; i++) {
        if (this.$store.state.cart[i].sale == true) {
          productPrice = this.$store.state.cart[i].discountedPrice;
        } else {
          productPrice = this.$store.state.cart[i].price;
        }
        newTotal = newTotal + productPrice;
      }
      newTotal = newTotal * 0.08;
      return newTotal;
    },
    cartTotal() {
      let newTotal = 0.0;
      let i = 0;
      let productPrice = 0.0;
      for (i = 0; i < this.$store.state.cart.length; i++) {
        if (this.$store.state.cart[i].sale == true) {
          productPrice = this.$store.state.cart[i].discountedPrice;
        } else {
          productPrice = this.$store.state.cart[i].price;
        }
        newTotal = newTotal + productPrice;
      }
      let tax = newTotal * 0.08;
      newTotal = newTotal + tax;
      return newTotal;
    },
  },
};
</script>

<style>
textarea {
  font-family: sans-serif;
}

.remove{
    grid-area: remove;
    font-size: 12px;
}
.total {
  display: flex;
  justify-content: space-between;
}
.tax {
  display: flex;
  justify-content: space-between;
}
.original-price {
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
    "thumbnail price"
    "thumbnail qty"
    "thumbnail remove"
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
  font-size: 20px;
}

.order-summary {
  display: block;
  flex-direction: column;
  position: sticky;
  top: 200px;
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
  object-fit: cover;
}

.qty {
  max-width: 50px;
  max-height: 30px;
  grid-area: qty;
}

#cart-old-price {
  font-size: 0.9em;
  color: rgb(253, 97, 97);
}

.msg {
  color: red;
  font-size: 0.8em;
}

#empty-cart-image {
  display: flex;
  padding-top: 3em;
}

#your-cart {
  display: flex;
  justify-content: center;
  font-size: 1.5em;
}
</style>