class Rule::ConditionBuilder
  attr_accessor :field, :logical_group, :rule

  def initialize(args = {})
    @field = args[:field]
    @logical_group = args[:logical_group]
    @rule = args[:rule]
  end

  def build
    send("build_#{logical_group}").first
  end

  private

  def build_meet_all
    rule.meet_all_data.clear
    rule.meet_all_data << OpenStruct.new(field: field,
                                         operator: nil,
                                         value: nil)
  end

  def build_meet_any
    rule.meet_any_data.clear
    rule.meet_any_data << OpenStruct.new(field: field,
                                         operator: nil,
                                         value: nil)
  end
end