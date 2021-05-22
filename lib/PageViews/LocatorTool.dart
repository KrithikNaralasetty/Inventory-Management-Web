import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:inventory_management_web/PageViews/NavigationServiceTool.dart';
import 'package:flutter/widgets.dart';
import 'package:inventory_management_web/PageViews/Pages/OverviewPage.dart';

import 'Pages/AddMachinePage.dart';
import 'Pages/MachinePage.dart';
import 'Pages/SettingPage.dart';
import 'Pages/TasksPage.dart';
import 'Pages/TemplatesListPage.dart';

const String overviewPageRoute = "OveriewPage";
const String machinePageRoute = "MachinesPage";
const String tasksPageRoute = "TasksPage";
const String addMachinePageRoute = "AddMachinePage";
const String settingsPageRoute = "SettingsPage";
const String templatesPageRoute = "TemplatesListPage";

Route<dynamic> generatePageRoute(RouteSettings settings){
  switch (settings.name) {
    case overviewPageRoute:
      return _getPageRoute(Overview());
      break;
    case machinePageRoute:
      return _getPageRoute(MachinesPage());
      break;
    case tasksPageRoute:
      return _getPageRoute(TasksPage());
      break;
    case addMachinePageRoute:
      return _getPageRoute(AddMachinesPage());
      break;
    case settingsPageRoute:
      return _getPageRoute(SettingsPage());
      break;
    case templatesPageRoute:
      return _getPageRoute(TemplatesListPage());
    default:
      return _getPageRoute(Overview());
  }
}


PageRoute _getPageRoute(Widget child){
  return MaterialPageRoute(builder: (context) => child);
}

GetIt pageLocator = GetIt.instance;

void setupPageLocator(){
  pageLocator.registerLazySingleton(() => PageNavigationService());
}