# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

  category_id = $('#js-category_id').val()
  question_options = QuestionOptionNew()

  # point
  point_vm = new Vue(
    el: '#point',
    data:
      point: 0,
    methods:
      add: (point) ->
        this.point += point
  )

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
      end: ->
        this.finish()
        $('.js-result_msg').text 'test is finished'  
        resultNotificationBlock()
        testFinish(category_id, point_vm.point)
  )

  progress_vm.start()

  $(document).on 'click', '.js-question_option', () ->
    index = $('.js-question_option').index this
    question_options[index].choice(progress_vm.width, point_vm)
    choiceSuccessFunc(question_options, progress_vm) 
    # できればchoiceのsuccess_funcに下記をいれたい


  $('.js-next_btn').click -> 
    testReload($('.js-question').data('id'), category_id, question_options)
    question_options = QuestionOptionNew()
    progress_vm.reset()
    resultNotificationNone(question_options, progress_vm)

   $('.js-finish_btn').click ->
     testFinish(category_id, point_vm.point) 

QuestionOptionNew = () ->
  question_options = []
  $('.js-question_option').each ->
    question_option = new QuestionOption($(this).data('id'), $(this).data('flg'), $('.js-question').data('id'))
    question_options.push question_option 
  return question_options

questionOptionsToDisable = (question_options) ->
  for question_option in question_options
    question_option.toDisable()

choiceSuccessFunc = (question_options, progress_vm) ->
  #questionOptionsToDisable(question_options)
  progress_vm.finish()
  resultNotificationBlock()
  blackCoverBlock()

blackCoverBlock = -> 
  $('.js-black_cover').addClass 'on'

blackCoverNone = ->
  $('.js-black_cover').removeClass 'on'

resultNotificationBlock = ->
  $('.result_notification').css('display', 'block')

resultNotificationNone = ->
  $('.result_notification').css('display', 'none')

testFinish = (category_id, point) ->
  $.ajax
    url: "/apis/finish_test"
    method: "POST"
    data: { category_id: category_id, point: point }
    success: (data ,status) ->
      alert 'test is finished'
    error: (data ,status) ->

testReload = (question_id, category_id) ->
  $.ajax
    url: "/apis/next_question"
    method: "GET"
    data: { question_id: question_id, category_id: category_id }
    success: (data ,status) ->
      $('#js-question_box').html(data)
      resultNotificationNone()
    error: (data ,status) ->
