import 'package:flutter/material.dart';
import 'package:flutter_base_app/blocs/blocs.dart';
import 'package:flutter_base_app/colors/colors.dart';
import 'package:flutter_base_app/models/models.dart';
import 'package:flutter_base_app/screens/country_details/widgets/country_details.dart';
import 'package:flutter_base_app/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryDetailsScreen extends StatefulWidget {
  static const routeName = '/CountryDetails';

  @override
  _CountryDetailsScreenState createState() => _CountryDetailsScreenState();
}

class _CountryDetailsScreenState extends State<CountryDetailsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _fetchData());
  }
  
  void _fetchData() {
    final CountryDetailsScreenArguments arguments =
        ModalRoute.of(context).settings.arguments;
    BlocProvider.of<CountryByCodeBloc>(context)
        .dispatch(FetchCountryByCode(code: arguments.country.alpha2Code));
  }

  Widget _getContent(CountryByCodeState state) {
    Widget widget = Container();
    if (state is CountryByCodeLoading) {
      widget = AppProgressIndicator();
    } else if (state is CountryByCodeLoaded) {
      widget = CountryDetails(
        country: state.country,
      );
    } else if (state is CountryByCodeError) {
      widget = Error(
        error: state.error,
      );
    }
    return widget;
  }

  @override
  Widget build(BuildContext context) {
    final CountryDetailsScreenArguments arguments =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          arguments.title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<CountryByCodeBloc, CountryByCodeState>(
          builder: (context, CountryByCodeState state) => _getContent(state),
        ),
      ),
    );
  }
}

class CountryDetailsScreenArguments {
  final String title;
  final Country country;

  CountryDetailsScreenArguments({this.title, @required this.country})
      : assert(country != null);

  @override
  String toString() =>
      'CountryDetailsScreenArguments{title: $title, country: $country}';
}
