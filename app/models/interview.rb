class Interview < ApplicationRecord
  belongs_to :user
  enum status: { 承認: 0, 保留: 1, 却下:2 }
end
