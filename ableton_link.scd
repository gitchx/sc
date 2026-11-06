(
s.waitForBoot {
    //if(~linkTest.notNil) { ~linkTest.stop; ~linkTest = nil };
    //if(~link.notNil) { ~link.stop; ~link = nil };
    //if(~audioLink.notNil) { ~audioLink.stop; ~audioLink = nil };

    ~link = LinkClock(1).latency_(s.latency);

    //~audioLink = LinkClock(1).latency_(s.latency);

    ~link.quantum = 4;
    ~link.beatsPerBar = 4;
    //~audioLink.quantum = 4;
    //~audioLink.beatsPerBar = 4;

    //SynthDef(\linkClick, { |freq = 880, amp = 0.12|
    //    var sig = SinOsc.ar(freq) * Env.perc(0.002, 0.06).ar(Done.freeSelf);
    //    OffsetOut.ar(0, (sig * amp).dup);
    //}).add;

    [
        "Ableton Link ready",
        "peers", ~audioLink.numPeers,
        "bpm", (~audioLink.tempo * 60).round(0.1),
        "server latency", s.latency,
        "bar", ~audioLink.bar,
        "beatInBar", ~audioLink.beatInBar
    ].postln;

    // Ableton Liveの4拍目から同期テストを開始
    //~linkTest = Pbind(
    //    \instrument, \linkClick,
    //    \freq, Pseq([1200, 700, 700, 700], inf),
    //    \dur, 1
    //).play(~audioLink, quant: 4);
};
)

// BPMを変更する場合（Ableton Live側にも反映される）
// ~link.tempo = 120 / 60;

~linkTest.stop;

~link.stop;

//~audioLink.stop;
