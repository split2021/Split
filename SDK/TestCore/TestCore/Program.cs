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
            Console.WriteLine(await split.Connect("split_2021@labeip.epitech.eu", "X#9q@XCy7qy&"));

            Console.WriteLine(await (await split.RetrieveMultipleRecords("user")).Content.ReadAsStringAsync());
        }
    }
}
