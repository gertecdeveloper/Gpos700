import React, { Component } from "react";
import { Text, View, Alert,Picker,TextInput,Button,DeviceEventEmitter } from "react-native";
import { SafeAreaView } from "react-native-safe-area-context";

import OperacaoSat from '../../services/operacaoSat';
import RetornoSat from '../../services/retornoSat';

import ValidaCodigo from '../../components/ValidacaoCodigo';

export default class AlterarCodigo extends Component {
    constructor(props) {
        super(props);
        this.state = {
            opcao:'Codigo de ativacao',
            codigoAtivacao:global.MyVar,
            codigoAtivacaoNovo:'',
            confirmarCodigo:'',
        };
    }

    dialogoSat(messageText){
        Alert.alert("Retorno", messageText);
    }
  
    // Função para validar os valores digitos pelo usuario e realizar a ativação do SAT
    alterarCodigoSat(){
        // Salva  o código de ativação para o usuario não precisar ficar digitando em todas as telas 
        global.MyVar = this.state.codigoAtivacao

        // CRIA UMA INSTÂNCIA DO COMPONENTE QUE VALIDA O CÓDIGO
        var validationCodigo = new ValidaCodigo();

        if(validationCodigo.getValidation(this.state.codigoAtivacao) && validationCodigo.getValidation(this.state.codigoAtivacaoNovo)){
            if(this.state.codigoAtivacaoNovo == this.state.confirmarCodigo){
                // Caso todos os valores estejam corretos
                // Envia para o canal de ativação a função de alterar codigo do Sat
                var op = 0;

                // No Java o Sat reconhece 1 - Como sendo a opção de mudar codigo de ativação
                // 2 como sendo a opção de alterar codigo de emergência
                if(this.state.opcao == "Codigo de ativacao"){
                    op = 1;
                }else{
                    op = 2;
                }

                //ENVIA PARA OPERAÇÃO SAT ONDE VAI CONECTAR COM O SAT DE ACORDO COM A FUNÇÃP
                var operacaoSat = new OperacaoSat();
                args = {'funcao': 'TrocarCodAtivacao',
                        'random': Math.floor(Math.random() * 9999999).toString(),
                        'codigoAtivar': this.state.codigoAtivacao,
                        'codigoAtivarNovo': this.state.codigoAtivacaoNovo,
                        'op': op.toString()
                };
                operacaoSat.invocarOperacaoSat(args);

                DeviceEventEmitter.once("eventAlterar", event => { 
                    var retorno = event.alterar;
                    var retornoSat = new RetornoSat(args['funcao'], retorno);
                    this.dialogoSat(operacaoSat.formataRetornoSat(retornoSat));
                });
            }else{
                this.dialogoSat("O Código de Ativação Novo e a Confirmação do Código de Ativação não correspondem!");
            }
        } else{
            this.dialogoSat("Código de Ativação deve ter entre 8 a 32 caracteres!")
        }
    }

    render() {
        return (
            <SafeAreaView>
                <View style={{justifyContent:'space-between', flexDirection:'row', marginTop:20, marginBottom:10}}>
                    <Text style={{ fontSize:20, fontWeight:'bold' }} >Opções </Text>
                    <Picker 
                        selectedValue={this.state.opcao}
                        style={{height: 30, width: 200,marginEnd:100 }}
                        onValueChange={(itemValue, itemIndex) =>this.setState({opcao:itemValue})}
                    >      
                        <Picker.Item label="Código de ativação" value="Codigo de ativacao" />
                        <Picker.Item label="Código de emergencia" value="Codigo de emergencia" />
                    </Picker>
                </View>

                <View style={{ marginBottom:10,flexDirection:'row',justifyContent:'space-between' }}>
                    <Text style={{fontSize:20, fontWeight: 'bold'}}>Atual</Text>
                    <TextInput
                        style={{height: 50,backgroundColor: 'white', fontSize: 17,width:250, marginRight:50}}
                        value={this.state.codigoAtivacao}
                        onChangeText={(text) => this.setState({codigoAtivacao: text})}  
                    />  
                </View>

                <View style={{ marginBottom:10,flexDirection:'row',justifyContent:'space-between' }}>
                    <Text style={{fontSize:20, fontWeight: 'bold'}}>Novo</Text>
                    <TextInput
                        style={{height: 50,backgroundColor: 'white', fontSize: 17,width:250, marginRight:50}}
                        value={this.state.codigoAtivacaoNovo}
                        onChangeText={(text) => this.setState({codigoAtivacaoNovo: text})}  
                    />
                </View>

                <View style={{ marginBottom:10,flexDirection:'row',justifyContent:'space-between' }}>
                    <Text style={{fontSize:20, fontWeight: 'bold'}}>Confirmar</Text>
                    <TextInput
                        style={{height: 50,backgroundColor: 'white', fontSize: 17,width:250, marginRight:10}}            
                        value={this.state.confirmarCodigo}
                        onChangeText={(text) => this.setState({confirmarCodigo: text})}  
                    />
                </View>
                 
                <View style={{marginTop: 30, marginStart: 20, marginEnd: 20, marginBottom: 2}}>
                    <Button
                        color= 'gray'
                        title="alterar"
                        onPress={() => this.alterarCodigoSat()}
                    />
                </View>

            </SafeAreaView>   
        );
    }
}


