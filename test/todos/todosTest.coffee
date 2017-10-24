import 'shelljs/make'
import dd from 'ddeyes'
import test from 'tape'

# 引入同步的 constants
import constants from '../../src/todos/constants'

# 引入 actions
import actions from '../../src/todos/actions'

# 引入 reducers
import reducers from './reducers'

# 组合测试
target.all = ->
  dd 'start'
  target.constants()
  target.actions()
  target.reducers()

# 测试constants
target.constants = -> 
  dd constants

# 测试actions
target.actions = ->
  for k, v of actions
    dd k
    dd v

# 测试reducers
target.reducers = ->
  reducers()