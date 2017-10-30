import 'shelljs/make'
import dd from 'ddeyes'

# 引入同步的 constants
import constants from '../../src/async/constants'
import actions from '../../src/async/actions'
import {
  getUsers
  addUser
  updateUser
  deleteUser
  deleteAll
  sellp
} from '../../src/async/service'

import {
  listTodos
  deleteStAndDb
  addTodos
  updateTodos
  deleteAllStore
} from './reducers'

target.all = ->
  target.deleteStAndDb()
  target.addTodos()
  # await sellp 2500
  # target.updateTodos()
  # await sellp 2500
  # target.deleteAllStore()
  # await sellp 2500
  # target.listTodos()
  # await sellp 2500
  # target.deleteStAndDb()

  # 1. deleteAll

  # 2. addTodo x 4

  # 3. update x 2

  # 4. removeAll store (only store)

  # 5. mirror store (store && db)

  # 6. deleteAll

target.deleteStAndDb = ->
  deleteStAndDb()

target.addTodos = ->
  addTodos()
  addTodos()
  addTodos()
  addTodos()

target.updateTodos = ->
  updateTodos()
  updateTodos()

target.deleteAllStore = ->
  deleteAllStore()

target.listTodos = ->
  listTodos()

target.service = ->
  # newUser = await addUser
  #   name: 'zhangsan',
  #   location: 'beijing'
  # users = await getUsers()
  # dd users
  await deleteAll()

  # user = await updateUser newUser.id

  # users = await getUsers()

  # dd users 
  # users.map (user) ->
  #   await deleteUser user.id

  users = await getUsers()

  # dd users
