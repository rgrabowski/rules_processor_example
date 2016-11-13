class Rule < ApplicationRecord

  scope :by_order, -> { order(order: :asc) }

  def meet_all
    meet_all_data.map { |condition| Rule::ConditionGetter.new(condition).build }
  end

  def meet_any
    meet_any_data.map { |condition| Rule::ConditionGetter.new(condition).build }
  end

  def actions
    actions_data.map { |action| Rule::ActionGetter.new(action).build }
  end

  def meet_all_attributes=(attributes)
    self.meet_all_data = Rule::ConditionHashSetter.new(attributes).build
  end

  def meet_any_attributes=(attributes)
    self.meet_any_data = Rule::ConditionHashSetter.new(attributes).build
  end

  def actions_attributes=(attributes)
    self.actions_data = Rule::ActionHashSetter.new(attributes).build
  end

end
