# Google AIY Projects on Barge

This will show you how to use Google AIY Voice Kit with [Barge](https://github.com/bargees/barge-os).

> [Google AIY Voice Kit](https://aiyprojects.withgoogle.com/voice)  
> This project demonstrates how to get a natural language recognizer up and running and connect it to the Google Assistant, using your AIY Projects voice kit.

## Build a Docker Image

```bash
[bargee@barge-rpi ~]$ git clone https://github.com/ailispaw/AIY-projects-barge.git
[bargee@barge-rpi ~]$ cd AIY-projects-barge
[bargee@barge-rpi AIY-projects-barge]$ docker build -t aiyprojects-raspbian:voicekit .
```

## Run a Developmet Environment

```bash
[bargee@barge-rpi ~]$ docker run -ti --rm --group-add audio --device /dev/snd --device /dev/mem --cap-add SYS_RAWIO -v ~/assistant.json:/home/pi/assistant.json:ro -v ~/voice-recognizer:/home/pi/.cache/voice-recognizer aiyprojects-raspbian:voicekit
Dev terminal is ready! See the demos in 'src/' to get started.
(env) pi@943f5b390ad5:~/AIY-projects-python$ 
```

- `--group-add audio --device /dev/snd`: to use an audio device
- `--device /dev/mem --cap-add SYS_RAWIO`: to access to /dev/mem
- `-v ~/assistant.json:/home/pi/assistant.json:ro`: to put your credentials
- `-v ~/voice-recognizer:/home/pi/.cache/voice-recognizer`: to save the authorized credentials

## Run a Demo

```bash
(env) pi@943f5b390ad5:~/AIY-projects-python$ sudo -E PATH=$PATH src/assistant_library_demo.py
```

- `sudo`: to access to /dev/mem as root
- `-E PATH=$PATH`: to keep environment variables to run the demo

## References

- [Google AIY Voice Kit](https://aiyprojects.withgoogle.com/voice)
- [API for Google AIY Voice Kit](https://github.com/google/aiyprojects-raspbian/tree/voicekit)
- [Debian Docker Image for Raspberry Pi 3](https://hub.docker.com/r/resin/raspberrypi3-debian/)
  - https://github.com/resin-io-library/base-images/blob/master/device-base/raspberrypi3/debian/stretch/Dockerfile
  - https://github.com/resin-io-library/base-images/blob/master/debian/armv7hf/stretch/Dockerfile
  - https://hub.docker.com/r/arm32v7/debian/
