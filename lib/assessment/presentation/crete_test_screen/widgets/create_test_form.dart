import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_finder/assessment/infrastructure/inputs/test_question.dart';
import 'package:teacher_finder/assessment/presentation/crete_test_screen/bloc/create_test_bloc.dart';

import '../../../../common/widgets/custom_app_bar.dart';
import '../../../../common/widgets/text_input.dart';
import 'alternatives_list.dart';
import 'general_information_panel.dart';

class CreateTestForm extends StatelessWidget {
  const CreateTestForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //final createTestBloc = context.watch<CreateTestBloc>();
    //final question = createTestBloc.state.question;
    return  Scaffold(
        appBar: const CustomAppBar(title: 'Add Question'),
        body:
           Padding(
             padding: const EdgeInsets.all(10.0),
             child: SizedBox(
              height: MediaQuery.of(context).size.height*1,
              child:  Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    TextInput(
                      title: 'Question',
                      label: 'Start typing your question...',
                      maxLines: 3,
                      //onChanged: (value) => createTestBloc.testQuestionChanged(value),
                      //errorMessage: question.errorMessage,
                    ),
                    AlternativesList(),
                    ElevatedButton(onPressed: (){
                   
                    }, child: const Text('Add Question'))
                  ],
                ),

          ),
           ),

      );

  }
}
