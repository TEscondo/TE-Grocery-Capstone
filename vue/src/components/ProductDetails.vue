<template>
  <div class="details-main">
    <br />
    <div class="image-container">
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
        ${{ currentProduct.price.toFixed(2) }}
      </div>
      <div id="price" v-else class="sale-price">
        <span class="discounted-price">
          ${{ currentProduct.discountedPrice.toFixed(2) }}
        </span> &nbsp;
        <span class="before-sale-price"><s>
            ${{ currentProduct.price.toFixed(2) }}</s>
          </span>
      </div>
      <div class="product-weight">{{ currentProduct.weight }}</div>
      <br />
      <div class="product-details">{{ currentProduct.details }}</div>
      <br />
      <div class="cert">Certifications: <div class="cert-icon" v-for="cert in certification" v-bind:key="cert.id"> {{ cert.name }} </div></div>
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
.details-main {
  display: grid;
  grid-template-columns: 200px 1fr;
  grid-template-areas:
    "title title"
    "image desc"
    "weight price"
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
  grid-area: image;
}

.thumbnail {
  display: flex;
  align-items: center;
  justify-items: center;
  margin: auto;
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

.container {
  display: flex;
  align-items: center;
}

.cert {
  grid-area: cert;
}

.cert-icon {
  display: inline-block;
  background-color: lightgray;
  border-radius: 28px;
  border: 1px solid;
  padding: 3px 8px 3px 8px;
  margin: 5px;
  font-weight: bold;
}
</style>