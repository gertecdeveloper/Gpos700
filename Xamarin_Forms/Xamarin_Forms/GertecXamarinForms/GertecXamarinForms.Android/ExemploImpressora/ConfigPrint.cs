using Xamarin.Forms;

namespace GertecXamarinForms.Droid.ExemploImpressora
{
    public class ConfigPrint
    {
        private string fonte = "NORMAL";
        private string alinhamento;
        private int tamanho;
        private int offSet;
        private int iHeight;
        private int lineSpace;
        private bool negrito;
        private bool italico;
        private bool sublinhado;
        private int avancaLinhas;

        public ConfigPrint()
        {
            this.fonte = "NORMAL";
            this.alinhamento = "CENTER";
            this.tamanho = 20;
            this.offSet = 0;
            this.iHeight = 400;
            this.IWidth = 300;
            this.lineSpace = 0;
            this.negrito = true;
            this.italico = true;
            this.sublinhado = false;
            this.avancaLinhas = 10;
        }

        public ConfigPrint(string fonte,
                           string alinhamento,
                           int tamanho,
                           int offSet,
                           int lineSpace,
                           bool negrito,
                           bool italico,
                           bool sublinhado)
        {
            this.fonte = fonte;
            this.alinhamento = alinhamento;
            this.tamanho = tamanho;
            this.offSet = offSet;
            this.lineSpace = lineSpace;
            this.negrito = negrito;
            this.italico = italico;
            this.sublinhado = sublinhado;
        }

        public ConfigPrint(string fonte,
                           string alinhamento,
                           int tamanho,
                           int offSet,
                           int iHeight,
                           int iWidth,
                           int lineSpace,
                           bool negrito,
                           bool italico,
                           bool sublinhado)
        {
            this.fonte = fonte;
            this.alinhamento = alinhamento;
            this.tamanho = tamanho;
            this.offSet = offSet;
            this.iHeight = iHeight;
            this.IWidth = iWidth;
            this.lineSpace = lineSpace;
            this.negrito = negrito;
            this.italico = italico;
            this.sublinhado = sublinhado;
        }

        public string Fonte
        {
            get { return this.fonte; }
            set { this.fonte = value; }
        }

        public string Alinhamento
        {
            get { return this.alinhamento; }
            set { this.alinhamento = value; }
        }

        public int Tamanho
        {
            get { return this.tamanho; }
            set { this.tamanho = value; }
        }

        public int OffSet
        {
            get { return this.offSet; }
            set { this.offSet = value; }
        }

        public int IHeight
        {
            get { return this.iHeight; }
            set { this.iHeight = value; }
        }

        public int IWidth { get; set; }

        public int LineSpace
        {
            get { return this.lineSpace; }
            set { this.lineSpace = value; }
        }

        public bool Negrito
        {
            get { return this.negrito; }
            set { this.negrito = value; }
        }

        public bool Italico
        {
            get { return this.italico; }
            set { this.italico = value; }
        }

        public bool SubLinhado
        {
            get { return this.sublinhado; }
            set { this.sublinhado = value; }
        }

        public int AvancaLinha
        {
            get { return this.avancaLinhas; }
            set { this.avancaLinhas = value; }
        }
    }
}