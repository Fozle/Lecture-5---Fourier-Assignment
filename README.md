# Lecture 5 – Fourier Assignment

**Course:** Fourier Series, DTFT and DFT  
**Student:** Fozle Arafat Chowdhury

## Exercise 1 – Build a Square Wave from Harmonics

### Prediction
I predict that adding more odd harmonics will make the waveform look more like an ideal square wave. The flat sections will become clearer, and the transitions will become sharper.

### Results and explanation
- H = 1: The signal looks like a sine wave.
- H = 3: The signal starts looking like a square wave.
- H = 9: The flat sections become more visible.
- H = 25: The waveform becomes closer to an ideal square wave.

Near sharp transitions, small oscillations and overshoots can be seen. This effect is called the Gibbs phenomenon. The overshoot does not completely disappear when more harmonics are added.

## Exercise 2 – Find Two Frequencies with the FFT

### Prediction
I expect two frequency peaks:
- 15 Hz with amplitude 0.8.
- 40 Hz with amplitude 0.4.

### Results
The FFT spectrum shows two peaks at 15 Hz and 40 Hz. Their amplitudes match the expected values of 0.8 and 0.4.

### Frequency-bin spacing

Sampling frequency:

fs = 200 Hz

Number of samples:

N = 200

Frequency-bin spacing:

Δf = fs / N

Δf = 200 / 200 = 1 Hz

Both frequencies fit exactly on the FFT frequency grid.

## Exercise 3 – Investigate Spectral Leakage

### Student-specific value

Last digit of student number:

d = 7

Second frequency:

f2 = 13.2 + 0.17 × d

f2 = 13.2 + 0.17 × 7

f2 = 14.39 Hz

### Prediction
I predict that the 14.39 Hz frequency will spread across nearby FFT bins because it does not fit an integer number of cycles in the one-second recording. This is called spectral leakage.

### One-second recording

Number of samples = 200

Frequency-bin spacing:

Δf = 200 / 200 = 1 Hz

The 14.39 Hz component spreads across nearby frequency bins.

### Four-second recording

Number of samples = 800

Frequency-bin spacing:

Δf = 200 / 800 = 0.25 Hz

The frequency peak becomes easier to identify. The frequency resolution improves because the recording is longer. Some leakage remains.

### Zero-padding

The original one-second signal is extended to 800 FFT points by adding zeros.

Frequency-grid spacing:

Δf = 200 / 800 = 0.25 Hz

Zero-padding makes the spectrum look smoother and gives more frequency points. However, it does not add new measured samples or new information to the original recording.

## Exercise 4 – Compare the DTFT and DFT

Original sequence:

x = [1 1 1 1]

### Task 4 – Compare DTFT and DFT

The DTFT produces a smooth curve because it is evaluated at many frequency values. The 4-point DFT produces only four frequency samples. The 64-point DFT produces more frequency samples and follows the DTFT curve more closely.

### Task 5 – Why does fft(x,64) produce more points?

The 64-point FFT adds zeros to the original four-sample sequence before calculating the FFT. It produces more frequency points but does not add new samples to the original signal.

### Task 6 – Where does the DTFT magnitude become zero?

The magnitude becomes zero at:

ω = -π, -π/2, π/2 and π.

The magnitude reaches 4 at ω = 0.

## AI Use Note

I used ChatGPT to understand the assignment, check MATLAB syntax, debug and organize the MATLAB scripts, and prepare explanations. I ran the MATLAB code myself and checked the generated plots.

## Final Files

- exercise-1/exercise1.m
- exercise-1/square-wave-comparison.png
- exercise-2/exercise2.m
- exercise-2/two-frequency-spectrum.png
- exercise-3/exercise3.m
- exercise-3/leakage-comparison.png
- exercise-4/exercise4.m
- exercise-4/dtft-dft-comparison.png
