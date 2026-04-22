class RecorderProcessor extends AudioWorkletProcessor {
    constructor() {
        super();
        this.recording = false;

        this.port.onmessage = (event) => {
            if (event.data === 'start') {
                this.recording = true;
            } else if (event.data === 'stop') {
                this.recording = false;
            }
        };
    }

    process(inputs, outputs, parameters) {
        if (this.recording) {
            const input = inputs[0];
            if (input.length > 0) {
                const channelData = input[0];
                this.port.postMessage(channelData);
            }
        }

        // return true = keep running
        return true;
    }
}

registerProcessor('recorder-processor', RecorderProcessor);
