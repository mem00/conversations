class Conversation < ApplicationRecord
  has_many :messages

  before_create do
    self.start_date = Date.today unless self.start_date
  end
end