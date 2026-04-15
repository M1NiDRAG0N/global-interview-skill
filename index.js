#!/usr/bin/env node
import { McpServer } from "@modelcontextprotocol/sdk/server/mcp.js";
import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js";
import { readFileSync } from "fs";
import { resolve, dirname } from "path";
import { fileURLToPath } from "url";
import { z } from "zod";

const __dirname = dirname(fileURLToPath(import.meta.url));

const systemPrompt = readFileSync(
  resolve(__dirname, "prompts/system-prompt.md"),
  "utf-8"
);

const server = new McpServer({
  name: "global-interview-skill",
  version: "1.0.0",
});

// 면접 코칭 시스템 프롬프트를 MCP prompt로 노출
server.prompt(
  "interview-agent",
  "개발자 면접 코칭 에이전트 — 이력서 분석, 모의 면접(KR/JP/US 페르소나), 이력서 보완",
  [],
  () => ({
    messages: [
      {
        role: "user",
        content: {
          type: "text",
          text: systemPrompt,
        },
      },
    ],
  })
);

// 이력서 파일 읽기 tool
server.tool(
  "read_resume",
  "Read a resume file from the local filesystem",
  {
    path: z.string().describe("Path to the resume file (pdf, docx, md, txt)"),
  },
  async ({ path: filePath }) => {
    try {
      const content = readFileSync(resolve(filePath), "utf-8");
      return { content: [{ type: "text", text: content }] };
    } catch (e) {
      return {
        content: [{ type: "text", text: `파일을 읽을 수 없습니다: ${e.message}` }],
        isError: true,
      };
    }
  }
);

const transport = new StdioServerTransport();
await server.connect(transport);
