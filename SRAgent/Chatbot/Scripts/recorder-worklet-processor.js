// recorder-worklet-processor.js
class RecorderWorkletProcessor extends AudioWorkletProcessor {
    constructor() {
        super();
        this._buffer = [];
    }

    process(inputs) {
        const input = inputs[0];
        if (input.length > 0) {
            const channelData = input[0]; // Mono
            this.port.postMessage(channelData);
        }
        return true;
    }
}

registerProcessor('recorder-worklet-processor', RecorderWorkletProcessor);
