class CreateContactsAddresses < ActiveRecord::Migration
  def change
    create_table :contacts_addresses do |t|
      t.string :addresstype
      t.string :street
      t.string :housenumber
      t.string :postalcode
      t.string :city
      t.string :country

      t.timestamps null: false
    end
  end
end
