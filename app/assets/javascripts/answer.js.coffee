class @QuestionOption
  constructor: (@id, @correctFlg, @questionID) ->

  choice: (time, point_vm, success_func, error_func) ->
    if @correctFlg == true
      console.log 'ok'
      # 正解だった時のアクション
    else
      console.log 'ng'
      # 不正解だった時のアクション
    $.ajax
      url: "/apis/answers"
      method: "POST"
      data: { question_id: @questionID, correct_flg: @correctFlg, question_option_id: @id, time: time }
      success: (data ,status) ->
        if success_func == undefined
          $('.js-result_msg').text data.msg
          point_vm.add data.point 
        else
          # 一応用意しておく
          $(success_func)
      error: (data ,status) ->
        
  toDisable: ->
      # 終わった後にdisableさせる
