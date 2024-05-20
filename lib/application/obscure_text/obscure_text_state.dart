part of 'obscure_text_cubit.dart';

class ObscureTextState extends Equatable {
  final bool isObscured;
  const ObscureTextState(this.isObscured);

  @override
  List<Object> get props => [isObscured];
}
