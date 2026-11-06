MIDIClient.init;

m = MIDIOut.newByName(
    MIDIClient.destinations[0].device,
    MIDIClient.destinations[0].name
);

    MIDIClient.destinations.postln;

  (
  Pbindef(\kick,
      \type, \midi,
      \midiout, m,
      \chan, 0,
      \midinote, Pseq([36], inf),
    \dur, 1,
    \amp, 100
).play(~link, quant: 4);
)


Pbindef(\kick).stop;


(
Pbindef(\hat,
    \type, \midi,
    \midiout, m,
    \chan, 0,
    \midinote, Pseq([Rest(), 40], inf),
    \dur, 0.5,
    \amp, 20,
).play(~link, quant: 4);
)



Pbindef(\hat).stop;

(
Pbindef(\sn,
    \type, \midi,
    \midiout, m,
    \chan, 0,
    \midinote, Pseq([Rest(), 38], inf),
    \dur, 1,
    \amp, 80
).play(~link, quant: 4);
)


Pbindef(\sn).stop;

(
~drums = [\kick, \sn, \hat];
~drums.do {|name|Pbindef(name).stop};
)
