class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.text :message_id
      t.text :user_id
      t.text :channel_id
      t.text :message_type
      t.text :content
      t.text :platform
      t.text :botname
      t.datetime :sent_at
      t.json :raw_data_store
      t.json :extra_data_store

      t.timestamps
    end
  end
end
