// Bass init
(
~bass = Pbind(
  \type, \midi,
  \midiout, m,
  \chan, 1,
  \scale, Scale.minor,
  \root, 4
);
~bassSeq = { |seq|
  Pdefn(\bassSeq, Pseq(seq, inf));
};
~bassDur = { |dur|
  Pdefn(\bassDur, dur)
};
Pdef(
  \bass,
  Pbindf(
    ~bass,
    \degree, Pdefn(\bassSeq),
    \dur, Pdefn(\bassDur),
    \amp, 100,
    \octave, 4
  );
);
)
//////////////////////////////////////
// for Live Coding
//////////////////////////////////////

~bassSeq.([0,0,0,0,0,0,0,4]);

~bassSeq.([0,2,4,2]);

~bassDur.(0.5);


Pdef(\bass).play(~link, quant: 4);

Pdef(\bass).stop;
