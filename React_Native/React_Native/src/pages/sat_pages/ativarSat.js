import React, { Component } from "react";

import { Text, View, Alert,StyleSheet,TextInput,Button, DeviceEventEmitter } from "react-native";
import { SafeAreaView } from "react-native-safe-area-context";
import {TextInputMask} from 'react-native-masked-text';

import ValidaCodigo from '../../components/ValidacaoCodigo';
import ValidacaoCnpj from "../../components/ValidacaoCnpj";

import OperacaoSat from '../../services/operacaoSat';
import RetornoSat from '../../services/retornoSat';

export default class AtivarSat extends Component{
    constructor(props) {
        super(props);       
        this.state = {
            cnpj:'',// CNPJ do contribuinte
            codigoAtivacao:global.MyVar,
            confirmacaoCodigo:''
        };
    }

    dialogoSat(messageText){
        Alert.alert("Retorno", messageText);
    }

    ativarSat(){
        // Salva  o código de ativação para o usuario não precisar ficar digitando em todas as telas
        global.MyVar = this.state.codigoAtivacao;

        // CRIA UMA INSTÂNCIAS DO COMPONENTE QUE VALIDA O CÓDIGO E CNPJ
        var validationCodigo = new ValidaCodigo();
        var validationCnpj = new ValidacaoCnpj();

        //LIMPEZA DO CNPJ DE ENTRADA
        var cnpj = validationCnpj.getClean(this.state.cnpj.toString());    

        if(validationCodigo.getValidation(this.state.codigoAtivacao)){
            if(this.state.codigoAtivacao==this.state.confirmacaoCodigo){
                if(validationCnpj.getSize(cnpj)){
                    this.dialogoSat("Verifique o CNPJ digitado!");
                }else{
                    
                    //ENVIA PARA OPERAÇÃO SAT ONDE VAI CONECTAR COM O SAT DE ACORDO COM A FUNÇÃP
                    var operacaoSat = new OperacaoSat();
                    args = {'funcao': 'AtivarSAT',
                            'random': Math.floor(Math.random() * 9999999).toString(),
                            'codigoAtivar': this.state.codigoAtivacao,
                            'cnpj': this.state.cnpj};
                    operacaoSat.invocarOperacaoSat(args);
                    
                    //RECEBE OS DADOS QUE FORAM ENVIADOS NA REPOSTA
                    DeviceEventEmitter.once("eventAtivar", event=> { 
                        var retorno = event.ativar;
                        var retornoSat = new RetornoSat(args['funcao'], retorno);
                        this.dialogoSat(operacaoSat.formataRetornoSat(retornoSat));
                    });
                }

            }else{
                this.dialogoSat("O Código de Ativação e a Confirmação do Código de Ativação não correspondem!");
            }
        }else{
            //console.log('XXXX: ', validationCnpj.getValidation(this.state.codigoAtivacao));
            this.dialogoSat("Código de Ativação deve ter entre 8 a 32 caracteres!");
        }
    }

    render() {
        return (
            <SafeAreaView>
                <View style={styles.containerCnpj}>
                    <Text style={styles.titleDefault}>CNPJ Contribuinte</Text>
                    <View style={styles.containerInput}>
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
                    
                <View style={styles.containerDefault}>
                    <Text style={styles.titleDefault}>Código de Ativação Sat</Text>
                    <TextInput           
                        style={styles.inputDefault}  
                        value={this.state.codigoAtivacao}
                        onChangeText={(text) => this.setState({codigoAtivacao: text})} 
                    />
                </View>

                <View style={styles.containerDefault}>
                    <Text style={styles.titleDefault}>Confirmação do Código</Text>
                    <TextInput           
                        style={styles.inputDefault}    
                        value={this.state.confirmacaoCodigo}
                        onChangeText={(text) => this.setState({confirmacaoCodigo: text})}  
                    />
                </View>
                    
                <View style={styles.containerButton}>
                    <Button
                        color= 'gray'
                        title="ativar"
                        onPress={() => this.ativarSat()}
                        />
                </View>
                
            </SafeAreaView>    
        );
    } 
}

const styles = StyleSheet.create({
    containerCnpj: {
        marginBottom:10,
        marginTop: 20
    },
    titleDefault: {
        fontSize:20,
        fontWeight: 'bold',
        marginStart: 30
    },
    containerInput: {
        backgroundColor:'white',
        width:300,
        marginStart:30,
        marginBottom:10
    },
    containerDefault: {
        marginBottom:10,
        justifyContent:'space-between' 
    },
    inputDefault: {
        height: 50,
        backgroundColor: 'white',
        fontSize: 17,
        width:300,
        marginStart:30
    },
    containerButton: {
        marginTop: 30,
        marginStart: 20,
        marginEnd: 20,
        marginBottom: 2
    }
});