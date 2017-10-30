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
  deleteAll
} from '../service'

{ 
  MIR_TODO_STORE_FROM_DB
  DEL_TODO_STORE_AND_DB
  ADD_TODO_TO_STORE
  UPD_TODO_TO_STORE

  GET_TODO_FROM_DB_TO_STORE
  DEL_ALL_STORE_DB
  ADD_TODO_TO_STORE_DB
  UPD_TODO_STORE_FROM_DB

  DEL_ALL_STORE
} = constants.types

Async =
  # get user list
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
    , GET_TODO_FROM_DB_TO_STORE
    return

  # deleteall
  delete: (action) ->
    try
      newTodo = yield sagaEffects.call deleteAll
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
    , DEL_ALL_STORE_DB

  # add user to db
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
    , ADD_TODO_TO_STORE_DB

    return

  # update user return user list
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
        newTodo
      }
    }
    
    yield dispatch newUpdateAction
    , UPD_TODO_STORE_FROM_DB

    return

  # remove all store
  deleteAllStore: (action) ->
    newUpdateAction = {
      action...
      payload: {
      }
    }
    yield dispatch newUpdateAction
    , DEL_ALL_STORE_DB

    return

export default [
  ->
    yield sagaEffects.takeLatest MIR_TODO_STORE_FROM_DB
    , Async.fetch
  ->
    yield sagaEffects.takeLatest DEL_TODO_STORE_AND_DB
    , Async.delete
  ->
    yield sagaEffects.takeLatest ADD_TODO_TO_STORE
    , Async.create
  ->
    yield sagaEffects.takeLatest UPD_TODO_TO_STORE
    , Async.update
  ->
    yield sagaEffects.takeLatest DEL_ALL_STORE
    , Async.deleteAllStore
]