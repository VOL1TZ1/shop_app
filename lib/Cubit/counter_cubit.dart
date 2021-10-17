import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/states.dart';
import 'package:shop_app/constants.dart';

class CounterCubit extends Cubit<CounterStates>{
  CounterCubit() : super(CounterInitState());


  static CounterCubit get(BuildContext context){
   return BlocProvider.of(context);
  }

  int count = 1;
  increment(){
    count++;
    emit(IncrementState());
   }
  decrement(){
    if(count>1) {
      count--;
    }
    emit(DecrementState());
  }
}