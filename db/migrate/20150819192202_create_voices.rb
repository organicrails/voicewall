class CreateVoices < ActiveRecord::Migration
  def change
    create_table :voices do |t|
      t.string :title
      t.text :opinion

      t.timestamps null: false
    end
  end
end
