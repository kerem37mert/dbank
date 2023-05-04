import Debug "mo:base/Debug";
import Time "mo:base/Time";

actor DBank {
  stable var currentValue: Nat = 300;
  currentValue := 500;

  let id = 5212144211;

  let startTime = Time.now();
  Debug.print(debug_show(startTime));

  // Debug.print(debug_show(id));

  public func topUp(amount: Nat)
   {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdrawl(amount: Nat)
  {

    if(currentValue >= amount)
    {
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    }else
    {
      Debug.print("error");
    }
    
  };

  public query func checkBalance(): async Nat
  {
    return currentValue;
  }

  // topUp();
}