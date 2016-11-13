class Rule::ActionsProcessor

  attr_accessor :records, :actions, :options

  def initialize(args = {})
    @records = args[:records]
    @options = args[:options]
    @actions = args[:rule][:actions]
  end

  def process
    actions.each do |action|
      perform_action(action)
    end
    records.values.map { |v| v.save }
  end

  private

  def perform_action(action)
    Rule::ActionExecutor.new(records: records, action: action).execute
  end

end

class ActionExecutor

  attr_accessor :records, :action, :record_class, :record, :action_name

  def initialize(args = {})
    @records = args[:records]
    @action = OpenStruct.new(args[:action])
    @record_class = action.action_name.split('_', 2)[0].to_sym
    @record = records[record_class]
    @action_name = action.action_name.split('_', 2)[1].to_sym
  end

  def execute
    record.public_send(action_name, action)
  end

end