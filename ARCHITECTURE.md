# Zoya architecture

UI -> ForegroundService -> AudioRecord/WakeWordDetector
                     -> GeminiLiveManager
                     -> ZoyaTools

Gemini Live:
microphone PCM16 -> Live session -> native audio output
                          |
                          +-> function call -> ZoyaTools -> FunctionResponse -> Live

Interruption:
user speech / VAD -> immediately cancel AudioTrack playback -> continue receiving input.

Security:
- Request runtime permissions.
- Validate every package/contact/email argument.
- Do not auto-grant permissions.
- For sensitive actions, consider explicit confirmation.
- Prefer ephemeral Live tokens/backend authentication rather than shipping a permanent API key.
