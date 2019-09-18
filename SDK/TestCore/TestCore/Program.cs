using System;
using Newtonsoft.Json;
using Nito.AsyncEx;
using Split2021;
using Split2021.Entities;

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

            var user = await split.RetrieveRecord<User>(1);
            Console.WriteLine(user.email);
            Console.WriteLine(JsonConvert.SerializeObject(user));

            var users = await split.RetrieveMultipleRecords<User>();
            Console.WriteLine(users[0].email);
        }
    }
}
