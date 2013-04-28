class CreateEventParticipations < ActiveRecord::Migration
  def change
    create_table :event_participations do |t|
      t.integer :event_id
      t.integer :act_id
      t.integer :act_rank

      t.timestamps
    end
  end
end
