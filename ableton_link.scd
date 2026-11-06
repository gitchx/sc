// Ableton Link と SuperCollider を同期するための設定
// SuperCollider 3.10.4 以降では LinkClock が標準搭載されています。

// 1) SuperCollider でこのブロックを評価（Cmd/Ctrl + Enter）
(
s.waitForBoot {
    // 既存のLinkClockがあれば止めてから作り直す
    if(~link.notNil) { ~link.stop };

    // Ableton Link の quantum と SuperCollider の小節を4拍にする
    // latency は音声サーバーと同じ値にするのが重要
    ~link = LinkClock(1).latency_(s.latency);
    ~link.quantum = 4;
    ~link.beatsPerBar = 4;

    "Ableton Link ready".postln;
    ("Peers: " ++ ~link.numPeers).postln;
    ("Tempo: " ++ (~link.tempo * 60).round(0.1) ++ " BPM").postln;

    s.options.numInputBusChannels = 0;
    s.options.sampleRate = 44100;
    s.boot;
};
)

// 2) BPMを変更（Linkセッション全体に反映される）
~link.tempo = 120 / 60;

// 現在の接続状態を表示
(
[
    "peers", ~link.numPeers,
    "bpm", (~link.tempo * 60).round(0.1),
    "bar", ~link.bar,
    "beatInBar", ~link.beatInBar
].postln;
)
// 3) 同期テスト用クリック音を登録
(
SynthDef(\linkClick, { |freq = 880, amp = 0.12|
    var sig = SinOsc.ar(freq) * Env.perc(0.002, 0.06).ar(Done.freeSelf);
    OffsetOut.ar(0, (sig * amp).dup);
}).add;
)

// 4) Ableton Live と同じ小節頭でクリックを鳴らす
// クリックを止めるには ~linkTest.stop;
(
~linkTest = Pbind(
    \instrument, \linkClick,
    \freq, Pseq([1200, 700, 700, 700], inf),
    \dur, 1
).play(~link, quant: 4);
)
// 5) 停止
~linkTest.stop;

// LinkClockを完全に切断する場合
// ~link.stop;
