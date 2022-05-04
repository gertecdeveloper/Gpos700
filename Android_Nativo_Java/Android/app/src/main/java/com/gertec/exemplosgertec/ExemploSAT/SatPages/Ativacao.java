package com.gertec.exemplosgertec.ExemploSAT.SatPages;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.text.TextWatcher;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.gertec.exemplosgertec.Components.ComponentsGertec;
import com.gertec.exemplosgertec.ExemploSAT.ServiceSAT.OperacaoSat;
import com.gertec.exemplosgertec.ExemploSAT.ServiceSAT.RetornoSat;
import com.gertec.exemplosgertec.ExemploSAT.ServiceSAT.SatFunctions;
import com.gertec.exemplosgertec.ExemploTEF.Mask;
import com.gertec.exemplosgertec.GlobalValues;
import com.gertec.exemplosgertec.R;
import com.gertec.exemplosgertec.Util.CommonCode;

import java.util.Random;

/**
 * Created by jmiranda on 04/12/2015.
 */
public class Ativacao extends Activity {
    private TextWatcher cnpjMask;
    private Button button_ativar, button_voltar;
    private EditText txtCodAtivacao, txtConfCodAtivacao;
    Random gerador = new Random();
    SatFunctions satFunctions;
    CommonCode commonCode = new CommonCode();
    public Context context;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        satFunctions = new SatFunctions(this);
        setContentView(R.layout.ativacao);
        context = this;
        button_ativar = (Button) findViewById(R.id.buttonAtivar);
        txtCodAtivacao = (EditText) findViewById(R.id.txtCodAtivacao);
        txtConfCodAtivacao = (EditText) findViewById(R.id.txtConfCodAtivacao);
        final EditText editCnpj = (EditText) findViewById(R.id.txtCNPJ);
        cnpjMask = Mask.insert("##.###.###/####-##", editCnpj);
        editCnpj.addTextChangedListener(cnpjMask);
        txtCodAtivacao.setText(GlobalValues.codAtivacao);

        button_ativar.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {
                if (txtCodAtivacao.getText().toString().length() >= 8) {
                    if (txtCodAtivacao.getText().toString().equals(txtConfCodAtivacao.getText().toString())) {
                        GlobalValues.codAtivacao = txtCodAtivacao.getText().toString();
                        String resp = satFunctions.ativarSat(txtCodAtivacao.getText().toString(),commonCode.removeMaskCnpj(editCnpj.getText().toString()), gerador.nextInt(999999));
                        RetornoSat retornoSat = OperacaoSat.invocarOperacaoSat("AtivarSAT",resp);

                        //* Está função [OperacaoSat.formataRetornoSat] recebe como parâmetro a operação realizada e um objeto do tipo RetornoSat
                        //* Retorna uma String com os valores obtidos do retorno da Operação já formatados e prontos para serem exibidos na tela
                        // Recomenda-se acessar a função e entender como ela funciona
                        String retornoFormatado = OperacaoSat.formataRetornoSat(retornoSat);
                        System.out.println(retornoFormatado);
                        ComponentsGertec.dialogoRetorno(retornoFormatado, context);
                    } else {
                        Toast.makeText(Ativacao.this, "O Código de Ativação e a Confirmação do Código de Ativação não correspondem!", Toast.LENGTH_LONG).show();
                    }
                } else {
                    Toast.makeText(Ativacao.this, "Código de Ativação deve ter entre 8 a 32 caracteres!", Toast.LENGTH_LONG).show();
                }
            }
        });
    }
}

