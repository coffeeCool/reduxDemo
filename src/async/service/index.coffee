import axios from 'axios'
import dd from 'ddeyes'

addUser = ->
  axios
    method: 'POST'
    url: 'http://192.168.0.192:3000/users'
    headers:
      'Content-Type': 'application/json'
    dataType: 'json'
    data: 
      name: '新增用户'
      location: '武汉'
  
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

updateUser = ->
  getUsers()
  .then (data) ->
    ids = data.reduce (r, c) ->
      [
        r...
        c.id
      ]
    , []
    id = ids[ids.length-1]
    axios
      method: 'PUT'
      url: "http://192.168.0.192:3000/users/#{id}"
      headers: 
        'Content-Type': 'application/json'
      dataType: 'json'
      data: 
        name: '黄飞鸿'
        location: '佛山'
    
    .then (response) ->
      getUsers() if response.status is 200 or 201
      .then (data) ->
        data

    .catch (error) ->
      console.log error

deleteUser = (id)->
  axios
    method: 'DELETE'
    url: "http://192.168.0.192:3000/users/#{id}"
    headers: 
      'Content-Type': 'application/json'
    dataType: 'json'
  
  .then (response) ->
    response.data if response.status is 200 or 201

  .catch (error) ->
    console.log error

dbTest = (user, store) ->
  dd
    db: user
    store: store

deleteAll =  ->
  getUsers()
  .then (data) ->
    ids = data.reduce (r, c) ->
      [
        r...
        c.id
      ]
    , []
    for id in ids
      await deleteUser id


export {
  getUsers
  addUser
  updateUser
  deleteUser
  dbTest
  deleteAll
}