import { reduxActions } from 'cfx.redux-actions'
{ handleActions } = reduxActions
import { mergeReduce } from 'cfx.redux'
import constants from '../constants'
import dd from 'ddeyes'

{
  GET_TODO_FROM_DB_TO_STORE
  ADD_TODO_TO_STORE_DB
  DEL_ALL_STORE_DB
  UPD_TODO_STORE_FROM_DB
} = constants.types

initialState =
  todos: []

todos = handleActions

  GET_TODO_FROM_DB_TO_STORE: (state, action) ->
    dd '进行GET_TODO_FROM_DB_TO_STORE操作'
    [
      action.payload.todos...
    ]
  
  ADD_TODO_TO_STORE_DB: (state, action) ->
    dd '进行ADD_TODO_TO_STORE_DB操作:::>>>'
    [
      state...
      action.payload
    ]

  DEL_ALL_STORE_DB: (state, action) ->
    dd '进行DEL_ALL_STORE_DB操作:::>>>'
    []

  UPD_TODO_STORE_FROM_DB: (state, action) ->
    dd '进行UPD_TODO_STORE_FROM_DB操作:::>>>'
    [
      action.payload.newTodo...
    ]
  
, 0

export default mergeReduce {
  todos
}
, initialState


