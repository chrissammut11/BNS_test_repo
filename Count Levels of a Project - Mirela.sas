data junk1;
input string $;
cards;
1.1
1.1.1
1.1.1.1
2
2.1
2.2.3
3
;
run;

data junk2;
set junk1;
find_dot = index(string,".");
main_proj = substr(string,1,find_dot-1);

num_levels = countw(string,".");

keep main_proj num_levels;
run;

proc sort data=junk2;
by main_proj descending num_levels;
run;

data junk3;
set junk2;
by main_proj descending num_levels;
if first.main_proj;
run;
