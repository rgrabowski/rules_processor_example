class Rule::ConditionGetter
  attr_accessor :condition

  def initialize(condition)
    @condition = condition
  end

  def build
    OpenStruct.new(condition)
  end
end