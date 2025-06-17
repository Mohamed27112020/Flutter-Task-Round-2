import 'package:bloc/bloc.dart';
import 'package:fire_app/Features/AuthScreen/Bloc/AuthStates.dart';
import 'package:fire_app/Features/AuthScreen/Bloc/auth_event.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth;

  AuthBloc({FirebaseAuth? firebaseAuth})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
      super(const AuthState()) {
    on<LoginEvent>(_onLogin);
    on<RegisterEvent>(_onRegister);
    on<LogoutEvent>(_onLogout);

    // Check if user is already logged in when the bloc is initialized
    _firebaseAuth.authStateChanges().listen((User? user) {
      if (user != null) {
        emit(state.copyWith(status: AuthStatus.authenticated, user: user));
      } else {
        emit(state.copyWith(status: AuthStatus.unauthenticated, user: null));
      }
    });
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );

      // Update display name if provided
      if (event.displayName != null && event.displayName!.isNotEmpty) {
        await userCredential.user?.updateDisplayName(event.displayName);
        await userCredential.user?.reload();
      }

      emit(
        state.copyWith(
          status: AuthStatus.authenticated,
          user: _firebaseAuth.currentUser,
        ),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = 'Email already in use.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is badly formatted.';
          break;
        case 'operation-not-allowed':
          errorMessage = 'Email/password accounts are not enabled.';
          break;
        case 'weak-password':
          errorMessage = 'The password is too weak.';
          break;
        default:
          errorMessage = 'An unknown error occurred.';
      }
      emit(
        state.copyWith(status: AuthStatus.error, errorMessage: errorMessage),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthStatus.error,
          errorMessage: 'An unknown error occurred.',
        ),
      );
    }
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
      emit(
        state.copyWith(
          status: AuthStatus.authenticated,
          user: userCredential.user,
        ),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'invalid-email':
          errorMessage = 'The email address is badly formatted.';
          break;
        case 'user-disabled':
          errorMessage = 'This user has been disabled.';
          break;
        case 'user-not-found':
          errorMessage = 'No user found with this email.';
          break;
        case 'wrong-password':
          errorMessage = 'Wrong password provided.';
          break;
        default:
          errorMessage = 'An unknown error occurred.';
      }
      emit(
        state.copyWith(status: AuthStatus.error, errorMessage: errorMessage),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthStatus.error,
          errorMessage: 'An unknown error occurred.',
        ),
      );
    }
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    await _firebaseAuth.signOut();
    emit(state.copyWith(status: AuthStatus.unauthenticated, user: null));
  }
}
