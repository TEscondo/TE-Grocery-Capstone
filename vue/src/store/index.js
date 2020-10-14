import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

/*
 * The authorization header is set for axios when you login but what happens when you come back or
 * the page is refreshed. When that happens you need to check for the token in local storage and if it
 * exists you should set the header so that it will be attached to each request
 */
const currentToken = localStorage.getItem('token')
const currentUser = JSON.parse(localStorage.getItem('user'));

if (currentToken != null) {
  axios.defaults.headers.common['Authorization'] = `Bearer ${currentToken}`;
}

export default new Vuex.Store({
  state: {
    total: 0.00,
    cart: [],
    token: currentToken || '',
    user: currentUser || {}
  },
  
  mutations: {

    REMOVE_FROM_CART(state, product){
      
      let index = state.cart.indexOf(product);
      state.cart.splice(index, 1);

      
  },

    UPDATE_ITEM_QTY(state, product) {
      console.log(state.cart);
      state.cart.forEach((item)=> {
      if (product.id == item.id) {
        item.quantity = product.quantity
        
      }
    })
    console.log(state.cart);
  },

    CART_TOTAL(state) {
      state.cart.forEach((item)=> {
        state.total += item.price;
      })     
    },
    CLEAR_CART(state) {
      state.cart = [];
    },
    ADD_PRODUCT(state, product) { 
      state.cart.push(product);
    },

    SET_AUTH_TOKEN(state, token) {
      state.token = token;
      localStorage.setItem('token', token);
      axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
    },
    SET_USER(state, user) {
      state.user = user;
      localStorage.setItem('user', JSON.stringify(user));
    },
    LOGOUT(state) {
      localStorage.removeItem('token');
      localStorage.removeItem('user');
      state.token = '';
      state.user = {};
      axios.defaults.headers.common = {};
    }
  }
})
