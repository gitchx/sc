// Audio Device Settings
s.options.device = "MacBook Airのス";

ServerOptions.devices;

s.options.sampleRate = 44100;
s.options.numInputBusChannels = 0;

s.boot;

s.quit;

//Ableton Link Settings
(
s.waitForBoot {
   ~link =
   LinkClock(1).latency_(s.latency);
   ~link.quantum = 4;
   ~link.tempo = 120 / 60;
};
)

~link.latency_(0);

~link.stop;

~link.tempo = 60 / 60;

//Ableton Live Link Testing
(
SynthDef(\linkClick, { |freq = 880,
amp = 0.12|
    var sig = SinOsc.ar(freq)
        * Env.perc(0.002,
        0.06).ar(Done.freeSelf);
    OffsetOut.ar(0, (sig * amp).dup);
}).add;

~linkTest = Pbind(
    \instrument, \linkClick,
    \freq, Pseq([1200, 700, 700, 700],
    inf),
    \dur, 1
).play(~link, quant: 4);
)

~linkTest.stop;

//MIDI Settings
(
MIDIClient.init;
MIDIClient.destinations.postln;
)

(
m = MIDIOut.newByName(
MIDIClient.destinations[0].device,
MIDIClient.destinations[0].name
);
)
