### Create migration

```bash
migrate create -ext sql -dir internal/infrastructure/persistence/mysql/migrations -seq create_users_table
```

### Running Migration

```bash
migrate -database "mysql://root:root@tcp(localhost:3306)/money_management" -path internal/infrastructure/persistence/mysql/migrations up
```

## Architecture

```bash
financial-app/
├── cmd/
│   └── app/
│       ├── main.go                  # Entry point
│       └── wire.go (optional DI)
│
├── internal/
│   ├── domain/                      # Core business logic (entities + interfaces)
│   │   ├── accounts/
│   │   │   ├── entity.go            # Structs: Account, Transaction, etc.
│   │   │   ├── service.go           # Usecases (business logic)
│   │   │   ├── repository.go        # Repository interface (port)
│   │   │   └── errors.go
│   │   ├── portfolios/
│   │   │   ├── entity.go
│   │   │   ├── service.go
│   │   │   └── repository.go
│   │   ├── users/
│   │   │   ├── entity.go
│   │   │   ├── service.go
│   │   │   └── repository.go
│   │   └── shared/
│   │       ├── value_objects.go     # Money, Currency, ID wrappers
│   │       └── errors.go
│   │
│   ├── application/                 # Use case orchestration (domain + ports)
│   │   ├── account_usecase.go
│   │   ├── transaction_usecase.go
│   │   ├── portfolio_usecase.go
│   │   └── user_usecase.go
│   │
│   ├── infrastructure/              # Adapters ke dunia luar
│   │   ├── persistence/             # DB layer
│   │   │   ├── postgres/
│   │   │   │   ├── account_repo.go
│   │   │   │   ├── transaction_repo.go
│   │   │   │   ├── portfolio_repo.go
│   │   │   │   └── migrations/
│   │   │   │       ├── 001_init.sql
│   │   │   │       └── 002_seed.sql
│   │   │   └── memory/              # In-memory mock repo (for tests)
│   │   │       └── account_repo.go
│   │   │
│   │   ├── http/                    # Delivery adapter (Fiber / Echo / Chi)
│   │   │   ├── handler/
│   │   │   │   ├── account_handler.go
│   │   │   │   ├── transaction_handler.go
│   │   │   │   └── auth_handler.go
│   │   │   ├── middleware/
│   │   │   │   ├── auth.go
│   │   │   │   └── logging.go
│   │   │   ├── router.go
│   │   │   └── response.go
│   │   │
│   │   ├── security/                # JWT, encryption, password hashing
│   │   │   ├── jwt_service.go
│   │   │   ├── password.go
│   │   │   └── encryption.go
│   │   │
│   │   ├── config/
│   │   │   ├── config.go
│   │   │   ├── env.go
│   │   │   └── logger.go
│   │   │
│   │   ├── scheduler/               # Optional: background jobs, cron
│   │   │   └── portfolio_updater.go
│   │   └── external/                # Integrasi API eksternal (harga saham, dll.)
│   │       ├── market_api.go
│   │       └── currency_api.go
│   │
│   └── tests/
│       ├── account_service_test.go
│       ├── transaction_service_test.go
│       └── mocks/
│           └── repository_mock.go
│
├── pkg/                             # Shared utilitas antar modul
│   ├── logger/
│   ├── response/
│   └── validator/
│
├── build/
│   ├── Dockerfile
│   └── docker-compose.yml
│
├── go.mod
├── go.sum
└── README.md

```
