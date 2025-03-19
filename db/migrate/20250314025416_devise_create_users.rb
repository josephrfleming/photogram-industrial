# db/migrate/<timestamp>_devise_create_users.rb

# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## [Optional Devise modules omitted for brevity]

      # Your custom columns
      t.string  :username
      t.boolean :private,         default: false
      t.integer :likes_count,     default: 0
      t.integer :comments_count,  default: 0

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :username,             unique: true  # <--- Added!
  end
end
