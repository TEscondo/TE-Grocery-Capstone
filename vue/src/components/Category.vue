<template>
  <section class="product-by-category">
    <div class="category-title">
      <h1>{{returnCategoryName}}</h1>
    </div>
    <p class="category-description">{{returnCategoryDescription}}</p>
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
          <s><div class="before-sale-price">${{ product.price }}.00</div></s> ${{ product.discountedPrice }}0
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
            return "Dry Goods";
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
            return "Dairy";
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
        return "Other";
    },
   returnCategoryDescription() {
        if (this.$route.params.categoryId == 1) {
            return "Frozen Food - Meat, Produce, Snacks, Dinners, Desserts, and other convenient meals to fill your freezer.";
        }
        if (this.$route.params.categoryId == 2) {
            return "An assortment of unrelated items";
        }
        if (this.$route.params.categoryId == 3) {
            return "Bakery - Bread, pies, cookies, and a variety of baked delights.";
        }
        if (this.$route.params.categoryId == 4) {
            return "Produce - Freshly picked fruits and vegetables to kickstart any recipe or enjoy on its own.";
        }
        if (this.$route.params.categoryId == 5) {
            return "Alcohol - Beers, wines, and spirits - Please drink responsibly.";
        }
        if (this.$route.params.categoryId == 6) {
            return "International - Exotic foods, snacks, and spices from all over the world.";
        }
        if (this.$route.params.categoryId == 7) {
            return "Beverages - Water, juice, soft drinks, and sports drinks to quench your thirst.";
        }
        if (this.$route.params.categoryId == 8) {
             return "Pets - Dry foods, canned foods, treats, and accessories for your furry family.";
        }
        if (this.$route.params.categoryId == 9) {
            return "Dry Goods - Cereal, pasta, rice, and other grains";
        }
        if (this.$route.params.categoryId == 10) {
            return "Items that may be bought in bulk for the best savings";
        }
        if (this.$route.params.categoryId == 11) {
            return "Personal Care - Vitamins, supplements, and other products to keep you healthy.";
        }
        if (this.$route.params.categoryId == 12) {
            return "Deli - Chicken, beef, pork, fish, and a variety of meats found on land or sea.";
        }
        if (this.$route.params.categoryId == 13) {
            return "Pantry - Sugar, spice, mix, and other essentials for any recipe.";
        }
        if (this.$route.params.categoryId == 14) {
            return "Items for the most important meal of the day";
        }
        if (this.$route.params.categoryId == 15) {
            return "Canned Goods - Fruits, vegetables, meats, and other foods built for a long shelf-life.";
        }
        if (this.$route.params.categoryId == 16) {
            return "Dairy - milk, cheese, and other plant-based alternatives for you and your family to enjoy.";
        }
        if (this.$route.params.categoryId == 17) {
            return "Household - Office, kitchen, bathroom, and cleaning products to keep your home stocked and clean.";
        }
        if (this.$route.params.categoryId == 18) {
            return "Items to care for the youngest among us";
        }
        if (this.$route.params.categoryId == 19) {
            return "Snacks - Chips, dips, cookies, candy, and other treats for you to endulge.";
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

.container {
  display: flex;
  align-items: center;
  flex-wrap: wrap;
  justify-content: space-around;
}

.before-sale-price {
    color: rgb(253, 97, 97);
}
</style>