using Android.App;
using Android.Content;
using Android.Content.PM;
using Android.Support.V7.App;
using Android.Views;
using Android.Widget;
using Android.OS;
using Android.Runtime;
using GertecXamarinForms.Droid;
using BR.Com.Gertec.Gedi.Exceptions;
using Plugin.DeviceInfo;
using System;
using GertecXamarinForms.Controls;
using Xamarin.Forms;
using GertecXamarinForms.Droid.Impressao;
using GertecXamarinForms.Droid.Services;
using System.Linq;
using GertecXamarinForms.Droid.TEF;
using Java.Util;
using Newtonsoft.Json;
using Org.Json;
using System.Text;
using Java.Util.Regex;
using Android.Hardware.Usb;
using GertecXamarinForms.Droid.Sat;
using GertecXamarinForms.Droid.SAT;

[assembly: Xamarin.Forms.Dependency(typeof(MainActivity))]
namespace GertecXamarinForms.Droid
{
    [Activity(Label = "GertecOne XamarinForms", Icon = "@drawable/Imagem1", Theme = "@style/MainTheme", MainLauncher = true,
        ConfigurationChanges = ConfigChanges.ScreenSize | ConfigChanges.Orientation),
         MetaData(UsbManager.ActionUsbDeviceAttached, Resource = "@xml/device_filter"),
        IntentFilter(new[] { "android.hardware.usb.action.USB_DEVICE_ATTACHED", "android.intent.action.MAIN" })]
    public class MainActivity : 
        global::Xamarin.Forms.Platform.Android.FormsAppCompatActivity,
        INfcId, INfcGedi
    {
        public static Activity mContext;
        public Context context;

        //IMPRESSAO
        public static ConfigPrint configPrint;
        public static GertecPrinter printer; 
        public static SatFunctions satFunctions;

        public static string modelo;

        //TEF
        private Date data = new Date();
        public Tef tef;

        public static string currentDateTimeString;
        public static string currentDateTimeStringT;
        

        public MainActivity() {
            this.context = Android.App.Application.Context;
        }

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            Xamarin.Essentials.Platform.Init(this, savedInstanceState);
            global::Xamarin.Forms.Forms.Init(this, savedInstanceState);

            modelo = CrossDeviceInfo.Current.Model;

            context = ApplicationContext;
            printer = new GertecPrinter(context);
            configPrint = new ConfigPrint();
            printer.setConfigImpressao(configPrint);
            satFunctions = new SatFunctions(context);

            tef = new Tef();

            // ZXing Inicialização
            global::ZXing.Net.Mobile.Forms.Android.Platform.Init();

            //LoadApplication is a Xamarin.Forms method
            LoadApplication(new App());

            currentDateTimeString = Convert.ToString(DateTime.Now.ToString("dd/MM/yyyy"));
            currentDateTimeStringT = Convert.ToString((data.Hours) + Convert.ToString(data.Minutes) + Convert.ToString(data.Seconds));

            mContext = this;
        }

        public override void OnRequestPermissionsResult(int requestCode, string[] permissions, [GeneratedEnum] Android.Content.PM.Permission[] grantResults)
        {
            Xamarin.Essentials.Platform.OnRequestPermissionsResult(requestCode, permissions, grantResults);

            base.OnRequestPermissionsResult(requestCode, permissions, grantResults);
        }

        public void NfcID()
        {
            
            Intent myIntent = new Intent(this.context, typeof(NfcID));
            myIntent.AddFlags(ActivityFlags.NewTask);
            this.context.StartActivity(myIntent);

        }

        public void NfcGedi()
        {
            Intent myIntent = new Intent(this.context, typeof(NfcGedi));
            myIntent.AddFlags(ActivityFlags.NewTask);
            this.context.StartActivity(myIntent);

        }
        
        protected override void OnActivityResult(int requestCode, Result resultCode, Intent data)
        {
            base.OnActivityResult(requestCode, resultCode, data);
           
            tef.ResultadoTef(requestCode, resultCode,data);              
        }
       
    }
}
