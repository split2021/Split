using System;
using Nito.AsyncEx;
using Split2021;

namespace TestCore
{
    class Program
    {
        static void Main(string[] args)
        {
            AsyncContext.Run(() => MainAsync(args));
        }

        static async void MainAsync(string[] args)
        {
            var split = new Split();
            Console.WriteLine(await split.Connect("", ""));
        }
    }
}
