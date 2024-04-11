%define ENUM para cada caracteristica

enum Nationalities = {Norwegian, Danish, British, German, Swedish};
enum Colors = {Red, Green, White, Yellow, Blue};
enum Drinks = {Tea, Coffee, Milk, Beer, Water};
enum Pets = {Cats, Horse, Birds, Dogs, Fish};
enum Hobbies = {Piano, Basket, Soccer, Violin};


%Define o array para cada casa
array[1..5] of var Nationalities: nationality;
array[1..5] of var Colors: color;
array[1..5] of var Drinks: drink;
array[1..5] of var Pets: pet;
array[1..5] of var Hobbies: hobby;

%definindo dicas que já sabemos
%clue 8
constraint nationality[1] = Norwegian;
%clue 11
constraint drink[3] = Milk;





%define a dica 1 onde o britanico mora na casa vermelha
constraint forall(i in 1..5) ((nationality[i] = British) <-> (color[i] = Red));
%clue 3
constraint forall(i in 1..5) ((nationality[i] = Danish) <-> (drink[i] = Tea));


%usando a constraint alldiferent para que ninguem tenha caracteristicas repetitivas...

constraint alldiferent(nationality);
constraint alldiferent(color);
constraint alldiferent(drink);
constraint alldiferent(pet);
constraint alldiferent(hobby);




