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
    }
}