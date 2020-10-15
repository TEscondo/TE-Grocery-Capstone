<template>
  <div>
    <h2>CHECKOUT</h2>
    <form id ="checkout-form">
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
      />
      <div v-if="validateZip">Sorry, you're not in our delivery area!</div>
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
          <input type="radio" id="today" name="deldate" value="today" checked />
          <label for="today">Today - Rush!</label>
        </div>
        <div>
          <input type="radio" id="tomorrow" name="deldate" value="tomorrow" />
          <label for="tomorrow">Tomorrow</label>
        </div>
      </div>
      <button class="cart-button">Cash on Delivery</button>
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
</template>

<script>
export default {
  data() {
    return {
    zipValid: {},
  }
},

  methods: {
    validateZip(zip) {
      if (zip > 44101 && zip < 44144 || zip > 45202 && zip < 45248 || zip > 43085 && zip < 43268 
      || zip > 48126 && zip < 48243) {
        return true;
      }
    }
  }
};
</script>

<style>
#checkout-form {
  text-align: center;
}
.checkout-input {
  border-radius: 5px;
  height: 2em;
  margin: 0.8em 1em 0.2em 1em;
}

#name {
  width: 25.4em;
}
#address {
  width: 25.4em;
}

#city {
  width: 8em;
}

#state {
  height: 2.2em;
  width: 7.7em;
}

#zip {
  width: 7em;
}

.cart-button-disable {
  display: inline-block;
  background-color: #67c1c4;
  color: white;
  border-radius: 4px;
  border: 1px solid;
  padding: 3px 8px 3px 8px;
  margin: 5px;
  font-weight: bold;
}
</style>