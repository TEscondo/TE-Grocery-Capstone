<template>
  <div class="home">
    <div v-for="prodCat in prodByCat" v-bind:key="prodCat.categoryName">
      <h3>
        <a v-bind:href="'/byCategory/'+prodCat.categoryId">{{prodCat.categoryName}}</a>
      </h3>
    <div class ="main">
      <div class="container" v-for="prod in prodCat.productsList" v-bind:key="prod.id">
        <a v-bind:href="'/product-details/' + prod.id">
          <img
            class="thumbnail"
            v-if="prod.image"
            v-bind:src="prod.image"
            onerror="this.onerror=null; this.src='https://grocerymonk.com/image_placeholder.png'"
          />
          <img
            class="thumbnail"
            v-else
            src="https://grocerymonk.com/image_placeholder.png"
          />
          <div class="product-title">{{ prod.title }}</div>
          <div class="price" v-if="prod.sale != true">
            ${{ prod.price.toFixed(2) }}</div>
          <div v-else><s>${{prod.price.toFixed(2)}}</s><br>
          ${{(0.9*prod.price).toFixed(2)}} </div>
        {{ prod.weight }}
        </a>
      </div>
    </div>
    </div>
  </div>

</template>

<script>
import productService from "@/services/ProductService.js";
export default {
  data() {
    return {
      products: [],
      filter: {
        title: "",
        sale: false,
        categoryId: "",
      },
      categories: [],
      prodByCat: [],
    };
  },
  components: {},
  created() {
    productService.loadHomePageData().then((response) => {
      this.prodByCat = response.data;
      this.prodByCat.forEach((cat) => {
        (cat.forEach((prod) => {
          prod.discountedPrice = prod.price*0.9;
        }))
      });
    });
  },
  methods: {
    clickMethod() {
      this.$router.push("all-products");
    },
  },
  computed: {
    filteredList() {
      let filteredProducts = this.products;
      if (this.filter.title != "") {
        filteredProducts = filteredProducts.filter((item) =>
          item.title.toLowerCase().includes(this.filter.title.toLowerCase())
        );
      }
      if (this.filter.sale != "") {
        filteredProducts = filteredProducts.filter(
          (item) => item.sale === this.filter.sale
        );
      }
      if (this.filter.categoryId != "") {
        filteredProducts = filteredProducts.filter(
          (item) => item.categoryId == this.filter.categoryId
        );
      }
      return filteredProducts;
    },
    
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

.container {
  background-color: white;
  border-radius: 10px;
  width: 250px;
  height: 270px;
  gap: 1rem;
  margin: 1rem;
  text-align: center;
  vertical-align: middle;
}
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

.thumbnail {
  display: flex;
  margin: 50px;
  width: 200px;
  height: 200px;
  padding-left: 20px;
}
</style>
