class Rule::ActionGetter
  attr_accessor :action

  def initialize(action)
    @action = action
  end

  def build
    OpenStruct.new(action)
  end

end