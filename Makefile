PROTO_DIR=proto
OUT_DIR=gen

install:
	go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
	go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

gen:
	protoc --go_out=$(OUT_DIR) --go-grpc_out=$(OUT_DIR) \
	       --go_opt=paths=source_relative --go-grpc_opt=paths=source_relative \
	       $(PROTO_DIR)/*/*.proto

clean:
	rm -rf $(OUT_DIR)/*

.PHONY: install gen clean