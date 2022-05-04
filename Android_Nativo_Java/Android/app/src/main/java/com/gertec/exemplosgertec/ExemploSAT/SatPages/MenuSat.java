package com.gertec.exemplosgertec.ExemploSAT.SatPages;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.appcompat.app.AppCompatActivity;

import com.gertec.exemplosgertec.R;

public class MenuSat extends AppCompatActivity {
    private Button button_ativar, button_associar, button_teste, button_rede, button_alterar, button_outros;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.menu_sat);
        button_ativar = findViewById(R.id.buttonAtivar2);
        button_associar = findViewById(R.id.buttonAssociar2);
        button_teste = findViewById(R.id.buttonTeste);
        button_rede = findViewById(R.id.buttonRede);
        button_alterar = findViewById(R.id.buttonAlterar2);
        button_outros = findViewById(R.id.buttonOutros);

        button_ativar.setOnClickListener(arg0 -> {
            Intent it = new Intent(MenuSat.this, Ativacao.class);
            startActivity(it);
        });

        button_associar.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {
                Intent it = new Intent(MenuSat.this, Associar.class);
                startActivity(it);
            }
        });

        button_alterar.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {
                Intent it = new Intent(MenuSat.this, Alterar.class);
                startActivity(it);
            }
        });

        button_outros.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {
                Intent it = new Intent(MenuSat.this, Ferramentas.class);
                startActivity(it);
            }
        });

        button_rede.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {
                Intent it = new Intent(MenuSat.this, Rede.class);
                startActivity(it);
            }
        });

        button_teste.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {
                Intent it = new Intent(MenuSat.this, Teste.class);
                startActivity(it);
            }
        });
    }
}
