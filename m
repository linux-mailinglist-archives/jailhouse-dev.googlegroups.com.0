Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB26LT7ZAKGQE76ZPKIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103a.google.com (mail-pj1-x103a.google.com [IPv6:2607:f8b0:4864:20::103a])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A92C15FE78
	for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 13:37:01 +0100 (CET)
Received: by mail-pj1-x103a.google.com with SMTP id 14sf7836258pjo.3
        for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 04:37:01 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581770219; cv=pass;
        d=google.com; s=arc-20160816;
        b=xHHLX9PSt+r+uHOOB3QxCH7q9IQxs6iNbjh90xpdwh+fwHjqF6FDAa4JEv6w+PpscR
         FF2cGRMWnXJfE3OKfuAibN9BGHt5Qm6nSodUJmERns3/05QPTO9zAHbvl12NhqnwneLl
         po0VOZMQDos5ualaBiu1lnfW3GePBFf4R8K4w/o4bTc3DdVXo9IKvhZ1TDg543MZ+oz1
         pBgbEtD0BCvY0ayAMOaPg1BGcLmiEIE+q2ogpWMxjzxufM++wOVS5aXNRmNNiBEltQH/
         CaaQMAuW31m88aCXFEuSyZfv5LHDm4nQ63fn/nXub6ZteNiHzKCcWMab0ScygyNZYXA7
         FL0g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=ZLUS0F73U3PnZAfueXr4Xa32fhy58Tv0IZqYVP2LYBY=;
        b=j88EeLMT/uTkP4SNdYWlaIGCiWpOmGEkjlDUTIQPkiixDbYNpZXKkDm5etWFvVEj0v
         RytfC0t3vTJQ7qasPK3dfgSkQ6oXIM4ZM7YkNYp/u2Jehn/wa6yqBRYD4TR224cuy3XS
         KauwFveDSmu3TIPlbU6dScnOfTTGiIsOMZIGKRIW9Mi2Dj5PyaMpNbG7NefVgKBgYHeb
         20HUC/m0MkVeWk/YC/KaqYy8jhDMwugGdagsTTY0A+KPGq9Ei6Ga+iQRsYmZkEiNv2xT
         KkyUkFxWDc8SxrV/I74lZ95niOlUwm7lL6TJ1UGMSGTy9Qjb+FXmpGZXyOotFXVA/udS
         0jpA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=vHVQkdJk;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.193 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ZLUS0F73U3PnZAfueXr4Xa32fhy58Tv0IZqYVP2LYBY=;
        b=tn5qq3Wm34JikWUoSJDc/FZ8HMsrlY8XwXbX0AaLamwKSRpKEo2+DsEVJsfw0lMLvC
         mWLtd1GYrz1/UymThGPPqjX+Pz3V128HhBr8gkuqfHa2WU0QFClAmGt1sRS++vE222DU
         W453h87sZGYyLvFE2a17kIokg6oPXJo47iD/eWkonVqYSBIfwTG9CXSJNEHq0lrUA9f0
         4EvmexZcHAEXVu7v02c0lttQvgpcRXlJNymq8nJxKTzZrc9gYU/UqbE6wfZyTxYh/5iN
         pUjWOmBLSqqfQhvVsIr1D8/eWclzkLGhKwf51gkYRzs8cZZrGB3imR/nEAb0YxrMilNx
         SSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ZLUS0F73U3PnZAfueXr4Xa32fhy58Tv0IZqYVP2LYBY=;
        b=fV11Dx/E083OPKdV5UbkTBpbgjaNaUyv0bvXuQ653xQh9+Cp95DVEXx0G9gWipjDZi
         zK1l55b2oWU+2W0rHGRWdu1HMxAcVfcGiGWvkhUzOk5fsTzFTkmGx6L+XhIgIyomvJV+
         3LY6xF2khu7uRc3fT1nEtG9oK2OfRETszzRg0LDJuMJkxDBcHOYy0mGZaXdMy3y3M72a
         pD6TvaWPU74KE0q+AK5TXseKDU7XEG133dM9QalBQtjmhu1+xFf5w+nLAj2Q1UNQJ1Kp
         rWB8bvY5BBaVXqFXtSsNdMYUulX7yEVFrs9tjF+7KBRv5AkhI8VJfYAxCnCFyoc7jloF
         2Llg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAURQ6cUpcvC/c3aqn491HOf+PjF7cdtq/qoGyjZtEVxn2yevuRj
	7iTDVgsB/IFO5o0SUHPYIgE=
X-Google-Smtp-Source: APXvYqx1TYuENrzTpgXaYsWnsL5p2hk5eXmqGELHHnHCimh7mgBF9Q4PVuIAT3IYURc7/TD4TUrlhA==
X-Received: by 2002:a63:8b41:: with SMTP id j62mr8104517pge.2.1581770219706;
        Sat, 15 Feb 2020 04:36:59 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a65:679a:: with SMTP id e26ls1903123pgr.5.gmail; Sat, 15 Feb
 2020 04:36:58 -0800 (PST)
