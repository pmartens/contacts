class CreateContactsHomepages < ActiveRecord::Migration
  def change
    create_table :contacts_homepages do |t|
      t.string :homepagetype
      t.string :url

      t.timestamps null: false
    end
  end
end
