import axios from "axios"

import * as Route from '../support/routes'

const procedure = {
  state: {
    collection: []
  },
  reducers: {
    fetchProceduresReducer(state, payload) {
      return { ...state, collection: payload }
    }
  },
  effects: (dispatch) => ({
    fetchProcedures(search) {
      axios(Route.procedures(search))
        // .then(res => res.json())
        .then(res => {
          dispatch.procedure.fetchProceduresReducer(res.data.data)
        })
    }
  })
}

export default procedure
