module Contacts
  class Email < ActiveRecord::Base

    belongs_to :contact, dependent: :destroy

    validates :emailtype, length: { in: 1..30 }, presence: true
    validates :email, presence: true, uniqueness: true

  end
end
