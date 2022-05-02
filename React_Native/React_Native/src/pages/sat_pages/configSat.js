import React, { Component } from "react";
import { Text, View, Alert,Picker,TextInput,Button, ScrollView, DeviceEventEmitter } from "react-native";
import {TextInputMask} from 'react-native-masked-text';

import OperacaoSat from '../../services/operacaoSat';
import RetornoSat from '../../services/retornoSat';

import ValidaCodigo from '../../components/ValidacaoCodigo';

export default class ConfigSat extends Component{
    constructor(props) {
        super(props);
        this.state = {
           textInputRede: true,
           textInputDns: false,
           textInputProxy: false,
           codigoAtivacao:global.MyVar,
           ipSat:'',
           tipoRede:'estatico',
           mascara:'',
           gateway:'',
           habilitarDNS: 'nao',
           dns1:'',
           dns2:'',
           habilitarProxy: 'nao usa',
           proxyIp:'',
           porta: '',
           user: '',
           password: ''
        };
    }

    dialogoSat(messageText){
        Alert.alert("Retorno", messageText);
    }

    configRede(){
        // Salva  o código de ativação para o usuario não precisar ficar digitando em todas as telas
        global.MyVar = this.state.codigoAtivacao;

        // CRIA UMA INSTÂNCIA DO COMPONENTE QUE VALIDA O CÓDIGO
        var validationCodigo = new ValidaCodigo();

        if(validationCodigo.getValidation(this.state.codigoAtivacao)){
            //ENVIA PARA OPERAÇÃO SAT ONDE VAI CONECTAR COM O SAT DE ACORDO COM A FUNÇÃP
            var operacaoSat = new OperacaoSat();

            args = {'funcao': 'EnviarConfRede', 
                    'random': Math.floor(Math.random() * 9999999),
                    'codigoAtivar': this.state.codigoAtivacao,
                    'dadosXml': this.formatarEnvioConfigRede()
            };
            operacaoSat.invocarOperacaoSat(args);
            

            DeviceEventEmitter.once("eventRede", event=>{
                var retorno = event.rede;
                var retornoSat = new RetornoSat(args['funcao'], retorno);
                this.dialogoSat(operacaoSat.formataRetornoSat(retornoSat));
            });
        }else{
          this.dialogoSat("Código de Ativação deve ter entre 8 a 32 caracteres!");
        }
    }

    // Configuracao os dados a serem enviados para o Sat
    formatarEnvioConfigRede(){
        var dadosXml = [];

        dadosXml[0] = "";
        dadosXml[1] = "";
        dadosXml[2] = "";
        dadosXml[3] = "";
        dadosXml[4] = "";
        dadosXml[5] = "";
        dadosXml[6] = "";
        dadosXml[7] = "";
        dadosXml[8] = "";
        dadosXml[9] = "";
        dadosXml[10] = "";


        // Monta as tags do XML sobre a parte de REDE
        if (this.state.tipoRede == "estatico") {

            dadosXml[0] = "<tipoLan>IPFIX</tipoLan>";

            if (this.state.ipSat != '') { dadosXml[1] = "<lanIP>" + this.state.ipSat + "</lanIP>"; };
            if (this.state.mascara != '') { dadosXml[2] = "<lanMask>" + this.state.mascara + "</lanMask>"; };
            if (this.state.gateway != '') { dadosXml[3] = "<lanGW>" + this.state.gateway+ "</lanGW>"; };
  
            // Monta as tags do XML sobre a parte de DNS
            if (this.state.habilitarDNS == "sim") {
                if (this.state.dns1!='') { dadosXml[4] = "<lanDNS1>" + this.state.dns1 + "</lanDNS1>"; };
                if (this.state.dns2!='') { dadosXml[5] = "<lanDNS2>" + this.state.dns2 + "</lanDNS2>"; };

            } else {
                dadosXml[4] = "<lanDNS1>8.8.8.8</lanDNS1>";
                dadosXml[5] = "<lanDNS2>4.4.4.4</lanDNS2>";
            }
        }else {
            dadosXml[0] = "<tipoLan>DHCP</tipoLan>";
            dadosXml[1] = "";
            dadosXml[2] = "";
            dadosXml[3] = "";
            dadosXml[4] = "";
            dadosXml[5] = "";
        }
  
        // Monta as tags do XML sobre a parte de PROXY
        if (this.state.habilitarProxy == "nao usa") {
            dadosXml[6] = "<proxy>0</proxy >";
            dadosXml[7] = "";
            dadosXml[8] = "";
            dadosXml[9] = "";
            dadosXml[10] = "";

        } else if (this.state.habilitarProxy == "Proxy com configuração"){
            dadosXml[6] = "<proxy>1</proxy >";
            if (this.state.proxyIp != '') { dadosXml[7] = "<proxy_ip>" + this.state.proxyIp + "</proxy_ip>"; };
            if (this.state.porta != '') { dadosXml[8] = "<proxy_porta>" + this.state.porta + "</proxy_porta>"; };
            if (this.state.user!='') { dadosXml[9] = "<proxy_user>" + this.state.user + "</proxy_user>"; };
            if (this.state.password!='') { dadosXml[10] = "<proxy_senha>" + this.state.password+ "</proxy_senha>"; };
        }else{
            dadosXml[6] = "<proxy>2</proxy >";
            if (this.state.proxyIp != '') { dadosXml[7] = "<proxy_ip>" + this.state.proxyIp + "</proxy_ip>"; };
            if (this.state.porta != '') { dadosXml[8] = "<proxy_porta>" + this.state.porta + "</proxy_porta>"; };
            if (this.state.user != '') { dadosXml[9] = "<proxy_user>" + this.state.user + "</proxy_user>"; };
            if (this.state.password != '') { dadosXml[10] = "<proxy_senha>" + this.state.password + "</proxy_senha>"; };
        }
        
        return dadosXml;
    }

