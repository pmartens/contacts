class AddLeadingContactToCompany < ActiveRecord::Migration
  def change
    add_column :contacts_companies, :main_contact_id, :int
  end
end
