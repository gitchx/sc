// MIDIデバイスを初期化
    MIDIClient.init;

    // 接続先一覧を表示
    (
    MIDIClient.destinations.do { |dest, i|
        [i, dest.device, dest.name, dest.uid].postln;
    };
    )
    // 表示された接続先を選んで接続します。

    // 例: 1番目のMIDI出力先に接続
    (
    ~dest = MIDIClient.destinations[0];

    MIDIOut.connect(0, ~dest.uid);
    ~midi = MIDIOut(0);
    )
    // 音を鳴らす場合：
  (
    // チャンネル0、ノート番号60（C4）、ベロシティ100
    ~midi.noteOn(0, 60, 100);

    // 1秒後にノートオフ
    SystemClock.sched(1, {
        ~midi.noteOff(0, 60, 100);
    });
  )
