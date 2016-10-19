/// scr_sound_play_shock(intensity)
// intensity from 0 to 1
var resource_idx = choose(snd_shock01, snd_shock02, snd_shock03)
var sound_idx = audio_play_sound(resource_idx, 50/*prio*/, false/*loop*/);
var volume = argument0;
audio_sound_gain(sound_idx, volume, 0/*now*/);
audio_sound_pitch(sound_idx, random_range(.95, 1.05));
