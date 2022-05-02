import React, { Component } from "react";
import { Text, View, Alert,Picker,TextInput,Button, DeviceEventEmitter } from "react-native";
import { SafeAreaView } from "react-native-safe-area-context";
import DialogInput from 'react-native-dialog-input';

import RetornoArquivoXml from '../../services/retornoArquivoXml';
import OperacaoSat from '../../services/operacaoSat';
import RetornoSat from '../../services/retornoSat';

import ValidaCodigo from '../../components/ValidacaoCodigo';
import '../../services/globalValue';

export default class TesteSat extends Component{
    constructor(props) {
        super(props);
        this.state = {
            isDialogVisible1:false,
            isDialogVisible2:false,
            codigoAtivacao:global.MyVar,
            inputCancela: global.ChaveConsulta,// Chave de cancelamento
            inputConsulta:'000',
            funcao: '',

            xmlCancelamento: '',
            xmlVenda:'',  
        };
    }

    async componentDidMount(){  
        // Transforma os Xml em base 64 e envia para o Java Android transmitir para a Sefaz
        var retornoArqXml = new RetornoArquivoXml();
        this.state.xmlCancelamento = await this.createFile(retornoArqXml.getArq_cancelamentoXml(), 'arq_cancelamento.xml')
        this.state.xmlVenda = await this.createFile(retornoArqXml.getArq_vendaXml(),'arq_venda.xml')
    }

    async createFile(writeFile, filename){
        // Cria o arquivo xml no seu dispositivo para ser lido e transformado em base64
        const RNFS = require('react-native-fs');

        var path = RNFS.DocumentDirectoryPath + '/' + filename;

        RNFS.writeFile(path, writeFile,'utf8').then((success) => {
            console.log('FILE WRITTEN!');
          })
          .catch((err) => {
            console.log('erro');
        });
        
        var k = await this.transformarbase64(path);
        return await this.transformarbase64(path);
    }

    async transformarbase64(path) {
        const RNFS = require('react-native-fs');
       
        // lê o arquivo que será criado no caminho especificado do dispositivo
        const  file1 = await RNFS.readFile(path,'base64');
       
        return file1
    }

    dialogoSat(messageText){
        Alert.alert("Retorno", messageText);
    }

    testeSat(texto,funcao){
        // Salva  o código de ativação para o usuario não precisar ficar digitando em todas as telas 
        global.MyVar = this.state.codigoAtivacao;
        global.ChaveConsulta = this.state.inputCancela;

        // CRIA UMA INSTÂNCIA DO COMPONENTE QUE VALIDA O CÓDIGO
        var validationCodigo = new ValidaCodigo();

        this.setState({funcao:funcao})

        //console.log('texto: '+texto)

        if(funcao=="CancelarUltimaVenda"){
            this.state.inputCancela=texto;
        }else if(funcao== "ConsultarNumeroSessao"){
            this.state.inputConsulta=texto;
        }
      
        //console.log('cancela: '+this.state.inputCancela)
        this.setState({isDialogVisible1: false});
        this.setState({isDialogVisible2: false});

        if(funcao == "ConsultarSat" || validationCodigo.getValidation(this.state.codigoAtivacao)){    
            //ENVIA PARA OPERAÇÃO SAT ONDE VAI CONECTAR COM O SAT DE ACORDO COM A FUNÇÃP
            var operacaoSat = new OperacaoSat();
            args = {'funcao': funcao, 
                    'random': Math.floor(Math.random() * 9999999).toString(),
                    'codigoAtivar': this.state.codigoAtivacao,
                    'cancela': this.state.inputCancela,
                    'sessao': this.state.inputConsulta,
                    'xmlVenda': this.state.xmlVenda,
                    'xmlCancelamento': this.state.xmlCancelamento
            };
            operacaoSat.invocarOperacaoSat(args);

            DeviceEventEmitter.once("eventTeste", event => {
                var retorno = event.teste;
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
                        title="consultar sat"
                        onPress={() => this.testeSat('',"ConsultarSat")}
                    />
                </View>

                <View style={{marginTop: 15, marginStart: 20, marginEnd: 20}}>
                    <Button
                        color= 'gray'
                        title="status operacional"
                        onPress={() => this.testeSat('',"ConsultarStatusOperacional")}
                    />
                </View>

                <View style={{marginTop: 15, marginStart: 20, marginEnd: 20}}>
                    <Button
                        color= 'gray'
                        title="teste fim a fim"
                        onPress={() => this.testeSat('', "EnviarTesteFim")}
                    />
                </View>

                <View style={{marginTop: 15, marginStart: 20, marginEnd: 20}}>
                    <Button
                        color= 'gray'
                        title="enviar dados de venda"
                        onPress={() => this.testeSat('',"EnviarTesteVendas")}
                    />
                </View>

                <View style={{marginTop: 15, marginStart: 20, marginEnd: 20}}>
                    <Button
                        color= 'gray'
                        title="cancelar venda"
                        onPress={() => this.setState({isDialogVisible1:true})}
                    />

                    <DialogInput isDialogVisible={this.state.isDialogVisible1}
                        initValueTextInput={this.state.inputCancela}
                        title={"CANCELAR VENDA"}
                        message={"Digite a chave de cancelamento"}
                        
                        submitInput={ (inputCancela) => {this.testeSat(inputCancela, "CancelarUltimaVenda")} }
                        closeDialog={ () => {this.setState({isDialogVisible1:false})}}>
                    </DialogInput>
                </View>

                <View style={{marginTop: 15, marginStart: 20, marginEnd: 20}}>
                    <Button
                        color= 'gray'
                        title="consultar sessão"
                        onPress={() => this.setState({isDialogVisible2: true})}
                    />

                    <DialogInput isDialogVisible={this.state.isDialogVisible2}
                        initValueTextInput={this.state.inputConsulta}
                        title={"CONSULTAR SESSÃO"}
                        message={"Digite o numero da sessao"}
                        textInputProps={{keyboardType:'numeric'}}
                        
                        submitInput={ (inputConsulta) => {this.testeSat(inputConsulta,"ConsultarNumeroSessao")} }
                        closeDialog={ () => {this.setState({isDialogVisible2:false})}}>
                    </DialogInput>
                </View>
            </SafeAreaView>
        )
    }
}