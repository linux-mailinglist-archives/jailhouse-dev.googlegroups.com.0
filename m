Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBMHH7X4QKGQEHOP27TA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3d.google.com (mail-yb1-xb3d.google.com [IPv6:2607:f8b0:4864:20::b3d])
	by mail.lfdr.de (Postfix) with ESMTPS id AA73B24CE99
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 Aug 2020 09:11:45 +0200 (CEST)
Received: by mail-yb1-xb3d.google.com with SMTP id x6sf1247480ybp.10
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 Aug 2020 00:11:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597993904; cv=pass;
        d=google.com; s=arc-20160816;
        b=uD1SIuJVHIxlOzrrsPZXBwZjo7jcJMzSMi1GlY4OpG7imTDjx9zbb9t1hY8qGf0twy
         zLB6s6AicRJlGSXFLpcgpd77GFYTm43ZYBb4hAYMJof4+zVRWoEEP9UvFvCQ9vy+gA0J
         8UHLzNqS7NfRf2+2UwB540paOjjri06e0dJqBnDeUyUP6xA3bsHGZja4PUY1bMulKIL8
         9z/UPWJiQlYiCwP57tZKoN27RyScKhlKXG3+xSQcaBmD+J/KMMM+MKcvYCYuZdJQeIb1
         LqvsMAQz1HpwQx0V3fTQPqEvYg9F7kq6YUeoG9I/dGQ8jPhMd+1MvsQs8ItVCXl7IMIa
         NFRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=lBMNWJBrEvah34XSGMuuMq8G/k/qFEOLnrlkHBtKngA=;
        b=twy5MrY1HzdKzJKuWD97+q3Ce52sXOD7bE5BEFi9RiIsit5WFtrMYDDB70zbn/JwJi
         +nk3SR0247NXAUz7fqbX4yeSGsm9bfRNjLrDec/+u7n5oW+eCkksHOVlpRiqbb2Fzbbf
         bkPxxKR4AghU9z+oLd95r9/3MEA1fFAaMED1zNps3L0j9Af82rGzZ+uVmA7UCx2LvTH+
         l4aNSJfBFSsAtyeFAh3AsfXXHIczq4tsbDwgzhooC/uLatLyafNWRywIndPeWFN/LE88
         kAaa2qAy6Wk9TaA4eOkoY8FVBSLPukOWMVmBhgupo4ULbwdZ2ZGRIzeg6/xSKi7aT0tM
         +MOQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=uiGFGacO;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lBMNWJBrEvah34XSGMuuMq8G/k/qFEOLnrlkHBtKngA=;
        b=ELDyYVbLMfTVd91eEex8L+9I8RjMg8BADVPiDXex3dEAH/kUUv8mS4BOIJhGmr42IS
         TFbuQkw4Zit0BO1W/D9X+TRidVhjBcn+cGIb9GfYzrFCbNAnFU1IxcDGHGc9IhbJKz92
         GYL4H7uXjPBZ7gwDxJi+2WMSnY3DgduGZ6epvRK3+P9UWQ0bkHcDdpSm3ssmNBwOUXc6
         lFt5MtA6kM5zN5qU2pRw9Tz67gf1WCoTAdqFmqR1PnE7lw1yrUmptYr9GIVbm3ohPSfm
         sUA/dHEgLjgQy4wSkK/N0T+Ee+snPorhaymanB2LGMwsDFFiohYzzQ+OnFIkGfuKUvLE
         XkPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=lBMNWJBrEvah34XSGMuuMq8G/k/qFEOLnrlkHBtKngA=;
        b=S4iiba+axxswJIuiaYA4DAU/m/L9g/vKO8hLGhqP+I8BF0e1LjUoxFCduLHymym/5g
         VVTAiZSSyFZF14UIimT28a5IPZxjCRz9v8pbHgiu9m0qhPtVf7Q7AHRB3rClLAoAw161
         5ne28fkE9qfAHiiu7DYvHvkDbrxg6BYnFurQ8nLS2wvv0X/npvQCJmMWnKezgLEiGjj3
         JhUAKeRnCOgCkM8q6xN/B/60D0o1grJ/x92tXl6lNwFs3A6GHaXAVHhdR9l6Msvgensf
         xyLZZVTbLNX4vXh2CVS+1VR22sWdxY8nWb0/3NOs/Mz1A3SwY80u1x7gyYkF1wN5nYRY
         SE1g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530of/tCN00EjVHVVWZpAZ6eGYvNrTZJFJhLu5JVHHByG2HZgzsw
	yWpsVSFlxKDcLs8fUj9dZZA=
