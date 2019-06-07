Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB4E45HTQKGQELCHOSTQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83c.google.com (mail-qt1-x83c.google.com [IPv6:2607:f8b0:4864:20::83c])
	by mail.lfdr.de (Postfix) with ESMTPS id 662813894F
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2019 13:45:53 +0200 (CEST)
Received: by mail-qt1-x83c.google.com with SMTP id c48sf1580509qta.19
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 Jun 2019 04:45:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559907952; cv=pass;
        d=google.com; s=arc-20160816;
        b=Mt4c/iDqtS0SqoIM76Gim0sQ65PmUdkXmb/gm/c8U7xSoze1AfMfEapeKky7RpbhsA
         b7ytpsn1OauKg4vC1jpixTgRri8YBvX7hFUi5OYKzT5hRwNTk4nq6u/MG2NYnJdAjvMF
         yICkQgXLMlTxP663cucXbTufRTSpmpgshiSVS17JteRoz/rE+wzBXN1RRScygKNRmzYN
         kZFMpgClpMASRa+2ifF9WwRfa4z6uHCeOjRLdlNPPaeVq4iCclFCZ+f47YMo/bkO14Dr
         7n5M4P3o5f6GhYe0CM1bynjVKTnnBkIMcEbGUt5PP094Eb5gWf6qwjrOlIkZKWBI6+dR
         Y+og==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=WMxCembfQpEj2xKLhTBH2xZiGbuYhwPEHbWrtiGNBFU=;
        b=zlTy0oF2Yhovs+LDVFyEFOdo7uRolQItNsUkolbG16XyVavkkMAzjhtgUSbxdnk1oO
         SR2yIpgHcdKEFxBF6sXlHLQDRHRhOU58amGZ6P/zGbQsr+s/hKEkiLru3nJyrpvulCgV
         YNjqHCiBVAAQfE1Xy81w2zikiWgsBGsUHk8sC46DLUuTe+qYNUmsKgy02WTbr+w4NJwv
         0TMJCqTwfCj3AOFG4vnmeiKqGVTjXYMhHpVXwgach16CBHXJGM8W4Vvt6ctFLA+u1/+O
         FQDxEr8sIGhna9ndviwKPjMiBOofe81D0fKAtF00jkaoWzxRNY/LNNN3YdFTDjLx3n8B
         klJA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="cqw5/oYe";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WMxCembfQpEj2xKLhTBH2xZiGbuYhwPEHbWrtiGNBFU=;
        b=lCITJqfQvXv1zB9zxcmsJZcC6roeBkkBUglPqjGRQouBKhI5WXTYEVrPKAvXk1/Nf+
         5Mo4f1O9IvBJ68zIvaFR1vT4VLu0BDEjnQxNY3mub/jnm8Jrn9L/NWlZFM1763TQxv8V
         nsO9DPcCehi+981d5AGQA7ZZwjVl16V0nSkD4j6iu9/C1BZRdei6Fn0VnCocwJy4sXDN
         WDQ/nftPRrqvg3VNu2PI3C4GWa25pDm66+Hiki5WdFs2Y8b7lMAFd2kKyFHeFy4eb8Un
         WrmeTHS7U2do+cFq2n6Yj8WlCsOaqAEu0F45Y0ce/emc+UjT65sHbL9QqczdnOaBwggQ
         kcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WMxCembfQpEj2xKLhTBH2xZiGbuYhwPEHbWrtiGNBFU=;
        b=rZzobK48jHg/bqCaPSYjkG8k4R76qh8I1QqpvNJTcsG8KoXJqhDXeyVhS1GHxJeKdj
         VP6kb8gYhaCbrdJUsFWn5qGMC1FyF9DV+/7Jekkgxwb6obZwE4weN2URhdLpWdDhrICA
         cvqopgtvRB5At2FNc7PN0SKDbx6656wjnxdbHQyYDE8yOpV7QaNaXwn/i9YfENjZHprN
         ULyFSOGUv/2dJc4pXKDuC+WomZRf4KspCBdFtgI5UpfO417mBYzeWoag2fjLtgQxzs3L
         r1cQg2qUhnyIJ2tvog51f3zki/DP0ie9zRlgyfYih31WTT4TmbaotaHeDDz4UxYUdDuL
         VvgQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUxVpbEinTMM/tTmT8a3SIpiq19/cLUeZaXIL6w/7UWZ53Ro0XX
	ViYP+QKVoWhzgKlM60HjFTA=
