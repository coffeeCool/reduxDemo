import { reduxActions } from 'cfx.redux-actions'
{ handleActions } = reduxActions
import { mergeReduce } from 'cfx.redux'

import dd from 'ddeyes'

initialState =
  todos: []

todos = handleActions

  LOAD_TODO: (state, action) ->
    dd 'LOAD_TODO'
    state
    []

  ADD_TODO: (state, action) ->
    dd '进行ADD_TODO'
    [
      state...
      action.payload
    ]
       
  MODIFY_TODO: (state, action) ->
    dd '正在执行MODIFY_TODO操作'
    dd action
    state.reduce (r, c) ->
      unless c.name is 'zhangsan'
        [
          r...
          c
        ]
      else
        n = {
          c...
          name: action.payload
        }
        [
          r...
          n
        ]
    , []
  
  REMOVE_TODO: (state, action) ->
    dd '正在执行REMOVE_TODO操作'
    []
    
, 0



export default mergeReduce {
  todos
}
, initialState


