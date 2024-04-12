%including file that allows us to use the all different constraint
include "globals.mzn";

%defines ENUM for each characteristic

enum Nationalities = {Norwegian, Danish, British, German, Swedish};
enum Colors = {Red, Green, White, Yellow, Blue};
enum Drinks = {Tea, Coffee, Milk, Beer, Water};
enum Pets = {Cats, Horse, Birds, Dogs, Fish};
enum Hobbies = {Piano, Basket, Soccer, Violin};


%defines array for each house
array[1..5] of var Nationalities: nationality;
array[1..5] of var Colors: color;
array[1..5] of var Drinks: drink;
array[1..5] of var Pets: pet;
array[1..5] of var Hobbies: hobby;

%define clues already knows
%clue 8
constraint nationality[1] = Norwegian;
%clue 11
constraint drink[3] = Milk;
%clue 14
constraint color[2] = Blue;



%clue 1
constraint forall(i in 1..5) ((nationality[i] = British) <-> (color[i] = Red));
%clue 2 
constraint forall(i in 1..5) ((nationality[i] = Swedish) <-> (pet[i] = Dogs));
%clue 3
constraint forall(i in 1..5) ((nationality[i] = Danish) <-> (drink[i] = Tea));
%clue 4
constraint forall(i in 1..5) ((nationality[i] = German) <-> (hobby[i] = Soccer));
%clue 5
constraint forall(i in 1..5) ((color[i] = Green) <-> (drink[i] = Coffee));
%clue 6
constraint forall(i in 1..5) ((hobby[i] = Basket) <-> (pet[i] = Birds)); 
%clue 7
constraint forall(i in 2..5) ((hobby[i] = Basket) -> (pet[i-1] = Cats)) \/ ((i<5) /\ (hobby[i] = Basket) -> (pet[i+1] = Cats));
%clue 9
constraint forall(i in 1..5) ((hobby[i] = Violin) <-> (drink[i] = Beer));
%clue 10
constraint forall(i in 1..5) ((color[i] = Yellow) <-> (hobby[i] = Piano));
%Clue 12
constraint forall(i in 2..5) ((pet[i] = Horse) -> (hobby[i-1] = Piano)) \/ ((i<5) /\ (pet[i] = Horse) -> (hobby[i+1] = Piano));
%clue 13
constraint forall(i in 1..4) ((nationality[i] = German) -> (color[i+1] = White));
%clue 14
constraint forall


%using the alldifferent constraint so that no one has repetitive characteristics...

constraint alldifferent(nationality);
constraint alldifferent(color);
constraint alldifferent(drink);
constraint alldifferent(pet);
constraint alldifferent(hobby);




