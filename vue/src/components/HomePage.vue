<template>
  <div class="home">
    <div class="category">
      <a href="/byCategory/1"> Frozen </a>
      <a href="http://localhost:8081/product-details/18">
        <img
          src="https://zonacooks.com/wp-content/uploads/2017/03/No-Yeast-Pizza-Dough-for-One-Recipe-13.jpg.webp"
        />
      </a>
      <a href="http://localhost:8081/product-details/30">
        <img
          src="https://www.rachaelraymag.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTQ2MDQwNzQzMjQ3NzUwODYx/three-cheese-baked-ziti-102594818.jpg"
      /></a>
      <a href="http://localhost:8081/product-details/4"
        ><img
          src="https://www.recipegirl.com/wp-content/uploads/2019/10/pasta-vodka-sauce-1-1.jpg"
      /></a>
    </div>
    <div class="category"><a href="/byCategory/3">Bakery</a></div>
    <div class="category">
      <a href="/byCategory/4"> Produce</a>
      <a href="http://localhost:8081/product-details/31"
        ><img
          src="https://www.seriouseats.com/recipes/images/2015/10/20131114-pearl-onion-taste-test-edit.jpg"
      /></a>
      <a href="http://localhost:8081/product-details/8"
        ><img
          src="https://images.eatthismuch.com/site_media/img/2095_AndyG13_3b2937be-ddee-462d-ad2d-17157216ee76.png"
      /></a>
      <a href="http://localhost:8081/product-details/45"
        ><img
          src="https://www.thespruceeats.com/thmb/0becJgkxq3cm1ap1tHCpDpB8mPk=/1779x1334/smart/filters:no_upscale()/sliced-cucumbers-for-salad-g2k-56b720035f9b5829f836932a.jpg"
      /></a>
    </div>
    <div class="category"><a href="/byCategory/5">Alcohol</a></div>
    <div class="category">
      <a href="/byCategory/6"> International</a>
      <a href="http://localhost:8081/product-details/31"
        ><img
          src="https://www.seriouseats.com/recipes/images/2015/10/20131114-pearl-onion-taste-test-edit.jpg"
      /></a>
    </div>
    <div class="category"><a href="/byCategory/7">Beverages</a></div>
    <div class="category"><a href="/byCategory/8">Pets</a></div>
    <div class="category"><a href="/byCategory/9">Dry Goods</a></div>
    <div class="category"><a href="/byCategory/10">Personal Care</a></div>
    <div class="category"><a href="/byCategory/12">Meat & Seafood</a></div>
    <div class="category"><a href="/byCategory/13">Pantry</a></div>
    <div class="category"><a href="/byCategory/15">Canned Goods</a></div>
    <div class="category"><a href="/byCategory/16">Dairy</a></div>
    <div class="category"><a href="/byCategory/17">Household</a></div>
    <div class="category"><a href="/byCategory/19">Snacks</a></div>
    <product-list />
  </div>
</template>

<script>
import productService from "@/services/ProductService.js";
export default {
  components: {},
  created() {
    productService.getAllProducts().then((response) => {
      this.products = response.data;
      this.products.forEach((product) => {
        product.discountedPrice = product.price * 0.9;
      });
    });
  },
  methods: {
    clickMethod() {
      this.$router.push("all-products");
    },
  },
};
</script>

<style>
body {
  background-color: skyblue;
}
.category {
  display: flex;
  margin-top: 5rem;
  border: 5px;
  padding: 1px;
  font-size: 30px;
}

img {
  display: flex;

  margin: 50px;
  width: 200px;
  height: 200px;
  padding-left: 20px;
}
</style>