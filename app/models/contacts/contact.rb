module Contacts
  class Contact < ActiveRecord::Base

    belongs_to :company
    has_many :addresses, dependent: :destroy
    has_many :emails, dependent: :destroy
    has_many :homepages, dependent: :destroy
    has_many :phones, dependent: :destroy

    accepts_nested_attributes_for :company, reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :emails, reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :homepages, reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true

    scope :by_company, ->(company) { where('company_id = ?', company) }

    after_save :save_contact_to_company, if: Proc.new { |contact| contact.company.present? && contact.company.main_contact_id.nil? }

    def save_contact_to_company
      self.company.main_contact_id = self.id
      save
    end

  end
end
