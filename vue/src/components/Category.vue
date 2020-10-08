<template>
  <section class="product-by-category">
    <div class="category-title">
      <h1>{{returnCategoryName}}</h1>
    </div>
    <p class="category-description">Category Description</p>
    <div class="main">
      <div
        class="container"
        v-for="product in products"
        v-bind:key="product.id"
      >
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
        <div class="product-title">{{ product.title }}</div>
        <div class="price" v-if="product.sale != true">
          ${{ product.price }}.00
        </div>
        <div class="sale-price" v-else>
          was ${{ product.price }}.00 now ${{ product.discountedPrice }}0
        </div>
        {{ product.weight }}oz
      </div>
    </div>
  </section>
</template>

<script>
import productService from "../services/ProductService.js";
export default {
 computed: {
    returnCategoryName() {
        if (this.$route.params.categoryId == 1) {
            return "Frozen";
        }
        if (this.$route.params.categoryId == 2) {
            return "Other";
        }
        if (this.$route.params.categoryId == 3) {
            return "Bakery";
        }
        if (this.$route.params.categoryId == 4) {
            return "Produce";
        }
        if (this.$route.params.categoryId == 5) {
            return "Alcohol";
        }
        if (this.$route.params.categoryId == 6) {
            return "International";
        }
        if (this.$route.params.categoryId == 7) {
            return "Beverages";
        }
        if (this.$route.params.categoryId == 8) {
             return "Pets";
        }
        if (this.$route.params.categoryId == 9) {
            return "Dry Goods Pasta";
        }
        if (this.$route.params.categoryId == 10) {
            return "Bulk";
        }
        if (this.$route.params.categoryId == 11) {
            return "Personal Care";
        }
        if (this.$route.params.categoryId == 12) {
            return "Meat & Seafood";
        }
        if (this.$route.params.categoryId == 13) {
            return "Pantry";
        }
        if (this.$route.params.categoryId == 14) {
            return "Breakfast";
        }
        if (this.$route.params.categoryId == 15) {
            return "Canned Goods";
        }
        if (this.$route.params.categoryId == 16) {
            return "Dairy Eggs";
        }
        if (this.$route.params.categoryId == 17) {
            return "Household";
        }
        if (this.$route.params.categoryId == 18) {
            return "Babies";
        }
        if (this.$route.params.categoryId == 19) {
            return "Snacks";
        }
        if (this.$route.params.categoryId == 20) {
            return "Deli";
        }
        if (this.$route.params.categoryId == 21) {
            return "Missing";
        }
        return "Other";
    }
 },
  data() {
    return {
      products: [],
    };
  },
  created() {
    productService
      .getProductsByCategoryId(this.$route.params.categoryId)
      .then((response) => {
        this.products = response.data;
        this.products.forEach((product) => {
          product.discountedPrice = product.price * 0.9;
        });
      });
  },
};
</script>

<style>
.main {
  display: flex;
  justify-content: space-evenly;
  flex-wrap: wrap;
  background-color: #f9fafb;
}

.category-title {
  line-height: 2em;
  font-size: xx-large;
  display: flex;
  align-items: center;
  flex-wrap: wrap;
  justify-content: space-around;
}

.category-description {
    font-size: x-large;
    display: flex;
    align-items: center;
    flex-wrap: wrap;
    justify-content: space-around;
}
</style>