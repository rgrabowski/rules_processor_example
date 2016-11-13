class Rule::ActionBuilder
  attr_accessor :action_name, :rule

  def initialize(args = {})
    @rule = args[:rule]
    @action_name = args[:action_name]
  end

  def build
    rule.actions_data.clear
    rule.actions_data << OpenStruct.new(action_name: action_name, value: nil)
  end
end