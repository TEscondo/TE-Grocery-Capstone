<template>
  <div class="details-main">
    <br />
    <div class="image-container">
      <img class="sale-banner" v-if="currentProduct.sale" src="/salebanner.png">
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
    </div>
      <h2 id="title">{{ currentProduct.title }}</h2>
      <div id="price" class="price" v-if="!currentProduct.sale">
        <div class="cart-button" v-on:click.prevent="addToCart(currentProduct)">Add to Cart</div>
        
        ${{ currentProduct.price.toFixed(2) }}
      </div>
      <div id="price" v-else class="sale-price">
        <span class="discounted-price">
          <div class="cart-button" v-on:click.prevent="addToCart(currentProduct)">Add to Cart</div>
          ${{ currentProduct.discountedPrice.toFixed(2) }}
        </span> &nbsp;
        <span class="before-sale-price"><s>
            ${{ currentProduct.price.toFixed(2) }}</s>
          </span>&nbsp;&nbsp;
      </div>
      <div class="product-weight">{{ currentProduct.weight }}</div>
      <br />
      <div class="product-details">{{ currentProduct.details }}</div>
      <br />
      <div class="cert">Certifications: <div class="cert-icon" v-for="cert in certification" v-bind:key="cert.id"> <a v-bind:href="'/certification/' + cert.id"> {{ cert.name }} </a></div></div>
      </div>  
</template>

<script>
import productService from "../services/ProductService.js";
export default {
  name: "details",
  data() {
    return {
      currentProduct: {},
      certification: [],
    };
  },
  methods :{
    addToCart(item) {
      this.$store.commit("ADD_PRODUCT", item);
      window.alert("Added!");
    }
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
};
</script>

<style>
.cart-button {
  display: inline-block;
  background-color: #03989e;
  color: white;
  border-radius: 4px;
  border: 1px solid black;
  padding: 3px 8px 3px 8px;
  margin: 5px;
  font-weight: bold;
}

.details-main {
  display: grid;
  grid-template-columns: 200px 1fr;
  grid-template-areas:
    "image title"
    "image desc"
    "weight desc"
    ". price"
    "cert cert";
  max-width: 500px;
  text-align: center;
  margin-left: auto;
  margin-right: auto;
}

#title {
  grid-area: title;
}
#price {
  grid-area: price;
}
.image-container {
  margin-top: 20px;
  grid-area: image;
  position: relative;
}

.sale-banner {
  position: absolute;
  width: 160px;
  height: 160px;
  display: block;
  margin: 10px 40px 10px 40px;
}

.thumbnail {
  display: flex;
  align-items: center;
  justify-items: center;
  margin: 10px 40px 10px 40px;
  padding: 0px 0px 0px 0px;
}

.product-details {
  font-size: 16px;
  line-height: 22px;
  grid-area: desc;
  align-items: center;
}

.product-weight {
  grid-area: weight;
}

.cert {
  grid-area: cert;
  margin-top: 15px;
}

.cert-icon {
  display: inline-block;
  background-color: lightgray;
  border-radius: 15px;
  border: 1px solid;
  padding: 3px 8px 3px 8px;
  margin: 5px;
  font-weight: bold;
}
</style>