X-Google-Smtp-Source: ABdhPJxQFcgOHNWF2neX8PQ7d8Frnq3fvsUrkBTv90PsbNBJVsCCNV8AaxadWj4zJunYxplX5phs7g==
X-Received: by 2002:a25:2fcc:: with SMTP id v195mr1873609ybv.119.1597993904455;
        Fri, 21 Aug 2020 00:11:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:40c:: with SMTP id 12ls440464ybe.7.gmail; Fri, 21 Aug
 2020 00:11:43 -0700 (PDT)
X-Received: by 2002:a25:9885:: with SMTP id l5mr2192368ybo.0.1597993903886;
        Fri, 21 Aug 2020 00:11:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597993903; cv=none;
        d=google.com; s=arc-20160816;
        b=TwlPEQ//rV/Ke9evYAcXII+MB7riNE95CE43GhRSLI/F9CwjoAPjYZg9D5aIvi5y9g
         fb46Wjo4F9OpeyCfzCI0854nLn7TO7+8+Jk+QzNnHEzDhIaXOtURoDpUuYB8ZGK/JsfZ
         HQDtBo10Tf+jUpnJD2ps65s3JScyhAfNWgsVqehF471rg2DBCgGwyFviAZL3oPcLc11/
         3JA+oH9mIN7GduBLzSSDraCegWkI7W5/jOXERQNkLToULwqB7v7h5O9MW1YcUrTzRMC3
         lJi2A20I4e2UlG0dc2RD9d3MaJcjQux6Na4bwKh97T1mz2E2rL1eD7kp+A5Yo92d2P/j
         JYLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=LTBbir6s7iqqUX3cI0v27pxTajtWs79FNToSdf/7vMc=;
        b=zHh7KHCNxJWmcmQyC0/obQ2aUgFikfchKLdxdDXk5r1g+4x57NqZv15QT8+obDS+Ie
         QzJ7d4XVb/albsNLt+ZqEETChPKpEc0kBw89Yyo9Vt5igCk9OMevsBEyRxPmleLo4vju
         ojdnlqyl4keBBueqqJwL+tK6QEpDZwSnB7PpaMwRDiNY8X/exWr1t3CK1Xx2Q3znDMxf
         Sy2wFMKTkPdfl1Ldw590NMpAUIhYMaSIEzxSPYd/rm/yzLWagka3lI3oi1D7bnGpDU0S
         WzBYjp7CeNg4b9Ji9d5/u1oS5Ufa8cSYxVcdLKqXgJPuI5h74ir7JvsItWMgkMB9YudF
         79gA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=uiGFGacO;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-20.smtp.github.com (out-20.smtp.github.com. [192.30.252.203])
        by gmr-mx.google.com with ESMTPS id 7si76192ybc.0.2020.08.21.00.11.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Aug 2020 00:11:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) client-ip=192.30.252.203;
Received: from github-lowworker-52827f8.ash1-iad.github.net (github-lowworker-52827f8.ash1-iad.github.net [10.56.108.24])
	by smtp.github.com (Postfix) with ESMTP id A0301E0937
	for <jailhouse-dev@googlegroups.com>; Fri, 21 Aug 2020 00:11:43 -0700 (PDT)
