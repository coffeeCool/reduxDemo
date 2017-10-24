import 'shelljs/make'
import dd from 'ddeyes'

# 引入同步的 constants
import constants from '../../src/async/constants'
import actions from '../../src/async/actions'
import {
  getUsers
  addUser
} from '../../src/async/service'
import reducers from './reducers'

# 组合测试
target.all = ->
  # dd constants
  reducers()

target.service = ->

  addUser
    name: 'zhangsan',
    location: 'beijing'
  .then (data) ->
    dd data
    getUsers()
    .then (data) ->
      dd data
