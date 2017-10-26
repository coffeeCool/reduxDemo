import dd from 'ddeyes'
import { createStore } from 'cfx.redux'
import App from '../../src/todos/index.coffee'
{ reducers } = App

import todosConf from  './todosConf'

module.exports = ->

  store = createStore
    App: reducers

  dd store.getState()

  unsubscribe = store.subscribe ->
    state = store.getState()
    dd state

  for task in todosConf
    store.dispatch task
 
  unsubscribe()
