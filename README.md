# Running-Assistant
Plots user's expected run using data analysis from pre-run questions. Tracks user's actual run using phone sensor recordings. Lays the graphs on top of each other so the user can see how they can improve their runs.

Start out by connecting your phone to the computer by downloading Matlab Mobile and typing in your computer’s IP address under “Settings”.

Once connected, run AccelerationTracker.m to run the whole program. This is the main script. All the functions are described in the comments.


The project contains 5 major tasks:

1. Collect data about how one thinks they will run:
The computer prompts for expected average pace, mileage, intensity, time and lengths of breaks, as well as increases and decreases in starting and ending speed.

2. Calculate time and expected pace vectors:
Time vector has 10 evenly spaced time intervals between the start and end of the run

Expected pace vector contains pace values that are calculated using the given information.

3. Plot the expected run, using the time vector and expected pace vector

4. Collect actual running data
After connecting to Matlab Mobile on one’s phone, the computer takes in true running speeds at each time

5. Plot actual running data on the same plot as the expected running data
