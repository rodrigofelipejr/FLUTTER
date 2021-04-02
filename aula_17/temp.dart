// Padding(
//         padding: const EdgeInsets.all(32.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Observer(
//               builder: (_) {
//                 return FormLoginWidget(
//                   onPressed: controller.state is Loading
//                       ? null
//                       : (email, password) {
//                           controller.login(email: email, password: password);
//                         },
//                 );
//               },
//             ),
//             Observer(
//               builder: (_) {
//                 if (controller.state is None) {
//                   return Container();
//                 }

//                 if (controller.state is Loading) {
//                   return CircularProgressIndicator();
//                 }

//                 if (controller.state is Success) {
//                   return Text('Entrando no aplicativo');
//                 }

//                 return Text('Email e/ou senha inválidos');
//               },
//             ),
//           ],
//         ),
//       ),