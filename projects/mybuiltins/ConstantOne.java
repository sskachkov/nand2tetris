package builtInChips;

import Hack.Gates.BuiltInGate;

/**
 * A bitwise 1-bit And gate.
 */
public class ConstantOne extends BuiltInGate {

    protected void reCompute() {
        outputPins[0].set((short) 1);
    }

}
