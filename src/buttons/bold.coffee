
class BoldButton extends Button

  name: 'bold'

  icon: 'bold'

  title: '加粗文字'

  htmlTag: 'b, strong'

  disableTag: 'pre'

  shortcut: 'cmd+66'

  render: ->
    if @editor.util.os.mac
      @title = @title + ' ( Cmd + b )'
    else
      @title = @title + ' ( Ctrl + b )'
      @shortcut = 'ctrl+66'
    super()

  status: ($node) ->
    @setDisabled $node.is(@disableTag) if $node?
    return true if @disabled

    active = document.queryCommandState('bold') is true
    @setActive active
    active

  command: ->
    document.execCommand 'bold'
    @editor.trigger 'valuechanged'

    # bold command won't trigger selectionchange event automatically
    $(document).trigger 'selectionchange'


Simditor.Toolbar.addButton(BoldButton)
