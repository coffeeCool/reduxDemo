import test from 'tape'
import 'shelljs/make'

import dd from 'ddeyes'

# 引入同步的constants
import constants from '../../src/counter/constants'

# 引入actions
import actions from '../../src/counter/actions'

# 引入reducers
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
  test 'Sync Reducers Test'
  , reducers