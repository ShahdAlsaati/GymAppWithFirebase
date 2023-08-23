import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gym/style/colors.dart';

import '../home/home_controller.dart';
import 'courses_controller.dart';

class FullBodyWeight extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var _controller=Get.put<CoursesController>(CoursesController());

    print(_controller.fullBodyWeight.length);

    return Scaffold(
      backgroundColor: pageColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: pageColor,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(

              decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade200,

                  border: Border.all(
                      color: Colors.black

                  )
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                    '''What is Weight training?\n
Weight training is a common type of strength training for developing the strength, size of skeletal muscles and maintenance of strength.
 It uses the force of gravity in the form of weighted bars, dumbbells or weight stacks in order to oppose the force generated by muscle through  concentric or eccentric contraction. Weight training uses a variety of specialized equipment to target specific muscle groups and types of movement.
Sports in which weight training is used include bodybuilding, weightlifting,powerlifting,strongman, highland games.'''
                ),
              ),

              width: MediaQuery.of(context).size.width*0.95,
              height: 265,
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: GetBuilder<CoursesController>(
                init: CoursesController(),
                builder:(controller)=> FutureBuilder(
                  future:_controller.getFullBodyWeight() ,
                  builder: (context,snapshot){
                    if(snapshot.connectionState==ConnectionState.waiting)
                    {
                      return Center(
                        child: Column(

                          children: [
                            SizedBox(
                              height: 100,
                            ),
                            CircularProgressIndicator(
                              color: Colors.orangeAccent,
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text('Loading ....')
                          ],
                        ),
                      );
                    }
                    else
                      return ListView.separated(
                          itemBuilder:(context,idx){
                            return InkWell(
                              onTap: (){
                                _controller.confirmJoin(_controller.fullBodyWeight[idx].cId);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Container(
                                  decoration: BoxDecoration(

                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.grey.shade200,

                                      border: Border.all(
                                          color: Colors.black

                                      )
                                  ),

                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Couch: ${_controller.fullBodyWeight[idx].couchName}'),
                                        SizedBox(height: 6,),
                                        Text('Time: ${_controller.fullBodyWeight[idx].time}'),
                                        SizedBox(height: 6,),
                                        Text('Days: ${_controller.fullBodyWeight[idx].date}'),
                                        SizedBox(height: 6,),

                                        Row(
                                          children: [
                                            Text('Calories Burned: ${_controller.fullBodyWeight[idx].caloriesBurned}'),
                                            Icon(Icons.local_fire_department_outlined,
                                              color: Colors.red,
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 6,),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context,idx){
                            return SizedBox(
                              height: 7,
                            );
                          },
                          itemCount: _controller.fullBodyWeight.length);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}