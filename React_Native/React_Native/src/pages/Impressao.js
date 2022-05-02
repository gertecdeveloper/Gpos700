import React, { Component } from 'react';  
import { Text, TextInput, View ,StyleSheet,Button, NativeModules,TouchableOpacity, Picker, DeviceEventEmitter, Alert} from 'react-native';  

import RadioForm from 'react-native-simple-radio-button';
  
var GertecGPOS700 = NativeModules.GertecGPOS700;

state = {
    toggle:true,
    toggle2:true,
    toggle3:true,
}

var hobbies = [
    {label: 'Esquerda', value: 'LEFT' },
    {label: 'Centralizado', value:'CENTER'},
    {label: 'Direita', value: 'RIGHT' } 
];
  
  
export default class Impressao extends Component {
    constructor(props) {  
        super(props);  
        this.state = {text: '',statusPrint:false};
    }

    async componentDidMount(){
        DeviceEventEmitter.addListener("eventStatus", event => { 
            this.setState({statusPrint:event.status})
        });
    }
   
    _onPress(){
        const newState = !this.state.toggle;
        this.setState({toggle: newState})
    }

    _onPress1(){
        const newState = !this.state.toggle2;
        this.setState({toggle2: newState})
    }

    _onPress2(){
        const newState = !this.state.toggle3;
        this.setState({toggle3: newState});
    }
   
    imprimeTexto(text, language1, language2, toggle, toggle2, toggle3, alinhamento){

        if(language1==null){ language1="DEFAULT" };
        if(language2==null){ language2=60 };
        if(toggle==null){ toggle=false };
        if(toggle2==null){ toggle2=false };
        if(toggle3==null){ toggle3=false };
        if(alinhamento==null){ alinhamento="CENTER" };

        if(text == null || text == '' ){
            Alert.alert('Preencha o texto')
            if(text=='') text=null;
        };

        if (text != null){
            GertecGPOS700.imprimeTexto(text, language1, parseInt(language2,10), toggle, toggle2, toggle3, alinhamento);
            GertecGPOS700.fimImpressao();//irá finalizar a impressão, fica a critério onde será colocado, solução para otimizar tempo de impressão
            GertecGPOS700.avancaLinha(150);//função para avançar linhas na impressão 
        };
    };


    imprimeBarCode(texto,height,width,barCodeType){
        if(height==null){ height = "280" };
        if(width==null){ width = "280" };
        if(barCodeType==null){ barCodeType="QR_CODE" };

        if(texto==null || texto=='' ){
            Alert.alert('Preencha o texto')
            if(texto=='')texto=null;
        };

        if (texto!=null){
            GertecGPOS700.imprimeBarCode(texto,parseInt(height,10),parseInt(width,10),barCodeType);
            GertecGPOS700.fimImpressao();//irá finalizar a impressão, fica a critério onde será colocado, solução para otimizar tempo de impressão
            GertecGPOS700.avancaLinha(150);//função para avançar linhas na impressão 
        }
    };

    imprimeTudo(){
        GertecGPOS700.imprimeTudo();
        GertecGPOS700.fimImpressao();//irá finalizar a impressão, fica a critério onde será colocado, solução para otimizar tempo de impressão
        GertecGPOS700.avancaLinha(150);//função para avançar linhas na impressão 
    };

    imprimeImagem(){
        GertecGPOS700.imprimeImagem();
        GertecGPOS700.fimImpressao();//irá finalizar a impressão, fica a critério onde será colocado, solução para otimizar tempo de impressão
        GertecGPOS700.avancaLinha(150);//função para avançar linhas na impressão 
    };
    
    statusImpressora(){  
        GertecGPOS700.statusImpressora();
        setTimeout(() => { 
            Alert.alert('STATUS', this.state.statusPrint);
        }, 100);
    }

