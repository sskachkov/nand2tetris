package builtInChips;

import Hack.Gates.BuiltInGate;

/**
 * A bitwise 1-bit And gate.
 */
public class Nop extends BuiltInGate {

    protected void reCompute() {
        short in = inputPins[0].get();
        outputPins[0].set(in);
    }

}
