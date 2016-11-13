class Ticket < ApplicationRecord
  STATUSES = %w(new active pending closed)
  PRIORITIES = %w(low medium high)

  def save_and_process_rules
    save!
    process_rules
  end

  def process_rules
    RulesProcessor::Processor.new(records: {ticket: self},
                                  options: {},
                                  ruleset: set_ruleset).process
  end

  def set_ruleset
    rules = Rule.all.by_order

    rules.map do |rule|
      OpenStruct.new(
          id: rule.id,
          meet_all: rule.meet_all_data,
          meet_any: rule.meet_any_data,
          actions: rule.actions_data
      )
    end
  end

  def set_priority(action)
    self.priority = action.value
  end

  def set_status(action)
    self.status = action.value
  end

end
