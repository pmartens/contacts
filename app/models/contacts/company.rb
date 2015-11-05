module Contacts
  class Company < ActiveRecord::Base

    belongs_to :contact

    validates :name, presence: true, uniqueness: true

  end
end
