<template>
  <div class="home">
    <div class="category">Frozen<img @click="clickMethod" src= 'https://zonacooks.com/wp-content/uploads/2017/03/No-Yeast-Pizza-Dough-for-One-Recipe-13.jpg.webp'/>
    <img src = 'https://www.rachaelraymag.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTQ2MDQwNzQzMjQ3NzUwODYx/three-cheese-baked-ziti-102594818.jpg'/> 
    <img src = 'https://www.recipegirl.com/wp-content/uploads/2019/10/pasta-vodka-sauce-1-1.jpg'/>
    
</div>
    <div class="category">Produce</div>
    <div class="category">International</div>
    <div class="category">Beverages</div>
    <div class="category">Dry Goods Pasta</div>
    <div class="category">Personal Care</div>
    <div class="category">Meat Seafood</div>
    <div class="category">Panty</div>
    <div class="category">Breakfast</div>
    <div class="category">Canned Goods</div>
    <div class="category">Snacks</div>
    <product-list />
  </div>
</template>

<script>
  import productService from '@/services/ProductService.js';
export default {
  components : {
  },
  created() {
    productService.getAllProducts().then((response) => {
      this.products = response.data;
      this.products.forEach((product) => {
        product.discountedPrice = product.price * 0.9;
      });
    });
  },
  methods:{
    clickMethod(){
      this.$router.push('all-products');
    }
  }
};
</script>

<style>

body {
  background-color: skyblue;

}
.category{
  display: flex;
  margin-top: 5rem;
  border:5px ;
 padding: 1px;
 font-size: 30px;
}

img{
  display: flex;
  
  margin: 50px;
  width:200px;
  height:200px;
  padding-left: 20px;
  
}



</style>