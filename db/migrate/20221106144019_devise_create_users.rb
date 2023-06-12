# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## Add any columns
      t.string :last_name, comment: '名字'
      t.string :first_name, comment: '名前'
      t.string :last_name_kana, comment: '名字カナ'
      t.string :first_name_kana, comment: '名前カナ'
      t.date :birthday, comment: '誕生日'
      t.string :listing_skill, comment: 'xxxスキル'
      t.string :seo_skill, comment: 'SEOスキル'
      t.string :phone_number, comment: '電話番号'
      t.string :postal_code, comment: '郵便番号'
      t.string :address, comment: '住所'
      t.integer :gender, comment: '性別'
      t.boolean :second_job_experience, default: false, comment: '複業経験有無'
      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
