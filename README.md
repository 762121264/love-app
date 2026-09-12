# Love App 💕

A modern love website and app connecting people and celebrating relationships.

## Features

- 👥 **User Profiles** - Create and customize your profile
- 💑 **Matching** - Advanced matching algorithm based on interests and compatibility
- 💬 **Real-time Messaging** - Instant messaging with matches
- ❤️ **Relationship Timeline** - Share memories and milestones
- 🎉 **Event Planning** - Plan dates and celebrations
- 🔐 **Privacy & Security** - End-to-end encryption and safety features

## Tech Stack

### Frontend
- React.js / Next.js
- TypeScript
- Tailwind CSS
- Redux for state management

### Backend
- Node.js / Express.js
- PostgreSQL
- Redis for caching
- WebSocket for real-time messaging

### Mobile
- React Native
- Expo

## Project Structure

```
love-app/
├── web/              # Frontend website
├── server/           # Backend API
├── mobile/           # React Native mobile app
├── docs/             # Documentation
└── scripts/          # Utility scripts
```

## Getting Started

### Prerequisites
- Node.js (v16+)
- npm or yarn
- PostgreSQL
- Redis

### Installation

1. Clone the repository
```bash
git clone https://github.com/762121264/love-app.git
cd love-app
```

2. Install dependencies
```bash
# Backend
cd server && npm install

# Frontend
cd ../web && npm install

# Mobile
cd ../mobile && npm install
```

3. Set up environment variables
```bash
cp .env.example .env
```

4. Start development servers
```bash
# Terminal 1: Backend
cd server && npm run dev

# Terminal 2: Frontend
cd web && npm run dev

# Terminal 3: Mobile
cd mobile && npm start
```

## API Documentation

API docs available at `http://localhost:3001/api/docs`

## Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](./CONTRIBUTING.md) first.

## License

MIT License - see [LICENSE](./LICENSE) file for details

## Support

For support, email support@love-app.com or open an issue.

---

Made with ❤️
