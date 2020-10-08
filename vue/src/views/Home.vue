<template>
  <div class="home">
    <banner />
    <product-list />
  </div>
</template>

<script>
import ProductList from '@/components/ProductList';
import Banner from '@/components/Banner';
export default {
  components : {
    Banner,
    ProductList
  }
};
</script>
