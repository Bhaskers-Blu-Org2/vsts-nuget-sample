using System;
using PhysicsEngine;

namespace FunPhysicsGame
{
    class Program
    {
        static void Main(string[] args)
        {
            var explosion = new Explosion();
            Console.WriteLine(explosion.MegaBoom());
        }
    }
}
