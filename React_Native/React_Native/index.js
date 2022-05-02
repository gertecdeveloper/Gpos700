/**
 * @format
 */

import {AppRegistry} from 'react-native';
import App from './App';
import Routes from "./src/Routes";
import {name as appName} from './app.json';
//import './src/services/globalValue';

AppRegistry.registerComponent(appName, () => Routes);
console.disableYellowBox = true;