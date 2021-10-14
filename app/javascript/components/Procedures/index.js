import React from 'react'
import { Provider } from 'react-redux'

import store from './store'
import Procedures from './Procedures'

export default function index() {
  return (
    <Provider store={store}>
      <Procedures />
    </Provider>
  )
}
