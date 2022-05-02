using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Xamarin.Forms;

namespace GertecXamarinForms.Droid.ExemploImpressora
{
    public class GertecPrinter : ContentPage
    {
        public GertecPrinter()
        {
            Content = new StackLayout
            {
                Children = {
                    new Label { Text = "Welcome to Xamarin.Forms!" }
                }
            };
        }
    }
}