import { reduxActions } from 'cfx.redux-actions'
{ handleActions } = reduxActions
import { mergeReduce } from 'cfx.redux'
import constants from '../constants'
import dd from 'ddeyes'

{
  MIR_TODO_FE
  MIR_TODO_FE_SUCCESS
  ADD_TODO_FE
  UPD_TODO_FE
  DEL_TODO_FE
} = constants.types

initialState =
  todos: []

todos = handleActions

  MIR_TODO_FE_SUCCESS: (state, action) ->
    dd '进行MIR_TODO_FE操作'
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
    dd state
    dd action
    
    
  DEL_TODO_FE: (state, action) ->
    dd '进行DEL_TODO_FE操作'
    dd state
    []
    

, 0

export default mergeReduce {
  todos
}
, initialState


