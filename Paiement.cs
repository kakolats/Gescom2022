//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré à partir d'un modèle.
//
//     Des modifications manuelles apportées à ce fichier peuvent conduire à un comportement inattendu de votre application.
//     Les modifications manuelles apportées à ce fichier sont remplacées si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Gestion_Com_2022
{
    using System;
    using System.Collections.Generic;
    
    public partial class Paiement
    {
        public int Id { get; set; }
        public string Type { get; set; }
        public string Reference { get; set; }
        public double Montant { get; set; }
        public System.DateTime Date { get; set; }
        public int ClientId { get; set; }
    
        public virtual Commande Commande { get; set; }
        public virtual Client Client { get; set; }
    }
}