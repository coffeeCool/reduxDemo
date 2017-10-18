#!/usr/bin/env coffee
test = require 'tape'
require 'shelljs/make'
require 'coffee-require/register'
dd = require 'ddeyes'

# 引入同步的constants
constants = (
  require '../src/constants/index.coffee'
).default

# 引入actions
actions = (
  require '../src/actions/index.coffee'
).default

# 引入reducers
reducers = require './reducers'

# 组合测试
target.all = ->
  dd 'start'
  target.constants()
  target.actions()
  target.reducers()
  dd 'end'
  
# 测试constants
target.constants = -> 
  dd constants

# 测试actions
target.actions = ->
  for k, v of actions
    dd k
    dd v 1

# 测试reducers
target.reducers = ->
  test 'Sync Reducers Test'
  , reducers




  
