%% Fig1
figure;
set(gcf,'Color',[1 1 1]);
Data = transpose([45 33 18 37 42 30]);
ylim([0 50]);
bar(Data);
sigasterisk(1,1,2,5,"*",Data);
title("Fig 1");

%% Fig2
figure;
set(gcf,'Color',[1 1 1]);
Data = [10 20 30;15 20 5;45 90 10;16 17 13;80 10 30;40 60 10];
bar(Data);
sigasterisk(1,1,2,3,"*",Data);
sigasterisk(1,1,2,4,"*",Data);
title("Fig 2");
ylim([0 95]);

%% Fig3
figure;
set(gcf,'Color',[1 1 1]);
bar(Data);
sigasterisk(2,3,3,3,"*",Data);
title("Fig 3");

%% Fig4
figure;
set(gcf,'Color',[1 1 1]);
Errors = rand(6,3)*5;
bar(Data);
add_errorbar(Errors, Data);
sigasterisk(2,3,1,1,"*",Data,Errors);
title("Fig 4");
