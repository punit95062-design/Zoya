# Zoya Full Project

A Kotlin/Jetpack Compose voice-assistant architecture using Gemini Live API concepts.

Verified against current Google AI documentation:
- Model: gemini-3.1-flash-live-preview
- Live API supports audio-to-audio and synchronous function calling.
- Live API tool responses must be handled by the client.
- Google recommends the Google GenAI SDK.

Before production:
1. Add the current Android-compatible Google GenAI dependency according to Google's SDK docs.
2. Do NOT hard-code a permanent API key in the APK. Prefer an ephemeral-token/backend flow for production.
3. Replace the wake-word detector stub with a real local on-device detector.
4. Android background microphone execution is governed by foreground-service and OS restrictions.
