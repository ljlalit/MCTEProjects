// void sign_in_user(String email, String password, var _auth, var context){
//   try {
//     final user = await _auth.signInWithEmailAndPassword(
//     email: email.trim(), password: password);
//     if (user != null) {
//       Navigator.pushNamed(context, 'home');
//     }
//     } catch (e) {
//       print(e);
//     }  
// }

// void sign_up(String email, String password, String cpass, String skey, var _auth, var context){
//   if(password != cpass){
//     print("Password fields dont match!");
//   }else{
//     if(skey == "16305"){
//       try {
//         final newUser = await _auth.createUserWithEmailAndPassword(
//             email: email.trim(), password: password);
//         if (newUser != null) {
//           Navigator.pushNamed(context, 'firstadmin');
//         }
//       } catch (e) {
//         print(e);
//       }
//     } else {
//       print("Service Key Invalid!");
//     }
//   }
// }