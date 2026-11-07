~synth = Pbind(
  \type, \midi,
  \midiout, m,
  \chan, 2,
  \scale, Scale.minor,
  \root, 4
)

Pdef(
  \bass,
  Pbindf(
    ~synth,
    \degree, Pseq([0 ,2 ,4 ,2], inf),
    \dur, 1,
    \amp, 100,
    \octave, 4
  )
)

Pdef(\bass).play(~link, quant: 4);

Pdef(\bass).stop;
