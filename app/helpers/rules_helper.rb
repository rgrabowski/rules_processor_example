module RulesHelper
  def path_to_rule_fields(f)
    field = f.object.field || f.object.action_name

    if field.present?
      field_name = field.chomp('_id')
      render "rules/fields/#{field_name}_fields", f: f
    end
  end

  def rule_field_options
    {
        'Ticket' =>
            [
                %w(Status ticket_status),
                %w(Priority ticket_priority),
                %w(Subject ticket_subject)
            ]
    }
  end

  def rule_action_options
    {
        'Conversation' =>
            [
                ['Set status', 'ticket_set_status'],
                ['Set priority', 'ticket_set_priority']
            ]
    }
  end

  def rule_operator_options(f)
    Rule::RuleTicketOperator.new(field: f.object.field).build
  end

end
