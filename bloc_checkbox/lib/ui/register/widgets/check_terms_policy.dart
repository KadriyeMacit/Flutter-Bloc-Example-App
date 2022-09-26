import 'package:bloc_checkbox/blocs/register/register_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckTermsPolicy extends StatelessWidget {
  const CheckTermsPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) => previous.isCheck != current.isCheck,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              checkColor: Colors.white,
              value: state.isCheck,
              onChanged: (value) {
                context.read<RegisterBloc>().add(RegisterCheckChanged(value!));
              },
            ),
            Text("Veriler, bilgiler vs")
          ],
        );
      },
    );
  }
}
