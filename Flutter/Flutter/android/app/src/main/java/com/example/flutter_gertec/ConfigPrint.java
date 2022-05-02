package com.example.flutter_gertec;

public class ConfigPrint {

    private String fonte = "NORMAL";
    private String alinhamento;
    private int tamanho;
    private int offSet;
    private int iHeight;
    private int iWidth;
    private int lineSpace;
    private boolean negrito;
    private boolean italico;
    private boolean sublinhado;
    private int avancaLinhas;

    public ConfigPrint() {
        this.fonte = "NORMAL";
        this.alinhamento = "CENTER";
        this.tamanho = 20;
        this.offSet = 0;
        this.iHeight = 700;
        this.iWidth = 430;
        this.lineSpace = 0;
        this.negrito = true;
        this.italico = true;
        this.sublinhado = false;
        this.avancaLinhas = 0;
    }

    public ConfigPrint(String fonte, String alinhamento, int tamanho, int offSet, int lineSpace, boolean negrito,
            boolean italico, boolean sublinhado) {
        this.fonte = fonte;
        this.alinhamento = alinhamento;
        this.tamanho = tamanho;
        this.offSet = offSet;
        this.lineSpace = lineSpace;
        this.negrito = negrito;
        this.italico = italico;
        this.sublinhado = sublinhado;
    }

    public ConfigPrint(String fonte, String alinhamento, int tamanho, int offSet, int iHeight, int iWidth,
            int lineSpace, boolean negrito, boolean italico, boolean sublinhado) {
        this.fonte = fonte;
        this.alinhamento = alinhamento;
        this.tamanho = tamanho;
        this.offSet = offSet;
        this.iHeight = iHeight;
        this.iWidth = iWidth;
        this.lineSpace = lineSpace;
        this.negrito = negrito;
        this.italico = italico;
        this.sublinhado = sublinhado;
    }

    public String getFonte() {
        return fonte;
    }

    public void setFonte(String fonte) {
        this.fonte = fonte;
        switch (fonte) {
            case "NORMAL":
                break;
            case "DEFAULT":
                break;
            case "DEFAULT BOLD":
                break;
            case "MONOSPACE":
                break;
            case "SANS SERIF":
                break;
            case "SERIF":
                break;
            default:
                setFont(fonte);
        }
    }

    public String getAlinhamento() {
        return alinhamento;
    }

    public void setAlinhamento(String alinhamento) {
        this.alinhamento = alinhamento;
    }

    public int getTamanho() {
        return tamanho;
    }

    public void setTamanho(int tamanho) {
        this.tamanho = tamanho;
    }

    public int getOffSet() {
        return offSet;
    }

    public void setOffSet(int offSet) {
        this.offSet = offSet;
    }

    public int getLineSpace() {
        return lineSpace;
    }

    public void setLineSpace(int lineSpace) {
        this.lineSpace = lineSpace;
    }

    private void setFont(String fonte) {
        this.fonte = "fonts/" + fonte;
    }

    public int getiHeight() {
        return iHeight;
    }

    public void setiHeight(int iHeight) {
        this.iHeight = iHeight;
    }

    public int getiWidth() {
        return iWidth;
    }

    public void setiWidth(int iWidth) {
        this.iWidth = iWidth;
    }

    public boolean isNegrito() {
        return negrito;
    }

    public void setNegrito(boolean negrito) {
        this.negrito = negrito;
    }

    public boolean isItalico() {
        return italico;
    }

    public void setItalico(boolean italico) {
        this.italico = italico;
    }

    public boolean isSublinhado() {
        return sublinhado;
    }

    public void setSublinhado(boolean sublinhado) {
        this.sublinhado = sublinhado;
    }

    public int getAvancaLinhas() {
        return avancaLinhas;
    }

    public void setAvancaLinhas(int avancaLinhas) {
        this.avancaLinhas = avancaLinhas;
    }
}
