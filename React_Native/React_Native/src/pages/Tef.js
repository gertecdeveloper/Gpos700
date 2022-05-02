import React, { Fragment, Component, useState } from "react";
import { SafeAreaView, Text, StatusBar, View, Button, Alert ,StyleSheet,DeviceEventEmitter,FlatList, TextInput, CheckBox, EventEmitter} from "react-native";
import {NativeModules} from 'react-native';
import {TextInputMask} from 'react-native-masked-text';

import RetornoGer7 from  '../configs/config_tef/operacaoRetornoGer7';

import RetornoMsiTef from  '../configs/config_tef/operacaoRetornoMsiTef';

import TefService from '../services/serviceTef';

import RadioForm from 'react-native-simple-radio-button';

import { ScrollView } from "react-native-gesture-handler";

import MaskedInput from 'react-native-masked-input-text';

var RadioPagamento = [
  {label: 'Crédito', value: 'Crédito' },
  {label: 'Débito', value:'Debito'},
  {label: 'Voucher (Ger7)'+'\n/Todos (M-Sitef)', value: 'Voucher' },
 
];
var RadioParcelamento = [
  {label: 'Parcelado Loja', value: 'loja' },
  {label: 'Parcelado Adm', value:'adm'},
  
 
];
var RadioApi=[
  {label: 'Ger7', value: 'ger7' },
  {label: 'M-Sitef', value:'msitef'},
]
var GertecGPOS700 = NativeModules.GertecGPOS700;

export default class Tef extends Component  {
  
 

  constructor(props) {    
    super(props);
    
    this.state = {
      input: '',
      arrayHolder: [
        
      ], 
      valor: '10,00',
      ip: '',
      text:'',
      parcela: '1',
      checked: false,
      pagamento: 'Crédito',
      tef: 'msitef',
      tipoTef: '',
      parcelamento: 'adm',
      acao: '',
      debito:true,
      msitef: true,
     
    }
  }
  
 

