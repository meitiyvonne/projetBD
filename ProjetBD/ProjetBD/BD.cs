using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Text;

namespace ProjetBD
{
    class BD
    {
        public MySqlConnection connectToDatabase()
        {
            MySqlConnection cnn;
            string connectionString = "Server=localhost;database=animaux;uid=root;pwd=;";
            cnn = new MySqlConnection(connectionString);

            try
            {
                cnn.Open();
                if (cnn.State == System.Data.ConnectionState.Open)
                {
                    Console.WriteLine();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Impossible d'ouvrir la connexion. {ex.Message}");
            }


            return cnn;
        }

        /// <summary>
        /// Requete d'extraction de donnees
        ///  Voir la liste de tous les animaux en pension (done) -2
        /// 
        /// </summary>
        public void executASelect()
        {
            MySqlConnection conn = this.connectToDatabase();
            string sql = "Select * from animal order by id";
            MySqlCommand command = new MySqlCommand(sql, conn);

            using (MySqlDataReader rdata = command.ExecuteReader())
            {
                if (rdata.HasRows)
                {
                    while (rdata.Read())
                    {
                        int id = rdata.GetInt32(0);
                        string type = rdata.GetString(1);
                        string nom = rdata.GetString(2);
                        int age = rdata.GetInt32(3);
                        int poids = rdata.GetInt32(4);
                        string couleur = rdata.GetString(5);
                        string proprietaire = rdata.GetString(6);
                        Console.WriteLine($"{id}\t{type}\t\t{nom}\t{age}\t{poids}\t{couleur}\t{proprietaire}");


                    }

                    Console.WriteLine();
                }
            }

            conn.Close();
        }

        /// <summary>
        ///  Requete d'extraction avec parametres
        ///     Voir la liste de tous les propriétaires (done) -3
        /// </summary>
        public void executASelectAvecParam()
        {
            MySqlConnection conn = this.connectToDatabase();

            string sql = "Select proprietaire from animal";
            MySqlCommand command = new MySqlCommand(sql, conn);

            MySqlDataReader rdata = command.ExecuteReader();

            if (rdata.HasRows)
            {
                while (rdata.Read())
                {
                    string proprietaire = rdata.GetString(0);
                    Console.WriteLine($" {proprietaire} ");


                }

                Console.WriteLine();
            }


            conn.Close();
            
        }


        /// <summary>
        /// Requete de mise a jour avec parametres
        /// </summary>
        public void UpdateAvecParam()
        {
            MySqlConnection conn = this.connectToDatabase();

            string dateDeNaissance = "1987-05-06";
            int age = 35;
            int id = 2;

            string sql = "UPDATE etudiant " +
                "set dateDeNaissance = @param_val_1, age=@param_val_2 where id = @param_val_3";

            MySqlCommand command = new MySqlCommand(sql, conn);

            command.Parameters.AddWithValue("@param_val_1", dateDeNaissance);
            command.Parameters.AddWithValue("@param_val_2", age);
            command.Parameters.AddWithValue("@param_val_3", id);

            command.ExecuteReader();
            conn.Close();

            Console.WriteLine($"Requete UPDATE termine.");
            Console.WriteLine();
        }

        /// <summary>
        /// Requete d'insertion avec parametres (done) -1
        /// </summary>
        public void InsertAvecParam(string atype, string name, int iAge, int iPoids, string aCouleur, string aProprietaire)
        {
            MySqlConnection conn = this.connectToDatabase();

            string type = atype;
            string nom = name;
            int age = iAge;
            int poids = iPoids;
            string couleur = aCouleur;
            string proprietaire = aProprietaire;

            string sql = "INSERT INTO animal (" +
                "type, nom, age, poids, couleur, proprietaire)" +
                "values(@type, @nom, @age, @poids, @couleur, @proprietaire)";

            MySqlCommand command = new MySqlCommand(sql, conn);

            command.Parameters.AddWithValue("@type", type);
            command.Parameters.AddWithValue("@nom", nom);
            command.Parameters.AddWithValue("@age", age);
            command.Parameters.AddWithValue("@poids", poids);
            command.Parameters.AddWithValue("@couleur", couleur);
            command.Parameters.AddWithValue("@proprietaire", proprietaire);


            command.ExecuteReader();

            conn.Close();

            Console.WriteLine("Request insertion termined");
            Console.WriteLine();
        }

        /// <summary>
        /// Voir le nombre total d’animaux en pension (done)-4
        /// </summary>
        public void GetNoOfAnimaux()
        { 
            MySqlConnection conn = this.connectToDatabase();

            string sql = "select count(*) from animal";

            MySqlCommand command = new MySqlCommand(sql, conn);

            int count = Convert.ToInt32(command.ExecuteScalar());

            
            Console.WriteLine($" {count}");

            conn.Close();

            Console.WriteLine("Request insertion termined");
            Console.WriteLine();

        }

        /// <summary>
        /// Voir le poids total de tous les animaux en pension
        /// </summary>
        public void GetTotalPoids()
        {
            MySqlConnection conn = this.connectToDatabase();

            string sql = "select sum(poids) from animal";

            MySqlCommand command = new MySqlCommand(sql, conn);

            int weight =  Convert.ToInt32(command.ExecuteScalar());
            

            Console.WriteLine($" {weight}");

            conn.Close();

            Console.WriteLine("Request insertion termined");
            Console.WriteLine();


        }

        /// <summary>
        /// Voir la liste des animaux d’une couleur(rouge, bleu ou violet) (done)-6
        /// </summary>
        public void GetAnAnimalByColor(string color)
        {
            MySqlConnection conn = this.connectToDatabase();

            
            string couleur = color;
            string sql = "select id,type,nom,couleur from animal where couleur = @param";

            MySqlCommand command = new MySqlCommand(sql,conn);

            command.Parameters.AddWithValue("@param", couleur);
            MySqlDataReader rdata = command.ExecuteReader();

            while (rdata.Read())
            {
                int id = rdata.GetInt32(0);
                string type = rdata.GetString(1);
                string nom = rdata.GetString(2);
                string aCouleur = rdata.GetString(3);

                Console.WriteLine($" {id}\t{type}\t\t\t{nom}\t{aCouleur}");


            }

            conn.Close();

            Console.WriteLine("Request insertion termined");
            Console.WriteLine();


        }

        /// <summary>
        /// Request de suppression avec parametres
        ///   Retirer un animal de la liste () -7
        /// </summary>
        public void DeleteAvecParam(int aId)
        {
            MySqlConnection conn = this.connectToDatabase();
            int id = aId;

            string sql = "DELETE FROM animal WHERE id = @id";

            MySqlCommand command = new MySqlCommand(sql, conn);

            command.Parameters.AddWithValue("@id", id);

            command.ExecuteReader();

            conn.Close();
            Console.WriteLine("Request DELETE termined.");
            Console.WriteLine();
        }
    }

}
