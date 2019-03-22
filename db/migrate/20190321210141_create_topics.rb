class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :title
      t.text :body
      t.belongs_to :user

      t.timestamps
    end

    change_table :users do |t|
      t.integer :topics_count, default: 0
    end
  end
end
