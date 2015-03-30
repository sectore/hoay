module hoay.common.util {
  'use strict';

  /**
   * Mixin helper
   * It will run through the properties of each of the mixins
   * and copy them over to the target of the mixins,
   * filling out the stand-in properties with their implementations.
   *
   * @see: http://www.typescriptlang.org/Handbook#mixins-mixin-sample
   *
   * @param derivedCtor
   * @param baseCtors
   */
  export function applyMixins(derivedCtor:any, baseCtors:any[]) {

    baseCtors.forEach(baseCtor => {
      Object.getOwnPropertyNames(baseCtor.prototype).forEach(name => {
        derivedCtor.prototype[name] = baseCtor.prototype[name];
      })
    });
  }

}
