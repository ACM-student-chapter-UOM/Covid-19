class Validation {
  bool checkPhoneNumber(String number){
    try{
      int n = int.parse(number);
      if(n.toString().length==10){
      return true; 
    }
    return false;
    }catch(e){
      return false;
    }
  }
}