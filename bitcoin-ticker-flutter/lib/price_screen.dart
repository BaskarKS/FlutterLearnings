import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;
import 'Network.dart';
// this library can help to find which platform(IOS/Android) our app is currently running on
// using 'show' to import only the specific class

//using 'hide' will hide a specific class from a package : Eg
//import 'dart:io' hide Platform; // will import all classes from 'io' but hides  Platform class

// using 'as' keyword will rename the imported item to a different name to use in our filr
// import 'dart:io' as InputOutput; // renames io package as 'InputOutput' in this file

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  String btcPrice;
  String ltcPrice;
  String ethPrice;

  void getPriceFromNetwork(List<String> cryptoList, String currency) async {
    Network network = Network();
    Map<String, String> priceList = {};
    for (String eachCrypt in cryptoList) {
      var result = await network.getPrice(eachCrypt, currency);
      if (result['rate'] is double) {
        double price = result['rate'];
        priceList[eachCrypt] = price.toStringAsFixed(0);
      } else if (result['rate'] is int) {
        int price = result['rate'];
        priceList[eachCrypt] = price.toStringAsFixed(0);
      }
    }
    updateUI(priceList);
  }

  void updateUI(Map<String, String> priceData) {
    setState(() {
      btcPrice = priceData['BTC'];
      ltcPrice = priceData['LTC'];
      ethPrice = priceData['ETH'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPriceFromNetwork(cryptoList, selectedCurrency);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          getBitCoinUIElements(),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getDropDown(),
          ),
        ],
      ),
    );
  }

  Column getBitCoinUIElements() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(38.0, 10.0, 38.0, 0),
          child: Card(
            color: Colors.lightBlueAccent,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
              child: Text(
                '1 BTC = $btcPrice $selectedCurrency',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(38.0, 10.0, 38.0, 0),
          child: Card(
            color: Colors.lightBlueAccent,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
              child: Text(
                '1 LTC = $ltcPrice $selectedCurrency',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(38.0, 10.0, 38.0, 0),
          child: Card(
            color: Colors.lightBlueAccent,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
              child: Text(
                '1 ETH = $ethPrice $selectedCurrency',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getDropDown() {
// Platform class from 'io' package can give us info about the
// current platform our app is running

//    if (Platform.isIOS) {
//      return iOSDropDown();
//    } else if (Platform.isAndroid) {
//      return androidDropDown();
//    }
    return Platform.isIOS ? iOSDropDown() : androidDropDown();
  }

  // IOS view of DropDown
  CupertinoPicker iOSDropDown() {
    List<Widget> items = [];
    for (String country in currenciesList) {
      items.add(Text(country));
    }
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIdx) {
        print(selectedIdx);
      },
      children: items,
    );
  }

  //Android View of Dropdown
  DropdownButton<String> androidDropDown() {
    List<DropdownMenuItem<String>> menuList = [];
    for (String currency in currenciesList) {
      menuList.add(DropdownMenuItem(
        child: Text(currency),
        value: currency,
      ));
    }
    return DropdownButton<String>(
      value: selectedCurrency,
      items: menuList,
      onChanged: (item) {
        setState(() {
          selectedCurrency = item;
          btcPrice = '?';
          ltcPrice = '?';
          ethPrice = '?';
          getPriceFromNetwork(cryptoList, selectedCurrency);
        });
      },
    );
  }
}
