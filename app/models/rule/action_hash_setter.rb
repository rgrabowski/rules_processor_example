class Rule::ActionHashSetter
  attr_accessor :attributes

  def initialize(attributes)
    @attributes = attributes
  end

  def build
    attributes.values.map do |action|
      next if action['action_name'].blank? if action.has_key?('action_name')
      next if action['_destroy'] == '1'
      action.except('_destroy')
    end.compact
  end

end