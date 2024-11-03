import { trainerize } from './trainerize';

import { expect, test, describe } from 'bun:test';

describe('trainerize', () => {
  test('should work', () => {
    expect(trainerize()).toEqual('trainerize');
  });
});
