import type { IncomingMessage, ServerResponse } from 'node:http'
import { sendReminders } from './_reminders.js'

// Lembrete da tarde: 18h em Brasília (horário no vercel.json)
export default function handler(req: IncomingMessage, res: ServerResponse) {
  return sendReminders(req, res, 'evening')
}
