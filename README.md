# Dead simple Ruby on Rails Tic-Tac-Toe

## API
- get game details: `GET /games/:id`
- create new game: `POST /games`
- play a move: `PATCH /games/:id` { move: { x: 0, y: 0 } }

## TODO
- [ ] Add controller tests
- [ ] Add integration tests
- [ ] Use UUID's instead of increment ID
- [ ] Add sockets instead of pulling
- [ ] Allow users to login
- [ ] **maybe** Allow users to play against computer