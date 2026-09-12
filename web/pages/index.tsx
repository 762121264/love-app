import React from 'react';

export default function Home() {
  return (
    <div className="min-h-screen bg-gradient-to-r from-pink-400 via-red-400 to-pink-600">
      <header className="flex justify-between items-center p-6 bg-white bg-opacity-10 backdrop-blur">
        <h1 className="text-3xl font-bold text-white">💕 Love App</h1>
        <nav className="space-x-6 text-white">
          <a href="#" className="hover:text-pink-200">Home</a>
          <a href="#" className="hover:text-pink-200">About</a>
          <a href="#auth" className="hover:text-pink-200">Sign In</a>
        </nav>
      </header>

      <main className="container mx-auto px-6 py-20">
        <section className="text-center text-white mb-16">
          <h2 className="text-5xl font-bold mb-4">Find Your Perfect Match</h2>
          <p className="text-xl mb-8">Connect with people who share your values and interests</p>
          <button className="bg-white text-pink-600 px-8 py-3 rounded-full font-bold hover:bg-pink-50 transition">
            Get Started
          </button>
        </section>

        <section className="grid grid-cols-1 md:grid-cols-3 gap-8 mt-16">
          <div className="bg-white bg-opacity-20 backdrop-blur p-8 rounded-lg text-white">
            <div className="text-4xl mb-4">👥</div>
            <h3 className="text-2xl font-bold mb-2">Smart Matching</h3>
            <p>Our algorithm finds compatible matches based on your preferences and personality</p>
          </div>
          <div className="bg-white bg-opacity-20 backdrop-blur p-8 rounded-lg text-white">
            <div className="text-4xl mb-4">💬</div>
            <h3 className="text-2xl font-bold mb-2">Real-time Chat</h3>
            <p>Connect instantly with matches through secure messaging</p>
          </div>
          <div className="bg-white bg-opacity-20 backdrop-blur p-8 rounded-lg text-white">
            <div className="text-4xl mb-4">🔐</div>
            <h3 className="text-2xl font-bold mb-2">Safe & Secure</h3>
            <p>Your privacy and safety are our top priority with verified profiles</p>
          </div>
        </section>
      </main>

      <footer className="bg-black bg-opacity-20 text-white text-center py-6 mt-20">
        <p>&copy; 2024 Love App. Made with ❤️</p>
      </footer>
    </div>
  );
}
