(
"song.scd".loadRelative;
// chord init
~chord = Pbindf(
	~song,
  \type, \midi,
  \midiout, m,
  \chan, 2,
);
~chordSeq = { |seq|
  Pdefn(\chordSeq, Pseq(seq, inf));
};
~chordDur = { |dur|
  Pdefn(\chordDur, dur)
};
Pdef(\chord,
	Pchain(
	  Pbindef(\chordParam,
	    \degree, Pdefn(\chordSeq),
	    \dur, Pdefn(\chordDur),
	    \velocity, 100,
	    \octave, 5
  	),
		~chord
	)
);

~chordPlay = {
Pdef(\chord).play(~link, quant: 4);
};

~chordStop = {
Pdef(\chord).stop;
};

)


//////////////////////////////////////
// for Live Coding
//////////////////////////////////////


~chordSeq.([0,0,0,0,0,0,0,4]);

~chordSeq.([0,2,4,2]);

~chordSeq.([0, Rest(), Rest(), Rest()]);

~chordSeq.(
  [0, Rest(), Rest(), Rest()],
  [2, Rest(), Rest(), Rest()]
);

~chordDur.(1);

~chordDur.(0.5);

~chordPlay.()

~chordStop.()

