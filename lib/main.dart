import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_bloc.dart';
import 'user_state.dart';
import 'user_event.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc User Example',
      theme: ThemeData(primaryColor: Colors.deepPurple[200]),
      home:BlocProvider(
        create:  (context) => UserBloc()..add(LoadUserEvent('1')),
        child: UserScreen(),
      )
    );
  }
}

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Profile'),),
      body: BlocBuilder<UserBloc, UserState>(builder: (context,state){
        if (state is UserLoading){
          return Center(child: CircularProgressIndicator(),);
        }
        else if (state is UserLoaded){
          return Center(child: Text('Name : ${state.user.name}'),);
        }
        return Center(child: Text('Press the button to load the user'),);
      }),
      floatingActionButton: FloatingActionButton(onPressed:(){context.read<UserBloc>().add(LoadUserEvent('1'));},child: Icon(Icons.refresh),),
    );
  }
}
