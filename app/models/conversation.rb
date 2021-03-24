class Conversation < ApplicationRecord
  before_create do
    self.start_date = Date.today unless self.start_date
  end
end