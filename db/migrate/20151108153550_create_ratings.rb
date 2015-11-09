class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :grader_id
      t.integer :graded_id
      t.integer :welcome_score
      t.integer :appearance_score
      t.integer :knowledge_score
      t.integer :listening_score
      t.integer :global_score
      t.text :description

      t.timestamps null: false
    end

    add_foreign_key :ratings, :users, column: :grader_id
    add_foreign_key :ratings, :users, column: :graded_id
  end

end
