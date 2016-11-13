class Rule::ConditionHashSetter
  attr_accessor :attributes

  def initialize(attributes)
    @attributes = attributes
  end

  def build
    attributes.values.map do |condition|
      next if condition['field'].blank? if condition.has_key?('field')
      next if condition['_destroy'] == '1'
      condition.except('_destroy')
    end.compact
  end
end