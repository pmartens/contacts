class CreateContactsPhones < ActiveRecord::Migration
  def change
    create_table :contacts_phones do |t|
      t.string :phonetype
      t.string :phonenumber

      t.timestamps null: false
    end
  end
end