X-Received: by 2002:aa7:979a:: with SMTP id o26mr8193855pfp.257.1581770218858;
        Sat, 15 Feb 2020 04:36:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581770218; cv=none;
        d=google.com; s=arc-20160816;
        b=JshSsyfrQdufV0uCA87EQbblCCpKb7CkvW6j5zn4i829d5luSySrWjW9SoXlhAgEoy
         gWKQbckBnQlBvD9X47CbfMvtPsET5g8U2p1uIn95o5BSBmJDssSctgq/+BoWOjGutI1+
         lJF/qgAbnGzZAtDzSEUNoc9LzVzAdBWPvHpzVB/J6WNLTXNPEfvEvnzcGUHXgo2xBTDl
         HvGCtftApAnS5omcomBDXGDbwyX/QEsccXxKpr9Z7VwpYf4teYDxtq4vWl/L7SpDuipD
         97KeELDM8Il1L4KMgEUAAtAWbYWNCP6Tr6ghiIHB71ilxp/bqYHZydEG3d5b+KRbGiiL
         x3Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=njISEwFsrarQ89NC2HLJxCKHinSsr3DPm2yvqlJZO8E=;
        b=VbV/mCRJLuy56QbGFGUYmOK08VgA9a9zuxqPHvc3xm5ULW4CHMFYINSbegFm2/bRj/
         Iqqz1kLbuOYPZ816zdpLKohD9DicYdpOllU3oG0HDWUReMnlr0KVGpg2ZRiV/UhbWprK
         YEWM0aXSIuMzPg86Xh6bxmvASIOrYBtGp2OzKDMLxJa4mPBwd8Am+T3zf0TzfOsyVDpb
         E4JNn6wxG5KS3zB/H5MlOfcQNF4Kq7EXS+PspI+oaiWQ4CtA3mBztjSZr0SjypWLU9R8
         4cCREJENibcMUB0tZUSSMtMb5SWO4baNrPhnJCQnSQKC02TPsa7WqlcTLFuXebeNQTBb
         L23w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=vHVQkdJk;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.193 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-2.smtp.github.com (out-2.smtp.github.com. [192.30.252.193])
        by gmr-mx.google.com with ESMTPS id d14si496174pfo.4.2020.02.15.04.36.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Feb 2020 04:36:58 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.193 as permitted sender) client-ip=192.30.252.193;
Received: from github-lowworker-6b40fdd.va3-iad.github.net (github-lowworker-6b40fdd.va3-iad.github.net [10.48.16.64])
	by smtp.github.com (Postfix) with ESMTP id 0CB9A1C03CE
	for <jailhouse-dev@googlegroups.com>; Sat, 15 Feb 2020 04:36:58 -0800 (PST)
Date: Sat, 15 Feb 2020 04:36:57 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/wip/riscv/000000-536441@github.com>
Subject: [siemens/jailhouse] 536441: RISC-V cornerstone
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=vHVQkdJk;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.193 as
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

  Branch: refs/heads/wip/riscv
  Home:   https://github.com/siemens/jailhouse
  Commit: 536441a05729b94446ff2a1f1ce0383306ffe822
      https://github.com/siemens/jailhouse/commit/536441a05729b94446ff2a1f1ce0383306ffe822
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-15 (Sat, 15 Feb 2020)

  Changed paths:
    A configs/riscv/qemu-riscv64.c
    A hypervisor/arch/riscv/Kbuild
    A hypervisor/arch/riscv/Makefile
    A hypervisor/arch/riscv/asm-defines.c
    A hypervisor/arch/riscv/control.c
    A hypervisor/arch/riscv/dbg-write.c
    A hypervisor/arch/riscv/entry.S
    A hypervisor/arch/riscv/include/asm/bitops.h
    A hypervisor/arch/riscv/include/asm/cell.h
    A hypervisor/arch/riscv/include/asm/control.h
    A hypervisor/arch/riscv/include/asm/ivshmem.h
    A hypervisor/arch/riscv/include/asm/jailhouse_header.h
    A hypervisor/arch/riscv/include/asm/mmio.h
    A hypervisor/arch/riscv/include/asm/paging.h
    A hypervisor/arch/riscv/include/asm/paging_modes.h
    A hypervisor/arch/riscv/include/asm/percpu.h
    A hypervisor/arch/riscv/include/asm/processor.h
    A hypervisor/arch/riscv/include/asm/sections.h
    A hypervisor/arch/riscv/include/asm/spinlock.h
    A hypervisor/arch/riscv/include/asm/types.h
    A hypervisor/arch/riscv/ivshmem.c
    A hypervisor/arch/riscv/lib.c
    A hypervisor/arch/riscv/paging.c
    A hypervisor/arch/riscv/pci.c
    A hypervisor/arch/riscv/setup.c
    A include/arch/riscv/asm/jailhouse_hypercall.h
    A inmates/demos/riscv/Makefile
    A inmates/lib/riscv/Makefile
    A inmates/tests/riscv/Makefile
    A inmates/tools/riscv/Makefile
    M scripts/include.mk

  Log Message:
  -----------
  RISC-V cornerstone

This allows to build Jailhouse for RISC-V, using QEMU as a first target.
The assembly entry routine can be called and returns a funky error for
now. All the rest are stubs.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/wip/riscv/000000-536441%40github.com.
