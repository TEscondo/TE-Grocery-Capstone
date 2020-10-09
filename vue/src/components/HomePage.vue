<template>
  <div class="home">

    <div v-for="category in categories" v-bind:key="category.categoryId">
      <h3>{{category.categoryName}}</h3>
      <div v-for="product in products" v-bind:key="product.categoryId">
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
    };
  },
  components : {
  },
  created() {
    productService.getAllProducts().then((response) => {
      this.products = response.data;
      this.products.forEach((product) => {
        product.discountedPrice = product.price * 0.9;
      });
    });
  productService.getAllCategories().then((response) => {
    this.categories = response.data;
  });
  },
  methods:{
    clickMethod(){
      this.$router.push('all-products');
    }
  },computed: {
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