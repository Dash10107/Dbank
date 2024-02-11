import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor dbank_backend{
  //to retain the value
 stable var currentValue:Float = 300;
 stable var startTime = Time.now();
 //to make them normal
  //currentValue:=300;
  startTime:=Time.now();


  public func topUp(amount:Float) {
    currentValue+=amount;
 
  Debug.print(debug_show(currentValue));
  };

   public func withdrawl(amount:Float) {
    let temp:Float = currentValue-amount;
    if(temp>=0){
    currentValue-=amount;
    Debug.print(debug_show(currentValue));  
    }else{
       Debug.print("Amount too large ");
    }
 
 
  };
  
public query func checkBalance(): async Float{
return currentValue;
};

public func compound(){
  let currentTime = Time.now();
  let timeElapsedNS = currentTime - startTime;
  let timeElapsedS = timeElapsedNS/1000000000;
  currentValue:=  currentValue *(1.01**Float.fromInt(timeElapsedS));
  startTime :=currentTime;
}

}