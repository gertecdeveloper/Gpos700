package com.gertec.exemplosgertec.ExemploSAT.SatPages;

import android.app.Activity;
import android.app.AlertDialog;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
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
public class Ferramentas extends Activity {
    private Button button_bloquear, button_desbloquear, button_log, button_atualizar, button_versao;
    private EditText txtCodAtivacao;
    private AlertDialog alerta;
    Random gerador = new Random();
    SatFunctions satFunctions;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        satFunctions = new SatFunctions(this);
        setContentView(R.layout.ferramentas);
        button_bloquear = (Button) findViewById(R.id.buttonBloquear);
        button_desbloquear = (Button) findViewById(R.id.buttonDesbloquear);
        button_log = (Button) findViewById(R.id.buttonLog);
        button_atualizar = (Button) findViewById(R.id.buttonAtualizar);
        button_versao = (Button) findViewById(R.id.buttonVersao);
        txtCodAtivacao = (EditText) findViewById(R.id.txtCodAtivacao);

        txtCodAtivacao.setText(GlobalValues.codAtivacao);

        button_bloquear.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {
                if (txtCodAtivacao.getText().toString().length() >= 8) {
                    repostaSat("BloquearSat");
                } else {
                    Toast.makeText(Ferramentas.this, "Código de Ativação deve ter entre 8 a 32 caracteres!", Toast.LENGTH_LONG).show();
                }
            }
        });

        button_desbloquear.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {
                if (txtCodAtivacao.getText().toString().length() >= 8) {
                    repostaSat("DesbloquearSat");
                } else {
                    Toast.makeText(Ferramentas.this, "Código de Ativação deve ter entre 8 a 32 caracteres!", Toast.LENGTH_LONG).show();
                }
            }
        });

        button_log.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {
                if (txtCodAtivacao.getText().toString().length() >= 8) {
                    repostaSat("ExtrairLog");
                } else {
                    Toast.makeText(Ferramentas.this, "Código de Ativação deve ter entre 8 a 32 caracteres!", Toast.LENGTH_LONG).show();
                }
            }
        });

        button_atualizar.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {
                if (txtCodAtivacao.getText().toString().length() >= 8) {
                    repostaSat("AtualizarSoftware");
                } else {
                    Toast.makeText(Ferramentas.this, "Código de Ativação deve ter entre 8 a 32 caracteres!", Toast.LENGTH_LONG).show();
                }
            }
        });

        button_versao.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {
                try {
                    repostaSat("Versao");
                } catch (Exception e) {
                    Toast.makeText(Ferramentas.this, "Erro ao verificar versão!", Toast.LENGTH_LONG).show();
                }
            }
        });
    }

    public void repostaSat(String operacao){
        String retornoOperaca = "";
        switch (operacao){
            case "BloquearSat":
                retornoOperaca = satFunctions.bloquearSat(txtCodAtivacao.getText().toString(), gerador.nextInt(999999));
                break;
            case "DesbloquearSat":
                retornoOperaca = satFunctions.desbloquearSat(txtCodAtivacao.getText().toString(), gerador.nextInt(999999));
                break;
            case "ExtrairLog":
                retornoOperaca = satFunctions.extrairLog(txtCodAtivacao.getText().toString(), gerador.nextInt(999999));
                break;
            case "AtualizarSoftware":
                retornoOperaca = satFunctions.atualizarSoftware(txtCodAtivacao.getText().toString(), gerador.nextInt(999999));
                break;
            case "Versao":
                retornoOperaca = satFunctions.versao();
                break;
            default:
                retornoOperaca = "";
                break;
        }
        GlobalValues.codAtivacao = txtCodAtivacao.getText().toString();

        RetornoSat retornoSat = OperacaoSat.invocarOperacaoSat(operacao, retornoOperaca);

        //* Está função [OperacaoSat.formataRetornoSat] recebe como parâmetro a operação realizada e um objeto do tipo RetornoSat
        //* Retorna uma String com os valores obtidos do retorno da Operação já formatados e prontos para serem exibidos na tela
        // Recomenda-se acessar a função e entender como ela funciona
        String retornoFormatado = OperacaoSat.formataRetornoSat(retornoSat);
        ComponentsGertec.dialogoRetorno(retornoFormatado, this);
    }
}
