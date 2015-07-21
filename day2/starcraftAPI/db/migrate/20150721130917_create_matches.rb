class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
    	t.string :winner_faction
    	t.string :loser_faction
    	t.float :duration
    	t.date :date

    	t.references :winner, references: :players
    	t.references :loser, references: :players

    	t.timestamps
    end
  end
end
