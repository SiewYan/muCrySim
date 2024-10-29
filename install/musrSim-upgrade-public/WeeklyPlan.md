# <center>Project Weekly Plan</center>

# 2022
## 7.12 - 7.18
### Meng
- [x] Create a j-box folder to share programme, data and report slides
- [x] Enable the customization of random seed
- [x] Search for an optimized target size that will generate more decay events for 50 MeV $\mu^+$
### Xin tong
- [x] Analyze the performance of the 3-layer detector and evaluate its feasibility
- [ ] Find the distribution of $mu^+$ decay position and angular distribution of generated $e^+$
### Fang yuan
- [ ] Write an analysis program based on 3-layer detector structure to support Xin tong's analysis
### Group meeting indico page
    https://indico-tdli.sjtu.edu.cn/event/1194

## 7.19 - 7.25
### Meng
- [x] Cosmic muon production
- [x] Paper reading

### Xin tong
- [x] Analysis algorithm debug
- [ ] Calibration of different polarization
- [ ] Use distributed muon, comparing the result with non-distributed one

### Fang yuan
- [x] Study targets' ability to stop muon with different muon

## 8.3-8.16
### Meng
- [x] Cosmic muon production in musrSim
- [x] Construct a simplified shell
- [x] Cnostruct a new detector and evaluate its performance

### Xin tong
- [x] Use det_time to find the time interval of two hits that are caused by the same positron in the same detector
- [x] Add det_time cut, to reduce those vector.size>3 to 3 (Only 1 hit in each detector)
- [ ] Evaluate e+ capture ratio based on above improvements
- [x] Add separation time to reduce repeating hits

### Group meeting indico page
```
https://indico-tdli.sjtu.edu.cn/event/1225/
https://indico-tdli.sjtu.edu.cn/event/1232/
```

