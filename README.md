# spectral2d-m
Simplified Matlab 2D version of FLUSI code


This code is intended for rapid prototyping and can, through MATLABS openMP interface for FFTW be executed in parallel on small workstations

It solves the Navier-Stokes eqn in u-p formulation (primitve variables), where a penalization term has been added to take into account obstacles

The time integration is performed using a RK2 scheme with integrating factor (thus there is no time step restriction for the viscous term)
