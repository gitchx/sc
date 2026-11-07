// Drums Common Settings
(
~drums = Pbind(
    \type, \midi,
    \midiout, m,
    \chan, 0
);

//Kick
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

//Hi-Hat
Pdef(\hat,
    Pbindf(
      ~drums,
      \midinote, 40,
      \dur, Pdefn(\hatDur)
    )
);

Pdefn(\hatDur, 0.25);

Pdef(\hat).play(~link, quant: 4);
Pdef(\hat).stop;


(
~drums = [\kick, \clap, \hat];
~drums.do {|name|Pbindef(name).stop};
)
