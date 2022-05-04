package com.gertec.exemplosgertec.ExemploNFCIdRW;

import android.annotation.SuppressLint;
import android.nfc.FormatException;
import android.nfc.NdefMessage;
import android.nfc.NdefRecord;
import android.nfc.Tag;
import android.nfc.tech.MifareClassic;
import android.nfc.tech.Ndef;
import android.nfc.tech.NdefFormatable;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public final class NfcLeituraGravacao {

    MifareClassic mifareClassic;

    // Mensagem padrão para ser usada quando o o cartão for formatado
    private static final String MENSAGEM_PADRAO = "GERTEC";

    // Tag para ser usado no LOG
    private static final String TAG = NfcLeituraGravacao.class.getSimpleName();

    private long tempInicial;
    private long tempFinal;
    private long direfenca;

    /**
     * Método construtor da classe.
     *
     * @param tag = contém as tag do cartão que foi lido.
     *
     * */
    public NfcLeituraGravacao(Tag tag) {

        this.mifareClassic = MifareClassic.get(tag);
        this.gravaTempoInicia();
    }

    /**
     *
     * Método que faz a leitura de todos os setores e blocos
     * existentes no cartão que esta sendo lido.
     *
     * Esse método nunca deve ser usado na Thread principal do Android,
     * sempre que foi necessario ler todas essas informações.
     *
     * Crie uma Thread auxíliar para fazer a leitura e obter o seu retorno.
     *
     * @throws IOException
     *
     * @return List<Object>
     *
     * */
    public List<Object> lerTodosOsSetoresDoCartao() throws Exception {

        byte[] byteRead;            // Irá armazenar os byte lidos do cartão
        boolean auth = false;       // Valida se existe ou não permissão para ler o bloco
        int quantSetores = 0;       // Quantidade de setores existentes no cartão
        int blocoCount = 0;         // Quantidades de blocos existentes no cartão
        int blocoIndex = 0;         // Irá armazenar o indice que esta sendo lido do cartão
        List<Object> ByteRetorno = new ArrayList<>(); // Lista com a leitura de todos os blocos e setores

        try {

            // Faz a conexão com o cartão
            validConexaoCartao();

            // Irá armazenar a quantidade de setores existentes no cartão
            quantSetores = mifareClassic.getSectorCount();

            // Percorre todos os setores existentes no cartão
            for (int i = 0; i < quantSetores; i++) {

                // Faz a validação de permissão para a leitura do bloco A
                auth = validPermissaoBlocoA(i);

                if (!auth) {
                    // Faz a validação de permissão para a leitura do bloco B
                    auth = validPermissaoBlocoB(i);
                }

                if (auth) {

                    // Busca a quanidade de blocos em um setor
                    blocoCount = mifareClassic.getBlockCountInSector(i);

                    // Percore todos os blocos do setor
                    for (int j = 0; j < blocoCount; j++) {
                        // É necessário fazer novamente a validação de permissão Bloco a bloco

                        // Faz a validação de permissão para a leitura do bloco A
                        auth = validPermissaoBlocoA(j);

                        if (!auth) {
                            // Faz a validação de permissão para a leitura do bloco B
                            auth = validPermissaoBlocoB(j);
                        }

                        if (auth) {

                            // seta o indice do setor dentro do bloco
                            blocoIndex = mifareClassic.sectorToBlock(j);

                            // Faz a leitura de um BLOCO no setor
                            byteRead = mifareClassic.readBlock(blocoIndex);
                            ByteRetorno.add(byteRead);
                        }
                    }
                }

            }

        } catch (IOException e) {
            throw new IOException(e);

        } finally {
            // Fecha a conexão com o cartão
            desconectaCartao();
            this.gravaTempoFinal();
        }

        return ByteRetorno;
    }

    /**
     *
     * Método que faz a leitura de um bloco e setor específico
     * no cartão que esta sendo lido.
     *
     * A leitura sempre será retornada em Bytes.
     *
     * @param bloco = número que bloco que deve ser lido
     * @param setor = número do setor existente dentro do bloco que será lido
     *
     * @throws IOException
     *
     * @return byte[] = a
     *
     * */
    public byte[] lerUmSetoresDoCartao(int bloco, int setor) throws Exception {

        byte[] byteRead = null;     // Irá armazenar os byte lidos do cartão
        boolean auth = false;       // Valida se existe ou não permissão para ler o bloco
        int blocoIndex = 0;         // Irá armazenar o indice que esta sendo lido do cartão

        try {

            // Faz a conexão com o cartão
            mifareClassic.connect();


            // Faz a validação de permissão para a leitura do bloco A
            auth = validPermissaoBlocoA(bloco);

            if (!auth) {
                // Faz a validação de permissão para a leitura do bloco B
                auth = validPermissaoBlocoB(bloco);

                if (!auth) {
                    throw new Exception("Falha na validação de senha.");
                }

            }

            if (auth) {

                // É necessário fazer novamente a validação de permissão Bloco a bloco

                // Faz a validação de permissão para a leitura do bloco A
                auth = validPermissaoBlocoA(setor);

                if (!auth) {
                    // Faz a validação de permissão para a leitura do bloco B
                    auth = validPermissaoBlocoB(setor);
                }

                if (auth) {

                    // seta o indice do setor dentro do bloco
                    blocoIndex = mifareClassic.sectorToBlock(setor);

                    // Faz a leitura de um BLOCO no setor
                    byteRead = mifareClassic.readBlock(blocoIndex);

                }
            }

        } catch (IOException e) {
            throw new Exception(e);
        } finally {
            desconectaCartao();
            this.gravaTempoFinal();
        }

        return byteRead;
    }

    /**
     *
     * Método faz a gravação de uma mensagem em um bloco específico
     * no cartão.
     *
     * A mensagem que será gravada não deve ser superior a 16 bits.
     *
     * A leitura sempre será retornada em Bytes.
     *
     * @param bloco = número que bloco que deve ser lido
     * @param mensagem = número do setor existente dentro do bloco que será lido
     *
     * @throws IOException
     *
     * @return true = caso haja um erro na gravação, será tratada no throw
     *
     * */
    public boolean gravaSetorCartao(int bloco, byte[] mensagem) throws Exception {

        try {
            // Valida a conexão com o cartão
            validConexaoCartao();

            // Valida a quantidade de bytes que serão gravados
            if (mensagem.length != 16) {
                throw new IllegalArgumentException("A mensagem não contem 16 bits");
            }
            // Grava no cartão
            mifareClassic.writeBlock(bloco, mensagem);

        } catch (IOException e) {
            throw new Exception(e);

        } finally {
            desconectaCartao();
            this.gravaTempoFinal();
        }

        return true;
    }

    /**
     *
     * Método que faz o incremento de um valor em um bloco específico
     * no cartão.
     *
     * O valor a ser incrementado será sempre o INTEIRO
     *
     *
     * @param bloco = Número que bloco que deve ser incrementado
     * @param valor = Valor que será incrementado ao já existente no bloco
     *
     * @throws IOException
     *
     * @return true = caso haja um erro na gravação será tratado no throw
     *
     * */
    public boolean incrementaValorCartao(int bloco, int valor) throws Exception {
        try {
            // Valida a conexão com o cartão
            validConexaoCartao();
            // Valida o valor a ser gravado
            validaValor(valor);
            // Incrementa o valor no cartão
            mifareClassic.increment(bloco, valor);
        } catch (IOException e) {
            throw new Exception(e);
        } finally {
            desconectaCartao();
            this.gravaTempoFinal();
        }

        return true;
    }

    /**
     *
     * Método que faz o decremento de um valor em um bloco específico
     * no cartão.
     *
     * O valor a ser decrementado será sempre o INTEIRO
     *
     *
     * @param bloco = Número que bloco que deve ser incrementado
     * @param valor = Valor que será incrementado ao já existente no bloco
     *
     * @throws IOException
     *
     * @return true = caso haja um erro na gravação será tratado no throw
     *
     * */
    public boolean decrementaValorCartao(int bloco, int valor) throws Exception {
        try {
            // Valida conexão
            validConexaoCartao();
            // Valida o valor
            validaValor(valor);
            // Decrementa o valor do cartão
            mifareClassic.decrement(bloco, valor);
        } catch (IOException e) {
            throw new Exception(e);
        } finally {
            desconectaCartao();
            this.gravaTempoFinal();
        }

        return true;
    }

    /**
     *
     * Método faz a gravação de uma nova mensagem no cartão.
     *
     * Essa nova mensagem será códificada usando o padrão UTF-8.
     *
     * @param ndef = Contém as informações do cartão que esta sendo lido.
     * @param mensagem = Mensagem que será gravada no cartão
     *
     * @throws IOException
     * @throws FormatException
     *
     * @return boolean =>  True = Mensagem Gravada / False = Erro ao gravar mensagem
     *
     * */
    @SuppressLint("NewApi")
    public boolean gravaMensagemCartao(Ndef ndef, String mensagem) throws FormatException, IOException {
        boolean retorno = false;
        try {
            if (ndef != null) {

                ndef.connect();
                NdefRecord mimeRecord = null;

                mimeRecord = NdefRecord.createMime("UTF-8", mensagem.getBytes(Charset.forName("UTF-8")));
                ndef.writeNdefMessage(new NdefMessage(mimeRecord));

                ndef.close();

                retorno = true;

            } else {
                retorno = formataCartao(ndef);
            }
        } catch (FormatException e) {
            throw new FormatException(e.getMessage());

        } catch (IOException e) {
            throw new IOException(e);

        } finally {
            this.gravaTempoFinal();
        }

        return retorno;
    }

    /**
     *
     * Método faz a gravação de uma nova mensagem no cartão.
     *
     * Essa nova mensagem será códificada usando o padrão UTF-8.
     *
     * @param ndef = Contém as informações do cartão que esta sendo lido.
     *
     * @throws IOException
     * @throws FormatException
     *
     * @return String = contém a mensagem que esta gravada no cartão
     *
     * */
    public String retornaMensagemGravadaCartao(Ndef ndef) throws Exception {

        String message;

        try {

            if (ndef == null) {
                throw new Exception("Não foi possível ler o cartão.");
            }

            if (!ndef.isConnected()) {
                ndef.connect();
            }

            NdefMessage ndefMessage = ndef.getNdefMessage();
            if (ndefMessage == null) {
                throw new Exception("Não foi possível ler o cartão.");
            } else {
                message = new String(ndefMessage.getRecords()[0].getPayload());
            }

        } catch (IOException | FormatException e) {
            throw new Exception(e);

        } catch (Exception e) {
            throw new Exception(e);
        } finally {
            gravaTempoFinal();
        }

        return message;
    }

    /**
     *
     * Método faz a formatação do cartão.
     *
     * A formatação do cartão só é necessario na sua primeira gravação.
     *
     * Após já existir algum valor gravado no cartão, não será possível formata-lo
     * novamente.
     *
     * @param ndef = Contém as informações do cartão que esta sendo lido.
     *
     * @throws IOException
     * @throws FormatException
     *
     * @return boolean =>  True = Cartão Formatado / False = Cartão não formatado
     *
     * */
    @SuppressLint("NewApi")
    public boolean formataCartao(Ndef ndef) throws IOException, FormatException {

        boolean retorno = false;

        NdefFormatable ndefFormatable = NdefFormatable.get(ndef.getTag());

        try {

            if(ndefFormatable == null){
                return  retorno;
            }

            if(!ndefFormatable.isConnected()){
                ndefFormatable.connect();
            }
            ndefFormatable.format(new NdefMessage(NdefRecord.createMime("UTF-8", MENSAGEM_PADRAO.getBytes(Charset.forName("UTF-8")))));
            ndefFormatable.close();
            retorno = true;

        } catch (IOException e) {
            throw new IOException(e);
        } catch (FormatException e) {
            throw new FormatException(e.getMessage());
        } finally {
            this.gravaTempoFinal();
        }


        return retorno;
    }

    /**
     *
     * Método que válida o valor a ser incrementado ou decrementado do cartão.
     *
     * @param valor = Valor a ser incrementado ou decrementado do cartão
     *
     * @throws IllegalArgumentException
     *
     * */
    private void validaValor(int valor) {
        if (valor < 0) {
            throw new IllegalArgumentException("O valor não poder ser negativo.");
        }
    }

    /**
     *
     * Método que válida se existe ou não conexão com o atual cartão.
     *
     * Caso não haja conexão aberta com o cartão, esse método irá abrir
     * uma nova conexão.
     *
     * */
    private void validConexaoCartao() {
        if (!mifareClassic.isConnected()) {
            conectarCartao();
        }
    }

    /**
     *
     * Método que faz a conexão com o cartão.
     *
     * @throws IOException
     *
     * */
    private void conectarCartao() {
        try {
            mifareClassic.connect();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     *
     * Método que desconecta o cartão.
     *
     * @throws IOException
     *
     * */
    private void desconectaCartao() {
        try {
            mifareClassic.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    /**
     *
     * Método que faz a validação de senha
     * para leitura e escrita de um bloco no SETOR A
     *
     * @param bloco  = Número do bloco que será validado a permissão
     *
     * @throws IOException
     *
     * @return boolean = Caso falso é porque não existe a permissão para leitura do bloco
     *
     * */
    private boolean validPermissaoBlocoA(int bloco) throws Exception {

        boolean retorno = false;

        try {

            if (mifareClassic.authenticateSectorWithKeyA(bloco, mifareClassic.KEY_MIFARE_APPLICATION_DIRECTORY)) {
                retorno = true;

            } else if (mifareClassic.authenticateSectorWithKeyA(bloco, mifareClassic.KEY_DEFAULT)) {
                retorno = true;

            } else if (mifareClassic.authenticateSectorWithKeyA(bloco, mifareClassic.KEY_NFC_FORUM)) {
                retorno = true;

            } else {
                retorno = false;
            }
        } catch (IOException e) {
            throw new Exception(e);

        }

        return retorno;
    }

    /**
     *
     * Método que faz a validação de senha
     * para leitura e escrita de um bloco no SETOR B
     *
     * @param bloco  = Número do bloco que será validado a permissão
     *
     * @throws IOException
     *
     * @return boolean = Caso falso é porque não existe a permissão para leitura do bloco
     *
     * */
    private boolean validPermissaoBlocoB(int bloco) throws Exception {

        boolean retorno = false;

        try {

            if (mifareClassic.authenticateSectorWithKeyB(bloco, mifareClassic.KEY_MIFARE_APPLICATION_DIRECTORY)) {
                retorno = true;

            } else if (mifareClassic.authenticateSectorWithKeyB(bloco, mifareClassic.KEY_DEFAULT)) {
                retorno = true;

            } else if (mifareClassic.authenticateSectorWithKeyB(bloco, mifareClassic.KEY_NFC_FORUM)) {
                retorno = true;

            } else {
                retorno = false;
            }
        } catch (IOException e) {
            throw new Exception(e);

        }

        return retorno;
    }

    /**
     *
     * Método que grava os milesegundos na inicialização desta class
     *
     * */
    private void gravaTempoInicia() {
        this.tempInicial = System.currentTimeMillis();
    }

    /**
     *
     * Método que grava os milesegundos da finalização de um método.
     *
     * Esse método sempre será chamado na finally dos try/catch
     *
     *
     * */
    private void gravaTempoFinal() {
        this.tempFinal = System.currentTimeMillis();
    }

    /**
     *
     * Método que retorna a quantidade de segundos que foram
     * necessário para faz uma execução.
     *
     * @return Long = Segundos que foram usado para concluir um processo.
     *
     *
     * */
    public Long retornaTempoDeExeculcaoSegundos() {
        this.direfenca = (this.tempFinal - this.tempInicial);
        return direfenca / 60;
    }

    /**
     *
     * Método que retorna o ID do cartão já convetido em Hexadecimal
     *
     * @return String = Id do cartão
     *
     * */
    public String idCartaoHexadecimal() {

        byte[] idCartao = mifareClassic.getTag().getId();
        long result = 0;

        if (idCartao == null) return "";

        for (int i = idCartao.length - 1; i >= 0; --i) {
            result <<= 8;
            result |= idCartao[i] & 0x0FF;
        }
        return Long.toString(result);
    }

    /**
     *
     * Método que retorna o ID do cartão em Bytes
     *
     * @return byte[] = Id do cartão
     *
     * */
    public byte[] cartaoId() {
        return mifareClassic.getTag().getId();
    }

    /**
     *
     * Método que gera um String randomicamente para ser usada em testes.
     *
     * @return String = Texto gerado randomicamente
     *
     * */
    public String geraString() {

        UUID uuid = UUID.randomUUID();
        String myRandom = uuid.toString();

        return myRandom.substring(0, 30);

    }
}
