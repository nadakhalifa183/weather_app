import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
               useMaterial3: false,

                primarySwatch:  getPrimaryColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weathercondition),
                appBarTheme: AppBarTheme(
                  backgroundColor: getPrimaryColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.weathercondition),
                  titleTextStyle: const TextStyle(color: Colors.white),
                  iconTheme: const IconThemeData(color: Colors.white),
                ),
              //    inputDecorationTheme: InputDecorationTheme(

              //   border: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(8.0),
              //     borderSide: BorderSide(color: getPrimaryColor(BlocProvider.of<GetWeatherCubit>(context)
              //             .weatherModel
              //             ?.weathercondition),
              //   ),
              // ),
              // ),
              ),
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
// import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
// import 'package:weather_app/views/home_view.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => GetWeatherCubit(),
//       child:
//           BlocBuilder<GetWeatherCubit, WeatherState>(builder: (context, state) {
//         Color primaryColor = Colors.blue; // Default
//         if (state is WeatherLoadedState) {
//           primaryColor = getPrimaryColor(
//                   BlocProvider.of<GetWeatherCubit>(context)
//                       .weatherModel
//                       ?.weathercondition)
//               .shade500;
//         }

//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           theme: ThemeData(
//             primarySwatch: MaterialColor(primaryColor.value, {
//               50: primaryColor.withOpacity(0.1),
//               100: primaryColor.withOpacity(0.2),
//               200: primaryColor.withOpacity(0.3),
//               300: primaryColor.withOpacity(0.4),
//               400: primaryColor.withOpacity(0.5),
//               500: primaryColor,
//               600: primaryColor.withOpacity(0.7),
//               700: primaryColor.withOpacity(0.8),
//               800: primaryColor.withOpacity(0.9),
//               900: primaryColor,
//             }
//             ),
//             appBarTheme: AppBarTheme(
//               backgroundColor: primaryColor,
//               titleTextStyle: const TextStyle(color: Colors.white),
//               iconTheme: const IconThemeData(color: Colors.white),
//             ),
//             inputDecorationTheme: InputDecorationTheme(
//               //Added here
//               border: OutlineInputBorder(
//                 borderSide: BorderSide(color: primaryColor),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: primaryColor.withOpacity(0.8),
//                 ),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: primaryColor),
//               ),
//               labelStyle: TextStyle(color: primaryColor),
//             ),
//           ),
//           home: const HomeView(),
//         );
//       }),
//     );
//   }
// }

// ... (getPrimaryColor function remains unchanged)

MaterialColor getPrimaryColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition.toLowerCase()) {
    case "sunny":
      return Colors.orange;
    case "partly cloudy":
      return Colors.yellow;
    case "cloudy":
      return Colors.blue;
    case "overcast":
      return Colors.grey;
    case "mist":
      return Colors.blueGrey;
    case "patchy rain possible":
    case "patchy snow possible":
      return Colors.lightBlue;

    case "patchy sleet possible":
      return Colors.lightGreen;
    case "patchy freezing drizzle possible":
      return Colors.brown;
    case "thundery outbreaks possible":
      return Colors.deepPurple;
    case "blowing snow":
      return Colors.grey;
    case "blizzard":
      return Colors.grey;
    case "fog":
      return Colors.grey;
    case "freezing fog":
      return Colors.grey;
    case "light drizzle":
      return Colors.blue;
    case "heavy rain":
      return Colors.blueGrey;
    case "light rain":
      return Colors.blue;
    case "heavy snow":
      return Colors.lightBlue;
    case "ice pellets":
      return Colors.teal;
    // Add more cases as needed
    default:
      return Colors.grey; // Default color for unknown conditions
  }
}
