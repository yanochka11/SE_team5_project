# SE_team5_project
Phase vocoder to compress and stretch audio files.

  A phase vocoder is a type of vocoder-purposed algorithm which can interpolate information present in the frequency and time domains of audio signals by using phase information extracted from a frequency transform.The computer algorithm allows frequency-domain modifications to a digital sound file (typically time expansion/compression and pitch shifting).

  At the heart of the phase vocoder is the short-time Fourier transform (STFT), typically coded using fast Fourier transforms. The STFT converts a time domain representation of sound into a time-frequency representation (the "analysis" phase), allowing modifications to the amplitudes or phases of specific frequency components of the sound, before resynthesis of the time-frequency domain representation into the time domain by the inverse STFT.
  
Application:
1) Time-stretching and Pitch-shifting:
   
  Time-stretching: Phase vocoder algorithms can stretch or compress the time domain of an audio signal without affecting its pitch. This is useful in music production, where you might want to match the tempo of different tracks or change the tempo of a recording without altering the pitch.
  Pitch-shifting: By modifying the phase information, phase vocoders can also change the pitch of an audio signal without altering its duration. This is valuable in audio editing, music production, and sound design where you might want to change the pitch of a musical instrument or a vocal recording.

2) Audio Editing and Production:

In audio editing and production, having the ability to compress or stretch audio files without changing their pitch or without causing noticeable artifacts is crucial. This allows for more creative control and flexibility in the production process. For instance, in film and video game production, background music or sound effects might need to be time-stretched or compressed to match the timing of specific scenes.

Software Engineering Techniques:

  1)The Bash script run.sh runs the problem solution.
  Input data:
<input.wav> - the path to the original WAV file

<output.wav> - the path to the file that is the result of the program's operation

<time_stretch_ratio> - the parameter 'r' of the algorithm. (0 < r < 1 - compress, 1 <= r - stretch)

  2) Development using Git
  3) Test scripts

