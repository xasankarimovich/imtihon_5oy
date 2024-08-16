import 'package:bloc/bloc.dart';
import '../../data/model/forum_status/form_status.dart';
import '../../data/model/network_response.dart';
import '../../data/services/firebase_auth_services.dart';
import '../../data/services/services_locator.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState.initialValue()) {
    on<LoginRequested>(_onLoginRequested);
    on<RegisterRequested>(_onRegisterRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<InitialEvent>(initialState);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: ForumStatus.loading));
    NetworkResponse response =
        await getIt<FirebaseAuthService>().login(event.email, event.password);
    if (response.errorMessage.isEmpty) {
      emit(
        state.copyWith(
          status: ForumStatus.success,
          user: response.data,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: ForumStatus.error,
          errorMessage: response.errorMessage,
        ),
      );
    }
  }

  Future<void> _onRegisterRequested(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        status: ForumStatus.loading,
      ),
    );
    NetworkResponse response = await getIt<FirebaseAuthService>()
        .register(event.email, event.password);
    if (response.errorMessage.isEmpty) {
      emit(
        state.copyWith(
          status: ForumStatus.success,
          user: response.data,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: ForumStatus.error,
          errorMessage: response.errorMessage,
        ),
      );
    }
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    await getIt<FirebaseAuthService>().logout();
    emit(
      state.copyWith(
        status: ForumStatus.loggedOut,
      ),
    );
  }

  void initialState(InitialEvent event, Emitter<AuthState> emit) =>
      emit(AuthState.initialValue());
}
