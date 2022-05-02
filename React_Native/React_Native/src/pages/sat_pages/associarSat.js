import React, { Component } from "react";
import { Text, View, Alert,Picker,TextInput,Button, DeviceEventEmitter } from "react-native";
import { SafeAreaView } from "react-native-safe-area-context";
import {TextInputMask} from 'react-native-masked-text';

import ValidaCodigo from '../../components/ValidacaoCodigo';
import ValidacaoCnpj from "../../components/ValidacaoCnpj";

import OperacaoSat from '../../services/operacaoSat';
import RetornoSat from '../../services/retornoSat';


export default class AssociarSat extends Component{
    
    constructor(props) {
        super(props);    
        this.state = {
            codigoAtivacao: global.MyVar,
            assinaturaAc: '',
            cnpj: '',// CNPJ do contribuinte
            cnpjSH: '', // CNPJ do Software House
            
        };
    }
    
    dialogoSat(messageText){
        Alert.alert("Retorno", messageText);
    }

    associarSat(){
        // Salva  o código de ativação para o usuario não precisar ficar digitando em todas as telas 
        global.MyVar = this.state.codigoAtivacao

        // CRIA UMA INSTÂNCIAS DO COMPONENTE QUE VALIDA O CÓDIGO E CNPJ
        var validationCodigo = new ValidaCodigo();
        var validationCnpj = new ValidacaoCnpj();

        // Limpeza dos CNPJs
        var cnpj = validationCnpj.getClean(this.state.cnpj.toString());
        var cnpjSH = validationCnpj.getClean(this.state.cnpjSH.toString());

        if(validationCodigo.getValidation(this.state.codigoAtivacao)){
            if(this.state.assinaturaAc.length != 0 ){
                if(validationCnpj.getSize(cnpj) || validationCnpj.getSize(cnpjSH)){
                    this.dialogoSat("Verifique o CNPJ digitado!");
                }else{
                    //ENVIA PARA OPERAÇÃO SAT ONDE VAI CONECTAR COM O SAT DE ACORDO COM A FUNÇÃO
                    var operacaoSat = new OperacaoSat();
                    args = {'funcao': 'AssociarSAT', 
                            'random': Math.floor(Math.random() * 9999999).toString(),
                            'codigoAtivar': this.state.codigoAtivacao,
                            'cnpj': this.state.cnpj,
                            'cnpjSH': cnpjSH,
                            'assinatura': this.state.assinaturaAc
                    };
                    operacaoSat.invocarOperacaoSat(args);
            
                    DeviceEventEmitter.once("eventAssociar", event => { 
                        var retorno = event.associar;
                        var retornoSat = new RetornoSat(args['funcao'], retorno);
                        this.dialogoSat(operacaoSat.formataRetornoSat(retornoSat));
                    });
                }
            }else {
                dialogoSat("Assinatura AC Inválida!");
            }
        }else {
            dialogoSat("Código de Ativação deve ter entre 8 a 32 caracteres!");
        }
    }
    
    render() {
        return (
            <SafeAreaView>
                <View style={{ marginBottom:10 , marginTop: 20}}>
                        <Text style={{fontSize:20, fontWeight: 'bold'}}>CNPJ Contribuinte</Text>
                        <View 
                            style={{backgroundColor:'white',
                                width:300,
                                marginStart:30,
                                marginBottom:10}
                            }
                        >
                            <TextInputMask
                                type={'cnpj'}  
                                value={this.state.cnpj}
                                onChangeText={text => {
                                    this.setState({
                                    cnpj: text
                                    })
                                }}
                            />
                        </View>
                </View>
                    
                <View style={{ marginBottom:10, }}>
                    <Text style={{fontSize:20, fontWeight: 'bold'}}>CNPJ Software House</Text>
                    <View style={{backgroundColor:'white',
                            width:300,
                            marginStart:30,
                            marginBottom:10, }}>
                        <TextInputMask
                            type={'cnpj'}
                            value={this.state.cnpjSH}
                            onChangeText={text => {
                                this.setState({
                                cnpjSH: text
                                })
                            }}
                        />
                    </View>
                </View>

                <View style={{ marginBottom:10,flexDirection:'row',justifyContent:'space-between' }}>
                    <Text style={{fontSize:20, fontWeight: 'bold'}}>Código de Ativação</Text>

                    <TextInput           
                        style={{height: 50,backgroundColor: 'white', fontSize: 17,width:160, marginRight:10}}
                        value={this.state.codigoAtivacao}
                        onChangeText={(text) => this.setState({codigoAtivacao: text})}  
                    />
                </View>

                <View style={{ marginBottom:10,flexDirection:'row',justifyContent:'space-between' }}>
                    <Text style={{fontSize:20, fontWeight: 'bold'}}>Assinatura AC</Text>

                    <TextInput           
                        style={{height: 50,backgroundColor: 'white', fontSize: 17,width:200, marginRight:10}}  
                        value={this.state.assinaturaAc}
                        onChangeText={(text) => this.setState({assinaturaAc: text})}
                    />
                </View>
                    
                <View style={{marginTop: 30, marginStart: 20, marginEnd: 20, marginBottom: 2}}>
                    <Button
                        color= 'gray'
                        title="associar"
                        onPress={() => this.associarSat()}
                    />
                </View>
            </SafeAreaView>
        );
    }
}