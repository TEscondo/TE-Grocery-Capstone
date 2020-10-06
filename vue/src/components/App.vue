<template>
  <div id="app">
      <ProductList v-on:intersect="intersected" />
</template>

<script>
import ProductList from './components/ProductList';
export default {
    name: 'App',
    components : {
        ProductList
    },
    methods : {
      async intersected() {
          //const 
        }
    }
}
</script>

<style>

</style>