### Fang yuan
- [x] Refer to [Phys. Rev. 122, 1883](https://journals.aps.org/pr/abstract/10.1103/PhysRev.122.1883). Use same Lead and Cu absorber to stop muon. Validate its conclusion (momentum should > 540 MeV/c)

### Si yuan
- [x] Continue studying the angular distribution of e+ decayed from thermal muon
- [x] Compare e+ angular distribution with shell and without shell

### Group meeting indico page
```
https://indico-tdli.sjtu.edu.cn/event/1242/
```

## 8.17-8.23(Group presentation)
### Meng
- [x] Apply new size to the new detector structure
- [x] Change shell material to Al
- [x] Apply filter+absorber structure to new detector structure
- [ ] Compare detector outcome of Cu absorber and Fe absorber

### Xin tong
- [x] Simplify the shell with solidworks
- [x] Apply new size to the 3-layer detector structure and evaluate its performance
- [x] Develop and optimize polarization detecting algorithm
- [x] Evaluate performance with shell and without shell

### Fang yuan
- [x] Study the influence of the shell to energy filter range
- [x] Use AB$\bar{C}$ detector signal to judge whether muon decays in absorber
- [x] Study the time interval between AB$\bar{C}$ signal and muon decay time
- [x] Compare energy range with Cu absorber and Fe absorber

### Si yuan
- [x] Change shell material to Al and study its angular distribution again
- [x] Compare distribution without shell to theoretical distribution

### Group meeting indico page
```
https://indico-tdli.sjtu.edu.cn/event/1249/
```

## 8.24-8.30
### Meng
- [x] Add coincidence to cosmic detector
- [x] Prepare SJTU-KEK workshop presentation slide

### Xin tong
- [x] Continue simplifying the shell (add inner ring)
- [x] Adjust scintillator thickness to 1cm (the actual thickness we'll use)
- [x] Evaluate 3-layer detector performance with the simplified shell in thermal muon

### Fang yuan
- [x] Remove the shell
- [ ] Optimize the thickness of lead filter for a better yield (on hold)
- [x] Evaluate the accuracy of (anti)coincidence detector when judging whether mu+ decay in absorber

### Si yuan
- [x] Plot the energy and asymmetry figure in paper
- [x] Compare e+ decay angular distribution of mu+ decay in Cu absorber and Fe absorber


## 8.31-9.5
### Meng
- [x] Optimize the performance of cosmic detector

### Xin tong
- [ ] Expand the size of detector until it can detect the polarization of thermal muon
- [ ] Cut the central part to save the cost, and re-evaluate its performance

### Fang yuan
- [ ] Improve the coincidence detector algorithm:
  - [x] Detector thickness: 1 cm
  - [ ] Use edep instead of mup_edep
  - [ ] Optimize the algorithm for a better performance

### Si yuan
- [x] Study the angular distribution of e+ with the defeatured shell
- [x] Study the angular distribution of e+ decayed from cosmic model

### Group meeting indico page
```
https://indico-tdli.sjtu.edu.cn/event/1270/
```

## 9.6-9.12
### Meng
- [x] Develop selection during simulation
- [x] Test cosmic performance in 5 different polarization values with 10^8 events
- [x] Help Si yuan to solve abnormal cosmic angular distribution

### Xin tong
- [x] Expand the size of detector until it can detect the polarization of thermal muon
- [x] Cut the central part to save the cost, and re-evaluate its performance

### Fang yuan
- [x] Remove the filter
- [ ] Study the function of mu+ decay number and Cu thickness, e+ absorb ratio and Cu thickness

### Si yuan 
- [x] Fix the problem of cosmic muon angular distribution
- [ ] Complete the plot of A-$\epsilon$ of muon decay


## 10.1-10.13
### Meng
- [ ] Compare the polarization measurement of corner structure and classic structure
- [x] Figure out the plan for hardware stage

### Xin tong & Si yuan
- [x] Further search of the parallel detector
- [x] Position reconstruction

### Fang yuan
- [x] Study the effect of absorber thickness to 4-corner detector's polarization detecting sensitivity 
- [x] Optimize the coincidence detector (detect muon using det_edep)

## 10.14-10.20
### Meng
- [x] Add cosmic muon polarization distribution and angular distribution

### Xin tong
- [x] Complete the position recostruction without shell
- [x] Evaluate the influence of shell on e+ reconstruction

### Fang yuan
- [x] Study the effect of absorber thickness to 4-corner detector's polarization detecting sensitivity
- [x] Figure out the best absorber thickness

### Si yuan
- [x] Study the angular distribution with regard to absorber thickness
- [x] Help Xintong to build position reconstruction

## 10.21-10.27
### Meng
- [ ] Add another 2 layers to the corner detector and evaluate its performance
- [x] Generate more simulation data

### Xin tong
- [ ] Use det_time_start and trackID to further study abnormal events
- [ ] Compare the track from the same positron with and without shell

### Fang yuan
- [x] Analyze performance of Cu absorber >10mm
- [x] Transfer current algorithm to Up-Down detector structure

### Si yuan
- [x] Develop coincidence algorithm

## 10.28-11.9
### Meng
- [ ] Add another 2 layers to the corner detector and evaluate its performance

### Xin tong
- [x] Use det_time_start and trackID to further study abnormal events
- [x] Compare the track from the same positron with and without shell

### Fang yuan
- [x] Calibrate A-P curve of two structures

### Si yuan
- [x] Further optimize the coincidence algorithm

## 11.11-11.23
### Meng
- [x] Add another 2 layers to the corner detector and evaluate its performance

### Xin tong
- [x] Develop coincidence algorithm for up-down structure

### Fang yuan
- [x] Develop e+ detector algorithm to reject background from particles other than e+

### Si yuan
- [x] Further develop and optimize coincidence algorithm of corner detector

## 11.24-12.3
### Meng
- [x] Add customized event selector
- [x] Add another 2 layers to the corner detector and evaluate its performance

### Xin tong
- [x] Develop coincidence algorithm for up-down structure

### Fang yuan
- [x] Develop e+ detector algorithm to reject background from particles other than e+

### Si yuan
- [x] Further develop and optimize coincidence algorithm of corner detector

## 12.4-12.21
### Meng
- [x] Optimize 2-layer detector performance and evaluate its background rejection
- [x] Add energy bin for Phase 3 reconstruction
- [x] Start searching for hardware construction

### Xin tong
- [x] Draw E-t plots of different cases in Phase 1
- [x] Complete coincidence algorithm in Phase 1

### Fang yuan
- [x] Optimize e+ detection algorithm

### Si yuan
- [x] Draw E-t plots of different cases in Phase 2
- [x] Complete coincidence algorithm in Phase 2

# 2023
## 3.22-3.29
### Meng
- [x] Fix the bug of DAQ time sequence
- [x] Complete the abstract of the Poster

### Xin tong
- [x] Study and visualize passing-trough events
  - [x] Frequency
  - [x] Angular distribution
- [ ] Compose the simulation poster

### Fang yuan
- [x] Optimize Landau Fitting with fixed peak range
- [x] Fit energy distribution of pass-through events
- [x] Study and visualize showering events

### Si yuan
- [x] Optimize muon source distribution
- [x] Optimize Landau distribution fitting of simulation

## 3.23 - 4.4
### Meng
- [ ] Compose the hardware poster
- [ ] Find the solution for DT5702 dead time

### Xin tong
- [ ] Study passing-through events with different thresholds
- [ ] Study angular distribution using MyAna framework
- [ ] Compose the simulation poster

### Fang yuan 
- [ ] Conduct Landau distribution fitting with different thresholds
- [ ] Make a calibration between edep and ADC value
- [ ] Compose the hardware poster

### Si yuan
- [ ] Fit the Landau distribution of passing-through events (simulation)
- [ ] Compose the simulation poster

## Future work reminder
- [ ] Study decay events
  - [ ] Select decay events
  - [ ] Frequency
  - [ ] Decay time distribution (~2.2 us?)
  - [ ] Polarization Measurement
- [ ] Create a process that convert surface muon into thermal muon
- [ ] Add depolarization physic process
- [ ] Consider the positron from Muoinum decacy
