class SummarizeService
  def self.summarize(text)
    return "" if text.blank?
    client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))

    prompt = <<~PROMPT
      Summarize the following conversation in 3-4 lines. Keep it concise and highlight key points.
      Conversation:
      #{text}
    PROMPT

    resp = client.chat(
      parameters: {
        model: "gpt-4o-mini",
        messages: [{role: "user", content: prompt}],
        max_tokens: 200
      }
    )
    if resp && resp.dig("choices", 0, "message", "content")
      resp.dig("choices", 0, "message", "content").strip
    else
      resp.to_s
    end
  end
end
