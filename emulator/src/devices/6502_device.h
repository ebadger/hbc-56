/*
 * Troy's HBC-56 Emulator - 6502 CPU device
 *
 * Copyright (c) 2021 Troy Schrapel
 *
 * This code is licensed under the MIT license
 *
 * https://github.com/visrealm/hbc-56/emulator
 *
 */

#ifndef _HBC56_6502_DEVICE_H_
#define _HBC56_6502_DEVICE_H_

#include "device.h"

typedef enum
{
  CPU_RUNNING,
  CPU_BREAK,
  CPU_STEP_INTO,
  CPU_STEP_OVER,
  CPU_STEP_OUT
} HBC56CpuState;


/* Function:  create6502CpuDevice
 * --------------------
 * create a 6502 CPU device
 */
HBC56Device create6502CpuDevice();

void interrupt6502(HBC56Device* device, HBC56InterruptType type, HBC56InterruptSignal signal);

void debug6502State(HBC56Device* device, HBC56CpuState state);

HBC56CpuState getDebug6502State(HBC56Device* device);


#endif