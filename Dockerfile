# =============================================================================
# VNGen RunPod Worker - Wan2.2 Remix I2V 14B (ComfyUI Serverless)
#
# Models baked into image for fast cold starts via FlashBoot.
# Built automatically by RunPod GitHub Integration on release.
# =============================================================================

FROM runpod/worker-comfyui:5.7.1-base

# ---------------------------------------------------------------------------
# Diffusion Models (~15 GB each, 2-pass architecture: HIGH + LOW lighting)
# ---------------------------------------------------------------------------
RUN comfy model download \
    --url https://huggingface.co/FX-FeiHou/wan2.2-Remix/resolve/main/NSFW/Wan2.2_Remix_NSFW_i2v_14b_high_lighting_v2.0.safetensors \
    --relative-path models/diffusion_models \
    --filename Wan2.2_Remix_NSFW_i2v_14b_high_lighting_v2.0.safetensors

RUN comfy model download \
    --url https://huggingface.co/FX-FeiHou/wan2.2-Remix/resolve/main/NSFW/Wan2.2_Remix_NSFW_i2v_14b_low_lighting_v2.0.safetensors \
    --relative-path models/diffusion_models \
    --filename Wan2.2_Remix_NSFW_i2v_14b_low_lighting_v2.0.safetensors

# ---------------------------------------------------------------------------
# Text Encoder - NSFW UMT5-XXL fp8 (~6.7 GB)
# ---------------------------------------------------------------------------
RUN comfy model download \
    --url https://huggingface.co/NSFW-API/NSFW-Wan-UMT5-XXL/resolve/main/nsfw_wan_umt5-xxl_fp8_scaled.safetensors \
    --relative-path models/text_encoders \
    --filename nsfw_wan_umt5-xxl_fp8_scaled.safetensors

# ---------------------------------------------------------------------------
# VAE (~254 MB)
# ---------------------------------------------------------------------------
RUN comfy model download \
    --url https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors \
    --relative-path models/vae \
    --filename wan_2.1_vae.safetensors

# ---------------------------------------------------------------------------
# CLIP Vision - required for I2V workflows (~1.3 GB)
# ---------------------------------------------------------------------------
RUN comfy model download \
    --url https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/clip_vision/clip_vision_h.safetensors \
    --relative-path models/clip_vision \
    --filename clip_vision_h.safetensors

# ---------------------------------------------------------------------------
# Lightning LoRAs - 4-step acceleration for expressions (~614 MB each)
# ---------------------------------------------------------------------------
RUN comfy model download \
    --url https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/LoRAs/Wan22-Lightning/old/Wan2.2-Lightning_I2V-A14B-4steps-lora_HIGH_fp16.safetensors \
    --relative-path models/loras \
    --filename Wan2.2-Lightning_I2V-A14B-4steps-lora_HIGH_fp16.safetensors

RUN comfy model download \
    --url https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/LoRAs/Wan22-Lightning/old/Wan2.2-Lightning_I2V-A14B-4steps-lora_LOW_fp16.safetensors \
    --relative-path models/loras \
    --filename Wan2.2-Lightning_I2V-A14B-4steps-lora_LOW_fp16.safetensors
