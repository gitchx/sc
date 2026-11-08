(
"song.scd".loadRelative;
// Bass init
~bass = Pbindf(
	~song,
  \type, \midi,
  \midiout, m,
  \chan, 1,
);
~bassSeq = { |seq|
  Pdefn(\bassSeq, Pseq(seq, inf));
};
~bassDur = { |dur|
  Pdefn(\bassDur, dur)
};
Pdef(\bass,
	Pchain(
	  Pbindef(\bassParam,
	    \degree, Pdefn(\bassSeq),
	    \dur, Pdefn(\bassDur),
	    \velocity, 100,
	    \octave, 4
  	),
		~bass
	)
);

~bassPlay = {
Pdef(\bass).play(~link, quant: 4);
};

~bassStop = {
Pdef(\bass).stop;
};

)

//////////////////////////////////////
// for Live Coding
//////////////////////////////////////

~bassSeq.([0,0,0,0,0,0,0,4]);

~bassSeq.([0,2,4,2]);

~bassSeq.([0, Rest(), Rest(), Rest()]);

~bassDur.(0.5);

~bassPlay.()

~bassStop.()

