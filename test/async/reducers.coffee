import dd from 'ddeyes'

import { createStore } from 'cfx.redux'
import { SagaMiddleware } from 'cfx.redux-saga'

import actions from '../../src/async/actions'
import reducers from '../../src/async/reducers'
import sagas from '../../src/async/sagas'
import todoApp from '../../src/async/index'

module.exports = ->

  SagaMW = new SagaMiddleware()

  store = createStore
    todoApp: reducers
  , [
    SagaMW.getMidleware()
  ]
  
  SagaMW.runSagas sagas

  
  unsubscribe = store.subscribe ->
    state = store.getState()
    dd state

  store.dispatch actions.mirTodoFe()
  store.dispatch actions.addTodoFe
    name: 'lll'
    location: 'go'
  store.dispatch actions.updTodoFe(1)
  store.dispatch actions.delTodoFe(1)

  unsubscribe()


