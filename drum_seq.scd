~kickMidi.stop;
~hatMidi.stop;
~clapMidi.stop;

  MIDIClient.init;

m = MIDIOut.newByName(
    MIDIClient.destinations[0].device,
    MIDIClient.destinations[0].name
);

  MIDIClient.destinations.postln;

(
Pbindef(\drums,
    \type, \midi,
    \midiout, m,
    \chan, 0,
    \midinote, Pseq([36], inf),
    \dur, 1,
    \amp, 100,
).play;
)


 Pbindef(\drums).stop;
