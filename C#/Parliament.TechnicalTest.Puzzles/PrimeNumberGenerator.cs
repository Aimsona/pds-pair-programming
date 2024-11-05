namespace Parliament.TechnicalTest.Puzzles;

public interface IPrimeGenerator
{
    IEnumerable<int> GeneratePrimesUpTo(int maxValue);
}

internal class PrimeNumberGenerator : IPrimeGenerator
{
    public IEnumerable<int> GeneratePrimesUpTo(int maxValue)
    {

        throw new NotImplementedException();
    }
}