Date: Fri, 21 Aug 2020 00:11:43 -0700
From: Peng Fan <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/9b4efc-2f0c87@github.com>
Subject: [siemens/jailhouse] 42b1f5: imx8: add lpuart support
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=uiGFGacO;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.203 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=github.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/siemens/jailhouse
  Commit: 42b1f5a55e4e4c3ccce3eb915bc9c8c82c394860
      https://github.com/siemens/jailhouse/commit/42b1f5a55e4e4c3ccce3eb915bc9c8c82c394860
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2020-08-12 (Wed, 12 Aug 2020)

  Changed paths:
    M hypervisor/arch/arm-common/Kbuild
    M hypervisor/arch/arm-common/dbg-write.c
    M hypervisor/arch/arm-common/include/asm/uart.h
    A hypervisor/arch/arm-common/uart-imx-lpuart.c
    M include/jailhouse/console.h
    M inmates/lib/arm-common/Makefile.lib
    A inmates/lib/arm-common/uart-imx-lpuart.c
    M inmates/lib/arm-common/uart.c

  Log Message:
  -----------
  imx8: add lpuart support

On i.MX8/8X family, there is only LPUART. So introduce lpuart support.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Alice Guo <alice.guo@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: c313108807d415ea594f69ad673a57359c927b35
      https://github.com/siemens/jailhouse/commit/c313108807d415ea594f69ad673a57359c927b35
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2020-08-15 (Sat, 15 Aug 2020)

  Changed paths:
    M pyjailhouse/config_parser.py

  Log Message:
  -----------
  pyjailhouse: config_parser: store binary format specification in struct.Struct

Improves its handling in the code and slightly increases the overall
performance as well.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: c2f3065768bd7fdb40cd95539ede1895c238f553
      https://github.com/siemens/jailhouse/commit/c2f3065768bd7fdb40cd95539ede1895c238f553
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2020-08-15 (Sat, 15 Aug 2020)

  Changed paths:
    M pyjailhouse/config_parser.py
    M tools/jailhouse-config-check

  Log Message:
  -----------
  pyjailhouse: config_parser: move parsing into class methods

... and use constructor for initialization only. This separation
provides clarity on how to instantiate config components.

This commit also serves as preparation for following one.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 8905d5e91ea047b80861e33e3d5b038652edff25
      https://github.com/siemens/jailhouse/commit/8905d5e91ea047b80861e33e3d5b038652edff25
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2020-08-15 (Sat, 15 Aug 2020)

  Changed paths:
    M pyjailhouse/config_parser.py

  Log Message:
  -----------
  pyjailhouse: config_parser: consolidate binary parsing into CStruct class

The class slots define component fields in a more grounded way.
This greatly simplifies definition of parseable compoments.

The first `__slots__` tuple in each class defines a constant list of
fields and also the corresponding binary ones in the C struct.
`_BIN_FIELD_NUM` ensures that subsequent slot additions are ignored by
CStruct as they must be constructed by the owning class itself.

For complex parsing the class method `parse` needs to be overridden,
see `CellConfig`.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1cfb4662c9b681d5cbb242541dca045f548f412e
      https://github.com/siemens/jailhouse/commit/1cfb4662c9b681d5cbb242541dca045f548f412e
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2020-08-15 (Sat, 15 Aug 2020)

  Changed paths:
    M pyjailhouse/config_parser.py
    M tools/jailhouse-config-check

  Log Message:
  -----------
  pyjailhouse: config_parser: use I/O stream instead slice of bytes

This enables more flexibility in input types as long as they provide
binary I/O capabilities.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 61ff21fc69999f0e58e3222905c46e4716c9b202
      https://github.com/siemens/jailhouse/commit/61ff21fc69999f0e58e3222905c46e4716c9b202
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2020-08-15 (Sat, 15 Aug 2020)

  Changed paths:
    M pyjailhouse/config_parser.py

  Log Message:
  -----------
  pyjailhouse: config_parser: parse pin_bitman in Irqchip as list

