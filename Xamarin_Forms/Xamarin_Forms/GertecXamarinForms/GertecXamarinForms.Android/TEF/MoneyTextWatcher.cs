using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Android.App;
using Android.Content;
using Android.Icu.Math;
using Android.Icu.Text;
using Android.OS;
using Android.Runtime;
using Android.Text;
using Android.Views;
using Android.Widget;
using Java.Lang;
using Java.Util;

namespace GertecXamarinForms.Droid.TEF
{
    public class MoneyTextWatcher : Java.Lang.Object, ITextWatcher
    {
        private WeakReference<EditText> editTextWeakReference;
        private Locale locale;

        public MoneyTextWatcher(EditText editText, Locale locale)
        {
            this.editTextWeakReference = new WeakReference<EditText>(editText);
            this.locale = locale != null ? locale : Locale.Default;
        }

        public MoneyTextWatcher(EditText editText)
        {
            this.editTextWeakReference = new WeakReference<EditText>(editText);
            this.locale = Locale.Default;
        }

        public void AfterTextChanged(IEditable editable)
        {
            /*EditText editText = editTextWeakReference;
            if (editText == null) return;
            editText.RemoveTextChangedListener(this);

            BigDecimal parsed = parseToBigDecimal(editable.ToString(), locale);
            string formatted = NumberFormat.GetCurrencyInstance(locale).Format(parsed);
            // NumberFormat.getNumberInstance(locale).format(parsed); // sem o simbolo de moeda
            */

        }

        public void BeforeTextChanged(ICharSequence s, int start, int count, int after)
        {
           
        }

        public void OnTextChanged(ICharSequence s, int start, int before, int count)
        {
            
        }
        private BigDecimal parseToBigDecimal(string value, Locale locale)
        {
            string replaceable = string.Format("[%s,.\\s]", NumberFormat.GetCurrencyInstance(locale).Currency.Symbol);

            string cleanString = value.Replace(replaceable, "");

            return new BigDecimal(cleanString).SetScale(
                    2, (RoundOptions)Java.Math.RoundOptions.Floor).Divide(new BigDecimal(100), (RoundOptions)Java.Math.RoundOptions.Floor
            );
        }

    }
}