    changeValueRede(s){
        this.state.tipoRede = s;
        if(s === 'DHCP'){
            this.setState({ textInputRede:false})
        }else{
            this.setState({ textInputRede:true})
        }
    }

    changeValueDns(s){
        this.state.habilitarDNS = s;

        if(s === 'sim'){
            this.setState({textInputDns:true})
        }
        else{
            this.setState({textInputDns: false})
        }
    }

    changeValueProxy(s){
        this.state.habilitarProxy = s;
        if(s === 'nao usa'){
            this.setState({textInputProxy: false})
        }else{
            this.setState({textInputProxy: true})
        }
    }
    
    render() {
        return (
            <ScrollView>
                <View style={{ marginBottom:10,justifyContent:'space-between' }}>
                    <Text style={{fontSize:20, fontWeight: 'bold'}}>Código de Ativação</Text>
                    <TextInput           
                        style={{height: 50,backgroundColor: 'white', fontSize: 17,width:300, marginStart:30}}  
                        value={this.state.codigoAtivacao}
                        onChangeText={(text) => this.setState({codigoAtivacao: text})}    
                    />
                </View>
                    
                <View style={{justifyContent:'space-between', flexDirection:'row', marginTop:20, marginBottom:10}}>
                    <Text style={{ fontSize:20, fontWeight:'bold' }}>Tipo de rede</Text>
                    <Picker 
                        selectedValue={this.state.tipoRede}
                        style={{height: 30, width: 200,marginEnd:100 }}
                        onValueChange={(itemValue, itemIndex) =>this.changeValueRede(itemValue)}
                    >   
                        <Picker.Item label="Estático" value="estatico" />
                        <Picker.Item label="DHCP" value="DHCP" />
                    </Picker>
                </View>

                <View style={{ marginBottom:10,flexDirection:'row',justifyContent:'space-between'  }}>
                    <Text style={{fontSize:20, fontWeight: 'bold'}}>IP SAT</Text>

                    <View style={{backgroundColor:this.state.textInputRede? "white" : "#F5F5F5",
                        width:270,
                        marginEnd:15,
                        marginBottom:10, }}
                    >
                        <TextInputMask
                            type={'only-numbers'}
                            value={this.state.ipSat}
                            onChangeText={text => {
                                this.setState({
                                ipSat: text
                                })
                            }}
                            editable={this.state.textInputRede} 
                        />
                    </View>
                </View>
            
                <View style={{ marginBottom:10,flexDirection:'row',justifyContent:'space-between'  }}>
                    <Text style={{fontSize:20, fontWeight: 'bold'}}>Máscara</Text>
                    <View style={{backgroundColor:this.state.textInputRede? "white" : "#F5F5F5",
                        width:265,
                        marginEnd:15,
                        marginBottom:10, }}
                    >
                        <TextInputMask
                            type={'only-numbers'}
                            value={this.state.mascara}
                            onChangeText={text => {
                                this.setState({
                                mascara: text
                                })
                            }}
                            editable={this.state.textInputRede} 
                        />
                    </View>
                </View>

                <View style={{ marginBottom:10,flexDirection:'row',justifyContent:'space-between'  }}>
                    <Text style={{fontSize:20, fontWeight: 'bold'}}>Getway</Text>
                    <View style={{backgroundColor:this.state.textInputRede? "white" : "#F5F5F5",
                        width:270,
                        marginEnd:15,
                        marginBottom:10, }}
                    >
                        <TextInputMask
                            type={'only-numbers'}
                            value={this.state.getway}
                            onChangeText={text => {
                                this.setState({
                                getway: text
                                })
                            }}
                            editable={this.state.textInputRede} 
                        />
                    </View>
                </View>
                    
                <View style={{justifyContent:'space-between', flexDirection:'row', marginTop:20, marginBottom:10}}>
                    <Text style={{ fontSize:20, fontWeight:'bold' }}>DNS</Text>
                    <Picker        
                        selectedValue={this.state.habilitarDNS}
                        style={{height: 30, width: 200,marginEnd:100 }}
                        onValueChange={(itemValue, itemIndex) =>this.changeValueDns(itemValue)}
                    >
                        <Picker.Item label="Não" value="nao" />
                        <Picker.Item label="Sim" value="sim" />
                    </Picker>
                </View>

                <View style={{ marginBottom:10,flexDirection:'row',justifyContent:'space-between'  }}>
                    <Text style={{fontSize:20, fontWeight: 'bold'}}>DNS 1</Text>
                    <View style={{backgroundColor:this.state.textInputDns? "white" : "#F5F5F5",
                        width:280,
                        marginEnd:15,
                        marginBottom:10, }}
                    >
                        <TextInputMask
                            type={'only-numbers'}
                            value={this.state.dns1}
                            onChangeText={text => {
                                this.setState({
                                dns1: text
                                })
                            }}
                            editable={this.state.textInputDns}
                        />
                    </View>
                </View>

                <View style={{ marginBottom:10, flexDirection:'row',justifyContent:'space-between' }}>
                    <Text style={{fontSize:20, fontWeight: 'bold'}}>DNS 2</Text>
                    <View style={{backgroundColor:this.state.textInputDns? "white" : "#F5F5F5",
                        width:280,
                        marginEnd:15,
                        marginBottom:10, }}
                    >
                        <TextInputMask
                            type={'only-numbers'}
                            value={this.state.dns2}
                            onChangeText={text => {
                                this.setState({
                                dns2: text
                                })
                            }}
                            editable={this.state.textInputDns}
                        />
                    </View>
                </View>

                <View style={{justifyContent:'space-between', flexDirection:'row', marginTop:20, marginBottom:10}}>
                    <Text style={{ fontSize:20, fontWeight:'bold' }}>Proxy</Text>
                    <Picker
                        selectedValue={this.state.proxyIp}
                        style={{height: 30, width: 200,marginEnd:100 }}
                        onValueChange={(itemValue, itemIndex) =>this.changeValueProxy(itemValue)}
                    >   
                        <Picker.Item label="Não usa proxy" value="nao usa" />
                        <Picker.Item label="Proxy com configuraçoes" value="com configuracoes" />
                        <Picker.Item label="Proxy transparente" value="transparente" />
                    </Picker>
                </View>

                <View style={{ marginBottom:10, flexDirection:'row',justifyContent:'space-between' }}>
                    <Text style={{fontSize:20, fontWeight: 'bold'}}>Proxy IP</Text>
                    <View style={{backgroundColor:this.state.textInputProxy? "white" : "#F5F5F5",
                        width:280,
                        marginEnd:15,
                        marginBottom:10, }}
                    >
                        <TextInputMask
                            type={'only-numbers'}
                            value={this.state.proxyIp}
                            onChangeText={text => {
                                this.setState({
                                proxyIp: text
                                })
                            }}
                            editable={this.state.textInputProxy}
                        />
                    </View>
                </View>

                <View style={{ marginBottom:10,flexDirection:'row',justifyContent:'space-between'  }}>
                    <Text style={{fontSize:20, fontWeight: 'bold'}}>Porta</Text>
                    <View style={{backgroundColor:this.state.textInputProxy? "white" : "#F5F5F5",
                        width:280,
                        marginEnd:15,
                        marginBottom:10, }}
                    >
                        <TextInputMask
                            type={'only-numbers'}
                            value={this.state.porta}
                            onChangeText={text => {
                                this.setState({
                                porta: text
                                })
                            }}
                            editable={this.state.textInputProxy}
                        />
                    </View>
                </View>

                <View style={{ marginBottom:10,flexDirection:'row',justifyContent:'space-between' }}>
                    <Text style={{fontSize:20, fontWeight: 'bold', marginTop: 10}}>User</Text>
                    <TextInput
                        style={{height: 50,backgroundColor: this.state.textInputProxy? "white" : "#F5F5F5", fontSize: 17,width:280, marginEnd:15}}  
                        value={this.state.user}
                        onChangeText={(text) => this.setState({user: text})}  
                        editable={this.state.textInputProxy}
                    />  
                </View>

                <View style={{ marginBottom:10,flexDirection:'row',justifyContent:'space-between', marginTop: 10 }}>
                    <Text style={{fontSize:20, fontWeight: 'bold'}}>Password</Text>
                    <TextInput           
                        style={{height: 50,backgroundColor:this.state.textInputProxy? "white" : "#F5F5F5", fontSize: 17,width:265, marginEnd:20}}  
                        value={this.state.password}
                        onChangeText={(text) => this.setState({password: text})}  
                        editable={this.state.textInputProxy}
                    />  
                </View>
                    
                <View style={{marginTop: 30, marginStart: 20, marginEnd: 20, marginBottom: 20}}>
                    <Button
                        color= 'gray'
                        title="enviar"
                        onPress={() => this.configRede()}
                    />
                </View>
            </ScrollView>
        );
    }    
}