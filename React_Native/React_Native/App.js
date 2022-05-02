import React, { Component} from 'react';
import { Text, StatusBar, TouchableOpacity, View, Image , StyleSheet, DeviceEventEmitter, FlatList} from 'react-native';
import {NativeModules} from 'react-native';

var GertecGPOS700 = NativeModules.GertecGPOS700;

export default class App extends Component {
    constructor(props) {    
        super(props);
        this.state = {
        arrayResult: [],
        data:[
            {id: 1, title: "Código de Barras", image:require('./src/images/barcode.png'), onPress: ()=>this.props.navigation.navigate("CodigoDeBarra")},
            {id: 2, title: "Código de Barras  V2", image: require('./src/images/qr_code.png'), onPress: ()=>GertecGPOS700.startCameraV2()},
            {id: 3, title: "Impressão", image:require('./src/images/print.png'), onPress:() =>  this.props.navigation.navigate("Impressao")},
            {id: 4, title: "NFC Gedi", image: require('./src/images/nfc.png'), onPress: () => this.props.navigation.navigate("NfcGedi")},
            {id: 5, title: "NFC Id", image:require('./src/images/nfc1.png'), onPress:() =>  this.props.navigation.navigate("NfcId"), },
            {id: 6, title: "TEF",image:require('./src/images/tef.png'), onPress:() =>   this.props.navigation.navigate("Tef")},
            {id: 6, title: "SAT",image:require('./src/images/sat.jpeg'), onPress:() =>   this.props.navigation.navigate("Sat")}] 
        }
    }

    // é possível recuperar o resultado do codigo de barras V2
    componentDidMount() {
        DeviceEventEmitter.addListener("eventResult",event=>{
            this.setState({
                arrayResult: [...this.state.arrayResult, event.result] 
            })
        });
    }
  
    render(){
        return (
            <View style={{backgroundColor: 'white', flex: 1}}>
                <StatusBar barStyle="dark-content" />

                <View>
                    <Image 
                    style={styles.stretch}
                    source={require('./src/images/gertec.png')} />
                    <Text style={{fontSize: 20, textAlign: 'center',fontWeight: 'bold'}}>Projeto React-Native v1.0.0</Text>          
                </View>
        
                <FlatList
                        data={this.state.data}
                        width='100%'
                        keyExtractor= {(item) => {
                        return item.id;
                        }}
                        ItemSeparatorComponent={this.FlatListItemSeparator}
                        renderItem={({ item}) =>   
                            <TouchableOpacity style={{height: 96,flexDirection:'row',alignItems:'center',justifyContent:'space-between'}} onPress={item.onPress}>
                                <View style={styles.row}>
                                    <Image source={item.image} resizeMode='contain' style={{flex:.2 }} />
                                    <Text style={{flex:.8, fontSize: 15, textAlign: 'center'}}>{item.title}</Text>
                                </View>
                            </TouchableOpacity>
                        }
                />
            </View>
        );
    }
}

const styles = StyleSheet.create({
    stretch: {
        width: 360,
        height: 105,
        resizeMode: 'stretch'
    },
    row:{
        flexDirection: 'row',
        alignItems: 'center',
        borderColor: '#DCDCDC',
        backgroundColor: '#fff',
        borderBottomWidth: 1,
        padding: 15,
    }
});