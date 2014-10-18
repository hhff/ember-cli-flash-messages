class FlashView extends Ember.View
  classNames: ['flash-messages']
  classNameBindings: ['type', 'queueName']
  type: 'inactive'
  queue: null
  queueName: null
  currentMessage: null
  templateName: 'flash'

  didInsertElement: ->
    if @queueName
      unless @queue = @flash.queues.findBy 'queueName', @queueName
        throw new Error "A Flash Queue named: #{@queueName} does not exist."
    else
      @queue = @flash.queues.findBy 'queueName', @flash.defaultQueueName
      @queueName = @flash.defaultQueueName

  click: -> @queue.dismissFlash()

  +observer queue.[]
  queueContentChanged: ->
    if @currentMessage = @queue?.objectAt 0
      @type = @currentMessage.type
    else
      @type = 'inactive'

`export default FlashView`