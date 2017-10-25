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
} from '../../src/async/service'
import reducers from './reducers'

target.all = ->
  reducers()

target.service = ->
  addUser
    name: 'zhangsan',
    location: 'beijing'
  .then (data) ->
    getUsers()
    .then (data) ->
      # dd '获取添加后的User'
      # dd data
      updateUser(data[0].id)
      .then (data) ->
        getUsers()
        .then (data) ->
          # dd '获取更新后的User'
          # dd data
          deleteUser(data[0].id)
          .then (data) ->
            getUsers()
            .then (data) ->
              # dd '删除后的User'
              # dd data
