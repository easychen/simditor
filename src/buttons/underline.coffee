
class UnderlineButton extends Button

  name: 'underline'

  icon: 'underline'

  title: '下划线文字'

  htmlTag: 'u'

  disableTag: 'pre'

  shortcut: 'cmd+85'

  render: ->
    if @editor.util.os.mac
      @title = @title + ' ( Cmd + u )'
    else
      @title = @title + ' ( Ctrl + u )'
      @shortcut = 'ctrl+85'
    super()

  status: ($node) ->
    @setDisabled $node.is(@disableTag) if $node?
    return @disabled if @disabled

    active = document.queryCommandState('underline') is true
    @setActive active
    active

  command: ->
    document.execCommand 'underline'
    @editor.trigger 'valuechanged'

    # underline command won't trigger selectionchange event automatically
    $(document).trigger 'selectionchange'


Simditor.Toolbar.addButton(UnderlineButton)


