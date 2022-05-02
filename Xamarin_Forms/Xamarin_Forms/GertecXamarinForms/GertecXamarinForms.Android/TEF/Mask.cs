using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Text;
using Android.Views;
using Android.Widget;
using Java.Lang;

namespace GertecXamarinForms.Droid.TEF
{
    public class Mask : Java.Lang.Object, ITextWatcher
    {
        private readonly EditText _editText;
        private readonly string _mask;
        bool isUpdating;
        string old = "";

        public Mask(EditText editText, string mask)
        {
            _editText = editText;
            _mask = mask;
        }

        public static string Unmask(string s)
        {
            return s.Replace(".", "").Replace("-", "")
                .Replace("/", "").Replace("(", "")
                .Replace(")", "");
        }

        public void AfterTextChanged(IEditable s)
        {
        }

        public void BeforeTextChanged(ICharSequence s, int start, int count, int after)
        {
        }

        public void OnTextChanged(ICharSequence s, int start, int before, int count)
        {
            string str = Unmask(s.ToString());
            string mascara = "";

            if (isUpdating)
            {
                old = str;
                isUpdating = false;
                return;
            }

            int i = 0;

            foreach (var m in _mask.ToCharArray())
            {
                if (m != '#' && str.Length > old.Length)
                {
                    mascara += m;
                    continue;
                }
                try
                {
                    mascara += str[i];
                }
                catch (System.Exception ex)
                {
                    break;
                }
                i++;
            }

            isUpdating = true;

            _editText.Text = mascara;

            _editText.SetSelection(mascara.Length);
        }

    }
}