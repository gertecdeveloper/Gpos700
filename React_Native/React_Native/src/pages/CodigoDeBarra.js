import React, { Component } from "react";
import { SafeAreaView, Text, View, Button, StyleSheet,DeviceEventEmitter,FlatList} from "react-native";
import {NativeModules} from 'react-native';

var GertecGPOS700 = NativeModules.GertecGPOS700;

export default class CodigoDeBarra extends Component  {
    constructor(props) {    
        super(props);
        this.state = {
            input: '',
            arrayHolder: []
        }
    }

    componentDidMount(){
        DeviceEventEmitter.addListener("eventName", event => {
            this.setState({
                arrayHolder: [...this.state.arrayHolder, event.bar] 
            })}
        );
    }

    startCamera(title){
        GertecGPOS700.startCameraV1(title);
    };

    Barcodes(){
        return ["EAN 8", "EAN 13", "EAN 14", "QRCODE"].map(e =>
            <Button 
                title={e}
                onClick={(e) => this.startCamera(e)}
            />
        )
    };

    render() {
        return (
            <SafeAreaView>
                <View>
                    <Text style={{fontSize: 30, textAlign: 'center', fontWeight: 'bold', height: 50}}>Ler código de barras</Text>
                </View>
            
                <View style={styles.fixToText}>       
                    { 
                        ["EAN 8", "EAN 13", "EAN 14", "QRCODE"].map(e =>
                        <Button title={e} onPress={(i) =>  this.startCamera(e)} />
                        ) 
                    }
                </View>
            
                <View style={{ height: 0.5, width: "100%", backgroundColor: "#000" , marginTop: 20}} />
                
                <FlatList
                    data={this.state.arrayHolder}
                    width='100%'
                    extraData={this.state.arrayHolder}
                    keyExtractor={(index) => index.toString()}
                    ItemSeparatorComponent={this.FlatListItemSeparator}
                    renderItem={({ item }) => <Text style={{fontSize: 18, fontWeight: 'bold', color: 'gray'}} > {item} </Text>}
                />
            </SafeAreaView>   
        );
    };
};

const styles = StyleSheet.create({
    fixToText: {
        flexDirection: 'row',
        justifyContent: 'space-between',
        height: 30,
        marginStart: 15,
        marginEnd: 15,
    },
    item: {
        flexDirection: 'row',
    }
});