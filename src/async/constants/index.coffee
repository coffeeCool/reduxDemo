import { toActionsTypes } from 'cfx.redux-types'

export default toActionsTypes {

  'MIR_TODO_FE'
  'ADD_TODO_FE'
  'UPD_TODO_FE'
  'DEL_TODO_FE'

  'GET_TODO_BE'
  'ADD_TODO_BE'
  'UPD_TODO_BE'
  'DEL_TODO_BE'

  # FE
  # 'MIR_TODO_FE' # mirror todos db to store // store.getState()
  # 'ADD_TODO_BE'
  # 'UPD_TODO_BE'
  # 'DEL_TODO_BE'

  # # BE
  # 'GET_TODO_BE' # list todos from db
  # 'ADD_TODO_BE'
  # 'UPD_TODO_BE'
  # 'DEL_TODO_BE'
}