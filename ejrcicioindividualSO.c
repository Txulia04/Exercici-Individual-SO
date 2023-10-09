#include <mysql.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

int main(int argc, char **argv)
{
	MYSQL *conn;
	int err;
	// Estructura especial para almacenar resultados de consultas 
	MYSQL_RES *resultado;
	MYSQL_ROW row;

	conn = mysql_init(NULL);
	if (conn==NULL) {
		printf ("Error al crear la conexion: %u %s\n", 
				mysql_errno(conn), mysql_error(conn));
		exit (1);
	}

	conn = mysql_real_connect (conn, "localhost","root", "mysql", "JuegoSO", 0, NULL, 0);
	if (conn==NULL) {
		printf ("Error al inicializar la conexion: %u %s\n", 
				mysql_errno(conn), mysql_error(conn));
		exit (1);
	}
	
	mysql_query(conn, "USE Juego;");
	
	char nombre[20];
	printf ("Escribe el nombre de un jugador \n");
	scanf("%s", nombre);
	
	char consulta [80];
	strcpy (consulta,"SELECT PlayersGames.Puntuacion FROM Jugadors,Partides,PlayersGames WHERE Jugadors.UserName = '");
	strcat (consulta, nombre);
	strcat (consulta,"' AND Partides.Identificador = PlayersGames.Partida AND PlayersGames.Jugador = Jugadors.Identificador");
	mysql_query (conn, consulta);
	
	resultado = mysql_store_result (conn);
	row = mysql_fetch_row (resultado);
	
	if (row == NULL)
		printf ("Ha habido un error en la consulta de datos \n");
	else
	{
		printf ("Las puntuaciones del jugador introducido son las siguientes: \n");
		while (row !=NULL) {
			printf ("%s\n", row[0]);
			row = mysql_fetch_row (resultado);
		}
	}
	
	mysql_close (conn);
	exit(0);
}