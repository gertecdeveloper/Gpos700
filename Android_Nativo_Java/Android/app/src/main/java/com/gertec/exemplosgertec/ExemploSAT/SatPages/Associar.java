package com.gertec.exemplosgertec.ExemploSAT.SatPages;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
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
 * Created by jmiranda on 07/12/2015.
 */
public class Associar extends Activity {
    private TextWatcher cnpjMask;
    private Button button_associar;
    private EditText txtCodAtivacao, txtAssinatura;
    private AlertDialog alerta;
    Random gerador = new Random();
    SatFunctions satFunctions;
    CommonCode commonCode = new CommonCode();
    Context context;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        satFunctions = new SatFunctions(this);
        setContentView(R.layout.assinatura);
        button_associar = (Button) findViewById(R.id.buttonAssociar);
        txtCodAtivacao = (EditText) findViewById(R.id.txtCodAtivacao);
        txtAssinatura = (EditText) findViewById(R.id.txtAssinatura);
        final EditText editCnpj = (EditText) findViewById(R.id.txtCNPJ);
        cnpjMask = Mask.insert("##.###.###/####-##", editCnpj);
        editCnpj.addTextChangedListener(cnpjMask);
        final EditText editCnpjSW = (EditText) findViewById(R.id.txtSW);
        cnpjMask = Mask.insert("##.###.###/####-##", editCnpjSW);
        editCnpjSW.addTextChangedListener(cnpjMask);
        txtCodAtivacao.setText(GlobalValues.codAtivacao);
        context = this;
        button_associar.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {
                if (txtCodAtivacao.getText().toString().length() >= 8) {
                    if (txtAssinatura.getText().toString().length() != 0) {

                        GlobalValues.codAtivacao = txtCodAtivacao.getText().toString();
                        String resp = satFunctions.associarSat(
                                commonCode.removeMaskCnpj(editCnpj.getText().toString()),
                                commonCode.removeMaskCnpj(editCnpjSW.getText().toString()),
                                txtCodAtivacao.getText().toString(), txtAssinatura.getText().toString(),
                                gerador.nextInt(999999)
                        );
                        RetornoSat retornoSat = OperacaoSat.invocarOperacaoSat("AssociarSAT", resp);

                        //* Está função [OperacaoSat.formataRetornoSat] recebe como parâmetro a operação realizada e um objeto do tipo RetornoSat
                        //* Retorna uma String com os valores obtidos do retorno da Operação já formatados e prontos para serem exibidos na tela
                        // Recomenda-se acessar a função e entender como ela funciona
                        String retornoFormatado = OperacaoSat.formataRetornoSat(retornoSat);
                        ComponentsGertec.dialogoRetorno(retornoFormatado, context);

                    } else {
                        Toast.makeText(Associar.this, "Assinatura AC Inválida!", Toast.LENGTH_LONG).show();
                    }
                } else {
                    Toast.makeText(Associar.this, "Código de Ativação deve ter entre 8 a 32 caracteres!", Toast.LENGTH_LONG).show();
                }
            }
        });
    }
}
