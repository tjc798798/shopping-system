<template>
  <div style="width: 80%; margin: 20px auto; min-height: 600px;">
    <el-card style="height: 700px; display: flex; flex-direction: column;">
      <div slot="header" class="clearfix">
        <span style="font-weight: bold; font-size: 18px;">AI 助手</span>
        <el-tag type="success" style="margin-left: 10px;">在线</el-tag>
      </div>

      <div class="chat-container" ref="chatContainer">
        <div v-for="(item, index) in chatList" :key="index" :class="['message-row', item.role === 'user' ? 'user-row' : 'ai-row']">
          <div class="avatar">
            <img :src="item.role === 'user' ? user.avatar : aiAvatar" alt="">
          </div>
          <div class="message-content">
            <div class="message-bubble">
              {{ item.content }}
            </div>
          </div>
        </div>
      </div>

      <div class="input-container">
        <el-input
            type="textarea"
            :rows="3"
            placeholder="请输入您的问题..."
            v-model="inputMsg"
            @keyup.enter.native="sendMessage"
            resize="none"
        ></el-input>
        <div style="text-align: right; margin-top: 10px;">
          <el-button type="primary" @click="sendMessage" :loading="loading">发送</el-button>
        </div>
      </div>
    </el-card>
  </div>
</template>

<script>
export default {
  name: "AiAssistant",
  data() {
    return {
      user: JSON.parse(localStorage.getItem('user') || '{}'),
      aiAvatar: 'https://coresg-normal.trae.ai/api/ide/v1/text_to_image?prompt=ai%20robot%20avatar&image_size=square',
      inputMsg: '',
      loading: false,
      chatList: [
        { role: 'ai', content: '您好！我是您的 AI 购物助手，有什么可以帮您的吗？' }
      ]
    }
  },
  methods: {
    async sendMessage() {
      if (!this.inputMsg.trim()) {
        this.$message.warning('请输入内容');
        return;
      }

      const userMsg = this.inputMsg;
      this.chatList.push({ role: 'user', content: userMsg });
      this.inputMsg = '';
      this.loading = true;

      // 自动滚动到底部
      this.$nextTick(() => {
        this.scrollToBottom();
      });

      try {
        // 调用后端 AI 接口
        const res = await this.$request.post('/ai/chat', { message: userMsg });
        if (res.code === '200') {
          this.chatList.push({ role: 'ai', content: res.data });
        } else {
          this.chatList.push({ role: 'ai', content: '抱歉，我现在有点忙，请稍后再试。' });
        }
      } catch (e) {
        this.chatList.push({ role: 'ai', content: '网络连接出现问题，请检查您的网络。' });
      } finally {
        this.loading = false;
        this.$nextTick(() => {
          this.scrollToBottom();
        });
      }
    },
    scrollToBottom() {
      const container = this.$refs.chatContainer;
      container.scrollTop = container.scrollHeight;
    }
  }
}
</script>

<style scoped>
.chat-container {
  flex: 1;
  overflow-y: auto;
  padding: 20px;
  background-color: #f9f9f9;
  border-radius: 4px;
  height: 480px; /* 固定高度以启用滚动 */
  margin-bottom: 20px;
}

.message-row {
  display: flex;
  margin-bottom: 20px;
  align-items: flex-start;
}

.user-row {
  flex-direction: row-reverse;
}

.avatar img {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  margin: 0 10px;
}

.message-content {
  max-width: 70%;
}

.message-bubble {
  padding: 10px 15px;
  border-radius: 8px;
  font-size: 14px;
  line-height: 1.6;
  position: relative;
  word-wrap: break-word;
}

.ai-row .message-bubble {
  background-color: #fff;
  color: #333;
  border: 1px solid #e0e0e0;
}

.user-row .message-bubble {
  background-color: #409eff;
  color: #fff;
}

.input-container {
  padding-top: 10px;
  border-top: 1px solid #ebeef5;
}

/* 隐藏滚动条但保留滚动功能 */
.chat-container::-webkit-scrollbar {
  width: 6px;
}
.chat-container::-webkit-scrollbar-thumb {
  background: #ccc;
  border-radius: 3px;
}
</style>
