<template>
  <div class="home">
    <products-list />
  </div>
</template>

<script>
import ProductsList from '@/components/ProductsList';
export default {
  name: "home",
  components : {
    ProductsList
  }
};
</script>
