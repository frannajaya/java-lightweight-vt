import http from 'k6/http';
import { check } from 'k6';

export const options = {
  vus: 1000,         // number of virtual users
  duration: '30s',   // total test duration
};

export default function () {
  const res = http.get('http://localhost:2000/hello');
  check(res, { 'status is 200': (r) => r.status === 200 });
}
