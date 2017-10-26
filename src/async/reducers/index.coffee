import { reduxActions } from 'cfx.redux-actions'
{ handleActions } = reduxActions
import { mergeReduce } from 'cfx.redux'
import constants from '../constants'
import dd from 'ddeyes'

{
  GET_TODO_BE
  ADD_TODO_FE
  UPD_TODO_FE
  DEL_TODO_FE
} = constants.types

initialState =
  todos: []

todos = handleActions

  GET_TODO_BE: (state, action) ->
    dd '进行GET_TODO_BE操作'
    [
      action.payload.todos...
    ]
    

  ADD_TODO_FE: (state, action) ->
    dd '进行ADD_TODO_FE操作'
    [
      state...
      action.payload
    ]
  
  UPD_TODO_FE: (state, action) ->
    dd '进行UPD_TODO_FE操作'
    [
      state...
      action.payload
    ]
  
  DEL_TODO_FE: (state, action) ->
    dd '进行DEL_TODO_FE操作'
    []
    

, 0

export default mergeReduce {
  todos
}
, initialState


