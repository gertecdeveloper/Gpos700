import React, { Fragment, Component } from "react";
import { SafeAreaView, Text, StatusBar,View,StyleSheet,Button,DeviceEventEmitter ,FlatList} from "react-native";
import {NativeModules} from 'react-native';

var GertecGPOS700 = NativeModules.GertecGPOS700;

export default class NfcGedi extends Component{
  constructor(props) {    
    super(props);
    
    this.state = {
      
      arrayIdGedi: []
    }
  }
  async componentDidMount(){
       
    DeviceEventEmitter.addListener("eventGedi",event=>{
      
      this.setState({
        arrayIdGedi: [...this.state.arrayIdGedi, event.idGedi] 
      })
      
    }
  );

}


  render(){
    return(
      <SafeAreaView>
          <View >
            <Text style={{fontSize: 30, fontWeight:'bold', marginLeft:40, marginRight:15}}>
              Leitura do cartão Gedi
            </Text>
          </View>
      
      <View style={{ marginTop:40, marginStart:40, marginEnd:40, marginBottom: 30}}>
         <Button
            color= 'blue'
            title="Ler cartão"
            onPress={() =>GertecGPOS700.nfcGedi()}

        />

      </View>
      <View style={{ height: 0.5, width: "100%", backgroundColor: "#000" }} />
      <FlatList
              data={this.state.arrayIdGedi}
              width='100%'
              extraData={this.state.arrayIdGedi}
              keyExtractor={(index) => index.toString()}
              ItemSeparatorComponent={this.FlatListItemSeparator}
              renderItem={({item}) => <Text style={{fontSize: 16, fontWeight: 'bold', color: 'gray', marginStart: 20}} > {item} </Text>}
        />

      </SafeAreaView>
      
    );
  }
}
 