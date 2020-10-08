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
    getProductsByCategory(categoryId){
        return http.get(`byCategory/${categoryId}`)
    },
    getTitleFromCategory(categoryName) {
        return http.get(`/category/${categoryName}`)
    }
}