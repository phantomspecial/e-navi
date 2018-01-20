class Interview < ApplicationRecord
  belongs_to :user
  enum status: { approval: 0, pending: 1, reject:2 }
end
