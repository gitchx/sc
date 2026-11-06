(
Pbindef(\bass,
    \type, \midi,
    \midiout, m,
    \chan, 1,
    \midinote, Pseq([36, 36, 36, 48], inf),
    \dur, 1,
    \sustain, Pseq([1, 1, 0.5, 1], inf),
    \amp, 50
).play(~link, quant: 4);
)
Pbindef(\bass).stop;


(
Pbindef(\bass,
    \midinote, Pseq([36, 36, 36, 48], inf),
    \dur, 0.5,
).play(~link, quant: 4);
)
Pbindef(\bass).stop;


Pbindef(\bass,
    \midinote, Pseq([36, 36, Rest(), 48], inf),
)
