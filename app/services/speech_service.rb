class SpeechService
  def self.transcribe(file_path)
    raise "No file" unless File.exist?(file_path)

    client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))

    audio_file = File.open(file_path)
    resp = client.audio.transcriptions(
      parameters: {
        file: audio_file,
        model: "whisper-1"
      }
    )
    audio_file.close
    if resp && resp["text"]
      resp["text"]
    else
      resp.dig("data", 0, "text") || resp.to_s
    end
  end
end
