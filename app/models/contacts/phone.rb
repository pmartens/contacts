module Contacts
  class Phone < ActiveRecord::Base

    belongs_to :contact, dependent: :destroy

    validates :phonetype, length: { in: 1..30 }, presence: true
    validates :phonenumber, uniqueness: true, presence: true
  end
end
