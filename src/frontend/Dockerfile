# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# Build stage
FROM golang:1.25 AS builder

WORKDIR /app
COPY . .

RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux go build -o frontend .

# Runtime stage
FROM alpine:3.20

WORKDIR /app

COPY --from=builder /app/frontend .
COPY static ./static
COPY --from=builder /app/templates ./templates

EXPOSE 8080

CMD ["./frontend"]
