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
    cart: [
      {
        title: "Chocolate Sandwich Cookies",
        price: 3.00,
        sale: true,
        brandId: 3,
        details: "Chocolate Sandwich Cookies are a classic combination of rich cream and chocolate wafers. The cream center is sandwiched between two crispy chocolate cookies, making each treat delightfully crunchy on the outside and wonderfully soft on the inside.",
        weight: "21 oz",
        id: 1,
        categoryId: 19,
        image: "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2018/6/18/0/MW0100_0203.jpg"
      },
      {
        title: "All-Seasons Salt",
        price: 10.00,
        sale: false,
        brandId: 1,
        details: "All Seasoned Salt is a blend of salt and savory spices, including paprika, black pepper, onion and garlic, with a hint of chili pepper.",
        weight: "28 oz",
        id: 2,
        categoryId: 13,
        image: "https://d.newsweek.com/en/full/1577880/stock-image-salt.jpg"
      }, {
        title: "Beef Hot Links Beef Smoked Sausage With Chile Peppers",
        price: 3.00,
        sale: false,
        brandId: 3,
        details: "Smoked and seasoned to perfection and made with pork, turkey and beef, our sausage makes a perfect addition to barbecue and spiced dishes.",
        weight: "18 oz",
        id: 40,
        categoryId: 12,
        image: "https://stoltzfusmeats.com/wp-content/uploads/2017/10/24.-Smoked-Sausage-Sampler.jpg"
      },
      {
        title: "Pumpkin Muffin Mix",
        price: 8.00,
        sale: false,
        brandId: 4,
        details: "With this convenient mix, you can make a loaf of freshly baked bread or 12 delicious muffins.",
        weight: "14.2 oz",
        id: 50,
        categoryId: 13,
        image: "https://d2t88cihvgacbj.cloudfront.net/manage/wp-content/uploads/2014/09/Best-Ever-Pumpkin-Muffins-2.jpg?x11740"
      }
    ],
    token: currentToken || '',
    user: currentUser || {}
  },
  computed: {
    cartTotal() {
      this.state.cart.forEach((item) => {
        this.state.total.total += item.price;
      });
    }

  },
  mutations: {
    CART_TOTAL(state) {
      state.cart.forEach((item)=> {
        state.total += item.price;
      })     
    },

    ADD_PRODUCT(state, product) {
      state.cart.unshift(product);
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
