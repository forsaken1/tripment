class CreateProcedures < ActiveRecord::Migration[6.1]
  def change
    create_table :procedures do |t|
      t.string :title
      t.string :url
      t.string :block
      t.text :body
      t.timestamps
    end
  end
end
