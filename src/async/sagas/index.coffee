import dd from 'ddeyes'
import {
  sagaEffects
  dispatch
} from 'cfx.redux-saga'

import constants from '../constants'
import {
  addUser
  getUsers
  updateUser
  deleteUser
} from '../service'

{
  MIR_TODO_FE
  MIR_TODO_FE_SUCCESS
  ADD_TODO_FE
  UPD_TODO_FE
  DEL_TODO_FE
} = constants.types

Async =

  fetch: (action) ->

    try
      todos = yield sagaEffects.call getUsers
    catch ex

      throw new Error ex

    return unless todos

    newAction = {
      action...
      payload: {
        action.payload...
        todos
      }
    }

    # dd newAction

    yield dispatch newAction
    , MIR_TODO_FE_SUCCESS

    return

  create: (action) ->

    try
      newTodo = yield sagaEffects.call addUser
      , action.payload
    catch ex

      throw new Error ex

    return unless newTodo

  update: (action) ->

    try
      newTodo = yield sagaEffects.call updateUser
      , action.payload
    catch ex

      throw new Error ex

    return unless newTodo

  delete: (action) ->

    try
      newTodo = yield sagaEffects.call deleteUser
      , action.payload
    catch ex

      throw new Error ex

    return unless newTodo

export default [
  ->
    yield sagaEffects.takeLatest MIR_TODO_FE
    , Async.fetch
  ->
    yield sagaEffects.takeLatest ADD_TODO_FE
    , Async.create
  ->
    yield sagaEffects.takeLatest UPD_TODO_FE
    , Async.update
  ->
    yield sagaEffects.takeLatest DEL_TODO_FE
    , Async.delete
]