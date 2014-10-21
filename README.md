# ember-cli-flash-messages

Manage multiple Flash Message queues with this addon.

# Usage

## Installation

* `npm install --save-dev ember-cli-flash-messages`

## Basic Usage

In application.hbs:

    {{view 'flash-outlet'}}

In your controller or route:

    this.get('flash').pushFlash('Signed in Successfully');

## Advanced Usage

The ```pushFlash``` function accepts an optional hash as its second parameter:

**Note:** ```this.get('flash')``` is only available in Routes and Controllers.  You shouldn't be pushing flash messages in anything else - that's not a concern of a view.


### type
(string * default: "notice")

The class applied to the flash-outlet view when message is active.  Currently supports "notice", "warning" and "error".

### isNagging
(boolean * default: false)

If true, the message will not auto-dismiss.

### flashTimeout
(int * default: 4000)

The time a flash message is active before auto-dismissing (provided isNagging is false).

### queueName
(string * default: "main")

If this is set, the flash messages will only appear in flash-outlets that have the same name.  For example:

```@flash.pushFlash("Product Updated", {queueName: "pdp"});```

Will only appear at:

```{{view "flash-outlet" queueName="pdp"}}```


# Contributing

## Getting up and Running

* Fork this Repo
* `git clone` your fork
* `cd ember-cli-flash-messages`
* `npm link`
* `cd ember-cli-dev-app`
* `npm link ember-cli-flash-messages`

Then add:

```
"ember-cli-flash-messages": "*"
```

To the devDependancies of your package.json.  Now when you spin up ember-cli-dev-app, it will use the local version of the plugin, so you can develop against it.

## Branching

Use either:

`feature/feature-name`
`fix/fix-name`
`tweak/tweak-name`

And mention the Issue, like: Closes #123 in the PR message.

## Running Tests

* `ember test`
* `ember test --server`