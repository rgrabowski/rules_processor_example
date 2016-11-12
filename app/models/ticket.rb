class Ticket < ApplicationRecord
  STATUSES = %w(New Active Pending Closed)
  PRIORITIES = %w(Low Medium High)
end
