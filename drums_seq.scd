// Drums Common Settings
(
~drums = Pbind(
    \type, \midi,
    \midiout, m,
    \chan, 0
);

Pdef(\kick,
    Pbindf(
        ~drums,
        \midinote, 36,
        \dur, 1,
        \amp, 100,
    )
);
)

Pdef(\kick).play(~link, quant: 4);
Pdef(\kick).stop;




// Unsorted Codes
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
Pbindef(\clap,
    \type, \midi,
    \midiout, m,
    \chan, 0,
    \midinote, Pseq([Rest(), 45], inf),
    \dur, 1,
    \amp, 80
).play(~link, quant: 4);
)
Pbindef(\clap).stop;


(
~drums = [\kick, \clap, \hat];
~drums.do {|name|Pbindef(name).stop};
)
