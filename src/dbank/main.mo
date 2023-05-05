import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;
  currentValue := 500;

  let id = 5212144211;

  stable var startTime = Time.now();
  Debug.print(debug_show(startTime));

  // Debug.print(debug_show(id));

  public func topUp(amount: Float)
   {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float)
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

  public query func checkBalance(): async Float
  {
    return currentValue;
  };

  // topUp();


  public func compound()
  {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  }
}