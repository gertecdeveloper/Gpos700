package com.gertec_framework;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.net.Uri;
import android.nfc.NfcAdapter;
import android.nfc.Tag;
import android.nfc.tech.MifareClassic;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.widget.Switch;
import android.widget.Toast;

import androidx.annotation.Nullable;

import com.facebook.react.bridge.ActivityEventListener;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReadableMap;
import com.google.gson.Gson;
import com.google.zxing.integration.android.IntentIntegrator;
import com.google.zxing.integration.android.IntentResult;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import br.com.gertec.gedi.GEDI;
import br.com.gertec.gedi.enums.GEDI_PRNTR_e_Alignment;
import br.com.gertec.gedi.enums.GEDI_PRNTR_e_BarCodeType;
import br.com.gertec.gedi.exceptions.GediException;
import br.com.gertec.gedi.interfaces.IGEDI;
import br.com.gertec.gedi.interfaces.IPRNTR;
import br.com.gertec.gedi.structs.GEDI_PRNTR_st_BarCodeConfig;
import com.phi.gertec.sat.satger.SatGerLib;

import br.com.gertec.gedi.structs.GEDI_PRNTR_st_PictureConfig;
import br.com.gertec.gedi.structs.GEDI_PRNTR_st_StringConfig;

import static android.app.Activity.RESULT_CANCELED;
import static android.app.Activity.RESULT_OK;
import static android.hardware.Camera.Parameters.FLASH_MODE_ON;
import static com.gertec_framework.MainActivity.satLib;

import com.facebook.react.modules.core.DeviceEventManagerModule;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.bridge.Arguments;

import org.json.JSONException;
import org.json.JSONObject;


public class ToastModule extends ReactContextBaseJavaModule implements ActivityEventListener {
    private static ReactApplicationContext reactContext;

    private static final String DURATION_SHORT_KEY = "SHORT";
    private static final String DURATION_LONG_KEY = "LONG";

    private IGEDI igedi;
    private IPRNTR iprntr;
    private GEDI_PRNTR_st_StringConfig stringConfig;
    private GEDI_PRNTR_st_PictureConfig pictureConfig;
    private Typeface typeface;
    private final static String TAG = ToastModule.class.getName();
    private GertecPrinter gertecPrinter;
    private ConfigPrint configPrint = new ConfigPrint();
    public static final String G700 = "GPOS700";
    public static final String G800 = "Smart G800";
    private static final String version = "RC03";
    public static String Model = Build.MODEL;
    private String tipoCode;
    // Adaptador NFC
    private NfcAdapter nfcAdapter;

    // Class MifareClassic
    private MifareClassic mifareClassic;

    // Tag do Cartão
    private Tag tag;
    Intent intentGer7 = new Intent(Intent.ACTION_VIEW, Uri.parse("pos7api://pos7"));


    Gson gson = new Gson();
    Bundle bundle = new Bundle();




    ToastModule(ReactApplicationContext context) {

        super(context);
        reactContext = context;

        reactContext.addActivityEventListener(this);
//        reactContext.addLifecycleEventListener(this);
        gertecPrinter = new GertecPrinter(reactContext.getApplicationContext());
        gertecPrinter.setConfigImpressao(configPrint);

//       Looper.prepare();



    }


    @Override
    public String getName() {
        return "GertecGPOS700";
    }

    @Override
    public Map<String, Object> getConstants() {
        final Map<String, Object> constants = new HashMap<>();
        constants.put(DURATION_SHORT_KEY, Toast.LENGTH_SHORT);
        constants.put(DURATION_LONG_KEY, Toast.LENGTH_LONG);
        return constants;
    }

