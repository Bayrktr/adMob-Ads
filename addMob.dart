import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:planner_piyon/pages/account.dart';
import 'package:planner_piyon/pages/archive.dart';
import 'package:planner_piyon/pages/date_picker.dart';
import 'package:planner_piyon/pages/menu.dart';
import 'package:planner_piyon/pages/planner.dart';
import 'package:planner_piyon/pages/quick.dart';
import 'package:planner_piyon/pages/quick_add.dart';
import 'package:planner_piyon/pages/update_archive.dart';
import 'package:planner_piyon/pages/update_mission.dart';
import 'package:planner_piyon/pages/update_quick.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key,this.name});

  var name;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _createInterstitialAd();
    super.initState();
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }

  InterstitialAd? _interstitialAd;
  int _numInterstitialLoadAttempts = 0;
  int maxFailedLoadAttempts = 3;

  void _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: "ca-app-pub-3940256099942544/1033173712", // test id
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          _numInterstitialLoadAttempts = 0;
          _showInterstitialAd();
        },
        onAdFailedToLoad: (LoadAdError error) {
          _numInterstitialLoadAttempts += 1;
          _interstitialAd = null;
          if (_numInterstitialLoadAttempts < maxFailedLoadAttempts) {
            _createInterstitialAd();
          } else {
            if(widget.name.toString() == "planner"){
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => general_romote_planner()),
                    (route) => false,
              );
            }
            else if(widget.name.toString() == "archive"){
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => general_romote_archive()),
                    (route) => false,
              );
            }
            else if(widget.name.toString() == "quick"){
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => general_romote_quick()),
                    (route) => false,
              );

            }
            else if(widget.name.toString() == "add_planner"){
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => general_romote_date_picker()),
                    (route) => false,
              );

            }
            else if(widget.name.toString() == "add_quick"){
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => general_romote_date_quick_add()),
                    (route) => false,
              );

            }
            else if(widget.name.toString() == "account"){
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => general_romote_account()),
                    (route) => false,
              );
            }
            else if(widget.name.toString() == "menu"){
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => general_romote_menu()),
                    (route) => false,
              );
            }
            else{
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => general_romote_menu()),
                    (route) => false,
              );
            }
          }
        },
      ),
    );
  }

  void _showInterstitialAd() {
    if (_interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();

        if(widget.name.toString() == "planner"){
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => general_romote_planner()),
                (route) => false,
          );
        }
        else if(widget.name.toString() == "archive"){
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => general_romote_archive()),
                (route) => false,
          );
        }
        else if(widget.name.toString() == "quick"){
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => general_romote_quick()),
                (route) => false,
          );

        }
        else if(widget.name.toString() == "add_planner"){
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => general_romote_date_picker()),
                (route) => false,
          );

        }
        else if(widget.name.toString() == "add_quick"){
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => general_romote_date_quick_add()),
                (route) => false,
          );

        }
        else if(widget.name.toString() == "update_planner"){
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => general_romote_update_mission()),
                (route) => false,
          );

        }
        else if(widget.name.toString() == "update_quick"){
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => general_romote_update_quick()),
                (route) => false,
          );
        }
        else if(widget.name.toString() == "update_archive"){
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => general_romote_update_archive()),
                (route) => false,
          );
        }
        else if(widget.name.toString() == "account"){
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => general_romote_account()),
                (route) => false,
          );
        }
        else if(widget.name.toString() == "menu"){
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => general_romote_menu()),
                (route) => false,
          );
        }
        else{
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => general_romote_menu()),
                (route) => false,
          );
        }
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(),
        )
      ),
    );
  }
}
