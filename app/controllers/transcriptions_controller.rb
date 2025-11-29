class TranscriptionsController < ApplicationController
  def new
    @transcription = Transcription.new
  end

  def create
    @transcription = Transcription.create(status: "pending")
    if params[:audio].present?
      fname = "transcription_#{SecureRandom.hex(6)}.webm"
      path = Rails.root.join("tmp", "uploads", fname)
      FileUtils.mkdir_p(File.dirname(path))
      File.open(path, "wb") { |f| f.write(params[:audio].read) }
      @transcription.update(audio_filename: fname, status: "processing")

      begin
        raw_text = SpeechService.transcribe(path) # implement service to call OpenAI or provider
        @transcription.update(raw_text: raw_text, status: "done")
      rescue => e
        @transcription.update(status: "failed")
        render json: {error: e.message}, status: 500 and return
      end
      render json: {id: @transcription.id, raw_text: raw_text}
    else
      render json: {error: "no audio"}, status: 400
    end
  end
end
