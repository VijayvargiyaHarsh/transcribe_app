# Voice Transcription & Summarization (Rails 7, Postgres)

## Setup (local)

1. Ruby version: 3.1.x recommended
2. Ensure PostgreSQL is running and you have a DB user.
Clone repository:
```bash
git clone git@github.com:VijayvargiyaHarsh/voice_transcribe.git
cd voice_transcribe


3. Install gems
bundle install

4.Setup env variables create .env
OPENAI_API_KEY=sk-...

5. Create DB
rails db:create db:migrate

6. Start server

7. Visit: http://localhost:3000/transcribe
