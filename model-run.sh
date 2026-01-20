# /home/models/GLM-4.7-W8A8-INT8-Dynamic-RTN
export CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7
export VLLM_USE_V1=1 
nohup python3 -m vllm.entrypoints.openai.api_server  \
	--host localhost    \
	--port 8123    \
    --model /home/models/GLM-4.7-W8A8-INT8-Dynamic-RTN  \
	--gpu-memory-utilization 0.95     \
    --trust-remote-code     \
	--max-model-len 61440     \
	--tensor-parallel-size 8 \
	--dtype auto      \
    --max_num_seqs 128  \
	--max_num_batched_tokens 61440    \
	--block-size 128 \
    --distributed-executor-backend mp \
	--disable-log-requests  \
    --enable-chunked-prefill > model-run.log 2>&1 &
