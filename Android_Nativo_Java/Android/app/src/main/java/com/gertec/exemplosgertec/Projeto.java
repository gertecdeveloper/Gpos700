package com.gertec.exemplosgertec;

public class Projeto {
    private String nome;
    private int img;

    public Projeto(String nome, int img) {
        this.nome = nome;
        this.img = img;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getImg() {
        return img;
    }

    public void setImg(int img) {
        this.img = img;
    }
}