    public String respSitefToJson(Intent data) throws JSONException {
        JSONObject json = new JSONObject();
        json.put("CODRESP",data.getStringExtra("CODRESP"));
        json.put("COMP_DADOS_CONF",data.getStringExtra("COMP_DADOS_CONF"));
        json.put("CODTRANS",data.getStringExtra("CODTRANS"));
        json.put("VLTROCO",data.getStringExtra("VLTROCO"));
        json.put("REDE_AUT",data.getStringExtra("REDE_AUT"));
        json.put("BANDEIRA",data.getStringExtra("BANDEIRA"));
        json.put("NSU_SITEF",data.getStringExtra("NSU_SITEF"));
        json.put("NSU_HOST",data.getStringExtra("NSU_HOST"));
        json.put("COD_AUTORIZACAO",data.getStringExtra("COD_AUTORIZACAO"));
        json.put("NUM_PARC",data.getStringExtra("NUM_PARC"));
        json.put("TIPO_PARC",data.getStringExtra("TIPO_PARC"));
        json.put("VIA_ESTABELECIMENTO",data.getStringExtra("VIA_ESTABELECIMENTO"));
        json.put("VIA_CLIENTE",data.getStringExtra("VIA_CLIENTE"));

        return json.toString();
    }
    @Override
    public void onActivityResult(Activity activity, int requestCode, int resultCode, Intent data) {

        //super(onActivityResult(activity,requestCode,resultCode,data));
        IntentResult intentResult = IntentIntegrator.parseActivityResult(requestCode,resultCode,data);
        if(intentResult != null){
            if(intentResult.getContents() == null){
//                Toast.makeText(reactContext.getApplicationContext(),"Resultado não encontrado", Toast.LENGTH_SHORT).show();
                WritableMap params = Arguments.createMap();
                params.putString("bar", this.tipoCode+": "+"Não foi possível ler o código");
                reactContext
                        .getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class)
                        .emit("eventName", params);

            }
            else{
                try{
//                    Toast.makeText(reactContext.getApplicationContext(),intentResult.getContents(), Toast.LENGTH_SHORT).show();

                    WritableMap params = Arguments.createMap();
                    params.putString("bar", this.tipoCode+": "+intentResult.getContents());
                    reactContext
                            .getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class)
                            .emit("eventName", params);



                }catch (Exception e){
                    e.printStackTrace();

                }
            }
        }else if(requestCode == 4713){
//            System.out.println("sou data: "+data);
//            System.out.println( "sou o gson: "+ data.getStringExtra("jsonResp"));
            if (resultCode == RESULT_OK && data != null) {
                WritableMap params1 = Arguments.createMap();

                params1.putString("ger7", data.getStringExtra("jsonResp"));
                reactContext
                        .getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class)
                        .emit("eventGer7", params1);

            }
        } else if(requestCode == 4321) {
            if (resultCode == RESULT_OK || resultCode == RESULT_CANCELED && data != null) {
                try {

              
                    WritableMap params2 = Arguments.createMap();

                    params2.putString("msitef", respSitefToJson(data));
                    reactContext
                            .getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class)
                            .emit("eventSitef", params2);

                } catch (JSONException e) {
                    e.printStackTrace();
                }
            } else {
                Toast.makeText(reactContext.getApplicationContext(), "m-SiTef Outro Codigo", Toast.LENGTH_LONG).show();

            }
        }

    }
    protected void showMessagem(String titulo, String mensagem){
        AlertDialog alertDialog = new AlertDialog.Builder(reactContext.getApplicationContext()).create();
        alertDialog.setTitle(titulo);
        alertDialog.setMessage(mensagem);
        alertDialog.setButton(AlertDialog.BUTTON_NEUTRAL, "OK",
                new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.dismiss();
                    }
                });
        alertDialog.show();
    }
    void ShowFalha(String sStatus){
        showMessagem("Falha Impressor",sStatus);
    }

    public void onNewIntent(Intent intent) {}


    @ReactMethod
    public void show(String message) {
        Toast.makeText(getReactApplicationContext(), message, Toast.LENGTH_LONG).show();
    }


    @ReactMethod
    public void imprimeTexto(String texto, String fontFamily, int fontSize, boolean negrito, boolean italico, boolean sublinhado, String alinhamento) {
        
        this.configPrint.setTamanho(fontSize);
        this.configPrint.setNegrito(negrito);
        this.configPrint.setItalico(italico);
        this.configPrint.setSublinhado(sublinhado);
        this.configPrint.setFonte(fontFamily);
        this.configPrint.setAlinhamento(alinhamento);

        try{
            gertecPrinter.getStatusImpressora();
            if(gertecPrinter.isImpressoraOK()){
                this.gertecPrinter.setConfigImpressao(configPrint);
                this.gertecPrinter.imprimeTexto(texto);
            }

        }catch (Exception e){
            e.printStackTrace();
        }

    }

    @ReactMethod
    public void imprimeImagem() throws GediException{

        try{
            String sStatus = gertecPrinter.getStatusImpressora();
            if(gertecPrinter.isImpressoraOK()) {
                configPrint = new ConfigPrint();
                gertecPrinter.setConfigImpressao(configPrint);
                gertecPrinter.imprimeImagem("invoice");
                gertecPrinter.avancaLinha(150);
                
            }
            else{
                ShowFalha(sStatus);
            }


        } catch (GediException e) {
            e.printStackTrace();
            Toast.makeText(reactContext.getApplicationContext(), e.getMessage(), Toast.LENGTH_LONG).show();
        }

    }



    @ReactMethod
    public void imprimeBarCode(String texto, int height, int width, String barCodeType ) throws GediException {
        try{
            gertecPrinter.getStatusImpressora();
            if(gertecPrinter.isImpressoraOK()){
                this.gertecPrinter.imprimeBarCode(texto,height,width,barCodeType);

            }

        }catch (GediException e){
            e.printStackTrace();
        }



    }
    @ReactMethod
    public void statusImpressora() throws GediException {
        try{
            String status = this.gertecPrinter.getStatusImpressora();
            WritableMap params = Arguments.createMap();
            params.putString("status", status);
             reactContext
                    .getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class)
                    .emit("eventStatus", params);
        }catch (GediException e){
            e.printStackTrace();

        }


    }
    @ReactMethod
    public void imprimeTudo()  {
        configPrint.setItalico(false);
        configPrint.setNegrito(true);
        configPrint.setTamanho(20);
        configPrint.setFonte("MONOSPACE");
        gertecPrinter.setConfigImpressao(configPrint);
        try {
            gertecPrinter.getStatusImpressora();
            // Imprimindo Imagem
            configPrint.setiWidth(300);
            configPrint.setiHeight(130);
            configPrint.setAlinhamento("CENTER");
            gertecPrinter.setConfigImpressao(configPrint);
            gertecPrinter.imprimeTexto("==[Iniciando Impressao Imagem]==");
            gertecPrinter.imprimeImagem("gertec_2");
            gertecPrinter.avancaLinha(10);
            gertecPrinter.imprimeTexto("====[Fim Impressão Imagem]====");
            gertecPrinter.avancaLinha(10);
            // Fim Imagem

            // Impressão Centralizada
            configPrint.setAlinhamento("CENTER");
            configPrint.setTamanho(30);
            gertecPrinter.setConfigImpressao(configPrint);
            gertecPrinter.imprimeTexto("CENTRALIZADO");
            gertecPrinter.avancaLinha(10);
            // Fim Impressão Centralizada

            // Impressão Esquerda
            configPrint.setAlinhamento("LEFT");
            configPrint.setTamanho(40);
            gertecPrinter.setConfigImpressao(configPrint);
            gertecPrinter.imprimeTexto("ESQUERDA");
            gertecPrinter.avancaLinha(10);
            // Fim Impressão Esquerda

            // Impressão Direita
            configPrint.setAlinhamento("RIGHT");
            configPrint.setTamanho(20);
            gertecPrinter.setConfigImpressao(configPrint);
            gertecPrinter.imprimeTexto("DIREITA");
            gertecPrinter.avancaLinha(10);
            // Fim Impressão Direita

            // Impressão Negrito
            configPrint.setNegrito(true);
            configPrint.setAlinhamento("LEFT");
            configPrint.setTamanho(20);
            gertecPrinter.setConfigImpressao(configPrint);
            gertecPrinter.imprimeTexto("=======[Escrita Netrigo]=======");
            gertecPrinter.avancaLinha(10);
            // Fim Impressão Negrito

            // Impressão Italico
            configPrint.setNegrito(false);
            configPrint.setItalico(true);
            configPrint.setAlinhamento("LEFT");
            configPrint.setTamanho(20);
            gertecPrinter.setConfigImpressao(configPrint);
            gertecPrinter.imprimeTexto("=======[Escrita Italico]=======");
            gertecPrinter.avancaLinha(10);
            // Fim Impressão Italico

            // Impressão Italico
            configPrint.setNegrito(false);
            configPrint.setItalico(false);
            configPrint.setSublinhado(true);
            configPrint.setAlinhamento("LEFT");
            configPrint.setTamanho(20);
            gertecPrinter.setConfigImpressao(configPrint);
            gertecPrinter.imprimeTexto("======[Escrita Sublinhado]=====");
            gertecPrinter.avancaLinha(10);
            // Fim Impressão Italico

            // Impressão BarCode 128
            configPrint.setNegrito(false);
            configPrint.setItalico(false);
            configPrint.setSublinhado(false);
            configPrint.setAlinhamento("CENTER");
            configPrint.setTamanho(20);
            gertecPrinter.setConfigImpressao(configPrint);
            gertecPrinter.imprimeTexto("====[Codigo Barras CODE 128]====");
            gertecPrinter.imprimeBarCode("12345678901234567890", 120,120,"CODE_128");
            gertecPrinter.avancaLinha(10);
            // Fim Impressão BarCode 128

            // Impressão Normal
            configPrint.setNegrito(false);
            configPrint.setItalico(false);
            configPrint.setSublinhado(true);
            configPrint.setAlinhamento("LEFT");
            configPrint.setTamanho(20);
            gertecPrinter.setConfigImpressao(configPrint);
            gertecPrinter.imprimeTexto("=======[Escrita Normal]=======");
            gertecPrinter.avancaLinha(10);
            // Fim Impressão Normal

            // Impressão Normal
            configPrint.setNegrito(false);
            configPrint.setItalico(false);
            configPrint.setSublinhado(true);
            configPrint.setAlinhamento("LEFT");
            configPrint.setTamanho(20);
            gertecPrinter.setConfigImpressao(configPrint);
            gertecPrinter.imprimeTexto("=========[BlankLine 50]=========");
            gertecPrinter.avancaLinha(50);
            gertecPrinter.imprimeTexto("=======[Fim BlankLine 50]=======");
            gertecPrinter.avancaLinha(10);
            // Fim Impressão Normal

            // Impressão BarCode 13
            configPrint.setNegrito(false);
            configPrint.setItalico(false);
            configPrint.setSublinhado(false);
            configPrint.setAlinhamento("CENTER");
            configPrint.setTamanho(20);
            gertecPrinter.setConfigImpressao(configPrint);
            gertecPrinter.imprimeTexto("=====[Codigo Barras EAN13]=====");
            gertecPrinter.imprimeBarCode("7891234567895", 120,120,"EAN_13");
            gertecPrinter.avancaLinha(10);
            // Fim Impressão BarCode 128

            // Impressão BarCode 13
            gertecPrinter.setConfigImpressao(configPrint);
            gertecPrinter.imprimeTexto("===[Codigo QrCode Gertec LIB]==");
            gertecPrinter.avancaLinha(10);
            gertecPrinter.imprimeBarCode("Gertec Developer Partner LIB", 240,240,"QR_CODE");

            configPrint.setNegrito(false);
            configPrint.setItalico(false);
            configPrint.setSublinhado(false);
            configPrint.setAlinhamento("CENTER");
            configPrint.setTamanho(20);
            gertecPrinter.imprimeTexto("===[Codigo QrCode Gertec IMG]==");
            gertecPrinter.imprimeBarCodeIMG("Gertec Developer Partner IMG", 240,240,"QR_CODE");

            gertecPrinter.avancaLinha(100);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }




    @ReactMethod
    public void startCameraV1(String titulo){

        switch (titulo){
            case "EAN 8":

                this.tipoCode = "EAN_8";
                break;

            case "EAN 13":

                this.tipoCode = "EAN_13";
                break;

            case "EAN 14":

                this.tipoCode = "EAN_14";
                break;

            case "QRCODE":

                this.tipoCode = "QR_CODE";
                break;
        }

        Activity activity = getCurrentActivity();
        IntentIntegrator qrScan = new IntentIntegrator(activity);


        qrScan.setPrompt("Digitalizar o código " + titulo );
        qrScan.setBeepEnabled(true);
        qrScan.setBarcodeImageEnabled(true);
        qrScan.setTimeout(30000); // 30 * 1000 => 3 minuto
        qrScan.addExtra("FLASH_MODE_ON", FLASH_MODE_ON);
        qrScan.initiateScan(Collections.singleton(this.tipoCode));


    }
    @ReactMethod
    public void startCameraV2(){
        Activity activity = getCurrentActivity();
        Intent intent = new Intent(getCurrentActivity(), CodigoBarras2.class);
        activity.startActivity(intent);
    }
    @ReactMethod
    public void nfcId(){
        Activity activity = getCurrentActivity();
        Intent  intent = new Intent(getCurrentActivity(),NfcExemploId.class);
        activity.startActivity(intent);

    }
    @ReactMethod
    public void nfcGedi(){
        Activity activity = getCurrentActivity();
        Intent  intent = new Intent(getCurrentActivity(),NfcExemploGedi.class);
        activity.startActivity(intent);
    }

    @ReactMethod
    public void realizarAcaoGer7( String json){
        System.out.println("sou o json : "+json);
        Activity activity = getCurrentActivity();
        intentGer7.putExtra("jsonReq", json);
        activity.startActivityForResult(intentGer7, 4713);

    }
    @ReactMethod
    public void realizarAcaoMsiTef(ReadableMap map, String tipo){

        Intent intentSitef = new Intent("br.com.softwareexpress.sitef.msitef.ACTIVITY_CLISITEF");


        Activity activity = getCurrentActivity();

        switch(tipo){
            case "venda":
                bundle.putString("empresaSitef",map.getString("empresaSitef"));
                bundle.putString("enderecoSitef",map.getString("enderecoSitef"));
                bundle.putString("operador", map.getString("operador"));
                bundle.putString("data", map.getString("data"));
                bundle.putString("hora", map.getString("hora"));
                bundle.putString("numeroCupom", map.getString("numeroCupom"));
                bundle.putString("valor", map.getString("valor"));
                bundle.putString("CNPJ_CPF", map.getString("CNPJ_CPF"));
                bundle.putString("comExterna", map.getString("comExterna"));
                bundle.putString("modalidade", map.getString("modalidade"));
                if( map.getString("transacoesHabilitadas")!="0"){
                    bundle.putString("transacoesHabilitadas", map.getString("transacoesHabilitadas"));
                }
                if(map.getString("numParcelas")!="0"){
                    bundle.putString("numParcelas", map.getString("numParcelas"));

                }
                if( map.getString("restricoes")!="0"){
                    bundle.putString("restricoes", map.getString("restricoes"));

                }

                bundle.putString("isDoubleValidation", map.getString("isDoubleValidation"));
                bundle.putString("caminhoCertificadoCA", map.getString("caminhoCertificadoCA"));
//                bundle.putString("comprovante", map.getString("comprovante"));
                intentSitef.putExtras(bundle);

                activity.startActivityForResult(intentSitef, 4321);
                break;
            case "cancelamento":
            case "reimpressao":
                bundle.putString("empresaSitef",map.getString("empresaSitef"));
                bundle.putString("enderecoSitef",map.getString("enderecoSitef"));
                bundle.putString("operador", map.getString("operador"));
                bundle.putString("data", map.getString("data"));
                bundle.putString("hora", map.getString("hora"));
                bundle.putString("numeroCupom", map.getString("numeroCupom"));
                bundle.putString("valor", map.getString("valor"));
                bundle.putString("CNPJ_CPF", map.getString("CNPJ_CPF"));
                bundle.putString("comExterna", map.getString("comExterna"));
                bundle.putString("modalidade", map.getString("modalidade"));
                bundle.putString("isDoubleValidation", map.getString("isDoubleValidation"));
                bundle.putString("caminhoCertificadoCA", map.getString("caminhoCertificadoCA"));
//                bundle.putString("comprovante", map.getString("comprovante"));
                intentSitef.putExtras(bundle);
                activity.startActivityForResult(intentSitef, 4321);
                break;
            case "funcoes":
                bundle.putString("empresaSitef",map.getString("empresaSitef"));
                bundle.putString("enderecoSitef",map.getString("enderecoSitef"));
                bundle.putString("operador", map.getString("operador"));
                bundle.putString("data", map.getString("data"));
                bundle.putString("hora", map.getString("hora"));
                bundle.putString("numeroCupom", map.getString("numeroCupom"));
                bundle.putString("valor", map.getString("valor"));
                bundle.putString("CNPJ_CPF", map.getString("CNPJ_CPF"));
                bundle.putString("comExterna", map.getString("comExterna"));
                bundle.putString("modalidade", map.getString("modalidade"));
                bundle.putString("isDoubleValidation", map.getString("isDoubleValidation"));
                bundle.putString("caminhoCertificadoCA", map.getString("caminhoCertificadoCA"));
//                bundle.putString("comprovante", map.getString("comprovante"));
                bundle.putString("restricoes", map.getString("restricoes"));
                intentSitef.putExtras(bundle);
                activity.startActivityForResult(intentSitef, 4321);
                break;


        }
    }

    @ReactMethod
    public void invocarMetodo(ReadableMap args){
        WritableMap params = Arguments.createMap();

        switch (args.getString("funcao")){
            case "AtivarSAT":        
                params.putString("ativar", satLib.ativarSat(
                    args.getString("codigoAtivar"),
                    args.getString("cnpj"),
                    Integer.parseInt(args.getString("random"))
                ));

                reactContext
                        .getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class)
                        .emit("eventAtivar", params);
                break;

            case "AssociarSAT":
                params.putString("associar", satLib.associarSat(
                    args.getString("cnpj"),
                    args.getString("cnpjSH"),
                    args.getString("codigoAtivar"),
                    args.getString("assinatura"),
                    Integer.parseInt(args.getString("random"))
                ));

                reactContext
                        .getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class)
                        .emit("eventAssociar", params);
                break;

            case  "ConsultarSat":
                params.putString("teste", satLib.consultarSat(
                    Integer.parseInt(args.getString("random"))
                ));

                reactContext
                        .getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class)
                        .emit("eventTeste", params);
                break;

            case  "ConsultarStatusOperacional":
                params.putString("teste", satLib.consultarStatusOperacional(
                    Integer.parseInt(args.getString("random")),
                    args.getString("codigoAtivar")
                ));

                reactContext
                    .getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class)
                    .emit("eventTeste", params);
                break;

            case  "EnviarTesteFim":
                params.putString("teste", satLib.enviarTesteFim(
                    args.getString("codigoAtivar"),
                    args.getString("xmlVenda"),
                    Integer.parseInt(args.getString("random"))
                ));
                
                reactContext
                        .getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class)
                        .emit("eventTeste", params);
                break;

            case  "CancelarUltimaVenda":
                params.putString("teste", satLib.cancelarUltimaVenda(
                    args.getString("codigoAtivar"),
                    args.getString("xmlCancelamento"),
                    args.getString("cancela"),
                    Integer.parseInt(args.getString("random"))
                ));

                reactContext
                        .getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class)
                        .emit("eventTeste", params);
                break;

            case  "EnviarTesteVendas":
                params.putString("teste", satLib.enviarTesteVendas(
                    args.getString("codigoAtivar"),
                    args.getString("xmlVenda"),
                    Integer.parseInt(args.getString("random"))
                ));

                reactContext
                        .getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class)
                        .emit("eventTeste", params);
                break;

            case  "ConsultarNumeroSessao":
                params.putString("teste", satLib.consultarNumeroSessao(
                    args.getString("codigoAtivar"),
                    Integer.parseInt(args.getString("sessao")),
                    Integer.parseInt(args.getString("random"))
                ));

                reactContext
                        .getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class)
                        .emit("eventTeste", params);
                break;
            
            case "TrocarCodAtivacao":
                params.putString("alterar", satLib.trocarCodAtivacao(
                    args.getString("codigoAtivar"),
                    Integer.parseInt(args.getString("op")),
                    args.getString("codigoAtivarNovo"),
                    Integer.parseInt(args.getString("random"))
                ));

                reactContext
                        .getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class)
                        .emit("eventAlterar", params);
                break;
            
            case  "BloquearSat":
                params.putString("ferramenta", satLib.bloquearSat(
                    args.getString("codigoAtivar"),
                    Integer.parseInt(args.getString("random"))
                ));

                reactContext
                        .getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class)
                        .emit("eventFerramenta", params);
                break;

            case  "DesbloquearSat":
                params.putString("ferramenta", satLib.desbloquearSat(
                    args.getString("codigoAtivar"),
                    Integer.parseInt(args.getString("random"))
                ));

                reactContext
                        .getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class)
                        .emit("eventFerramenta", params);
                break;

            case  "ExtrairLog":
                params.putString("ferramenta", satLib.extrairLog(
                    args.getString("codigoAtivar"),
                    Integer.parseInt(args.getString("random"))
                ));

                reactContext
                        .getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class)
                        .emit("eventFerramenta", params);
                break;

            case  "AtualizarSoftware":
                params.putString("ferramenta", satLib.atualizarSoftware(
                    args.getString("codigoAtivar"),
                    Integer.parseInt(args.getString("random"))
                ));

                reactContext
                        .getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class)
                        .emit("eventFerramenta", params);
                break;

            case  "Versao":
                params.putString("ferramenta", satLib.versao());
                reactContext
                        .getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class)
                        .emit("eventFerramenta", params);
                break;
        }
    }

    @ReactMethod
    public  void configRede(int random, String codigoAtivacao, ReadableArray dadosXml) throws IOException {
        try {
            WritableMap params = Arguments.createMap();
            params.putString("rede", satLib.enviarConfRede(random, dadosXml, codigoAtivacao));
            reactContext
                    .getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class)
                    .emit("eventRede", params);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @ReactMethod
    public  void fimImpressao(){
        try {
            gertecPrinter.ImpressoraOutput();
            Toast.makeText(reactContext.getApplicationContext(), "Finalizou Impressao", Toast.LENGTH_LONG).show();

        } catch (GediException e) {
            e.printStackTrace();
        }

    }
    @ReactMethod
    public void avancaLinha(int linha) throws GediException {
        gertecPrinter.avancaLinha(linha);
    }
}
