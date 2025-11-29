# == Schema Information
#
# Table name: transcriptions
#
#  id             :bigint           not null, primary key
#  audio_filename :string
#  duration       :integer
#  raw_text       :text
#  status         :string
#  summary_text   :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Transcription < ApplicationRecord
  validates :audio_filename, presence: true
end
