Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB7XM77TQKGQE2UPITGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83c.google.com (mail-qt1-x83c.google.com [IPv6:2607:f8b0:4864:20::83c])
	by mail.lfdr.de (Postfix) with ESMTPS id 062BB3D5AF
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 20:44:16 +0200 (CEST)
Received: by mail-qt1-x83c.google.com with SMTP id 97sf12572354qtb.16
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 11:44:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560278654; cv=pass;
        d=google.com; s=arc-20160816;
        b=Knqbw7W6Zvtdrsl8zHaQghzPGBcO1z6xRrA1TwLvK2RNivxOM+fuaYrJDCL7q5I8N6
         M9+FL2zMq8rUpOpRlTdl1kEJYUvI7Sjvf5JruV/nyGagow/60WCjZLRMT4IcYJqaBdeZ
         gjTLkVJo1jck6Kvf9+G6s+o2Y6MFHr08ITUTEPKn/nq5SxLLxrhBiJe33obNOQ2wrT6o
         ThSHJt0gOh9X/5UzBMd5Fi13nWW3c5J+t5wuaZgmGO57UWU8pFkLNbpARsPM8isZJCUQ
         S1lWRz1wpECj9Fk74vtBrkhfIAi0HHLkZlLS/DOfQ9JP87JF0EjHIOZuTuzeDM881tVs
         wnbg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=2bWmTDhwod+sHKhBMr41YeVKInricHi+eIdTIVD9ADs=;
        b=wGx0X+9yNypzpD6w9GgHj69DRxY7+iq/1T4hk4T6lxeUMBDUJZY85WsiIESfG+kjg9
         qGM6/ZTXXgtqXNy1ZPaYK7K7Bh+/NIa/b/8HEM/R6KHpCn7Gs94BxoHUU3b1dMwM5tQc
         xBZdptLmHk70R5P4vMN+Dcc0jLbm7TUCqE4IqUokmXZqgQ1WEBQLhDSHkDDkZBqDPW11
         iwmDZHy+vrO5gPJN+ju7ItBM1UyFcCxymrNV0u7SQSAx3LpddXKRUITDp5+DbPnHXzbh
         mcoxSccaq7V4B9nEpU8Ts6m8TCmMHAEC4jw8su0HfDItR9I2uGWv+apDTB+tFytGHK3b
         gylA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=la5SzD5E;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2bWmTDhwod+sHKhBMr41YeVKInricHi+eIdTIVD9ADs=;
        b=Nmm8kl6kkrVgTFL/EtoXWq9IwZfJ1U07upi91N6DaJU6oaEFOAjnHmvWPt95JOlIDs
         vFY85bKG1FaqefgBtUojgg+jJFh0yjzeuitqSjFZA4+mrj0j21LuT6uJwcMCJsKsp8JS
         NLcBSULzvfz9YQ6po8hFmt3nIMyxAcd26yMn7tHfTkJf9+Dua67niKvO7xenw0ksJmzK
         4owBkVohvnx99n4i7QIwa6lLnKVikTtlE2ggg2na2P55EC2eXKvW10uhEpVuGLXlHuyW
         DkB6zFg1w8kmK5EjGq2oyn/Zxi9JWWHOVi9KaWsM7f6br1Q/oEyP5rwljasSIOJT/Xw8
         M+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=2bWmTDhwod+sHKhBMr41YeVKInricHi+eIdTIVD9ADs=;
        b=Kfo5BhRkaRdm34Hprt1kGtJhSBXafFlZB8q78ltq7O9SxOjjTEcWgHakdjBpKoVpgj
         hnzbWKf+Z8Y1hCAxaaGolBwEPbnMV4QwKl5G9VIsb2BW1vsDUGHgUf5jIuvtlzXuscsd
         0a8Q5pMGO3nzauNUBjxUKOLZTuSoQpIuwdAMUIQ8n5ctid8ObtavZpDch9G5c9JvQHKo
         7VbVkPO6Gdc7Eey/M/ZsIy5jAApZbKqBBMYY8gIdjPfl1YKxtJIkClnECeV4hR+tfZqc
         nOJ0lLAuuiSN93PVoIknYDM44hqds/7ETfZy3DVW3dfhxseL3FcwwwFJgP24EiD7h3HR
         XsXQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVlJo21il5Mt/tN1lMb5SwwWqCM0NkNkdIQKvh+KzpzP4iuB/Oo
	Hlx0BjzcZIKG/1CvKeZyGUM=
X-Google-Smtp-Source: APXvYqx1nNcMp9zUYksmr0DzTz0DuhUmmOsfkQUzorwlm1rLf1Q2M8iRB4AvHdGQfvdCtxIrSzn5VA==
X-Received: by 2002:a37:b8c:: with SMTP id 134mr29990225qkl.160.1560278654736;
        Tue, 11 Jun 2019 11:44:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aed:3a68:: with SMTP id n95ls2497953qte.10.gmail; Tue, 11
 Jun 2019 11:44:14 -0700 (PDT)
