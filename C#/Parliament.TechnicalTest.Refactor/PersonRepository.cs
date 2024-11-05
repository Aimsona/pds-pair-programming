using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;

namespace Parliament.TechnicalTest.Refactor;

public class PersonRepository
{
    public object CommandIssuer;
    public DbConnection Connection;

    public PersonRepository()
    {
        CommandIssuer = new CommandIssuer();
        Connection = new SqlConnection();
        Connection.Open();
    }

    public List<Person> GetPeople(int skip, int take, string name)
    {
        var command = Connection.CreateCommand();
        command.CommandText = $"SELECT * FROM USER WHERE name = '{name}'";

        IEnumerable<Person> results = ((CommandIssuer)CommandIssuer).IssueCommand<IEnumerable<Person>>(command);

        Connection.Close();

        return results.ToList().Skip(skip).Take(take).ToList();
    }
}

public class Person
{
    public string Name { get; set; }
}

public class CommandIssuer
{
    public T IssueCommand<T>(DbCommand command)
    {
        // Issue command etc
        //(not part of the test) to specify this clearly doesn't work!
        throw new NotImplementedException();
    }
}