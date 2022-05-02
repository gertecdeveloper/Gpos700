import React, { Component } from "react";
import { Text, View, Alert,Picker,TextInput,Button,DeviceEventEmitter } from "react-native";
import { SafeAreaView } from "react-native-safe-area-context";

import OperacaoSat from '../../services/operacaoSat';
import RetornoSat from '../../services/retornoSat';

import ValidaCodigo from '../../components/ValidacaoCodigo';

export default class FerramentasSat extends Component{
    constructor(props) {
        super(props);    
        this.state = {
            value:'',
            codigoAtivacao: global.MyVar,
        };
    }

    dialogoSat(messageText){
        Alert.alert("Retorno", messageText);
    }

    ferramentasSat(funcao){
        // Salva  o código de ativação para o usuario não precisar ficar digitando em todas as telas
        global.MyVar = this.state.codigoAtivacao
        this.state.value = funcao;

        // CRIA UMA INSTÂNCIA DO COMPONENTE QUE VALIDA O CÓDIGO
        var validationCodigo = new ValidaCodigo();
        
        if(validationCodigo.getValidation(this.state.codigoAtivacao)){

            //ENVIA PARA OPERAÇÃO SAT ONDE VAI CONECTAR COM O SAT DE ACORDO COM A FUNÇÃO
            var operacaoSat = new OperacaoSat();
            args = {'funcao': funcao, 
                    'random': Math.floor(Math.random() * 9999999).toString(),
                    'codigoAtivar': this.state.codigoAtivacao
            };
            operacaoSat.invocarOperacaoSat(args);
            
            DeviceEventEmitter.once("eventFerramenta", event => { 
                var retorno = event.ferramenta;
                var retornoSat = new RetornoSat(args['funcao'], retorno);
                this.dialogoSat(operacaoSat.formataRetornoSat(retornoSat));
            });
        }else{
            this.dialogoSat("Código de Ativação deve ter entre 8 a 32 caracteres!");
        }
    }
    
    render() {
        return (  
             <SafeAreaView>   
                <View style={{ marginBottom:10,justifyContent:'space-between', marginTop: 30 }}>
                    <Text style={{fontSize:20, fontWeight: 'bold'}}>Código de Ativação Sat</Text>
                    <TextInput
                        style={{height: 50,backgroundColor: 'white', fontSize: 17,width:300, marginStart: 30}}                
                        value={this.state.codigoAtivacao}
                        onChangeText={(text) => this.setState({codigoAtivacao: text})}
                    />
                </View>
                     
                <View style={{marginTop: 15, marginStart: 20, marginEnd: 20}}>
                    <Button
                        color= 'gray'
                        title="bloquear sat"
                        onPress={() => this.ferramentasSat("BloquearSat")}
                    />
                </View>

                <View style={{marginTop: 15, marginStart: 20, marginEnd: 20}}>
                    <Button
                        color= 'gray'
                        title="desbloquear sat"
                        onPress={() => this.ferramentasSat("DesbloquearSat")}
                    />
                </View>

                <View style={{marginTop: 15, marginStart: 20, marginEnd: 20}}>
                    <Button
                        color= 'gray'
                        title="extrair log"
                        onPress={() => this.ferramentasSat("ExtrairLog")}
                    />
                </View>

                <View style={{marginTop: 15, marginStart: 20, marginEnd: 20}}>
                    <Button
                        color= 'gray'
                        title="atualizar software"
                        onPress={() => this.ferramentasSat("AtualizarSoftware")}
                    />
                </View>

                <View style={{marginTop: 15, marginStart: 20, marginEnd: 20}}>
                    <Button
                        color= 'gray'
                        title="verificar versão"
                        onPress={() => this.ferramentasSat("Versao")}
                    />
                </View>
            </SafeAreaView>
        )
    }
}