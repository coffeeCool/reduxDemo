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
} from '../../src/async/service'
import reducers from './reducers'

target.all = ->
  reducers()

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
