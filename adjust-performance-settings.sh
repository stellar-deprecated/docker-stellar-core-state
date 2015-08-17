#!/bin/sh

# Place this file in docker-entrypoint-initdb.d/ in the postgresql container.

# Give it more memory to work with.
sed -ri "s/^#(shared_buffers\s*=\s*)\S+/\1 1GB/" "${PGDATA}/postgresql.conf"

# Disable synchronous commits; depending on disk controller this may add a
# slight risk of data loss, a window of 3x wal_writer_delay (200ms,
# i.e. 600ms of DB activity at risk of loss if the drive controller has no
# battery). However, this is no more of a risk than the gap between
# SCP-consensus and SQL-commit we already have; the guarantees we make to
# clients should not be based on a ledger-in-progress, but the "previous
# ledger hash" value that occurs in the _next_ ledger. In other words, by
# the time consensus on ledger N+1's "previous ledger" (N's hash) is
# acquired, N itself will be safely on disk regardless.
sed -ri "s/^#(synchronous_commit\s*=\s*)\S+/\1 off/" "${PGDATA}/postgresql.conf"

# Space checkpoints out and make them less bursty.
sed -ri "s/^#(checkpoint_segments\s*=\s*)\S+/\1 30/" "${PGDATA}/postgresql.conf"
sed -ri "s/^#(checkpoint_completion_target\s*=\s*)\S+/\1 0.9/" "${PGDATA}/postgresql.conf"
