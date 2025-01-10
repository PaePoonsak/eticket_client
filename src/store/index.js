import { createStore } from 'vuex';

const store = createStore({
  state: {
    message: 'Hello, Vuex!'
  },
  mutations: {
    setMessage(state, payload) {
      state.message = payload;
    }
  },
  actions: {
    updateMessage({ commit }, message) {
      commit('setMessage', message);
    }
  },
  getters: {
    getMessage: (state) => state.message
  }
});

export default store;
