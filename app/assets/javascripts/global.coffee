jQuery ->
  displayHint = (strength, crack_time) ->
    msg = '您的密码 ' + strength

    estimate_message = this.next('.estimate-message')
    if estimate_message.length > 0
      estimate_message.text msg
    else
      this.after '<span class="help-block estimate-message">' + msg + '</span>'

  $('form').on 'keyup', '.estimate-password', ->
    $this = $(this)
    estimation = zxcvbn($this.val())
    crack_time = estimation.crack_time_display
    strength = estimation.score

    switch estimation.score
      when 0 then displayHint.call($this, "得" + estimation.score + "分, 弱爆了，黑客哈哈大笑！")
      when 1 then displayHint.call($this, "有点弱呀，黑客讥笑连连。", crack_time)
      when 2 then displayHint.call($this, "强弱一般般吧，黑客要费点脑子了。", crack_time)
      when 3 then displayHint.call($this, "比较强吧，黑客痛苦郁闷中。", crack_time)
      when 4 then displayHint.call($this, "非常强呀！黑客去墙角哭了！", crack_time)

  return