X-Received: by 2002:aed:3747:: with SMTP id i65mr17771545qtb.166.1560278654371;
        Tue, 11 Jun 2019 11:44:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560278654; cv=none;
        d=google.com; s=arc-20160816;
        b=R7AQbuhMr0stSAYmaZV4X8aRdlMlcNMMq19Qp/gNakM+75hH6PAAl+khjcrD/bReQ9
         FwrTWhHhrok1OwkIcg6I79WhJMX2vTkD+7wIR5qM21YYz3hhnw0GWZRv5SPiZ7U5iDLh
         T7HPGGt5GWsxT4i3gVnq8OpY9omNrHcrIa3EkvSFw2iIxyik65wYcPHrAE/ThggLfjJS
         gry5iOheZgIbjWHwl6+YLraZwB+B+GGbnZpUn4WfxuH0sduvZfkZ+5qeAVvsofcR7yrN
         ugTqA9rNCfgr71HL/EOlB7J/oyFfgylGBaDFmqI6N0T5JAP1zMdt6YXTaqLni2Rrr2Fa
         ofKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=JuudPYalfzeKFC3FuShPNWutc8VNxTwDquAUCzTDNmA=;
        b=fUPcjXk1GMm/tsLw2cl3g4ruWascLKQuSNE8JcYbQGZ6nbzhF1oggYBDkfyedGkGCL
         qvrWMVkjvb9igNSrxURyNZxbFWSl2GslgfYG3LWlJwD/mTuf033szqyTPodDK4aYfJLX
         0jf1ECun42mGBQmEgSTZVa5cBuk5atzbxb2soG2yedUJ7nLPB+qHcA3N2B5OjvB3xhWS
         ahJn9DhrAoWzXm0fLApAXiP2sDVFUNjZH4Yb+S5deEL0hSqDjoCfKHFbhigPOqLXT40Z
         BHGnsAygpd4iy7I8AMl62nCMWggxvm01xzdXdnx5THNdO+AtOMreA1F9BW0DpM4VF5TC
         UAVA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=la5SzD5E;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-18.smtp.github.com (out-18.smtp.github.com. [192.30.252.201])
        by gmr-mx.google.com with ESMTPS id t74si16259qka.4.2019.06.11.11.44.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 11:44:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) client-ip=192.30.252.201;
Date: Tue, 11 Jun 2019 11:44:14 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/0c3e5e-e0de70@github.com>
Subject: [siemens/jailhouse] f7604e: x86: vtd: Use proper MMIO_ERROR instead
 of -1
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=la5SzD5E;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.201 as
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
  Commit: f7604e0b4beda5985aceebe50228c3e14abe4d0b
      https://github.com/siemens/jailhouse/commit/f7604e0b4beda5985aceebe50228c3e14abe4d0b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-06-06 (Thu, 06 Jun 2019)

  Changed paths:
    M hypervisor/arch/x86/vtd.c

  Log Message:
  -----------
  x86: vtd: Use proper MMIO_ERROR instead of -1

No functional change as the value stays the same.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d07b0dcba4837e2f5cc9799d777a32b1ab5f7936
      https://github.com/siemens/jailhouse/commit/d07b0dcba4837e2f5cc9799d777a32b1ab5f7936
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2019-06-07 (Fri, 07 Jun 2019)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: fix IVDM memory region definition

Second parameter to MemRegion must be its end (inclusive).

Fixes: 5fe206927c05 ("tools: Implement ACPI IVRS table parser")
Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 8c5b95c43a8c41a2f648a8d3b0b95533916cca17
      https://github.com/siemens/jailhouse/commit/8c5b95c43a8c41a2f648a8d3b0b95533916cca17
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-07 (Fri, 07 Jun 2019)

  Changed paths:
    M hypervisor/arch/x86/include/asm/mmio.h
    M hypervisor/arch/x86/mmio.c
    M hypervisor/arch/x86/vcpu.c
    M inmates/tests/x86/mmio-access-32.c
    M inmates/tests/x86/mmio-access.c

  Log Message:
  -----------
  x86: mmio: fix accidental clears of bits in registers

We trap certain MMIO accesses and need to emulate their access.

On x86, a 32-bit read will clear bits 32-63 of a register.

Inconsistently, on x86, 16-bit and 8-bit reads must not clear high bits.
Jailhouse erroneously cleared those bits. Prevent this by applying a
preserved mask that keeps bits alive.

Add tests that check correct behaviour.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
[Jan: dropped redundant EXPECT_EQUAL]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a39be9c3499f51a05dedf5b8612cee42f82db659
      https://github.com/siemens/jailhouse/commit/a39be9c3499f51a05dedf5b8612cee42f82db659
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-07 (Fri, 07 Jun 2019)

  Changed paths:
    M hypervisor/arch/x86/mmio.c

  Log Message:
  -----------
  x86: mmio: move flags to struct parse_context

We can easier pass them around if flags are stored in struct
parse_context.

