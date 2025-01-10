class CreateBots < ActiveRecord::Migration[7.1]
  def change
    create_table :bots do |t|
      t.text :name
      t.text :type
      t.json :config_store

      t.timestamps
    end
  end
end