  _formatarInfoRecebida(myjson){
  
    
    myjson = myjson.toString().split('\\r').join('')
    myjson = myjson.toString().split('"{').join('{')
    myjson = myjson.toString().split('}"').join('}')
    var parsedJson = JSON.parse(myjson)


    
      
    if(this.state.tef=="ger7"){
          var retornoGer7 = new RetornoGer7();
          retornoGer7.fromJsonGer7(parsedJson);
          if(retornoGer7.getErrmsg()=='' && retornoGer7.getPrint()!=''){
            this.dialogoImpressao(retornoGer7.getPrint(),17)
          }

         
          if (retornoGer7.getErrmsg()!='' && this.state.acao=='funcoes') {
            this.dialogoErroGer7(retornoGer7);
          }
          if((this.state.acao=='venda'||this.state.acao=='cancelamento')){
          
            if(retornoGer7.getErrmsg()!=''){
              this.dialogoErroGer7(retornoGer7);
            }else{
              this.dialogoTransacaoAprovadaGer7(retornoGer7);
            }    
          }
    }
    else{
      var retornoMsitef = new RetornoMsiTef();
      retornoMsitef.fromJsonMsiTef(parsedJson);

     
      if(retornoMsitef.getCodResp()=='0'){
        var impressao= ''
      
       
        if(retornoMsitef.textoImpressoCliente()!=''){
         
          impressao+= retornoMsitef.textoImpressoCliente();
      
        }
        if(retornoMsitef.textoImpressoEstabelecimento()!=''){

          impressao+='\n\n-----------------------------     \n'//espaço entre os cupons 
        
          impressao+=retornoMsitef.textoImpressoEstabelecimento();

          
        }
        
      
        if(impressao!=''){
      
          this.dialogoImpressao(impressao,17);
        }
      }
      if ( (this.state.acao=='venda'||this.state.acao=='cancelamento')) {
         
         
        if((retornoMsitef.getCodTrans().toString()=="" ||
        retornoMsitef.getCodTrans() == null)) {
        //Caso ocorra um erro durante as ações, um dialogo de erro é chamado
          this.dialogoErroMsitef(retornoMsitef);
         
         
        }else{
          this.dialogoTransacaoAprovadaMsitef(retornoMsitef);
        }
      }  
    }
    
     
  }
  enviarParametrosTef(tipoAcao,tipoTef,tefService) {
  
    

    // Verificando qual foi a tef selecionada, dependendo da Tef os seus parâmetros são formatados;
    if (tipoTef == "ger7") {
     
      switch (tipoAcao) {
        case "venda":
         
          parametroFormatado=tefService._formatarPametrosVendaGer7();
          break;
        case "cancelamento":
          parametroFormatado=tefService._formatarPametrosCancelamentoGer7();
          break;
        case "funcoes":
          parametroFormatado=tefService._formatarPametrosFuncaoGer7()
          break;
        case "reimpressao":
          parametroFormatado=tefService._formatarPametrosReimpressaoGer7();
          break;
      }
      GertecGPOS700.realizarAcaoGer7( parametroFormatado);
      // recebe os dados enviados pela Ger7, quando os recebe aciona a função _formatarInfoRecebida
      // eventGer7 é o nome do evento emitido 
      // .ger7 são os dados
      DeviceEventEmitter.once("eventGer7",event=>{ this._formatarInfoRecebida(event.ger7)});

   
    
      
    } else {  


      switch (tipoAcao) {
        
        case "venda":
          parametroFormatado =tefService._formatarPametrosVendaMsiTef();
          break;
        case "cancelamento":
          parametroFormatado=tefService._formatarPametrosCancelamentoMsiTef();
          break;
        case "funcoes":
          parametroFormatado=tefService._formatarPametrosFuncoesMsiTef();
          break;
        case "reimpressao":
          parametroFormatado=tefService._formatarPametrosReimpressaoMsiTef();
          break;
      }
 
      GertecGPOS700.realizarAcaoMsiTef( parametroFormatado,tipoAcao);
      // recebe os dados enviados M-Sitef, quando os recebe aciona a função _formatarInfoRecebida
      // eventSitef é o nome do evento emitido 
      // .msitef são os dados
    
      DeviceEventEmitter.once("eventSitef",event=>{ this._formatarInfoRecebida(event.msitef)});
     
      

      
    
     
    
    }


   
  }
 
  
  realizarFuncoes(acao, tef,valor,ip,habilitarImpressao,parcelas,pagamento){
    this.setState({acao:acao})
 
    var ehValido = true
    var valorFormatado = valor
    ip = ip.split(' ').join('')
   
    valorFormatado = valorFormatado.replace(/,/g, '')
    valorFormatado = valorFormatado.split('.').join('')
    if((/^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/.test(ip) && tef=='msitef')||tef=='ger7'){
      ehValido=true
      
    }else{
      alert('É necessário colocar um IP válido'+ '\n(opção M-Sitef marcada)')
      ehValido=false
    }
    
    if(valorFormatado=='000' || valorFormatado==''){
      alert('É necessário colocar um valor em R$ '+ '\n(maior que 0)')
      ehValido=false
    }
    
    
    if((parcelas=='0' || parcelas=='') && (pagamento=='Crédito')){
     
      alert('É necessário colocar o número de parcelas desejadas '+ '\n(maior ou igual a 1)'+'\n(obs.: Opção por compra por crédito marcada)')
      ehValido=false

    }
   
    
    if(ehValido) {
      var tefService = new TefService();
      
      this.state.tipoTef=tef;
     
      
     
      
     
     
      tefService.setParcelamento(this.state.parcelamento);
      tefService.setValorVenda(valorFormatado);
      tefService.setIpConfig(ip);
      tefService.setHabilitarImpressao(habilitarImpressao);
      tefService.setQuantParcelas(parcelas);
 
      tefService.setTipoPagamento(pagamento);
      this.enviarParametrosTef(acao,this.state.tipoTef, tefService);
    

    }
  
   
  }
  ImprimaGer7(CupomTEF,size){

    if(CupomTEF!=" "){


        var curPos = 0;
        var LastPos = 0;

        while (curPos >= 0) {
            //TODO: Tratar exceção ultima Linha sem \n
            curPos = CupomTEF.indexOf("\n", curPos);
            if (curPos > 0) {

                try {
                    if (curPos != LastPos) {
                      GertecGPOS700.imprimeTexto(CupomTEF.substring(LastPos, curPos),"MONOSPACE",size,true,false,false,"LEFT");
                        
                    } else {
                      GertecGPOS700.imprimeTexto(" ","MONOSPACE",size,true,false,false,"LEFT");

                 
                    }
                    curPos++;
                    LastPos = curPos;

                } catch (ex) {
                    console.log(ex);
                }
            }

        }
    }
}
  dialogoImpressao(textoNota,size){
  
   
   
      
      Alert.alert(
        "Realizar Impressão",
        "Deseja realizar a impressao pela aplicação ?",
        [
         
          {
            text: "Não",
            onPress: () => console.log("Cancel Pressed"),
            style: "cancel"
          },
          { text: "Sim", onPress: () => {
            var textoEstabelecimento='';
            var textoCliente='';
            try{
              if(this.state.tef=='ger7'){
               
                  textoEstabelecimento=textoNota.substring(0,textoNota.indexOf("\f"));//via cliente
                  textoCliente=textoNota.substring(textoNota.indexOf("\f"), textoNota.length);//via estabelecimento
                  this.ImprimaGer7(textoEstabelecimento,size);
                  GertecGPOS700.avancaLinha(100);//espaço entre os cupons 
                  this.ImprimaGer7(textoCliente,size);
              }
              else{
                    GertecGPOS700.imprimeTexto(textoNota,"MONOSPACE",size,true,false,false,"LEFT");
                   

              }
              GertecGPOS700.avancaLinha(200);
              GertecGPOS700.fimImpressao();

            }catch(e){
              console.log(e);
            }

          }}
        ],
        { cancelable: false }
      );
    
  

  }
  dialogoTransacaoAprovadaGer7(operacaoRetorno){
    Alert.alert('Ação executada com sucesso', "version: " + operacaoRetorno.getVersion()+ '\n'+
   "status: " + operacaoRetorno.getStatus()+'\n'+
   "config: " + operacaoRetorno.getConfig()+'\n'+
   "license: " + operacaoRetorno.getLicens()+'\n'+
   "terminal: " + operacaoRetorno.getTerminal()+'\n'+
   "merchant: " + operacaoRetorno.getMerchant()+'\n'+
   "id: " + operacaoRetorno.getId()+'\n'+
   "type: " + operacaoRetorno.getType()+'\n'+
   "product: " + operacaoRetorno.getProduct()+'\n'+
   "response: " + operacaoRetorno.getResponse()+'\n'+
   "authorization: " + operacaoRetorno.getAuthorization()+'\n'+
   "amount: " + operacaoRetorno.getAmount()+'\n'+
   "installments: " + operacaoRetorno.getInstallments()+'\n'+
   "instmode: " + operacaoRetorno.getInstmode()+'\n'+
   "stan: " + operacaoRetorno.getStan()+'\n'+
   "rrn: " + operacaoRetorno.getRrn()+'\n'+
   "time: " + operacaoRetorno.getTime()+'\n'+
   "track2: " + operacaoRetorno.getTrack2()+'\n'+
   "aid: " + operacaoRetorno.getAid()+'\n'+
   "cardholder: " + operacaoRetorno.getCardholder()+'\n'+
   "prefname: " + operacaoRetorno.getPrefname()+'\n'+
   "errcode: " + operacaoRetorno.getErrcode()+'\n'+
   "label: " + operacaoRetorno.getLabel())

  }
  dialogoErroGer7(operacaoRetorno){
    Alert.alert('Ocorreu um erro durante a realização da ação',  "version: " + operacaoRetorno.getVersion()+'\n'+
    "errcode: " + operacaoRetorno.getErrcode()+'\n'+
    "errmsg: " + operacaoRetorno.getErrmsg() )
  }
  dialogoTransacaoAprovadaMsitef(operacaoRetorno){
    Alert.alert('Ação executada com sucesso', "CODRESP: " + operacaoRetorno.getCodResp()+'\n'+
    "COMP_DADOS_CONF: " + operacaoRetorno.getCompDadosConf()+'\n'+
    "CODTRANS: " + operacaoRetorno.getCodTrans()+'\n'+
    "CODTRANS (Name): " + operacaoRetorno.getNameTransCod()+'\n'+
    "VLTROCO: " + operacaoRetorno.getvlTroco()+'\n'+
    "REDE_AUT: " + operacaoRetorno.getRedeAut()+'\n'+
    "BANDEIRA: " + operacaoRetorno.getBandeira()+'\n'+
    "NSU_SITEF: " + operacaoRetorno.getNSUSitef()+'\n'+
    "NSU_HOST: " + operacaoRetorno.getNSUHOST()+'\n'+
    "COD_AUTORIZACAO: " + operacaoRetorno.getCodAutorizacao()+'\n'+
    "NUM_PARC: " + operacaoRetorno.getParcelas())
  }
  dialogoErroMsitef(operacaoRetorno){
    Alert.alert('Ocorreu um erro durante a realização da ação', "CODRESP: " + operacaoRetorno.getCodResp() )

  }
  changeValueParcelas(pagamento){
    if(pagamento=='Crédito'){
      this.setState({debito:true})
      this.setState({pagamento:'Crédito'})
    }
    else {
      this.setState({debito:false})
      this.setState({pagamento:pagamento})
      this.setState({parcela:'1'})
    }
  }
  changeValueIpAndPrinter(tef){
    if( tef!='msitef'){
      this.setState({msitef:false});
      this.setState({tef:tef})
      this.state.checked = !this.state.checked
    }
    else{
      this.setState({msitef:true});
      this.setState({tef:tef})
      this.setState({checked:false})
    }

  }
 
