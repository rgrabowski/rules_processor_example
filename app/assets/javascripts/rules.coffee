class RuleForm
  constructor: (element) ->
    @form = $(element)
    @setEvents()

  setEvents: ->
    @form.on 'click', "[data-behavior='add-condition-fields-link']", @addConditionFields
    @form.on 'click', "[data-behavior='add-action-fields-link']", @addActionFields
    @form.on 'change', "[data-behavior='condition-field-selector']", @handleConditionFields
    @form.on 'change', "[data-behavior='action-name-selector']", @handleActionFields
    @form.on 'click', "[data-behavior='remove-condition-link']", @removeCondition
    @form.on 'click', "[data-behavior='remove-action-link']", @removeAction

  addConditionFields: (event) ->
    $el = $(event.target)
    logicalGroup = $el.parents("[data-behavior='condition-fieldset']").data('logicalGroup')
    $.ajax
      url: $el.data('addConditionFieldsPath'),
      method: 'GET',
      data: {logical_group: logicalGroup}
    return false

  addActionFields: (event) ->
    $el = $(event.target)
    $.ajax
      url: $el.data('addActionFieldsPath')
      method: 'GET'
    return false

  handleConditionFields: (event) ->
    el = $(event.target)
    selectedField = el.val()
    conditionContainer = el.parents("[data-behavior='condition-container']")
    logicalGroup = el.parents("[data-behavior='condition-fieldset']").data('logicalGroup')
    $.ajax
      url: el.data('handleConditionFieldsPath'),
      method: 'GET',
      data: {field: selectedField, logical_group: logicalGroup, index: conditionContainer.data('index')}
    return false

  handleActionFields: (event) ->
    el = $(event.target)
    selectedAction = el.val()
    actionContainer = el.parents("[data-behavior='action-container']")
    $.ajax
      url: el.data('handleActionFieldsPath'),
      method: 'GET',
      data: {action_name: selectedAction, index: actionContainer.data('index')}
    return false

  removeCondition: (event) ->
    conditionContainer = $(event.target).parents("[data-behavior='condition-container']")
    markDestroyField = conditionContainer.find("[data-behavior='mark-destroy-hidden-field']").val(1)
    conditionContainer.hide()
    return false

  removeAction: (event) ->
    actionContainer = $(event.target).parents("[data-behavior='action-container']")
    markDestroyField = actionContainer.find("[data-behavior='mark-destroy-hidden-field']").val(1)
    actionContainer.hide()
    return false

$(document).on 'turbolinks:load', ->
  new RuleForm $("[data-behavior='rule-form']")