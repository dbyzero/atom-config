module.exports =

  activate: (state) ->
    atom.workspaceView.command 'big-cursor:toggle', @toggle

  toggle: ()->
    atom.workspaceView.getActiveView()
    .find(".cursor").toggleClass("big-cursor")
