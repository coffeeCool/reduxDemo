import { toActionsTypes } from 'cfx.redux-types'

export default toActionsTypes {

  'MIR_TODO_STORE_FROM_DB'
  'DEL_TODO_STORE_AND_DB'
  'ADD_TODO_TO_STORE'
  'UPD_TODO_TO_STORE'

  'GET_TODO_FROM_DB_TO_STORE'
  'DEL_ALL_STORE_DB'
  'ADD_TODO_TO_STORE_DB'
  'UPD_TODO_STORE_FROM_DB'

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