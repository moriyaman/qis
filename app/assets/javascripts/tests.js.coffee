# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  # progress_bar
  progress_vm = new Vue(
    el: '#progress_bar',
    data:
      width: 100,
    methods:
      start: ->
        progress_interval = setInterval () ->
          if progress_vm.width <= 0
            clearInterval progress_interval
            progress_vm.finish()
          else
            progress_vm.width -= 10
          return
        , 1000
      reset: ->
        this.width = 100
        this.start()
      finish: ->
        this.width = 0
        console.log '終了'
  )

  progress_vm.start()

  # point
  point_vm = new Vue(
    el: '#point',
    data:
      point: 0,
    methods:
      add: (point) ->
        this.point += point
  )

  category_id = $('#js-category_id').val()
  
  question_options = []
  $('.js-question_option').each ->
    question_option = new QuestionOption($(this).data('id'), $(this).data('flg'), $('.js-question').data('id'))
    question_options.push question_option 

  $('.js-question_option').on 'click', ->
    index = $('.js-question_option').index this
    question_options[index].choice(progress_vm.width, point_vm)
    
    # できればchoiceのsuccess_funcに下記をいれたい
    blackCoverBlock()
    progress_vm.finish()
    resultNotificationBlock()

  $('.js-next_btn').click -> 
    testReload($('.js-question').data('id'), category_id, question_options)
    progress_vm.reset()

QuestionOptionNew = (question_options, question_id) ->
  question_options = []

blackCoverBlock = -> 
  $('.js-black_cover').addClass 'on'

blackCoverNone = ->
  $('.js-black_cover').removeClass 'on'

resultNotificationBlock = ->
  $('.result_notification').css('display', 'block')

resultNotificationNone = ->
  $('result_notification').css('display', 'none')

testReload = (question_id, category_id, @question_options) ->
  $.ajax
    url: "/apis/next_question"
    method: "GET"
    data: { question_id: question_id, category_id: category_id }
    success: (data ,status) ->
      $('#js-question_box').html(data)
      resultNotificationNone()
      # QuestionOptionNew(@question_options, $('.js-question').data('id'))
    error: (data ,status) ->