X-Google-Smtp-Source: APXvYqxV5p6EfjFSZUNjO0jZgqE1VJrYvShjYXhyIVeChZh5Q4rTnxcewMfy81HJuZeZHsGD9AOcIg==
X-Received: by 2002:a0c:fad2:: with SMTP id p18mr3797895qvo.243.1559907952542;
        Fri, 07 Jun 2019 04:45:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:8e43:: with SMTP id q64ls2508572qkd.1.gmail; Fri, 07 Jun
 2019 04:45:52 -0700 (PDT)
X-Received: by 2002:a37:a413:: with SMTP id n19mr41347191qke.98.1559907952264;
        Fri, 07 Jun 2019 04:45:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559907952; cv=none;
        d=google.com; s=arc-20160816;
        b=OF6nneTf7e4ujB2z3E7pu/YzlvXgvhr5zQxLp4jXPYAs8D14f98R12WX2TIy0Qf91l
         3FbQKMJIrIyYSlRmlZ5v59kxawTCpygs0vyseqsthcIIB/D+oBYE2nCluhajGNCE8wqC
         Xyn0d7IFKgKTznxFhAmfgv2PU+ZKoNOZeXm4RKbqyITKbe3SxwQvijsOm8pOl/PKT/SB
         YnNcMDlkI0K+kvEVl5ub5f9kfMwxf1DvyThWr6p1/5pSzVlqsCSJiIvxssdB+vSHJBMb
         7EslQHJCju1zRuW54a21rzQhIccClIksroE2k6RlrjYHcWIkAziMx/+xupM2j/GUhvx2
         S7VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=np2OlUmHJmeXFKRU8JcnawHtD9mTxWBc1SFqDnDSD0c=;
        b=tKAQhpmrIj5CP81l1plF+MRQwFwXjk9sbTDdYMffffSVeSMCx3a8Pwi4H4XAQpoOJ4
         Zb833hlWis7imcgbm5RKWo/MKr09+9J12My+ckJZrbN4Bpltkef9GsGx3e5P8rq15Qwq
         sJUk0GVHqPK+EQpj1XnvLAHp8iKPbGUKL3jZW028B0S+tX/42TVKke3nrPOhH50pkE39
         OY61sLwBKYp91u8Y7SsHEfDIgU62rVjQUGYGI0nrxqXSBVKBHjOJ/MxCutg54BFuPp69
         gyVwIekRrkpJQARwS0wgsWP7rLgXxFdICVcfkiI2ziPYmeCiNtZYqQCN5BwcBaqV7C05
         P/EQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="cqw5/oYe";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-20.smtp.github.com (out-20.smtp.github.com. [192.30.252.203])
        by gmr-mx.google.com with ESMTPS id m55si79415qtm.0.2019.06.07.04.45.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 04:45:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) client-ip=192.30.252.203;
Date: Fri, 07 Jun 2019 04:45:52 -0700
From: Ralf Ramsauer <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/d07b0d-961576@github.com>
Subject: [siemens/jailhouse] 8c5b95: x86: mmio: fix accidental clears of bits
 in registers
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b="cqw5/oYe";
       spf=pass (google.com: domain of noreply@github.com designates
 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
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


Compare: https://github.com/siemens/jailhouse/compare/d07b0dcba483...96157677dfbb

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/d07b0d-961576%40github.com.
For more options, visit https://groups.google.com/d/optout.
