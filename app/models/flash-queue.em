`import FlashMessage from "../models/flash-message"`

class FlashQueue extends Ember.ArrayProxy
  flashTimeout: 4000
  content: []
  queueName: null
  timer: null

  # params
  # isNagging: boolean
  # flashTimeout: integer (ms)
  pushFlash: (type, message, params) ->
    params ?= { }
    @pushObject FlashMessage.create
      message: message
      type: type
      isNagging: params.isNagging
      flashTimeout: params.flashTimeout ? @flashTimeout

  dismissFlash: ->
    Ember.run.cancel @timer if @timer
    @timer = null
    @removeObject @objectAt 0

  +observer content.[]
  contentChanged: ->
    unless @timer or Ember.empty @content
      @timer = Ember.run.later @, @dismissFlash, @flashTimeout

`export default FlashQueue`
