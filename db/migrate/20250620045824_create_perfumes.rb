class CreatePerfumes < ActiveRecord::Migration[7.2]
  def change
    create_table :perfumes do |t|
      t.string :question

      t.timestamps
    end
  end
end
