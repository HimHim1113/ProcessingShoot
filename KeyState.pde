static class KeyState{
  static HashMap<Integer, Boolean> key;
  
  //入力状態の初期化
  static void initialize(){
    key = new HashMap<Integer, Boolean>();
    
    key.put(RIGHT, false);
    key.put(LEFT, false);
    key.put(UP, false);
    key.put(DOWN, false);
    key.put(SHIFT, false);
  }
  
  //keyCodeとその入力状態を受け取り、更新する
  static void putState(int code, boolean state){
    key.put(code, state);
  }
  
  //keyCodeを受け取り、その入力状態を返す
  static boolean getState(int code){
    return key.get(code);
  }
}
