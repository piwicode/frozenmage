/// scr_sound_play_shock(intensity)
// intensity from 0 to 1
var resource_idx = choose(snd_shock01, snd_shock02, snd_shock03)
var sound_idx = scr_play_at_position(resource_idx, argument0);
audio_sound_pitch(sound_idx, random_range(.95, 1.05));
return sound_idx;
