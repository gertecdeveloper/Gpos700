package com.gertec.exemplosgertec.ExemploNFCIdRW.fragment;

import android.app.DialogFragment;
import android.content.Context;
import android.nfc.FormatException;
import android.nfc.tech.Ndef;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.Nullable;

import com.gertec.exemplosgertec.ExemploNFCIdRW.NfcExemplo;
import com.gertec.exemplosgertec.ExemploNFCIdRW.NfcLeituraGravacao;
import com.gertec.exemplosgertec.R;

import java.io.IOException;

public class NFCFormatFragment extends DialogFragment {

    private NfcLeituraGravacao nfcLeituraGravacao;

    public static final String TAG = NFCFormatFragment.class.getSimpleName();

    private View view;
    private TextView texMensagem;
    private NfcExemplo mListener;

    public static NFCFormatFragment newInstance(){
        return new NFCFormatFragment();
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        view = inflater.inflate(R.layout.fragment_formata,container,false);
        initViews(view);
        return view;
    }

    private void initViews(View view) {

        texMensagem = view.findViewById(R.id.tv_message);
    }

    @Override
    public void onAttach(Context context) {
        super.onAttach(context);
        mListener = (NfcExemplo)context;
        mListener.onDialogDisplayed();
    }

    @Override
    public void onDetach() {
        super.onDetach();
        mListener.onDialogDismissed();
    }

    public void onNfcDetected(Ndef ndef){
        nfcLeituraGravacao = new NfcLeituraGravacao(ndef.getTag());
        formatFromNFC(ndef);
    }

    /**
     * Este método irá tentar fazer a formatação do atual cartão que esta
     * sendo lido pela leitora.
     *
     * @param ndef = contém as informações do cartão que acabou de ser lido.
     *
     * @exception IOException
     * @exception FormatException
     *
     * */
    private void formatFromNFC(Ndef ndef) {

        boolean retorno;

        try {

            retorno = nfcLeituraGravacao.formataCartao(ndef);

            if (retorno){
                texMensagem.setText("Cartão formatado");
            }else{
                texMensagem.setText("Não é necessário formatar este cartão.");
            }

        } catch (IOException e) {
            e.printStackTrace();
        } catch (FormatException e) {
            e.printStackTrace();
        }

    }

}
