# Sigasterisk
> This Matlab package adds lines with asterisks (*) to show significant differences between bars in a bar plot.

## Table of contents
* [General info](#general-info)
* [Screenshots](#screenshots)
* [Setup](#setup)
* [Code Examples](#code-examples)
* [Features](#features)
* [Contact](#contact)

## General info
The functions in this package do:
1. Add lines and asterisks for bars in a bar plot.
2. Add lines and asterisks for bars within a group in a grouped bar plot.
3. Add lines and asterisks for bars between groups in a grouped bar plot.
4. Add lines and asterisks when bars of the bar plot have error bars.

## Screenshots
![Example screenshot](demo.png)

## Setup
Add the package folder to the search path of Matlab.

## Code Examples
Figure 1
```
figure;
Data = transpose([45 33 18 37 42 30]);
ylim([0 50]);
bar(Data);
sigasterisk(1,1,2,5,"*",Data);
title("Fig 1");
```
Figure 2
```
figure;
bar(Data);
sigasterisk(2,3,3,3,"*",Data);
title("Fig 2");
```
Figure 3
```
figure;
Data = [10 20 30;15 20 5;45 90 10;16 17 13;80 10 30;40 60 10];
bar(Data);
sigasterisk(1,1,2,3,"*",Data);
sigasterisk(1,1,2,4,"*",Data);
title("Fig 3");
ylim([0 95]);
```
Figure 4
```
figure;
Errors = rand(6,3)*5;
bar(Data);
add_errorbar(Errors, Data);
sigasterisk(2,3,1,1,"*",Data,Errors);
title("Fig 4");
```

## Features
* The appearance and location of lines/asterisks can be adjusted by optional arguments.

## Contact
Created by [@arsalanfiroozi](https://ee.sharif.ir/~firoozi.arsalan) - feel free to contact me!
