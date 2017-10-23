import dd from 'ddeyes'
import { createStore } from 'cfx.redux'
import CounterApp from '../../src/counter/index.coffee'
{ reducers } = CounterApp

import taskConf from  './testConf'

module.exports = (t) ->

  tasks = taskConf.slice()

  store = createStore
    counterApp: reducers

  dd store.getState()

  unsubscribe = store.subscribe ->
    state = store.getState()
    task = tasks.shift()
    dd state
    t.deepEqual state
    , task.expected
    , task.msg

  for task in tasks.slice()
    store.dispatch task.actual.sync()

  unsubscribe()

  t.end()
