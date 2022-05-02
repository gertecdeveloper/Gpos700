package com.gertec_framework;

import android.app.PendingIntent;
import android.content.Intent;
import android.content.IntentFilter;
import android.nfc.NfcAdapter;
import android.nfc.Tag;
import android.nfc.tech.IsoDep;
import android.nfc.tech.MifareClassic;
import android.os.Bundle;
import android.util.Log;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.facebook.react.ReactActivity;
import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.modules.core.DeviceEventManagerModule;

public class NfcExemploId extends ReactActivity {

    private final static String TAG = NfcExemploId.class.getName();

    // Adaptador NFC
    private NfcAdapter nfcAdapter;
    // Class MifareClassic tipo de cartao q ele vai ler os 2 mais usados no mercado, cada um trabalha de uma maneira, grava texto, grava por setor
    // depende do cartao o nosso desenvolvimento
    private MifareClassic mifareClassic;

    // Tag do Cartão
    private Tag tag;

    // Text
    private TextView text;

    // Static
    private static int Contador = 0;
    // Class IsoDep
    private IsoDep isoDep;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.nfcexemploid);
        text = findViewById(R.id.lblText);
    }

    /*
    * Trecho principal pra ligar o NFC
    * Caso não exista esse código dentro do onStart, a NFC não vai funcionar.
    * */
    @Override
    protected void onStart() {
        super.onStart();
        nfcAdapter = NfcAdapter.getDefaultAdapter(this);
    }

    /*
     * Filtrar todas as tags que queremos define as tags de cartao, passa pro ident filter
     *
     * */
    @Override
    protected void onResume() {
        super.onResume();

        Log.d(TAG, "onResume");

        IntentFilter tagDetected = new IntentFilter(NfcAdapter.ACTION_TAG_DISCOVERED);
        IntentFilter ndefDetected = new IntentFilter(NfcAdapter.ACTION_NDEF_DISCOVERED);
        IntentFilter techDetected = new IntentFilter(NfcAdapter.ACTION_TECH_DISCOVERED);
        IntentFilter idDetected = new IntentFilter((NfcAdapter.EXTRA_ID));
        IntentFilter[] nfcIntentFilter = new IntentFilter[]{techDetected,tagDetected,ndefDetected, idDetected};

        PendingIntent pendingIntent = PendingIntent.getActivity(
                this, 0, new Intent(this, getClass()).addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP), 0);

        // Deixa o sensor da NFC em alerta.
        if(nfcAdapter!= null)
            nfcAdapter.enableForegroundDispatch(this, pendingIntent, nfcIntentFilter, null);

    }

    /*
     * Todo os retornos da NFC devem ser tratados nesse método.
     * Aqui deve ser feito todos os tratamentos para converter do id do cartão de Byte para Int ou String
     *
     * */
    @Override
    public void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        try {
            tag = intent.getParcelableExtra(NfcAdapter.EXTRA_TAG);
            if(tag == null){
                Toast.makeText(getApplicationContext(), "Não foi possível ler o cartão.", Toast.LENGTH_SHORT).show();
            }else{
                LerCartaoNfc();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Faz a leitura do ID do cartão
    protected void LerCartaoNfc(){
        mifareClassic = MifareClassic.get(tag);
        Contador += 1;
        if(mifareClassic == null){
            isoDep = IsoDep.get(tag);
        }
//        text.setText("Leitura: " + Contador + "\nId do Cartão: " + idCartao());
        WritableMap params = Arguments.createMap();
        params.putString("id", "\nId do Cartão: " + idCartao());
        getReactInstanceManager().getCurrentReactContext()
                .getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class)
                .emit("eventId", params);
        finish();
    }

    // Converte o ID do cartão que esta em Bytes para String
    public String idCartao() {

        byte[] idCartao = mifareClassic.getTag().getId();
        long result = 0;

        if (idCartao == null) return "";

        for (int i = idCartao.length - 1; i >= 0; --i) {
            result <<= 8;
            result |= idCartao[i] & 0x0FF;
        }
        Log.d(TAG, "ID Cartão INT: " + Long.toString(result));
        Log.d(TAG, "ID Cartão HEX: " + bytesToHex(idCartao));
        return Long.toString(result);
        
    }

    private static String bytesToHex(byte[] hashInBytes) {

        StringBuilder sb = new StringBuilder();
        for (byte b : hashInBytes) {
            sb.append(String.format("%02x", b));
        }
        return sb.toString();
    }

}
