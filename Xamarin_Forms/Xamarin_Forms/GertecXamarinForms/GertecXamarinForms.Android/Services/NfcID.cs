using Android.App;
using Android.Content;
using Android.Nfc;
using Android.Nfc.Tech;
using Android.OS;
using Android.Runtime;
using Android.Util;
using Android.Widget;
using GertecXamarinForms.Controls;
using System;
using System.Text;

namespace GertecXamarinForms.Droid.Services
{
    [Activity(Label = "NfcID", Theme = "@style/Theme.AppCompat.Light.NoActionBar")]

    public class NfcID : global::Xamarin.Forms.Platform.Android.FormsAppCompatActivity
    {
        public TextView txtLeitura;
        private NfcAdapter nfcAdapter;
        private MifareClassic mifareClassic;
        private static int Contador = 0;
        private Tag tag;
        private IsoDep isoDep;
        private object TAG;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            Xamarin.Essentials.Platform.Init(this, savedInstanceState);
            SetContentView(Resource.Layout.NfcID);
            // Set our view from the "main" layout resource
            //SetContentView(VisualElement.NavigationProperty);
            /*Este era como estava o Geovani e esse em cima foi como eu utilizei
             * */

            nfcAdapter = NfcAdapter.GetDefaultAdapter(this);
            txtLeitura = FindViewById<TextView>(Resource.Id.txtLeitura);

        }
        protected override void OnStart()
        {
            base.OnStart();
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
                Log.Equals(TAG, "onResume");
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
                    new string[][] { new string[] { "android.nfc.tech.Ndef", "android.nfc.action.NDEF_DISCOVERED" } }
                );
            }

        }
        protected override void OnNewIntent(Intent intent)
        {
            base.OnNewIntent(intent);

            tag = intent.GetParcelableExtra(NfcAdapter.ExtraTag) as Tag;
            if (tag == null){
                Toast.MakeText(this, "Não foi possível ler o cartão.", ToastLength.Long).Show();
            }
            else{
                LerCartaoNfc();
            }
        }
        // Faz a leitura do ID do cartão
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
            Log.Equals(TAG, "ID Cartão INT: " + bytesToHex(idCartao));
            Log.Equals(TAG, "ID Cartão HEX: " + bytesToHex(idCartao));
            return result.ToString();
            //Console.WriteLine("ToString");
        }

        private static string bytesToHex(byte[] hashInBytes)
        {

            StringBuilder sb = new StringBuilder();
            foreach (byte b in hashInBytes)
            {
                sb.Append(String.Format("%02x", b));
            }
            return sb.ToString();
        }



    }
}