class Rule::RuleTicketOperator
  attr_accessor :field

  OPERATORS =
      {is: 'is',
       is_not: 'is not',
       less_than: 'less than',
       greater_than: 'greater than',
       less_than_equal: 'less than equal',
       greater_than_equal: 'greater than equal',
       match: 'match',
       not_match: 'not matches',
       include: 'includes',
       not_include: 'not includes'}.with_indifferent_access

  def initialize(args = {})
    @field = args[:field]
  end

  def build
    collection = send(field)
    collection.map { |o| [OPERATORS.fetch(o), o] }
  end

  private

  def base
    RulesProcessor::OperatorsToSelect.base
  end

  def comparable
    RulesProcessor::OperatorsToSelect.comparable
  end

  def includable
    RulesProcessor::OperatorsToSelect.includable
  end

  def ticket_status
    base + comparable
  end

  def ticket_priority
    base + comparable
  end

  def ticket_requester_id
    base
  end

  def ticket_subject
    base + includable
  end
end
