# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  vm = new Vue(
    el: '#progress_bar',
    data:
      width: 100
  )

  progress_interval = setInterval (->
    vm.width = vm.width - 1
    clearInterval progress_interval  if vm.width is 0
    return
  ), 100

