import dd from 'ddeyes'

import { createStore } from 'cfx.redux'
import { SagaMiddleware } from 'cfx.redux-saga'

import actions from '../../src/async/actions'
import reducers from '../../src/async/reducers'
import sagas from '../../src/async/sagas'
import todoApp from '../../src/async/index'

import {
  getUsers
  addUser
  updateUser
  deleteUser
} from '../../src/async/service'

module.exports = ->

  SagaMW = new SagaMiddleware()

  store = createStore
    todoApp: reducers
  , [
    SagaMW.getMidleware()
  ]
  
  SagaMW.runSagas sagas

  # 返回user list集合
  listTodos = =>
    store.dispatch actions.mirTodoFe()
    users = await getUsers()
    dd
      db: users
      store: store.getState()

  # 返回新增的 user
  addTodos = =>
    store.dispatch actions.addTodoFe
      name: 'helloWorld'
      location: 'world'
    users = await getUsers()
    dd
      db: users[users.length-1]
      store: store.getState()
  
  # 返回更新的 user
  updateTodos = (id) =>
    store.dispatch actions.updTodoFe 2
    users = await getUsers()
    dd 
      db: users[0]
      store: store.getState()
    
  # 返回删除后的 user
  deleteTodos = (id) =>
    store.dispatch actions.delTodoFe 2
    users = await getUsers()
    dd 
      db: users
      store: store.getState()

  # listTodos()
  # addTodos()
  updateTodos()
  # deleteTodos()

