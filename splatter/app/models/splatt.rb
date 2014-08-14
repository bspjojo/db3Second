class Splatt < ActiveRecord::Base
  belongs_to :user

  validates :body, length: {minimum: 1}
end