Just like the array of 4 in the C struct.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f02a43a5fb3c870c80606ced065502211290acab
      https://github.com/siemens/jailhouse/commit/f02a43a5fb3c870c80606ced065502211290acab
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2020-08-15 (Sat, 15 Aug 2020)

  Changed paths:
    M pyjailhouse/config_parser.py
    M tools/jailhouse-config-check

  Log Message:
  -----------
  pyjailhouse: config_parser: consolidate header parsing

This also enables probing for a configuration type.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: dcc62c3f365ef06c4d701a77aed9abfb204b0b02
      https://github.com/siemens/jailhouse/commit/dcc62c3f365ef06c4d701a77aed9abfb204b0b02
  Author: Alice Guo <alice.guo@nxp.com>
  Date:   2020-08-18 (Tue, 18 Aug 2020)

  Changed paths:
    M hypervisor/arch/arm-common/control.c
    M hypervisor/arch/arm-common/include/asm/control.h
    M hypervisor/arch/arm/control.c
    M hypervisor/arch/arm64/control.c
    M hypervisor/arch/arm64/entry.S
    M hypervisor/arch/arm64/include/asm/sysregs.h
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  arm64: support inmate cell in AArch32 mode

An AArch64 hypervisor can host both AArch32 and AArch64 virtual machines
at the same time. If the inmate cell wants to run in AArch32 mode, the
assigned cpu must change to AArch32. Because AArch64 hypervisor and
AArch64 root cell are used, when the AArch32 inmate cell is destroyed,
cpu owned by inmate cell will be reassigned to AArch64 root cell, switch
the cpu back to AArch64.

The following is a summary of some of the points when supporting inmate
cell in AArch32 mode:
Define a macro "JAILHOUSE_CELL_AARCH32" to indicate AArch32 execution
state. Add this macro to flags of struct jailhouse_cell_desc, and you can
use it to indicate whether a cell is AArch32.

Add "bool aarch32" as second parameter to arm_cpu_reset(), and can use
it to pass execution state. If aarch32 equals true, switch to AArch32.

When an exception occurs, the processor must execute handler code which
corresponds to the exception. When the exception is being taken at a
lower Exception level, the execution state of the next lower level
(AArch64 or AArch32) will be used. Fill exception handling functions for
Lower EL using AArch32 in hypervisor/arch/arm64/entry.S.

Configure the registers related to changing execution state. If a cell
is AArch32, SPSR_EL2.M[4] will be set to 0b1 which means AArch32
execution state, SPSR_EL2.M[3:0] will be set to 0b0011 which means
Supervisor, and HCR_EL2.RW will be set to 0b0 which means lower levels
are all AArch32. If a cell is AArch64, make sure HCR_EL2.RW is 0 and the
other registers are configured according to the previous code.

After Linux operating system boots up, execute the following commands to
use AArch32 virtual machine on the i.MX8DXL:
./jailhouse enable imx8dxl.cell
./jailhouse cell create imx8dxl-gic-demo-aarch32.cell
./jailhouse cell load 1 gic-demo.bin (32-bit)
./jailhouse cell start 1

Signed-off-by: Alice Guo <alice.guo@nxp.com>
[Jan: style fixes]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 20015a7645ac9ba8123a3f2f10a003bbe084149f
      https://github.com/siemens/jailhouse/commit/20015a7645ac9ba8123a3f2f10a003bbe084149f
  Author: Alice Guo <alice.guo@nxp.com>
  Date:   2020-08-18 (Tue, 18 Aug 2020)

  Changed paths:
    M hypervisor/arch/arm-common/gic-v3.c

  Log Message:
  -----------
  arm-common: gic-v3: Add support for accessing GICR_TYPER high word separately

