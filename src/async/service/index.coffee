import axios from 'axios'
import dd from 'ddeyes'

addUser = (user) ->
  axios
    method: 'POST'
    url: 'http://192.168.0.192:3000/users'
    headers:
      'Content-Type': 'application/json'
    dataType: 'json'
    data: user
  
  .then (response) ->
    response.data if response.status is 200 or 201

  .catch (error) ->
    console.log error

getUsers = ->
  axios
    method: 'GET'
    url: 'http://192.168.0.192:3000/users'
    headers: 
      'Content-Type': 'application/json'
    dataType: 'json'
  
  .then (response) ->
    response.data if response.status is 200 or 201

  .catch (error) ->
    console.log error

export {
  getUsers
  addUser
}