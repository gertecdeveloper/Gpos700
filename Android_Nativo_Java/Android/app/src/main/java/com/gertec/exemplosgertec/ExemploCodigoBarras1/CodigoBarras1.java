package com.gertec.exemplosgertec.ExemploCodigoBarras1;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import androidx.annotation.Nullable;

import com.gertec.exemplosgertec.R;
import com.google.zxing.integration.android.IntentIntegrator;
import com.google.zxing.integration.android.IntentResult;

import java.util.ArrayList;

import static android.hardware.Camera.Parameters.FLASH_MODE_ON;

public class CodigoBarras1 extends Activity implements View.OnClickListener {

    private TextView txtLeitura;

    private Button btnEan8;
    private Button btnEan13;
    private Button btnEan14;
    private Button btnQrCode;

    private IntentIntegrator qrScan;

    private String titulo;
    private String tipoCode;

    private ArrayList<String> arrayListTipo;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.codigo_barras1);

        txtLeitura = findViewById(R.id.textLeitura);

        btnEan8 = findViewById(R.id.btnEan8);
        btnEan13 = findViewById(R.id.btnEan13);
        btnEan14 = findViewById(R.id.btnEan14);
        btnQrCode = findViewById(R.id.btnQrCode);

        btnEan8.setOnClickListener(this);
        btnEan13.setOnClickListener(this);
        btnEan14.setOnClickListener(this);
        btnQrCode.setOnClickListener(this);
    }

    @Override
    public void onClick(View view) {

        this.arrayListTipo = new ArrayList<String>();

        switch (view.getId()){
            case R.id.btnEan8:
                this.titulo = "EAN 8";
                this.tipoCode = "EAN_8";
                break;

            case R.id.btnEan13:
                this.titulo = "EAN 13";
                this.tipoCode = "EAN_13";
                break;

            case R.id.btnEan14:
                this.titulo = "EAN 14";
                this.tipoCode = "EAN_14";
                break;

            case R.id.btnQrCode:
                this.titulo = "QrCode";
                this.tipoCode = "QR_CODE";
                break;
        }

        arrayListTipo.add(this.tipoCode);
        startCamera();
    }

    private void startCamera(){
        qrScan = new IntentIntegrator(this);
        qrScan.setPrompt("Digitalizar o código " + titulo );
        qrScan.setBeepEnabled(true);
        qrScan.setBarcodeImageEnabled(true);
        qrScan.setTimeout(30000); // 30 * 1000 => 3 minuto
        qrScan.addExtra("FLASH_MODE_ON", FLASH_MODE_ON);
        qrScan.initiateScan(this.arrayListTipo);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        IntentResult intentResult = IntentIntegrator.parseActivityResult(requestCode, resultCode, data);

        StringBuilder stringBuilder = new StringBuilder(txtLeitura.getText().toString());

        if (intentResult != null) {
            //if qrcode has nothing in it
            if (intentResult.getContents() == null) {
                // Toast.makeText(this, "Result Not Found", Toast.LENGTH_LONG).show();
                stringBuilder.append(this.tipoCode +": Não foi possível ler o código.\n");
                txtLeitura.setText(stringBuilder.toString());
            } else {
                //if qr contains data
                try {

                    Log.i(this.tipoCode, intentResult.getContents());
                    stringBuilder.append(this.tipoCode + ": " + intentResult.getContents() + "\n");
                    txtLeitura.setText(stringBuilder.toString());


                } catch (Exception e) {
                    e.printStackTrace();
                    stringBuilder.append(this.tipoCode +": Erro " + e.getMessage() + "\n");
                    txtLeitura.setText(stringBuilder.toString());
                }
            }
        } else {
            super.onActivityResult(requestCode, resultCode, data);
            stringBuilder.append(this.tipoCode +": Não foi possível fazer a leitura.\n");
            txtLeitura.setText(stringBuilder.toString());
        }

    }

}
