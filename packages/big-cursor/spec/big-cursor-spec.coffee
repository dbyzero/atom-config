{WorkspaceView} = require 'atom'
BigCursor = require '../lib/big-cursor'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "BigCursor", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('big-cursor')

  describe "when the big-cursor:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.big-cursor')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'big-cursor:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.big-cursor')).toExist()
        atom.workspaceView.trigger 'big-cursor:toggle'
        expect(atom.workspaceView.find('.big-cursor')).not.toExist()
