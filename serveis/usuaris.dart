Map<String, String> usuarisRegistrats = {
  "usuari1": "1",
  "usuari2": "2",
  "a": "a"
};

bool iniciarSesio(String usuari, String contrasenya){
  if(usuarisRegistrats.containsKey(usuari)){
    return usuarisRegistrats[usuari] == contrasenya;
  }
  else{
    return false;
  }
}