import axios from 'axios';

const http = axios.create({
    baseURL: "http://localhost:8080"
});

export default {
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
}