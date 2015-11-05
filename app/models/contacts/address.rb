module Contacts
  class Address < ActiveRecord::Base

    belongs_to :contact, dependent: :destroy

    validates :addresstype, length: { in: 1..30 }, presence: true
    validates :street, :housenumber, :postalcode, :city, :country, presence: true


  end
end
