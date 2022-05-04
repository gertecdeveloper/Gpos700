package com.gertec.exemplosgertec.ExemploSAT.SatPages;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Toast;

import com.gertec.exemplosgertec.Components.ComponentsGertec;
import com.gertec.exemplosgertec.ExemploSAT.ServiceSAT.OperacaoSat;
import com.gertec.exemplosgertec.ExemploSAT.ServiceSAT.RetornoSat;
import com.gertec.exemplosgertec.ExemploSAT.ServiceSAT.SatFunctions;
import com.gertec.exemplosgertec.GlobalValues;
import com.gertec.exemplosgertec.R;

import java.util.Random;

/**
 * Created by jmiranda on 08/12/2015.
 */
public class Alterar extends Activity {
    private Button button_alterar;
    private EditText txtCodAtual, txtCodNovo, txtCodConfirmar;
    private Spinner spinner;
    ArrayAdapter<String> adapter = null;
    private AlertDialog alerta;
    private int opcao = 1;
    String[] optCod = new String[]{"Código de ativação", "Código de Emergência"};
    Random gerador = new Random();
    SatFunctions satFunctions;
    Context context;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        satFunctions = new SatFunctions(this);
        setContentView(R.layout.alterar);
        context = this;
        txtCodAtual = findViewById(R.id.txtCodAtual);
        txtCodConfirmar = findViewById(R.id.txtCodConfirmar);
        txtCodNovo = findViewById(R.id.txtCodNovo);
        spinner = findViewById(R.id.Spinner1);
        txtCodAtual.setText(GlobalValues.codAtivacao);
        button_alterar = findViewById(R.id.buttonAlterar);
        adapter = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_item, optCod);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner.setAdapter(adapter);

        button_alterar.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {
                try {
                    if (txtCodAtual.getText().toString().length() >= 8 && txtCodNovo.getText().toString().length() >= 8) {
                        if (txtCodNovo.getText().toString().equals(txtCodConfirmar.getText().toString())) {
                            if (spinner.getSelectedItem().equals("Código de ativação")) {
                                opcao = 1;
                            } else {
                                opcao = 2;
                            }
                            GlobalValues.codAtivacao = txtCodNovo.getText().toString();
                            String resp = satFunctions.trocarCodAtivacao(txtCodAtual.getText().toString(), opcao, txtCodNovo.getText().toString(), gerador.nextInt(999999));
                            RetornoSat retornoSat = OperacaoSat.invocarOperacaoSat("TrocarCodAtivacao", resp);

                            //* Está função [OperacaoSat.formataRetornoSat] recebe como parâmetro a operação realizada e um objeto do tipo RetornoSat
                            //* Retorna uma String com os valores obtidos do retorno da Operação já formatados e prontos para serem exibidos na tela
                            // Recomenda-se acessar a função e entender como ela funciona
                            String retornoFormatado = OperacaoSat.formataRetornoSat(retornoSat);
                            ComponentsGertec.dialogoRetorno(retornoFormatado, context);
                        } else {
                            Toast.makeText(Alterar.this, "O Novo Código de Ativação e a Confirmação do Novo Código de Ativação não correspondem!", Toast.LENGTH_LONG).show();
                        }
                    } else {
                        Toast.makeText(Alterar.this, "Código de Ativação deve ter entre 8 a 32 caracteres!", Toast.LENGTH_LONG).show();
                    }
                } catch (Exception e) {

                }
            }
        }
        );
    }
}

