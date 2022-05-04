package com.gertec.exemplosgertec.ExemploNFCIdRW;

import android.app.PendingIntent;
import android.content.Intent;
import android.content.IntentFilter;
import android.nfc.NfcAdapter;
import android.nfc.Tag;
import android.nfc.tech.Ndef;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.gertec.exemplosgertec.ExemploNFCIdRW.fragment.NFCFormatFragment;
import com.gertec.exemplosgertec.ExemploNFCIdRW.fragment.NFCReadFragment;
import com.gertec.exemplosgertec.ExemploNFCIdRW.fragment.NFCWriteFragment;
import com.gertec.exemplosgertec.ExemploNFCIdRW.fragment.NFCWriteReadFragment;
import com.gertec.exemplosgertec.R;

public class NfcExemplo extends AppCompatActivity {

    private EditText editMesagemPadrao;
    private Button btn_ler;
    private Button btn_gravar;
    private Button btn_forceteste;
    private Button btn_formatarCartao;

    private boolean isDialogDisplayed = false;
    private boolean isWrite = false;
    private boolean isRead  = false;
    private boolean isFormat = false;
    private boolean isForceTeste = false;

    private NFCWriteFragment mNfcWriteFragment;
    private NFCReadFragment mNfcReadFragment;
    private NFCWriteReadFragment nfcWriteReadFragment;
    private NFCFormatFragment nfcFormatFragment;

    private NfcAdapter mNfcAdapter;

    private static final String MENSAGEM_PADRAO = "GERTEC";
    private int processo = 1000;
    private byte[] getID;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.nfcexemplo);

        editMesagemPadrao = (EditText) findViewById(R.id.editMensagemPadrao);
        btn_ler = (Button) findViewById(R.id.btn_leitura);
        btn_gravar = (Button) findViewById(R.id.btn_gravar);
        btn_forceteste = (Button) findViewById(R.id.btn_teste);
        btn_formatarCartao = (Button) findViewById(R.id.btn_formatarCartao);

        initViews();
        initNFC();
    }

    private void initViews() {

        btn_gravar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showWriteFragment();
            }
        });

        btn_ler.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showReadFragment();
            }
        });

        btn_forceteste.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showReadWriteFragment();
            }
        });

        btn_formatarCartao.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showFormatFragment();
            }
        });

    }

    private void initNFC(){

        mNfcAdapter = NfcAdapter.getDefaultAdapter(this);
        // nfcManager = new NfcManager(this);

    }


    private void showWriteFragment() {

        isWrite = true;
        isRead = false;
        isForceTeste = false;
        isFormat = false;

        mNfcWriteFragment = (NFCWriteFragment) getFragmentManager().findFragmentByTag(NFCWriteFragment.TAG);

        if (mNfcWriteFragment == null) {

            mNfcWriteFragment = NFCWriteFragment.newInstance();
        }
        mNfcWriteFragment.show(getFragmentManager(),NFCWriteFragment.TAG);

    }

    private void showReadFragment() {

        isRead = true;
        isWrite = false;
        isForceTeste = false;
        isFormat = false;

        mNfcReadFragment = (NFCReadFragment) getFragmentManager().findFragmentByTag(NFCReadFragment.TAG);

        if (mNfcReadFragment == null) {

            mNfcReadFragment = NFCReadFragment.newInstance();
        }
        mNfcReadFragment.show(getFragmentManager(),NFCReadFragment.TAG);

    }

    private void showFormatFragment(){

        isFormat = true;
        isForceTeste = false;
        isRead = false;
        isWrite = false;

        nfcFormatFragment = (NFCFormatFragment) getFragmentManager().findFragmentByTag(NFCFormatFragment.TAG);

        if (nfcFormatFragment == null) {

            nfcFormatFragment = NFCFormatFragment.newInstance();
        }
        nfcFormatFragment.show(getFragmentManager(),NFCFormatFragment.TAG);

    }

    private void showReadWriteFragment(){

        isForceTeste = true;
        isRead = false;
        isWrite = false;
        isFormat = false;
        processo = 1000;

        nfcWriteReadFragment = (NFCWriteReadFragment) getFragmentManager().findFragmentByTag(NFCWriteReadFragment.TAG);

        if (nfcWriteReadFragment == null) {

            nfcWriteReadFragment = NFCWriteReadFragment.newInstance();
        }
        nfcWriteReadFragment.show(getFragmentManager(),NFCWriteReadFragment.TAG);

    }

    public void onDialogDisplayed() {

        isDialogDisplayed = true;
    }

    public void onDialogDismissed() {

        isDialogDisplayed = false;

    }

    @Override
    protected void onResume() {
        super.onResume();
        IntentFilter tagDetected = new IntentFilter(NfcAdapter.ACTION_TAG_DISCOVERED);
        IntentFilter ndefDetected = new IntentFilter(NfcAdapter.ACTION_NDEF_DISCOVERED);
        IntentFilter techDetected = new IntentFilter(NfcAdapter.ACTION_TECH_DISCOVERED);
        IntentFilter idDetected = new IntentFilter((NfcAdapter.EXTRA_ID));
        IntentFilter[] nfcIntentFilter = new IntentFilter[]{techDetected,tagDetected,ndefDetected, idDetected};

        PendingIntent pendingIntent = PendingIntent.getActivity(
                this, 0, new Intent(this, getClass()).addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP), 0);
        if(mNfcAdapter!= null)
            mNfcAdapter.enableForegroundDispatch(this, pendingIntent, nfcIntentFilter, null);

    }

    @Override
    protected void onPause() {
        super.onPause();
        if(mNfcAdapter!= null)
            mNfcAdapter.disableForegroundDispatch(this);
    }

    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        Tag tag = intent.getParcelableExtra(NfcAdapter.EXTRA_TAG);

        Log.d("TAG", "onNewIntent: " + intent.getAction());

        if (tag != null) {

            Ndef ndef = Ndef.get(tag);

            if (isDialogDisplayed) {

                if(ndef == null){
                    mNfcReadFragment = (NFCReadFragment) getFragmentManager().findFragmentByTag(NFCReadFragment.TAG);
                    mNfcReadFragment.onNfcDetected(tag);
                }else if (isWrite) {

                    String messageToWrite = editMesagemPadrao.getText().toString();
                    if (messageToWrite.equals("")) {
                        Toast.makeText(getApplicationContext(), "Preencha uma mensagem", Toast.LENGTH_SHORT).show();
                    } else {
                        mNfcWriteFragment = (NFCWriteFragment) getFragmentManager().findFragmentByTag(NFCWriteFragment.TAG);
                        mNfcWriteFragment.onNfcDetected(ndef, messageToWrite);
                    }

                } else if (isRead) {

                    mNfcReadFragment = (NFCReadFragment) getFragmentManager().findFragmentByTag(NFCReadFragment.TAG);
                    mNfcReadFragment.onNfcDetected(ndef);

                } else if (isForceTeste) {

                    nfcWriteReadFragment = (NFCWriteReadFragment) getFragmentManager().findFragmentByTag(NFCWriteReadFragment.TAG);
                    nfcWriteReadFragment.onNfcDetected(ndef, MENSAGEM_PADRAO + String.valueOf(processo));
                    processo--;

                } else if (isFormat) {
                    nfcFormatFragment = (NFCFormatFragment) getFragmentManager().findFragmentByTag(NFCFormatFragment.TAG);
                    nfcFormatFragment.onNfcDetected(ndef);
                }
            }
        }
    }

}
