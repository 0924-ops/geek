class CreateTweets < ActiveRecord::Migration[7.2]
  def change
    create_table :tweets do |t|
      t.string :place
      t.text :comment

      t.timestamps
    end
  end
end
