***
	Benmin Hoertnagl-Pereira
	bhoertn1
	631-488-7197 
	bhoertn1@jhu.edu

	520.214.01 EE214 Signals and Systems
	Project 2 - Sonar Detection and Digital Reception/Transmission

	Files:
	Scripts-
	sonar_driver - main driver to run various functions
	sonar_detection - determines distance of object given a received 
		ping response via LTI system convolution

	.mat-
	ActiveSonar.mat - containes sonar echo and ping signals
	ReceivedSignal.mat - contains the recieved signal after ping
***

## Part 1: Sonar Detection
You are now the sonar operator scanning for a friendly ship. You send out a ping signal sp(t) that is a sinusoidal signal of duration 0:30 second, saved in variable SonarPing. At the same time, you start recording the returned echo signal x(t),
saved in the variable SonarEcho. This received signal consists of your ping signal embedded in noise and delayed by the time it took to travel to the object and echo back. Assuming sound travels 5000 feet per second in water, the object's distance can be calculated by measuring the time it took for the echo to return. The signal you sent SonarPing and signal you received SonarEcho are stored in the the ActiveSonar.mat. Both signals are sampled at 100 samples every second.

## Part 2: Digital Message Reception
The friendly ship you detected in Part 1 now wants to send you a binary message. For transmission purposes, the binary code is converted to a continuous time signal, 1-values are encoded with a 0.5 sec long positive ramp with amplitude of 0:5 at t = 0:5 sec; 0-values are encoded similarly with a negative ramp with amplitude 􀀀0:5 at t = 0:5 sec. Again, there is a great deal of noise in the water making reception of the entire signal potentially difficult.

## Part 3: Digital Message Transmission
Now, you want to send a message back to the friendly ship. It should have a minimum of 5 characters. Use the same binary waveform from Part 2 to represent your message as a transmitted signal s(t). A sampling rate of 100 samples/second is again assumed. To appreciate how noise can corrupt this message, generate a noisy version of your signal by adding a noise signal n(t), of the same length. The sum of your clean transmitted signal s(t) and the noise interference n(t) is now the received signal x(t).