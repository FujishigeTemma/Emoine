/* eslint-disable no-console */
import ReconnectingWebSocket from 'reconnecting-websocket'

let ws: ReconnectingWebSocket | undefined

export const getWs = (): ReconnectingWebSocket => {
  if (!ws) connect()
  return ws as ReconnectingWebSocket
}

const connect = (): void => {
  const _ws = new ReconnectingWebSocket(`ws://localhost:80/api/ws`)
  _ws.binaryType = 'arraybuffer'
  _ws.addEventListener('open', e => {
    console.log('connected', e)
  })
  _ws.addEventListener('message', e => {
    console.log(e.data)
  })
  _ws.addEventListener('error', e => {
    console.log('err', e)
  })
  _ws.addEventListener('close', e => {
    console.log('close', e)
  })
  ws = _ws
}
