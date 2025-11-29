class CreateTranscriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :transcriptions do |t|
      t.string :audio_filename
      t.text :raw_text
      t.text :summary_text
      t.string :status
      t.integer :duration

      t.timestamps
    end
  end
end
