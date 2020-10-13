import axios from 'axios';

const http = axios.create({
    baseURL: "http://localhost:8080"
});

export default {
    loadHomePageData() {
        return http.get('/allProductsHome');
    },
    getAllProducts() {
        return http.get('/allProducts');
    },
    getProductByDetails(id){
        return http.get(`/byBrand/${id}`);
    },
    getProductsByCategory(category){
        return http.get(`/category/${category}`)
    },
    getProductById(id) {
        return http.get(`/details/${id}`)
    },
    getProductsByCategoryId(categoryId){
        return http.get(`/byCategory/${categoryId}`)
    },
    getAllCategories(){
        return http.get(`/cat`)
    },
    getCertifications(productId) {
        return http.get(`/cert/${productId}`)
    },
    viewCartInventory() {
        return http.get('/cartInventory');
    }
}