This is needed for 32-bit guests that cannot issue 64-bit accesses, thus
will trigger two separate 32-bit accesses.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
[Jan: replaced subject and commit message]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1c70fb3943f09e35ece0d2b739e6d25bc9566baa
      https://github.com/siemens/jailhouse/commit/1c70fb3943f09e35ece0d2b739e6d25bc9566baa
  Author: Alice Guo <alice.guo@nxp.com>
  Date:   2020-08-18 (Tue, 18 Aug 2020)

  Changed paths:
    M inmates/lib/arm-common/gic-v3.c
    M inmates/lib/arm/include/asm/sysregs.h
    M inmates/lib/arm64/include/asm/sysregs.h

  Log Message:
  -----------
  inmates: gic-v3: solve 32-bit incompatibility problems in gic_v3_init()

When the inmate cell is in AArch32 execution state, using mmio_read64()
to obtain the value of GICR_TYPER will cause error because mmio_read64()
generates "ldrd" instruction when compiling 32-bit gic_demo.bin, and
"ldrd" belongs to A64 assembly language which is cannot be used in
AArch32. So use mmio_read32() to read 64-bit GICR_ TYPER in twice.

In ARMv8-A, AArch64 state supports four levels of affinity. but AArch32
state can only support three levels of affinity. So use MPIDR_CPUID_MASK
to set bit[31:24] of mpidr to be 0, and ensure the correct mpidr.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
[Jan: slightly improved subject]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f34cb118a0eda21d611c4bbb0f44373aa012e5eb
      https://github.com/siemens/jailhouse/commit/f34cb118a0eda21d611c4bbb0f44373aa012e5eb
  Author: Alice Guo <alice.guo@nxp.com>
  Date:   2020-08-18 (Tue, 18 Aug 2020)

  Changed paths:
    A configs/arm64/imx8dxl-inmate-demo-aarch32.c
    A configs/arm64/imx8dxl-inmate-demo.c
    A configs/arm64/imx8dxl.c

  Log Message:
  -----------
  configs: arm64: imx8dxl: add cell configuration files

Add "imx8dxl-inmate-demo-aarch32.c" to support AArch32 VM on the imx8dxl
platform. Distinguish whether it is AArch32 inmate cell by the macro
JAILHOUSE_CELL_AARCH32.

Add "imx8dxl-inmate-demo.c" for AArch64 VM.

"imx8dxl.c" is used for the root cell.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ce10986e6637076778fa9a94968b7779d17a56a9
      https://github.com/siemens/jailhouse/commit/ce10986e6637076778fa9a94968b7779d17a56a9
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2020-08-19 (Wed, 19 Aug 2020)

  Changed paths:
    M hypervisor/arch/arm64/entry.S

  Log Message:
  -----------
  arm64: mitigate Straight-line Speculation

From Linux Kernel
commit 679db70801da ("arm64: entry: Place an SB sequence following an ERET instruction")
"
Some CPUs can speculate past an ERET instruction and potentially perform
speculative accesses to memory before processing the exception return.
Since the register state is often controlled by a lower privilege level
at the point of an ERET, this could potentially be used as part of a
side-channel attack.
"

Use Speculation barrier sequences:
 - SB
 - DSB followed by ISB

Since we not have ARMv8.5 with SB extension hardware, so only
use the 2nd approach now.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 5bd098db2e9f591fb5620be4a06b1686e736de50
      https://github.com/siemens/jailhouse/commit/5bd098db2e9f591fb5620be4a06b1686e736de50
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2020-08-21 (Fri, 21 Aug 2020)

  Changed paths:
    M hypervisor/arch/arm-common/irqchip.c

  Log Message:
  -----------
  arm: irqchip/gic: Ensure we have an ISB between ack and ->handle_irq

The whole commit message is from Linux Kernel:
commit <39a06b67c2c1>("irqchip/gic: Ensure we have an ISB between ack and ->handle_irq")

Devices that expose their interrupt status registers via system
registers (e.g. Statistical profiling, CPU PMU, DynamIQ PMU, arch timer,
vgic (although unused by Linux), ...) rely on a context synchronising
operation on the CPU to ensure that the updated status register is
visible to the CPU when handling the interrupt. This usually happens as
a result of taking the IRQ exception in the first place, but there are
two race scenarios where this isn't the case.

