<template>
  <div class="observer"></div>
</template>

<script>
export default {
    name :'observer',
    data() {
        return {
            oberserver: null
        };
    },
    mounted() {
        this.observer=new IntersectionObserver(([entry])) => {
           if (entry && entry.isIntersecting) {
               this.$emit('intersect')
           } 
        }
        this.oberserver.observe(this.$el);
    }
}
</script>

<style>

</style>