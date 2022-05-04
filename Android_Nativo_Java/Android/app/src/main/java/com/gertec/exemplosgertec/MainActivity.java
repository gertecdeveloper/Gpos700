package com.gertec.exemplosgertec;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.TextView;

import com.gertec.exemplosgertec.ExemploCodigoBarras1.CodigoBarras1;
import com.gertec.exemplosgertec.ExemploCodigoBarras2.CodigoBarras2;
import com.gertec.exemplosgertec.ExemploNFCGedi.NfcExemploGedi;
import com.gertec.exemplosgertec.ExemploNFCId.NfcExemploId;
import com.gertec.exemplosgertec.ExemploNFCIdRW.NfcExemplo;
import com.gertec.exemplosgertec.ExemploImpressora.Impressora;
import com.gertec.exemplosgertec.ExemploSAT.SatPages.MenuSat;
import com.gertec.exemplosgertec.ExemploTEF.Tef;


import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {

    public static final String G700 = "GPOS700";
    private static final String version = "v1.0.0";

    public static String Model = Build.MODEL;

    ArrayList<Projeto> projetos = new ArrayList<Projeto>();
    ListView lvProjetos;

    TextView txtProject;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        txtProject = findViewById(R.id.txtNameProject);
        lvProjetos = findViewById(R.id.lvProjetos);

        txtProject.setText("Android Studio "+ version);

        projetos.add(new Projeto("Código de Barras", R.drawable.barcode));
        projetos.add(new Projeto("Código de Barras V2",R.drawable.qr_code));
        projetos.add(new Projeto("Impressão",R.drawable.print));


        if(Model.equals(G700)){
            projetos.add(new Projeto("NFC Gedi",R.drawable.nfc));
            projetos.add(new Projeto("NFC Id",R.drawable.nfc1));

        }else{
            projetos.add(new Projeto("NFC Leitura/Gravação",R.drawable.nfc2));
        }

        projetos.add(new Projeto("TEF", R.drawable.tef));
        projetos.add(new Projeto("SAT", R.drawable.icon_sat));

        ProjetoAdapter adapter = new ProjetoAdapter(getBaseContext(), R.layout.listprojetos, projetos);
        lvProjetos.setAdapter(adapter);
        lvProjetos.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                Projeto projeto = (Projeto) lvProjetos.getItemAtPosition(i);

                Intent intent = null;
                switch (projeto.getNome()){
                    case "Código de Barras":
                        // Toast.makeText(getApplicationContext(), projeto.getNome(), Toast.LENGTH_LONG).show();
                        intent = new Intent(MainActivity.this, CodigoBarras1.class);
                        break;
                    case "Código de Barras V2":
                        // Toast.makeText(getApplicationContext(), projeto.getNome(), Toast.LENGTH_LONG).show();
                        intent = new Intent(MainActivity.this, CodigoBarras2.class);
                        break;
                    case "Impressão":
                        // Toast.makeText(getApplicationContext(), projeto.getNome(), Toast.LENGTH_LONG).show();
                        intent = new Intent(MainActivity.this, Impressora.class);
                        break;
                    case "NFC Gedi":
                        intent = new Intent(MainActivity.this, NfcExemploGedi.class);
                        // Toast.makeText(getApplicationContext(), projeto.getNome(), Toast.LENGTH_LONG).show();
                        break;
                    case "NFC Id":
                        intent = new Intent(MainActivity.this, NfcExemploId.class);
                        // Toast.makeText(getApplicationContext(), projeto.getNome(), Toast.LENGTH_LONG).show();
                        break;
                    case "NFC Leitura/Gravação":
                        // Toast.makeText(getApplicationContext(), projeto.getNome(), Toast.LENGTH_LONG).show();
                        // intent = new Intent(MainActivity.this, NfcActivity.class);
                        intent = new Intent(MainActivity.this, NfcExemplo.class);
                        break;
                    case "TEF":
                        intent = new Intent(MainActivity.this, Tef.class);
                        break;
                    case "SAT":
                        intent = new Intent(MainActivity.this, MenuSat.class);
                        break;
                }
                if(intent != null){
                    startActivity(intent);
                }
            }
        });
    }
}
