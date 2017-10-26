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
  dbTest
  deleteAll
} from '../../src/async/service'

module.exports = ->

  SagaMW = new SagaMiddleware()

  store = createStore
    todoApp: reducers
  , [
    SagaMW.getMidleware()
  ]
  
  SagaMW.runSagas sagas

  # user list
  listTodos = =>
    store.dispatch actions.mirTodoStoreFromDb()
    users = await getUsers()
    dbTest(users, store.getState())

  # deleteAll (store and db)
  deleteTodos = =>
    store.dispatch actions.delTodoStoreAndDb()
    users = await getUsers()
    dbTest(users, store.getState())

  # add user return user list
  addTodos = =>
    store.dispatch actions.mirTodoStoreFromDb() # 以后要删除
    store.dispatch actions.addTodoToStore()
    users = await getUsers()
    dbTest(users, store.getState())

  # update user return user list
  updateTodos =  =>
    # store.dispatch actions.mirTodoStoreFromDb() # 以后要删除
    store.dispatch actions.updTodoToStore()
    users = await getUsers()
    dbTest(users, store.getState())


  # 1. deleteAll

  # 2. addTodo x 4

  # 3. update x 2

  # 4. removeAll store (only store)

  # 5. mirror store (store && db)

  # 6. deleteAll
  # deleteTodos()
  # listTodos()
  # deleteTodos()
  # addTodos()
  updateTodos()
