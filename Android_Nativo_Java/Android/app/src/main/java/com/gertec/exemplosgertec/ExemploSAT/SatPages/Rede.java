package com.gertec.exemplosgertec.ExemploSAT.SatPages;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
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

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Random;

/**
 * Created by jmiranda on 09/12/2015.
 */
public class Rede extends Activity {
    private Button button_configurar;
    private EditText txtCodAtivacao, txtIp, txtMascara, txtGateway, txtDns, txtDns2, txtProxyIp, txtPorta, txtUser, txtPassword;
    private Spinner spinnerTipoRede, spinnerOptDns, spinnerOptProxy;
    private AlertDialog alerta;
    private static final String[] tipoRede = new String[]{"Estático", "DHCP"};
    private static final String[] optDns = new String[]{"Não", "Sim"};
    private static final String[] optProxy = new String[]{"Não usa proxy", "Proxy com configuração", "Proxy transparente"};
    private String appPackage = "com.gertec.exemplosgertec8";
    private String caminhoXML = "data/data/" + appPackage + "/configRede.xml";
    Random gerador = new Random();
    Context context;
    SatFunctions satFunctions;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        satFunctions = new SatFunctions(this);
        setContentView(R.layout.rede);
        context = this;
        button_configurar = (Button) findViewById(R.id.buttonEnviar);
        txtCodAtivacao = (EditText) findViewById(R.id.txtCodAtivacao);
        txtIp = (EditText) findViewById(R.id.txtIp);
        txtMascara = (EditText) findViewById(R.id.txtMascara);
        txtGateway = (EditText) findViewById(R.id.txtGateway);
        txtDns = (EditText) findViewById(R.id.txtDns);
        txtDns2 = (EditText) findViewById(R.id.txtDns2);
        txtProxyIp = (EditText) findViewById(R.id.txtProxyIp);
        txtPorta = (EditText) findViewById(R.id.txtPorta);
        txtUser = (EditText) findViewById(R.id.txtUser);
        txtPassword = (EditText) findViewById(R.id.txtPassword);
        spinnerTipoRede = (Spinner) findViewById(R.id.tipoRede);
        spinnerOptDns = (Spinner) findViewById(R.id.optDns);
        spinnerOptProxy = (Spinner) findViewById(R.id.optProxy);
        txtCodAtivacao.setText(GlobalValues.codAtivacao);

