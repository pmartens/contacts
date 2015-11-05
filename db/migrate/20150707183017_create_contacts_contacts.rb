class CreateContactsContacts < ActiveRecord::Migration
  def change
    create_table :contacts_contacts do |t|
      t.string :firstname
      t.string :lastname
      t.date :birthdate
      t.text :note

      t.timestamps null: false
    end
  end
end
