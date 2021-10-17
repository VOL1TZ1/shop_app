// import 'package:flutter/cupertino.dart';
//
// class CustomCounter extends StatefulWidget {
//   const CustomCounter({Key? key}) : super(key: key);
//
//   @override
//   _CustomCounterState createState() => _CustomCounterState();
// }
//
// class _CustomCounterState extends State<CustomCounter> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//
//       ],
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/cubit/counter_cubit.dart';
import 'package:shop_app/cubit/states.dart';


class Counter extends StatelessWidget {
  const Counter({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = CounterCubit.get(context);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Divider(
                color: Colors.white,
                height: 30,
              ),
              SizedBox(child: ElevatedButton(onPressed: (){cubit.increment(); itemCount++;}, child: const Icon(Icons.arrow_circle_up_outlined)),),
              const Divider(
                color: Colors.white,
                height: 5,
              ),
              SizedBox(child: ElevatedButton(onPressed: (){}, child: Text(cubit.count.toString())),),
              const Divider(
                color: Colors.white,
                height: 5,
              ),
              SizedBox(child: ElevatedButton(onPressed: (){cubit.decrement();itemCount--;}, child: const Icon(Icons.arrow_circle_down_outlined)),),
              const Divider(
                color: Colors.white,
                height: 5,
              ),
            ],
          );


        },
      ),
    );
  }
}