For example, let's say we have two peripherals (X and Y), where Y uses a
system register for its interrupt status.

Case 1:
1. CPU takes an IRQ exception as a result of X raising an interrupt
2. Y then raises its interrupt line, but the update to its system
   register is not yet visible to the CPU
3. The GIC decides to expose Y's interrupt number first in the Ack
   register
4. The CPU runs the IRQ handler for Y, but the status register is stale

Case 2:
1. CPU takes an IRQ exception as a result of X raising an interrupt
2. CPU reads the interrupt number for X from the Ack register and runs
   its IRQ handler
3. Y raises its interrupt line and the Ack register is updated, but
   again, the update to its system register is not yet visible to the
   CPU.
4. Since the GIC drivers poll the Ack register, we read Y's interrupt
   number and run its handler without a context synchronisation
   operation, therefore seeing the stale register value.

In either case, we run the risk of missing an IRQ. This patch solves the
problem by ensuring that we execute an ISB in the GIC drivers prior
to invoking the interrupt handler. This is already the case for GICv3
and EOIMode 1 (the usual case for the host).

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 59c13520ca5e7e235d1dc93674e92b23ec89fb4d
      https://github.com/siemens/jailhouse/commit/59c13520ca5e7e235d1dc93674e92b23ec89fb4d
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2020-08-21 (Fri, 21 Aug 2020)

  Changed paths:
    M hypervisor/arch/arm64/Makefile

  Log Message:
  -----------
  arm64: Do not use FPU registers in jailhouse

Some compilers default use hardfloat to generate instructions,
so it will use some FPU/NEON registers to do some optimization.

However some inmates might use FPU/NEON registers do some
calculation such as vector/audio and etc. So we need to disable
jailhouse use these registers. Use `-march=armv8-a+nofp` for this.

Reported-by: Michal Hanak <michal.hanak@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ac290aab988018282f333c6182e271a9fc1e3738
      https://github.com/siemens/jailhouse/commit/ac290aab988018282f333c6182e271a9fc1e3738
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2020-08-21 (Fri, 21 Aug 2020)

  Changed paths:
    M hypervisor/arch/arm64/control.c
    M hypervisor/arch/arm64/include/asm/sysregs.h

  Log Message:
  -----------
  arm64: allow accessing simd/floating-point registers in inmate

Set bit 30 of FPEXC32_EL2 to enables access to the Advanced SIMD and
floating-point functionality from all Exception levels.

Set CPACR_EL1.FPEN to not trap accessing to SIMD or floating point
registers.

Reported-by: Alice Guo <alice.guo@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
[Jan: replaced CPACR_EL1_FPEN(3) with CPACR_EL1_FPEN_ALL]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d557c02606ba1f38bb803935da6bffab9cc986ef
      https://github.com/siemens/jailhouse/commit/d557c02606ba1f38bb803935da6bffab9cc986ef
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2020-08-21 (Fri, 21 Aug 2020)

  Changed paths:
    M hypervisor/arch/arm/Makefile

  Log Message:
  -----------
  arm: pass -march=armv7ve to KBUILD_AFLAGS

Some toolchains might not have this flag default set, so when compiling,
there will be error that "dsb not supported" in cache.S.

So pass the flag to force toolchain use v7.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 2f0c8774eef8abec46daf7c98ac0057df514c739
      https://github.com/siemens/jailhouse/commit/2f0c8774eef8abec46daf7c98ac0057df514c739
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2020-08-21 (Fri, 21 Aug 2020)

  Changed paths:
    M inmates/Makefile

  Log Message:
  -----------
  inmates: Makefile: add -march=armv7ve

Add -march=armv7ve to avoid build error
that ".virt extension not supported".

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/9b4efcf4cb3a...2f0c8774eef8

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/9b4efc-2f0c87%40github.com.
