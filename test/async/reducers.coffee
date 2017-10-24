import dd from 'ddeyes'

import { createStore } from 'cfx.redux'
import { SagaMiddleware } from 'cfx.redux-saga'

import actions from '../../src/async/actions'
import reducers from '../../src/async/reducers'
import sagas from '../../src/async/sagas'

module.exports = ->

  SagaMW = new SagaMiddleware()

  store = createStore
    todoApp: reducers
  , [
    SagaMW.getMidleware()
  ]

  SagaMW.runSagas sagas

  # store.dispatch actions.getTodoFe()
  store.dispatch actions.addTodoBe
    name: 'zhansan'
    location: 'beijing'

  # dd store.getState()