Just a preparation, no functional change so far.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 96157677dfbb37cc112e4384bbd4c585f9d98af6
      https://github.com/siemens/jailhouse/commit/96157677dfbb37cc112e4384bbd4c585f9d98af6
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-07 (Fri, 07 Jun 2019)

  Changed paths:
    M hypervisor/arch/x86/include/asm/processor.h
    M hypervisor/arch/x86/mmio.c
    M inmates/tests/x86/mmio-access-32.c
    M inmates/tests/x86/mmio-access.c

  Log Message:
  -----------
  x86: mmio: add support for 0x66 operand prefix

mov (%rax), %ax is a 16-bit data MOV_FROM_MEM that will emit
0x66 0x8b 0x00.

0x66 is the operand-size override prefix which we currently do not support.

We should support it, as we can find this opcode, for example, for some
mmconfig space access from Linux (e.g., pci_generic_config_read).

This also adds appropriate mmio-access tests.

Tested in QEMU virtual target.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
[Jan: dropped redundant EXPECT_EQUAL, adjusted ebx->rax addressing, tuned comment]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 6e27d3af3557c8d1bca5423aee32e828cca567c0
      https://github.com/siemens/jailhouse/commit/6e27d3af3557c8d1bca5423aee32e828cca567c0
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-06-10 (Mon, 10 Jun 2019)

  Changed paths:
    M hypervisor/arch/arm-common/smccc.c

  Log Message:
  -----------
  arm: Account for non-compliant PSCI_VERSION return codes

U-Boot returns PSCI_NOT_SUPPORTED, rather than the implemented 0.2. This
is practically harmless as the succeeding PSCI 1.0 call will then fail,
but it is cleaner to filter out all negative return codes.

Fixes: ea924a3fec98 ("arm64: Initialise SMCCC backend")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Tested-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>


  Commit: 7c0d292ba15aeaea482be984f9082143fd2bb275
      https://github.com/siemens/jailhouse/commit/7c0d292ba15aeaea482be984f9082143fd2bb275
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-06-10 (Mon, 10 Jun 2019)

  Changed paths:
    M configs/arm/orangepi0.c

  Log Message:
  -----------
  configs: orangepi0: Keep hypervisor away from "secure" memory

U-Boot places its PSCI EL3 code at 0x4ffbb000, and Jailhouse so far
overwrote this during enabling - because it was not secured. This
slipped through widely unnoticed as long as no one tried physical
CPU offline/online after Jailhouse ran. But since we implemented Spectre
mitigation, we started to query the firmware - and crashed. Avoid this
by keeping some safe gap to the firmware, reducing the hypervisor memory
by 320K.

Fixes: MiniDebConf 2019 live demo
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 6ca605d1fd3d6d16cf89fed0812305f81bde8d7d
      https://github.com/siemens/jailhouse/commit/6ca605d1fd3d6d16cf89fed0812305f81bde8d7d
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-10 (Mon, 10 Jun 2019)

  Changed paths:
    M inmates/tests/x86/mmio-access.c

  Log Message:
  -----------
  inmates: x86: mmio: fix data width of test

The sequence 67 48 a1 f8 1f 10 00 is "addr32 mov 0x101ff8, %rax".

In fact, data is accessed 64-bit wide, and not 32-bit wide as the
comment stated, and as the comparison expected.

0x67 only restricts the absolute address operand, and not the data
width.

Let's also use the mnemonic instead of the binary representation.

Cc: Henning Schild <henning.schild@siemens.com>
Fixes: 23f745cbe19089d ("x86: mmio: Skip over address size prefix found in x32 code")
Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9c633193fd583e884a0e3e4af9c16b4e469d7806
      https://github.com/siemens/jailhouse/commit/9c633193fd583e884a0e3e4af9c16b4e469d7806
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-06-11 (Tue, 11 Jun 2019)

  Changed paths:
    M hypervisor/control.c

  Log Message:
  -----------
  core: Reset PCI devices on CELL_SET_LOADABLE

This ensures two things: Physical devices active prior to
CELL_SET_LOADABLE will be silenced (no more DMA) and cannot conflict
with the load operation anymore. And ivshmem devices can send the
information about the reset to their peer earlier than during a later
CELL_START-reset.

This comes at the price of resetting the devices again on CELL_START.
Could be optimized, but not worth it at this point.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e0de703fa9f3f0f5dd50f00b8484778ec0c9c158
      https://github.com/siemens/jailhouse/commit/e0de703fa9f3f0f5dd50f00b8484778ec0c9c158
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-06-11 (Tue, 11 Jun 2019)

  Changed paths:
    M hypervisor/arch/x86/vtd.c

  Log Message:
  -----------
  x86: Clarify why we call arch_ivshmem_update_msix on vtd_emulate_inv_int

No functional change, just documenting the possibly non-obvious.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/0c3e5eb67e17...e0de703fa9f3

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/0c3e5e-e0de70%40github.com.
For more options, visit https://groups.google.com/d/optout.
