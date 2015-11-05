module Contacts
  class Homepage < ActiveRecord::Base

    belongs_to :contact, dependent: :destroy

    validates :homepagetype, length: { in: 1..30 }, presence: true
    validates :url, presence: true, uniqueness: true

  end
end
