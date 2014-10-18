`import FlashQueue from "../models/flash-queue"`

class FlashController extends Ember.Controller

  queues: []
  defaultQueueName: 'main'

  init: ->
    @createQueue @defaultQueueName

  createQueue: (queueName) ->
    if queue = @queues.findBy 'queueName', queueName
      throw new Error "A Flash Queue named: #{queueName} already exists."
    else
      newQueue           = FlashQueue.create()
      newQueue.queueName = queueName

      @queues.pushObject newQueue

  # Params obj:
  # nagging (bool * optional)
  # timer (int * default)
  # queueName (string * defaultQueueName)
  pushFlash: (type, message, params) ->
    params ?= {}
    queueName = if params.queueName
      params.queueName
    else
      @defaultQueueName

    if queue = @queues.findBy 'queueName', queueName
      queue.pushFlash type, message, params
    else
      throw new Error "A Flash Queue named: #{queueName} does not exist"

`export default FlashController`