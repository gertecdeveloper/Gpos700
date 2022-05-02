using Android.Nfc.Tech;
using Android.App;
using Android.Content;
using Android.Nfc;
using Android.OS;
using Android.Runtime;
using Android.Util;
using Android.Widget;
using BR.Com.Gertec.Gedi;
using BR.Com.Gertec.Gedi.Interfaces;
using BR.Com.Gertec.Gedi.Structs;
using System.Collections.Generic;
using System.Threading;

namespace GertecXamarinForms.Droid.Services
{
    [Activity(Label = "NfcGedi", Theme = "@style/Theme.AppCompat.Light.NoActionBar"), IntentFilter(new[] { "android.nfc.action.TECH_DISCOVERED" },
    Categories = new[] { "android.intent.category.DEFAULT" })]

    [MetaData(NfcAdapter.ActionTechDiscovered, Resource = "@xml/nfc_tech_filter")]
    public class NfcGedi : global::Xamarin.Forms.Platform.Android.FormsAppCompatActivity
    {
        private TextView txtLeitura;
        private NfcAdapter nfcAdapter;
        private static int Contador = 0;
        private Tag tag;
        private IsoDep isoDep;

        ICL icl = null;
        GEDI_CL_st_ISO_PollingInfo pollingInfo;
        private MifareClassic mifareClassic;

        public object TAG { get; private set; }

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            Xamarin.Essentials.Platform.Init(this, savedInstanceState);
            startGedi();
            // Set our view from the "main" layout resource
            SetContentView(Resource.Layout.NfcGedi);
            txtLeitura = FindViewById<TextView>(Resource.Id.txtLeitura);
            nfcAdapter = NfcAdapter.GetDefaultAdapter(this);
        }
        public override void OnRequestPermissionsResult(int requestCode, string[] permissions, [GeneratedEnum] Android.Content.PM.Permission[] grantResults)
        {
            Xamarin.Essentials.Platform.OnRequestPermissionsResult(requestCode, permissions, grantResults);

            base.OnRequestPermissionsResult(requestCode, permissions, grantResults);
        }

        protected override void OnResume()
        {
            base.OnResume();
            //Check if we have an NFC adapter.
            if (nfcAdapter != null && nfcAdapter.IsEnabled)
            {
                IntentFilter tagDetected = new IntentFilter(NfcAdapter.ActionTagDiscovered);
                IntentFilter ndefDetected = new IntentFilter(NfcAdapter.ActionNdefDiscovered);
                IntentFilter techDetected = new IntentFilter(NfcAdapter.ActionTechDiscovered);
                IntentFilter idDetected = new IntentFilter((NfcAdapter.ExtraId));
                IntentFilter idExtraTag = new IntentFilter((NfcAdapter.ExtraTag));

                IntentFilter[] nfcIntentFilter = new IntentFilter[] { techDetected, tagDetected, ndefDetected, idDetected, idExtraTag };

                //Enable the foreground dispatch.
                nfcAdapter.EnableForegroundDispatch
                (
                    this,
                    PendingIntent.GetActivity(this, 0, new Intent(this, GetType()).AddFlags(ActivityFlags.SingleTop), 0),
                    nfcIntentFilter,
                    null
                );
            }

        }
        protected override void OnNewIntent(Intent intent)
        {
            base.OnNewIntent(intent);

            tag = intent.GetParcelableExtra(NfcAdapter.ExtraTag) as Tag;
            if (tag == null)
            {
                Toast.MakeText(this, "Não foi possível ler o cartão.", ToastLength.Long).Show();
            }
            else
            {
                LerCartaoNfc();
            }
        }

        public void startGedi()
        {
            new System.Threading.Thread(new ThreadStart(() =>
            {
                GEDI.GetInstance(this);
            })).Start();
        }
        
        protected void LerCartaoNfc()
        {
            mifareClassic = MifareClassic.Get(tag);
            if (mifareClassic == null)
            {
                isoDep = IsoDep.Get(tag);
            }
            Contador += 1;
            txtLeitura.Text = "Leitura: " + Contador.ToString() + "\nId do Cartão: " + idCartao();
        }

        public string idCartao()
        {
            byte[] idCartao = null;
            long result = 0;

            if (mifareClassic != null)
            {
                idCartao = mifareClassic.Tag.GetId();
            }
            else if (isoDep != null)
            {
                idCartao = isoDep.Tag.GetId();
            }
                       
            if (idCartao == null) return "";

            for (int i = idCartao.Length - 1; i >= 0; --i)
            {
                result <<= 8;
                result |= idCartao[i] & 0x0FF;
            }
            Log.Equals(TAG, "ID Cartão INT: " + BytesToHex(idCartao));
            Log.Equals(TAG, "ID Cartão HEX: " + BytesToHex(idCartao));
            return result.ToString();
        }

        private static string BytesToHex(IList<byte> hashInBytes){

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            foreach (byte b in hashInBytes)
            {
                sb.Append(System.String.Format("%02x", b));
            }
            return sb.ToString();
        }
    
    }

}
