class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.timestamps
    end
    # we only wnat unique emails.
    add_index :users, %i(email), unique: true
  end
end
