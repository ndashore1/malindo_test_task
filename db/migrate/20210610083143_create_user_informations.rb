# frozen_string_literal: true

# Creates table user informations.
class CreateUserInformations < ActiveRecord::Migration[6.1]
  def change
    create_table :user_informations do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :url, null: false

      t.timestamps
      t.index :email, unique: true
    end
  end
end