    render() {
        const {toggle} = this.state;
        const {toggle2} = this.state;
        const {toggle3} = this.state;
   
        const borderC = toggle? "blue":"white"
       
        const textColor = toggle? "black":"white"
        const borderC2 = toggle2? "blue":"white"
       
        const textColor2 = toggle2? "black":"white"
        const borderC3 = toggle3? "blue":"white"
       
        const textColor3 = toggle3? "black":"white"

        return (
            <View>
                <Text style={{color:'gray', fontSize: 23, fontWeight:'bold', marginLeft:15, marginRight:15}}>Funções Impressão G700/G800</Text>

                <View style={{ marginLeft: 15, marginRight:15}}>  
                    <Button
                        color= 'gray'
                        title="STATUS IMPRESSORA"
                        onPress={() => this.statusImpressora()}
                    />
                    
                    <TextInput           
                        style={{height: 50,backgroundColor: 'white', fontSize: 20,}}  
                        placeholder="Escreva sua mensagem"  
                        onChangeText={(text) => this.setState({input: text})}
                    />
                </View>

                <Text style={{color:'gray', fontSize: 25, fontWeight:'bold', marginLeft:15, marginRight:15, textAlign: 'center'}}>Configuração de impressão</Text>

                <View style={styles.fixToText}>
                    <RadioForm
                        radio_props={hobbies}
                        initial={false}
                        onPress={(value) => this.setState({value:value})}
                        buttonSize={20}
                        buttonOuterSize={20}
                        selectedButtonColor={'blue'}
                        buttonColor={'black'}
                        labelStyle={{ fontSize: 15,color:'black',marginEnd:20}}
                        disabled={false}
                        formHorizontal={true}
                    />  
                </View>
                
                <View style={styles.fixToText2}>   
                    <TouchableOpacity
                        onPress= {()=>this._onPress()}
                        style={{width:100,height:50, backgroundColor:'gray', justifyContent:'center',borderColor:borderC,borderWidth:2, marginStart: 9}}>
                        <Text style={{color:textColor,textAlign:'center',fontSize:16}}>NEGRITO</Text>
                    </TouchableOpacity>

                    <TouchableOpacity
                        onPress= {()=>this._onPress1()}
                        style={{width:100, height:50, backgroundColor:'gray', justifyContent:'center',borderColor:borderC2,borderWidth:2}}>
                        <Text style={{color:textColor2,textAlign:'center',fontSize:16}}>ITÁLICO</Text>
                    </TouchableOpacity>

                    <TouchableOpacity
                        onPress= {()=>this._onPress2()}
                        style={{width:150,height:50, backgroundColor:'gray', justifyContent:'center',borderColor:borderC3,borderWidth:2, marginEnd:25}}>
                        <Text style={{color:textColor3,textAlign:'center',fontSize:16}}>SUBLINHADO</Text>
                    </TouchableOpacity>
                </View>
               
                <View style={styles.fixToText2}>
                    <Text style={{marginStart: 15 ,color: 'gray', fontSize:20 }} >Font:</Text>
                    <Picker
                        selectedValue={this.state.language1}
                        style={{height: 30, width: 100, }}
                        onValueChange={(itemValue, itemIndex) =>
                            this.setState({language1: itemValue})
                        }>
                        <Picker.Item label="DEFAULT" value="DEFAULT" />
                        <Picker.Item label="MONOSPACE" value="MONOSPACE" />
                        <Picker.Item label="SANS SERIF" value="SANS SERIF" />
                        <Picker.Item label="SERIF" value="SERIF" />
                        <Picker.Item label="VECTRA.otf" value="VECTRA.otf" />
                    </Picker>
                   
                    <Text style={{ color: 'gray', fontSize:20 }} >Size:</Text>
                    <Picker
                        selectedValue={this.state.language2}
                        style={{height: 30, width: 100, }}
                        onValueChange={(itemValue, itemIndex) =>
                            this.setState({language2: itemValue})
                        }>
                        
                        
                        <Picker.Item label="60" value="60"/>
                        <Picker.Item label="20" value="20" />
                        <Picker.Item label="30" value="30" />
                        <Picker.Item label="40" value="40" />
                        <Picker.Item label="50" value="50" />
                        <Picker.Item label="70" value="70" />
                        <Picker.Item label="80" value="80" />
                        <Picker.Item label="90" value="90" />
                        <Picker.Item label="100" value="100" />
                    </Picker>
                </View>
               
                <View style={styles.fixToText}> 
                    <Button
                        color= 'gray'
                        title="IMPRIMIR TEXTO"
                        onPress={() =>this.imprimeTexto(
                            this.state.input,
                            this.state.language1,
                            this.state.language2,
                            this.state.toggle,
                            this.state.toggle2,
                            this.state.toggle3,
                            this.state.value)
                        }
                    >
                        <View style={{ height: 0.5, width: "100%", backgroundColor: "black" }} />
                    </Button>
                    <Button
                        color= 'gray'
                        title="IMPRIMIR IMAGEM"
                        onPress={() => this.imprimeImagem()}
                    />
                </View>

                <View style={{marginStart:3,   flexDirection: 'row', justifyContent: 'space-between',marginEnd:20}} >
                    <Text style={{marginStart: 15 ,color: 'gray', fontSize:15}} >Bar code Height:</Text>
                    <Text style={{ color: 'gray', fontSize:15 }} >Bar Code Width:</Text>
                    <Text style={{marginStart: 15 ,color: 'gray', fontSize:15 }} >Bar Codes:</Text>
                </View>

                <View style={{marginStart:10,   flexDirection: 'row', justifyContent: 'space-between',marginEnd:10}} >
                    <Picker
                        selectedValue={this.state.language3}
                        style={{height: 30, width: 100, }}
                        onValueChange={(itemValue, itemIndex) =>
                            this.setState({language3: itemValue})
                    }>
                        <Picker.Item label="280" value="280" />
                        <Picker.Item label="10" value="10" />
                        <Picker.Item label="40" value="40" />
                        <Picker.Item label="80" value="80" />
                        <Picker.Item label="120" value="120" />
                        <Picker.Item label="160" value="160" />
                        <Picker.Item label="200" value="200" />
                        <Picker.Item label="240" value="240" />
                        <Picker.Item label="320" value="320" />
                        <Picker.Item label="380" value="380" />
                    </Picker>
                   
                    <Picker
                        selectedValue={this.state.language4}
                        style={{height: 30, width: 80, }}
                        onValueChange={(itemValue, itemIndex) =>
                            this.setState({language4: itemValue})
                    }>
                        <Picker.Item label="280" value="280" />
                        <Picker.Item label="10" value="10" />
                        <Picker.Item label="40" value="40" />
                        <Picker.Item label="80" value="80" />
                        <Picker.Item label="120" value="120" />
                        <Picker.Item label="160" value="160" />
                        <Picker.Item label="200" value="200" />
                        <Picker.Item label="240" value="240" />
                        <Picker.Item label="320" value="320" />
                        <Picker.Item label="380" value="380" />  
                    </Picker>

                    <Picker
                        selectedValue={this.state.language5}
                        style={{height: 30, width: 110, }}
                        onValueChange={(itemValue, itemIndex) =>
                            this.setState({language5: itemValue})
                    }>
                        <Picker.Item label="QR_CODE" value="QR_CODE" />
                        <Picker.Item label="CODE_128" value="CODE_128" />
                        <Picker.Item label="EAN_8" value="EAN_8"/>
                        <Picker.Item label="EAN_13" value="EAN_13"/>
                        <Picker.Item label="PDF_417" value="PDF_417" />
                    </Picker>
                </View>
              
                <View style={{marginTop: 20, marginLeft: 15, marginRight:15}}>
                    <Button
                        color= 'gray'
                        title="IMPRIMIR BARCODE"
                        onPress={() => this.imprimeBarCode(this.state.input,this.state.language3,this.state.language4,this.state.language5)}
                    />
                </View>
            
                <View style={{marginTop: 20, marginLeft: 15, marginRight:15}}>
                    <Button
                        color= 'gray'
                        title="IMPRIMIR TODAS AS FUNÇÕES"
                        onPress={() => this.imprimeTudo()}
                    />
                </View>
            </View>
        );  
    };
};

const styles = StyleSheet.create({
    fixToText: {     
        marginLeft: 15,
        marginRight: 15,
        marginTop:10,
        flexDirection: 'row',
        justifyContent: 'space-between',
    },
    fixToText2:{
        flexDirection: 'row',
        justifyContent: 'space-between',
    }
});