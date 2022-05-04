package com.gertec.exemplosgertec.ExemploCodigoBarras2;

import android.Manifest;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.pm.PackageManager;
import android.media.MediaPlayer;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;

import com.gertec.exemplosgertec.R;
import com.google.zxing.Result;

import me.dm7.barcodescanner.zxing.ZXingScannerView;

public class CodigoBarras2 extends AppCompatActivity implements View.OnClickListener, ZXingScannerView.ResultHandler {

    private static final String ACESSO_NEGADO = "Permissão negada à câmera";

    private boolean flash = false;

    private ViewGroup contentFrame;

    private ZXingScannerView mScannerView;

    private TextView txtLeitura;

    private Button btnFlash;

    int StartCameraFlag = 0;

    public static final String G700x = "GPOS700";
    public static final String G800x = "Smart G800";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.codigo_barras2);

        ActivityCompat.requestPermissions(CodigoBarras2.this,
                new String[]{Manifest.permission.CAMERA},
                1);

        txtLeitura = findViewById(R.id.textLeitura);

        btnFlash = findViewById(R.id.btnLigarFlash);

        btnFlash.setOnClickListener(this);

        contentFrame = (ViewGroup) findViewById(R.id.content_frame);
        mScannerView = new ZXingScannerView(this);
        contentFrame.addView(mScannerView);
    }

    @Override
    public void onClick(View view) {

        switch (view.getId()){
            case R.id.btnLigarFlash:
                if(flash){
                    mScannerView.setFlash(false);
                    flash = false;
                    btnFlash.setText("Flash - Desligado");
                }else{
                    mScannerView.setFlash(true);
                    flash = true;
                    btnFlash.setText("Flash - Ligado");
                }
        }
    }

    @Override
    public void onResume() {
        super.onResume();
        startCamera();
    }

    @Override
    public void onPause() {
        super.onPause();
        mScannerView.stopCamera();
    }
    @Override
    public void onDestroy() {
        super.onDestroy();
        if(mScannerView!=null)
            mScannerView.stopCamera();
    }


    @Override
    public void onRequestPermissionsResult(int requestCode, String permissions[], int[] grantResults) {
        switch (requestCode) {
            case 1: {
                if (grantResults.length > 0
                        && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                } else {
                    Toast.makeText(CodigoBarras2.this, ACESSO_NEGADO, Toast.LENGTH_SHORT).show();
                }
                return;
            }
        }
    }

    @Override
    public void handleResult(Result result) {

        //new Thread(new Runnable() {
        //    @Override
        //    public void run() {
        //        try {
        //            stopCamera();
        //            Thread.sleep(1000);
        //        } catch (InterruptedException e) {
        //            e.printStackTrace();
        //        }
        //    }
        //});

        //Aciona o beep
        MediaPlayer mp;
        mp = MediaPlayer.create(getApplicationContext(),R.raw.beep);// the song is a filename which i have pasted inside a folder **raw** created under the **res** folder.//
         mp.start();

        AlertDialog alertDialog = new AlertDialog.Builder(CodigoBarras2.this).create();
        alertDialog.setTitle("Código " + result.getBarcodeFormat());
        alertDialog.setMessage(result.getBarcodeFormat() + ": " + result.getText());
        alertDialog.setButton(AlertDialog.BUTTON_NEUTRAL, "OK",
                new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.dismiss();
                        startCamera();
                    }
                });
        alertDialog.show();

        txtLeitura.setText(result.getBarcodeFormat() + ": " + result.getText());
        //startCamera();

    }

    protected void startCamera(){
        contentFrame.setVisibility(View.VISIBLE);
        mScannerView.setResultHandler(this);
        mScannerView.setAutoFocus(true);

        if(Build.MODEL.equals(G700x)){
            if(StartCameraFlag == 0) {
                mScannerView.startCamera();
                StartCameraFlag = 1;
            }else {
                mScannerView.resumeCameraPreview(this);
            }
        }else{
            mScannerView.startCamera();
        }
    }

    protected void stopCamera(){
        mScannerView.stopCamera();
        contentFrame.setVisibility(View.INVISIBLE);
    }

}
