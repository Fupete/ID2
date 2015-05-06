//This sketch takes values from a table stored locally and parse them into an array. I chose this way because I could'nt publish the table on github for privacy reasons.
//In the main project, this sketch works with the others in order to extract the ip values from the log table and send them the Stitchy Identicons sketch 
//to automatically generate a new identicon for each user. This means that repeated ip values must be not considered in the array. 
//They have to be considered in the destination ip addresses.



Table myftable;
int [] ip = new int [190];

myftable = loadTable("Logs.csv", "header"); //load the csv stored in my local directory
myftable.removeTokens("."); //remove the dots in the ip addresses in order to make them readble to stichies.pdeù

IntList A_Values = new IntList ();

println (myftable.getStringColumn ("Source address")); //gets only the column named as source address

for (int i = 0; i <190; i++) {
  ip [i] = A_Values.get(i);
}

for (int i = 0; i <190; i++) {
  System.out.println(ip[i]);
}
