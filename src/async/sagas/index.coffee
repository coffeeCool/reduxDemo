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
  GET_TODO_BE
  ADD_TODO_BE
  UPD_TODO_BE
  DEL_TODO_BE

  MIR_TODO_FE
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
    yield dispatch newAction
    , GET_TODO_BE
    return

  create: (action) ->
    try
      newTodo = yield sagaEffects.call addUser
      , action.payload
    catch ex
      throw new Error ex
    return unless newTodo

    newCreateAction = {
      action...
      payload: {
        newTodo...
      }
    }
    yield dispatch newCreateAction
    , ADD_TODO_FE

    return

  update: (action) ->
    try
      newTodo = yield sagaEffects.call updateUser
      , action.payload
    catch ex
      throw new Error ex
    return unless newTodo

    newUpdateAction = {
      action...
      payload: {
        newTodo...
      }
    }
    yield dispatch newUpdateAction
    , UPD_TODO_FE

    return

  delete: (action) ->
    try
      newTodo = yield sagaEffects.call deleteUser
      , action.payload
    catch ex
      throw new Error ex
    return unless newTodo

    newDeleteAction = {
      action...
      payload: {
        newDeleteAction...
      }
    }
    yield dispatch newDeleteAction
    , DEL_TODO_FE

export default [
  ->
    yield sagaEffects.takeLatest MIR_TODO_FE
    , Async.fetch
  ->
    yield sagaEffects.takeLatest ADD_TODO_BE
    , Async.create
  ->
    yield sagaEffects.takeLatest UPD_TODO_BE
    , Async.update
  ->
    yield sagaEffects.takeLatest DEL_TODO_BE
    , Async.delete
]