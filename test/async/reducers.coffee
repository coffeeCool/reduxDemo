import dd from 'ddeyes'
import { createStore } from 'cfx.redux'
import { SagaMiddleware } from 'cfx.redux-saga'
import actions from '../../src/async/actions'
import reducers from '../../src/async/reducers'
import sagas from '../../src/async/sagas'
import todoApp from '../../src/async/index'

import {
  getUsers
  dbTest
  sellp
} from '../../src/async/service'

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
  dbTest users, store.getState()

# deleteAll (store and db)
deleteStAndDb = ()=>
  store.dispatch actions.delTodoStoreAndDb()
  start = do ->
    await sellp 2000
    users = await getUsers()
    dbTest users, store.getState()

# add user return user list
addTodos = =>
  store.dispatch actions.mirTodoStoreFromDb() # 以后要删除
  store.dispatch actions.addTodoToStore()
  users = await getUsers()
  dbTest users, store.getState()

# update user return user list
updateTodos =  =>
  store.dispatch actions.mirTodoStoreFromDb() # 以后要删除
  store.dispatch actions.updTodoToStore()
  users = await getUsers()
  dbTest users, store.getState()

# delete all store
deleteAllStore =  =>
  store.dispatch actions.delAllStore()
  users = await getUsers()
  dbTest users, store.getState()

export {
  listTodos
  deleteStAndDb
  addTodos
  updateTodos
  deleteAllStore
}
  
  
