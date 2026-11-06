(
MIDIClient.init;
m = MIDIOut.newByName(
    MIDIClient.destinations[0].device,
    MIDIClient.destinations[0].name
);

~link.latency_(0.21);

[
    "MIDI out", m,
    "latency", m.latency
].postln;
MIDIClient.destinations.postln;
)
