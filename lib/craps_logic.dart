import "dart:io";
import "dart:math";

class Player {
  //testing a thing
  double balance = 0;
  int points = 0;
  bool status = false; // checking if the game is won or lost, cant rely on point system because losing desnt change points
  double bet = 0;
   Player({double startingBalance = 1000.0}){
    print(r"Your starting balance will be $1000, would you like a different balance?");
    if (["yes", "y", "sure", "yeah"].contains(stdin.readLineSync()!.toLowerCase())){
      stdout.write("Your starting balance will be: ");
      startingBalance = double.parse(stdin.readLineSync()!);
      while (startingBalance <= 0){
        stdout.write("Your starting balance should be greater than 0: ");
      }
    }
    balance = startingBalance;
  }
}

Player? player;




void instructions(){
  print("would you like to see the instructions");
  if(["yes", "y", "sure", "yeah"].contains(stdin.readLineSync()!.toLowerCase())){
  print("""1. Two dices are required to play and a player rolls two six-sided dice and adds the numbers rolled together.
2. If on the first roll a player encounters a total of 7 or 11 the player automatically wins, and if the player
rolls a total of 2, 3, or 12 the player automatically loses, and play is over.
3. If a player rolls a total of 4, 5, 6, 8, 9, or 10 on their first roll, that number becomes the ‘point. Then
the player continues to roll the two dice again until one of two things happens either they roll the ‘point’
again, in which case they win, or they roll a 7, in which case they lose.""");
  }
}

int scoring(List<int?> rolled){

  if (rolled[0] == 7 || rolled[0] == 11 ){
    winLoss("win");
  } else if ([2,3,12].contains(rolled[0]) || [2,3,12,7].contains(rolled[1])){
    winLoss("lose");;
  } else if (rolled[1] == rolled[0]) {
    winLoss("win");
  }
    return rolled[0] as int;

}

void game(){
  print("Game of Craps");
  if (player == null){
   instructions();
   player = Player();
  }
    if (player!.balance == 0){
    print("You're broke");
    exit(0);
  }
  gamble();
  if (player!.balance == 0){
    print("no bet has been placed");
  }
  bool statusChanged = player!.status;
  int point = diceroller();
  scoring([point,null]);
  while (statusChanged == player!.status){
    print("The point is $point");
    scoring([point,diceroller()]);
  }
}

int diceroll(int rollcount){
  int dice = Random().nextInt(5) + 1;
  print("roll $rollcount: $dice");
  return dice;
}

int diceroller({pre}){
  print("roll the dice (Press Enter)");
  stdin.readLineSync();
  int rolled = 0;
  print("rolling the dice...");
  for (int rollCount = 1; rollCount <= 2; ++rollCount){
    rolled += diceroll(rollCount);
  }
  print("you rolled $rolled");
  return rolled;  
}

void winLoss(String winLoss){
  print("You $winLoss!");
  player!.status = true;
  if (winLoss == "win"){
    player!.points += 1;
    if (player!.bet > 0){
      print("You gambled ${player!.bet} and doubled your money!");
      player!.balance += player!.bet*2;
      print("your balance is ${player!.balance}");
    }
  } else {
    if (player!.bet > 0){
      print("You gambled ${player!.bet} and lost your money!");
      print("your balance is ${player!.balance}");
    }
  }
  player!.bet = 0;
}

int gamble(){
  print("Do you want to place a bet?");
  if (player!.balance <=0){
    print("You dont have anything to bet");
    return 1;
  }
  if (["yes", "y", "sure", "yeah"].contains(stdin.readLineSync()!.toLowerCase())){
    print("Your balance is ${player!.balance}");
    stdout.write("How much would you like to bet?: ");
    player!.bet = double.parse(stdin.readLineSync()!);
    while(player!.balance < player!.bet){
      print("You cant bet more than your balance");
      print("Do you just want to bet your entire balance instead?");
      if (["yes", "y", "sure", "yeah"].contains(stdin.readLineSync()!.toLowerCase())){
        player!.bet = player!.balance;
      }
    }
    player!.balance -= player!.bet;
    print("You bet ${player!.bet}, your balance is now ${player!.balance}");
  }
  return 0;
}
void main(){
  while (true){
    game();
    print("go again?");
    if (!["yes", "y", "sure", "yeah"].contains(stdin.readLineSync()!.toLowerCase())){
      exit(0);
    }
  }
}
