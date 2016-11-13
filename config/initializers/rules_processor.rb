require 'rules_processor'

RulesProcessor.configure do |config|
  config.actions_class = ::Rule::ActionsProcessor
end