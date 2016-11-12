json.extract! ticket, :id, :subject, :status, :priority, :requester_id, :description, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)