        ArrayAdapter adp = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_item, tipoRede);
        adp.setDropDownViewResource(android.R.layout.simple_spinner_item);
        spinnerTipoRede.setAdapter(adp);

        ArrayAdapter adp2 = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_item, optDns);
        adp2.setDropDownViewResource(android.R.layout.simple_spinner_item);
        spinnerOptDns.setAdapter(adp2);

        ArrayAdapter adp3 = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_item, optProxy);
        adp3.setDropDownViewResource(android.R.layout.simple_spinner_item);
        spinnerOptProxy.setAdapter(adp3);

        spinnerTipoRede.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            /**
             * Called when a new item is selected (in the Spinner)
             */
            public void onItemSelected(AdapterView<?> parent, View view,
                                       int pos, long id) {
                // An spinnerItem was selected. You can retrieve the selected item using
                if (spinnerTipoRede.getSelectedItem().equals("Estático")) {
                    txtIp.setEnabled(true);
                    txtMascara.setEnabled(true);
                    txtGateway.setEnabled(true);
                } else {
                    txtIp.setEnabled(false);
                    txtMascara.setEnabled(false);
                    txtGateway.setEnabled(false);
                }

            }

            public void onNothingSelected(AdapterView<?> parent) {
                // Do nothing, just another required interface callback
            }

        });

        spinnerOptDns.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            /**
             * Called when a new item is selected (in the Spinner)
             */
            public void onItemSelected(AdapterView<?> parent, View view,
                                       int pos, long id) {
                // An spinnerItem was selected. You can retrieve the selected item using
                if (spinnerOptDns.getSelectedItem().equals("Não")) {
                    txtDns.setEnabled(false);
                    txtDns2.setEnabled(false);
                } else {
                    txtDns.setEnabled(true);
                    txtDns2.setEnabled(true);
                }

            }

            public void onNothingSelected(AdapterView<?> parent) {
                // Do nothing, just another required interface callback
            }

        });

        spinnerOptProxy.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            /**
             * Called when a new item is selected (in the Spinner)
             */
            public void onItemSelected(AdapterView<?> parent, View view,
                                       int pos, long id) {
                // An spinnerItem was selected. You can retrieve the selected item using
                if (spinnerOptProxy.getSelectedItem().equals("Não usa proxy")) {
                    txtProxyIp.setEnabled(false);
                    txtPorta.setEnabled(false);
                    txtUser.setEnabled(false);
                    txtPassword.setEnabled(false);
                } else {
                    txtProxyIp.setEnabled(true);
                    txtPorta.setEnabled(true);
                    txtUser.setEnabled(true);
                    txtPassword.setEnabled(true);
                }

            }

            public void onNothingSelected(AdapterView<?> parent) {
                // Do nothing, just another required interface callback
            }

        });
        button_configurar.setOnClickListener(new View.OnClickListener() {
            public void onClick(View arg0) {
                try {
                    if (txtCodAtivacao.getText().toString().length() >= 8) {
                        GlobalValues.codAtivacao = txtCodAtivacao.getText().toString();
                        String resp = satFunctions.enviarConfRede(gerador.nextInt(999999), formatarEnvioConfigRede(), txtCodAtivacao.getText().toString());
                        RetornoSat retornoSat = OperacaoSat.invocarOperacaoSat("EnviarConfRede",resp);

                        //* Está função [OperacaoSat.formataRetornoSat] recebe como parâmetro a operação realizada e um objeto do tipo RetornoSat
                        //* Retorna uma String com os valores obtidos do retorno da Operação já formatados e prontos para serem exibidos na tela
                        // Recomenda-se acessar a função e entender como ela funciona
                        String retornoFormatado = OperacaoSat.formataRetornoSat(retornoSat);
                        ComponentsGertec.dialogoRetorno(retornoFormatado, context);
                    } else {
                        Toast.makeText(Rede.this, "Código de Ativação deve ter entre 8 a 32 caracteres!", Toast.LENGTH_LONG).show();
                    }
                } catch (Exception e) {
                    Toast.makeText(Rede.this, e.getMessage(), Toast.LENGTH_LONG).show();
                }
            }
        });
    }

    public String[] formatarEnvioConfigRede() throws IOException {
        // Define o nome do arquivo XML de configuração de rede
        String filename = "configRede.xml";
        String[] dadosXml = new String[11];
        dadosXml[0] = "";
        dadosXml[1] = "";
        dadosXml[2] = "";
        dadosXml[3] = "";
        dadosXml[4] = "";
        dadosXml[5] = "";
        dadosXml[6] = "";
        dadosXml[7] = "";
        dadosXml[8] = "";
        dadosXml[9] = "";
        dadosXml[10] = "";

        // Monta as tags do XML sobre a parte de REDE
        if (spinnerTipoRede.getSelectedItem().equals("Estático")) {
            dadosXml[0] = "<tipoLan>IPFIX</tipoLan>";
            if (!txtIp.getText().equals("")) {
                dadosXml[1] = "<lanIP>" + txtIp.getText() + "</lanIP>";
            }
            if (!txtMascara.getText().equals("")) {
                dadosXml[2] = "<lanMask>" + txtMascara.getText() + "</lanMask>";
            }
            if (!txtGateway.getText().equals("")) {
                dadosXml[3] = "<lanGW>" + txtGateway.getText() + "</lanGW>";
            }

            // Monta as tags do XML sobre a parte de DNS
            if (spinnerOptDns.getSelectedItem().equals("Sim")) {
                if (!txtDns.getText().equals("")) {
                    dadosXml[4] = "<lanDNS1>" + txtDns.getText() + "</lanDNS1>";
                }
                if (!txtDns2.getText().equals("")) {
                    dadosXml[5] = "<lanDNS2>" + txtDns2.getText() + "</lanDNS2>";
                }
            } else {
                dadosXml[4] = "<lanDNS1>8.8.8.8</lanDNS1>";
                dadosXml[5] = "<lanDNS2>4.4.4.4</lanDNS2>";
            }
        } else {
            dadosXml[0] = "<tipoLan>DHCP</tipoLan>";
            dadosXml[1] = "";
            dadosXml[2] = "";
            dadosXml[3] = "";
            dadosXml[4] = "";
            dadosXml[5] = "";
        }

        // Monta as tags do XML sobre a parte de PROXY
        if (spinnerOptProxy.getSelectedItem().equals("Não usa proxy")) {
            dadosXml[6] = "<proxy>0</proxy >";
            dadosXml[7] = "";
            dadosXml[8] = "";
            dadosXml[9] = "";
            dadosXml[10] = "";
        } else if (spinnerOptProxy.getSelectedItem().equals("Proxy com configuração")) {
            dadosXml[6] = "<proxy>1</proxy >";
            if (!txtProxyIp.getText().equals("")) {
                dadosXml[7] = "<proxy_ip>" + txtProxyIp.getText() + "</proxy_ip>";
            }
            if (!txtPorta.getText().equals("")) {
                dadosXml[8] = "<proxy_porta>" + txtPorta.getText() + "</proxy_porta>";
            }
            if (!txtUser.getText().equals("")) {
                dadosXml[9] = "<proxy_user>" + txtUser.getText() + "</proxy_user>";
            }
            if (!txtPassword.getText().equals("")) {
                dadosXml[10] = "<proxy_senha>" + txtPassword.getText() + "</proxy_senha>";
            }
        } else {
            dadosXml[6] = "<proxy>2</proxy >";
            if (!txtProxyIp.getText().equals("")) {
                dadosXml[7] = "<proxy_ip>" + txtProxyIp.getText() + "</proxy_ip>";
            }
            if (!txtPorta.getText().equals("")) {
                dadosXml[8] = "<proxy_porta>" + txtPorta.getText() + "</proxy_porta>";
            }
            if (!txtUser.getText().equals("")) {
                dadosXml[9] = "<proxy_user>" + txtUser.getText() + "</proxy_user>";
            }
            if (!txtPassword.getText().equals("")) {
                dadosXml[10] = "<proxy_senha>" + txtPassword.getText() + "</proxy_senha>";
            }
        }
        File file = new File(caminhoXML);
        // Se o arquivo não existe, então cria
        if (!file.exists()) {
            file.createNewFile();
        }
        // Começa a escrever no arquivo
        FileWriter fw = new FileWriter(file.getAbsoluteFile());
        BufferedWriter bw = new BufferedWriter(fw);
        bw.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
        bw.newLine();
        bw.write("<config>");
        bw.newLine();
        bw.write("<tipoInter>ETHE</tipoInter>");
        bw.newLine();
        bw.write(dadosXml[0]);
        bw.newLine();

        if (!dadosXml[1].equals("")) {
            bw.write(dadosXml[1]);
            bw.newLine();
        }
        if (!dadosXml[2].equals("")) {
            bw.write(dadosXml[2]);
            bw.newLine();
        }
        if (!dadosXml[3].equals("")) {
            bw.write(dadosXml[3]);
            bw.newLine();
        }
        if (!dadosXml[4].equals("")) {
            bw.write(dadosXml[4]);
            bw.newLine();
        }
        if (!dadosXml[5].equals("")) {
            bw.write(dadosXml[5]);
            bw.newLine();
        }

        bw.write(dadosXml[6]);
        bw.newLine();

        if (!dadosXml[7].equals("")) {
            bw.write(dadosXml[7]);
            bw.newLine();
        }
        if (!dadosXml[8].equals("")) {
            bw.write(dadosXml[8]);
            bw.newLine();
        }
        if (!dadosXml[9].equals("")) {
            bw.write(dadosXml[9]);
            bw.newLine();
        }
        if (!dadosXml[10].equals("")) {
            bw.write(dadosXml[10]);
            bw.newLine();
        }

        bw.write("</config>");
        bw.flush();
        bw.close();

        return dadosXml;
    }
}
