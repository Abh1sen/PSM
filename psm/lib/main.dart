import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psm/blocs/cart/bloc/cart_bloc.dart';
import 'package:psm/blocs/category/category_bloc.dart';
import 'package:psm/blocs/wishlist/bloc/wishlist_bloc.dart';
import 'package:psm/config/app_router.dart';
import 'package:psm/config/theme.dart';
import 'package:psm/repositories/category/category_repository.dart';
import 'package:psm/screens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishList())),
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(
          create: (_) => CategoryBloc(
            categoryRepository: CategoryRepository(),
          )..add(LoadCategories()),
        )
      ],
      child: MaterialApp(
        title: 'Haseena',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