  render() {
    return (
        <ScrollView>
          <Text style={{color:'gray', fontSize: 22, fontWeight:'bold', marginLeft:15, marginRight:15, textAlign: 'center'}}>Exemplo TEF API - React-Native</Text>
          <View style={{justifyContent: 'space-between', flexDirection: 'row'}}>
          <Text style={{color:'black', fontSize: 17, fontWeight:'bold', marginLeft:20, marginRight:15, textAlign:'left', marginTop: 8}}>Valor em R$</Text>
          <Text style={{color:'black', fontSize: 17, fontWeight:'bold',  marginLeft:55, textAlign:'left', marginTop: 8}}>IP </Text>
          <Text style={{color:'gray', fontSize: 13, fontWeight:'bold', marginRight:15, textAlign:'left', marginTop: 8}}>(somente para o M-Sitef)</Text>
         
          </View>
          
          <View style={{justifyContent: 'space-between', flexDirection: 'row'}}>
             
            <View style={{backgroundColor:'white',
          width:120,
          marginLeft:20,
          marginBottom:10, justifyContent: 'space-between',  flexDirection: 'row'}}>

            <TextInputMask
                type={'money'}
                options={{
                  precision: 2,
                  separator: ',',
                  delimiter: '.',
                  unit: '',
                  suffixUnit: '',
              
                }}
                value={this.state.valor}
                onChangeText={text => {
                  this.setState({
                    valor: text
                  })
                }} 
              />
              
            </View>
            <View style={{
          width:150,
          marginRight:20,
          marginBottom:10, }}>
            <MaskedInput mask={'0.?0?.?0?.?0.?0?.?0?.?0.?0?.?0?.?0.?0?.?0?'}
              placeholder={"192.168.0.1" } 
              keyboardType={'numeric'} 
               style={{height: 50,backgroundColor: this.state.msitef? 'white':'gray', fontSize: 17,}}  
               value={this.state.ip}
               onChangeText={(text) => this.setState({ip: text})} 
               editable={this.state.msitef}

            
            />
           
         
           
          
                   
          </View>
          
          </View>
          <View style={{ justifyContent:'space-between', flexDirection: 'row'}}>
          <Text style={{color:'black', fontSize: 13, fontWeight:'bold', marginLeft:20, marginRight:15, textAlign:'left'}}>Pagamento a ser utilizado</Text>
          <View style={{marginTop: 30,  marginStart:-200 , marginEnd: 10}}>
                  <RadioForm
                        radio_props={RadioPagamento}
                        initial={0}
                        onPress={(value) => this.changeValueParcelas(value)}
                        buttonSize={18}
                        buttonOuterSize={18}
                        selectedButtonColor={'blue'}
                        buttonColor={'black'}
                        labelStyle={{ fontSize: 15,color:'black', marginTop: 3}}
                        disabled={false}
                        formHorizontal={false}
                        />  
              </View>           
           <Text style={{color:'black', fontSize: 13, fontWeight:'bold', textAlign:'left'}}>Tipo de parcelamento</Text>
          <View style={{marginTop: 30, marginStart: -160, marginEnd: 10 }}>
                  <RadioForm
                        radio_props={RadioParcelamento}
                        initial={1}
                     
                        onPress={(value) => this.setState({parcelamento:value})}
                        buttonSize={18}
                        buttonOuterSize={18}
                        selectedButtonColor={'blue'}
                        buttonColor={'black'}
                        labelStyle={{ fontSize: 15,color:'black', marginTop: 3}}
                        disabled={false}
                        formHorizontal={false}
                        />  
               </View>
          </View>
          <Text style={{color:'black', fontSize: 17, fontWeight:'bold', marginLeft:20, marginRight:15, textAlign:'left'}}>Número de Parcelas</Text>
          <View style={{backgroundColor:this.state.debito? 'white':'gray',
          width:300,
          marginStart:30,
          marginBottom:10, }}>
                 
                    <TextInputMask
                        type={'only-numbers'}
                        value={this.state.parcela}
                        onChangeText={text => {
                          this.setState({
                            parcela: text
                          })
                        }}
                        editable={this.state.debito}
                      />
          </View>
          <Text style={{color:'black', fontSize: 17, fontWeight:'bold', marginLeft:20, marginRight:15, textAlign:'left', }}>Escolha a API</Text>
          <View style={{marginTop: 10, marginStart: 30, marginBottom: 8 }}>
                  <RadioForm
                        radio_props={RadioApi}
                        initial={1}
                        onPress={(value) => this.changeValueIpAndPrinter(value)}
                        buttonSize={20}
                        buttonOuterSize={20}
                        selectedButtonColor={'blue'}
                        buttonColor={'black'}
                        labelStyle={{ fontSize: 15,color:'black', marginEnd: 100}}
                        disabled={false}
                        formHorizontal={true}
                        />  

          </View>
          <View style={{justifyContent: 'space-around', flexDirection: 'row',marginRight: 100, marginStart: 20}}>
              <CheckBox
               value={this.state.checked}
               onValueChange={() => this.changeValueIpAndPrinter(this.state.tef)}
               disabled={this.state.msitef}
              />
              <Text style={{marginTop: 5, marginRight: 90, color: this.state.msitef? 'gray':'black'}} >Habilitar impressão</Text>
          </View>

          <View style={{marginTop: 10, marginStart: 20, marginEnd: 20, marginBottom: 2}}>
          <Button
                        color= 'gray'
                        title="enviar transação"
                        onPress={() => this.realizarFuncoes('venda',this.state.tef, this.state.valor, this.state.ip, this.state.checked, this.state.parcela, this.state.pagamento)}
                    />
       
          </View>
          <View style={{marginTop: 8, marginStart: 20, marginEnd: 20, marginBottom: 2}}>
                    
                <Button
                        color= 'gray'
                        title="Cancelar transação"
                        onPress={() => this.realizarFuncoes('cancelamento',this.state.tef, this.state.valor, this.state.ip, this.state.checked, this.state.parcela, this.state.pagamento)}
                    />
          </View>
            
          <View style={{marginTop: 8, marginStart: 20, marginEnd: 20, marginBottom: 2}}>
                    
                    <Button
                            color= 'gray'
                            title="funções"
                            onPress={() => this.realizarFuncoes('funcoes',this.state.tef, this.state.valor, this.state.ip, this.state.checked, this.state.parcela, this.state.pagamento)}
                        />
          </View>
          <View style={{marginTop: 8, marginStart: 20, marginEnd: 20, marginBottom: 2}}>
                
                <Button
                        color= 'gray'
                        title="reimpressão"
                        onPress={() => this.realizarFuncoes('reimpressao',this.state.tef, this.state.valor, this.state.ip, this.state.checked, this.state.parcela, this.state.pagamento)}
                    />
          </View>
          

        </ScrollView>
    );
  }
}
