# This migration comes from refinery_contact_inquiries (originally 1)
class CreateContactInquiries < ActiveRecord::Migration

  def up
    create_table :refinery_contact_inquiries do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.text :message

     t.timestamps
    end

    add_index :refinery_contact_inquiries, :id
  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "contact_inquiries"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/contact_inquiries"})
    end

    drop_table :refinery_contact_inquiries
  end

end
