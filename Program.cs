using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Gestion_Com_2022
{
    static class Program
    {
        /// <summary>
        /// Point d'entrée principal de l'application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Model1Container model = new Model1Container();
            /*
            Categorie cat = new Categorie();
            cat.Libelle = "Vehicules";
            cat.CodeCat = "COO2";

            Categorie cat1 = new Categorie();
            cat1.Libelle = "Vetements";
            cat1.CodeCat = "COO3";

            model.Categories.Add(cat);
            model.Categories.Add(cat1);
            model.SaveChanges();
            
            Console.WriteLine(model.Categories);
            List<Categorie> categories = new List<Categorie>();
            categories.Add(cat);
            categories.Add(cat1);
            model.Categories.AddRange(categories);*/

            foreach(Categorie cate in model.Categories)
            {
                Console.WriteLine(cate.Produits.Count);
            }
            




            //Console.WriteLine(cat.Id);

            Console.WriteLine("Termine Junior et Jacques vous etes contents ?");
            //cat.Libelle = "Nourriture";
            //model.SaveChanges();




            /*
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new Form1());*/
        }
    }
}
