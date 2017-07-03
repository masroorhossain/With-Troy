# With-Troy

Testing various means to produce pitch shifting in Octave



## TODO items

* test out using Octave's "resample" function instead of calculating our own indices.
   * e.g., resample input spectrum by 1.054 times (this effectively 'stretches' it out), and then take the relevant spectrum\_half\_width section of the output spectrum
