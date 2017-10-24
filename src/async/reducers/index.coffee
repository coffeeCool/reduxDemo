import { reduxActions } from 'cfx.redux-actions'
{ handleActions } = reduxActions
import { mergeReduce } from 'cfx.redux'
import constants from '../constants'
import dd from 'ddeyes'

{
  GET_TODO_FE
} = constants.types

initialState =
  todos: []

todos = handleActions

  GET_TODO_FE: (state, action) ->
    state

  ADD_TODO_FE: (state, action) ->
    [
      state...
      action.payload
    ]

, []

export default mergeReduce {
  todos
}
, initialState


