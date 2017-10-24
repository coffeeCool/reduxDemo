import dd from 'ddeyes'
import {
  sagaEffects
  dispatch
} from 'cfx.redux-saga'

import constants from '../constants'
import {
  addUser
  getUsers
} from '../service'

{
  ADD_TODO_BE
  GET_TODO_BE
} = constants.types

Async =

  fetch: (action) ->

    try
      todos = yield sagaEffects.call getUsers
    catch ex

      throw new Error ex

    return unless todos

    # newAction = {
    #   action...
    #   payload: {
    #     action.payload...
    #     todos
    #   }
    # }

    # dd newAction

    # yield dispatch newAction
    # , GET_TODO_FE

    return

  create: (action) ->

    try
      newTodo = yield sagaEffects.call addUser
      , action.payload
    catch ex

      throw new Error ex

    return unless newTodo

export default [
  ->
    yield sagaEffects.takeLatest GET_TODO_BE
    , Async.fetch
  ->
    yield sagaEffects.takeLatest ADD_TODO_BE
    , Async.create
]