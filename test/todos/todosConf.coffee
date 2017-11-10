import App from '../../src/todos/index.coffee'
import 'shelljs/make'
import dd from 'ddeyes'
{ actions } = App

{
  loadTodo
  addTodo
  modifyTodo
  removeTodo
} = actions

  
module.exports = [
  removeTodo()
  addTodo
    name:'zhangsan'
    location:'wuhan'
    age: 24
  modifyTodo 
    name: 'wuhang'
  removeTodo()
]
