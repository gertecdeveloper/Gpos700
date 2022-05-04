package com.gertec.exemplosgertec.ExemploSAT.SatPages;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.text.InputType;
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
 * Created by jmiranda on 10/12/2015.
 */
public class Teste extends Activity {
    private Button button_consultar, button_status, button_teste, button_vendas, button_cancelamento, button_sessao;
    private EditText txtCodAtivacao;
    private AlertDialog alerta;
    Random gerador = new Random();
    SatFunctions satFunctions;
    public String inputText;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        satFunctions = new SatFunctions(this);
        setContentView(R.layout.teste);
        button_consultar = (Button) findViewById(R.id.buttonConsultar);
        button_status = (Button) findViewById(R.id.buttonStatus);
        button_teste = (Button) findViewById(R.id.buttonFimaFim);
        button_vendas = (Button) findViewById(R.id.buttonTesteVenda);
        button_cancelamento = (Button) findViewById(R.id.buttonCancelamento);
        button_sessao = (Button) findViewById(R.id.buttonConsultarSessao);
        txtCodAtivacao = (EditText) findViewById(R.id.txtCodAtivacao);

        txtCodAtivacao.setText(GlobalValues.codAtivacao);
        button_consultar.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {
                repostaSat("ConsultarSat");
            }
        });

        button_status.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {
                if (txtCodAtivacao.getText().toString().length() >= 8) {
                    repostaSat("ConsultarStatusOperacional");
                } else {
                    Toast.makeText(Teste.this, "Código de Ativação deve ter entre 8 a 32 caracteres!", Toast.LENGTH_LONG).show();
                }
            }
        });

        button_teste.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {
                if (txtCodAtivacao.getText().toString().length() >= 8) {
                    repostaSat("EnviarTesteFim");
                } else {
                    Toast.makeText(Teste.this, "Código de Ativação deve ter entre 8 a 32 caracteres!", Toast.LENGTH_LONG).show();
                }
            }
        });

        button_vendas.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {
                if (txtCodAtivacao.getText().toString().length() >= 8) {
                    repostaSat("EnviarTesteVendas");
                } else {
                    Toast.makeText(Teste.this, "Código de Ativação deve ter entre 8 a 32 caracteres!", Toast.LENGTH_LONG).show();
                }
            }
        });

        button_cancelamento.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {
                AlertDialog.Builder builder = new AlertDialog.Builder(Teste.this);
                //define o titulo
                builder.setTitle("Atenção");
                //define a mensagem
                builder.setMessage("Digite a chave de cancelamento");
                EditText input = new EditText(Teste.this);
                input.setText(GlobalValues.ultimaChaveVenda);
                builder.setView(input);
                builder.setNeutralButton("OK", new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int which) {
                                if (input.getText().toString().length() > 0) {
                                    inputText = input.getText().toString();
                                    repostaSat("CancelarUltimaVenda");
                                } else {
                                    Toast.makeText(Teste.this, "Digite uma chave de cancelamento!", Toast.LENGTH_LONG).show();
                                }
                            }
                        }
                );
                //cria o AlertDialog
                alerta = builder.create();
                //Exibe
                alerta.show();
            }
        });

        button_sessao.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {
                AlertDialog.Builder builder = new AlertDialog.Builder(Teste.this);
                //define o titulo
                builder.setTitle("Atenção");
                //define a mensagem
                builder.setMessage("Digite o número da sessão");
                final EditText input = new EditText(Teste.this);
                input.setInputType(InputType.TYPE_CLASS_NUMBER);
                builder.setView(input);
                builder.setNeutralButton("OK", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        if (input.getText().toString().length() > 0) {
                            inputText = input.getText().toString();
                            repostaSat("ConsultarNumeroSessao");
                        } else {
                            Toast.makeText(Teste.this, "Digite um número de sessão!", Toast.LENGTH_LONG).show();
                        }
                    }
                });

                //cria o AlertDialog
                alerta = builder.create();
                //Exibe
                alerta.show();
            }
        });
    }

    public void repostaSat(String operacao){
        String retornoOperaca = "";
        switch (operacao){
            case "ConsultarSat":
                retornoOperaca = satFunctions.consultarSat(gerador.nextInt(999999));
                break;
            case "ConsultarStatusOperacional":
                retornoOperaca = satFunctions.consultarStatusOperacional(gerador.nextInt(999999), txtCodAtivacao.getText().toString());
                break;
            case "EnviarTesteFim":
                retornoOperaca = satFunctions.enviarTesteFim(txtCodAtivacao.getText().toString(), gerador.nextInt(999999));
                break;
            case "EnviarTesteVendas":
                retornoOperaca = satFunctions.enviarTesteVendas(txtCodAtivacao.getText().toString(), gerador.nextInt(999999));
                break;
            case "CancelarUltimaVenda":
                retornoOperaca = satFunctions.cancelarUltimaVenda(txtCodAtivacao.getText().toString(), inputText, gerador.nextInt(999999));
                break;
            case "ConsultarNumeroSessao":
                retornoOperaca = satFunctions.consultarNumeroSessao(txtCodAtivacao.getText().toString(), Integer.valueOf(inputText.trim()), gerador.nextInt(999999));
                break;
            default:
                retornoOperaca = "";
                break;
        }
        GlobalValues.codAtivacao = txtCodAtivacao.getText().toString();

        RetornoSat retornoSat = OperacaoSat.invocarOperacaoSat(operacao, retornoOperaca);
        /*
         * Está verificação(abaixo) tem como objetivo capturar a "Chave de Consulta" retornado na operação EnviarTesteVendas
         * O valor é armazenado em uma variavel global e quando o usuario abre a tela para cancelar venda, o campo (Chave de Cancelamento) já fica preenchido
         */
        if (operacao.equals("EnviarTesteVendas")) {
            GlobalValues.ultimaChaveVenda = retornoSat.getChaveConsulta();
//             = GlobalValues.valorCfe;
        }
            //* Está função [OperacaoSat.formataRetornoSat] recebe como parâmetro a operação realizada e um objeto do tipo RetornoSat
        //* Retorna uma String com os valores obtidos do retorno da Operação já formatados e prontos para serem exibidos na tela
        // Recomenda-se acessar a função e entender como ela funciona
        String retornoFormatado = OperacaoSat.formataRetornoSat(retornoSat);
        ComponentsGertec.dialogoRetorno(retornoFormatado, this);
    }
}
