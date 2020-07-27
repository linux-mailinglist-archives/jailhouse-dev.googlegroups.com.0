Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBQNG7L4AKGQE2GVX2BI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 0567422E7F1
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jul 2020 10:41:38 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id d6sf2084733wrv.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jul 2020 01:41:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595839297; cv=pass;
        d=google.com; s=arc-20160816;
        b=rJ34pW2kSmkWjJx41FGY8JWXw+lfj4j9dFJzAQJ5NPrHQX+Ftx2LgH3gLBSPmXrYv9
         DU6fEoiZwxX6/vJ3BaDx8+rid/g08ts2q/dUmFRGeMg6Ewd6c4sg43yMJqA0iuDQmo5D
         2451MT+7bRGfusr3jFI7IhwvNTo5giPFUo0o7XLwT+h2sCHyx2KH8Q5GzvPoQsE/Dnl+
         cjWnH2jQH0Ws2uoBoa5Mi3vS+bdJTaUhLJLu2qyuTery03FXg5npTIFNF7YtEO+f38ba
         AtUmUaMkc0O3Rn2r8wIdFQMUmUnKzL6WqhsimOcfmcsYtlr6KGFN3rkjJW92bsesHu6I
         qYxg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=vi7Av3QNkzb2t5Vas5er6haqcSNuMUDgnKCfdDJ5GQs=;
        b=SooUAdI7z4Cgt548SwSM+8EKCHhVpHswU7T0aV/TBAD+QZNwb57YlzLRysn2vLIeZm
         IJ6rPZzDaIqlqF9OhVcPB18VoFNMj0lAULXjLY+YU8NrzQIIVjgN4I9e49TfXOkWsijA
         x76FY7enDOrxRGgER05+bsaFsX6uzXmBynE7FX0U30W9b8DS2YWf6VWXGSE/ZUaWXXam
         XX7F3lq+yXr8txr5FpZFsOJDlo9ZWYwujg02AeFxWyOLwAHGbozX+2Pu2sbQY+QWZx52
         ujbr/sF2tf+oGmqDCwpBqfnC5WGNykx55rAagIamNiwkvXEvjVCHTQ49lr3FQ/Acq//F
         tz3Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=VA4iki4M;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vi7Av3QNkzb2t5Vas5er6haqcSNuMUDgnKCfdDJ5GQs=;
        b=Xb9zIst13RHZvjfqVf415UBsi3wHb9gjMNALmg4rdFRD19BEu+eYj1mwXPXGFSAYIW
         cu5JhpQXNYDjy5X+nvuUxkdwYnQN5jwet9FkdG0ge2x1cVFNcE7TB9wpZVhweUgokcwU
         DrdI+RbQVt/HqHXsmKPuejl6yv/uWI0sq63HRY5FKpXnd7xB++Hgw4y9DqPUooefHg7m
         4cDk//RDE5ckwivnFBG14PggTfeUwYCuFKKxQedcqGpPxp79kbyjKi5o3SHCsRlnyIcY
         GfrB6TKy2hWUCQlKKhZV2bgP6V2hC0WX4ulF5gebbfXBlSJ4IkoCojMQOTLU+2E9haeX
         UXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vi7Av3QNkzb2t5Vas5er6haqcSNuMUDgnKCfdDJ5GQs=;
        b=GZYXu7s8aZHdqbHz9SB0126rPlx06KfZtz2j76d34rPg4fTF9fTxQOKxnp/WvHbwKy
         OuNTURz6QMak9Aceb04sXlWfo9OtyGIOHDcvrNjXEv4VIpy0SjeUqFhSigQbctM12ld4
         owg0MMfCVNhfcM7KMH0Aq9fCgM5JRVxj1pGjZJwjrOHEoG7Q1rB1Hh1nGx6eTc/x9WY2
         9vlpholzlp6cFZ/w7ZHx8uNcwynkJ0+0kNNDWY+JRZRVEeb2quK1DiyN3aLTu+1lydH2
         KFdFaXmTjkqvpg4dOoPZ1hJZtv+eI6KZ7HzERCE++fayp0xDMpmT66GvuJ9dFtHXsQNK
         XoMQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530H6Y4uPd/TZbUb2ZGAM1Wq9ifmtdpCJTXdjdrIkmeHMq4mGXbM
	6WFPbR8MT5YWuTw/dSkiaRM=
X-Google-Smtp-Source: ABdhPJzhQt/rjnK2DC59xfjnlRFxp7CUQ34ZWMHPQLA7g9jGgCXUC0f7AiqsweJNDs0hB2Ad25C4nA==
X-Received: by 2002:adf:9bdd:: with SMTP id e29mr20812951wrc.394.1595839297734;
        Mon, 27 Jul 2020 01:41:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:81f4:: with SMTP id 107ls7288955wra.2.gmail; Mon, 27 Jul
 2020 01:41:37 -0700 (PDT)
X-Received: by 2002:a5d:4d8b:: with SMTP id b11mr19475124wru.341.1595839297016;
        Mon, 27 Jul 2020 01:41:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595839297; cv=none;
        d=google.com; s=arc-20160816;
        b=htjfinnzx01tpnlyMty2rm6vNdrESVYE7cC6ZiOR6ICketK+QjeZO3/WpKXc0+4dhK
         Cwo/+8eJoSLqBqrkm0lCpLmtDB0e7JfoZY+lEFoqBQP1+OE9uyQa3lAcoZGmMdUKqcZ+
         gwRhgsvHZG3mliU/PS/amUlZMQDSk9gpZVmTQXdvDNSkSSerEJ32VOTwvGZ6T7gtdydb
         tLtFjEE990Y1U/lvtguKJKRX/wGd/B2ECC37x5XCCRmCuvNjb/4al1eMlKAc+XYsK6cl
         3DVDK3oDbXB3CGjnSCU1o/f3+b0ntpZyyD5C17SCKFjbU4ewg+wm5KLbLuUoVBeozQlb
         Kukw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=RtwSFeQXTL0esl01/irVVUeGJ0yNQTy1K6UwPCyqc5k=;
        b=yeRX06VJGfqReZ+dUve9NesllkfUt4Em1rgXsvmLCzFVkDjKp+l2cJzBQI3uYj6Eyv
         eAgg6S67VFJQzpmKFByZpxqXNO9sSjxaUkANUXwdKwHbsyvBFdD1eG+MR+vjAJiHaddM
         WoZ+1xffPCz3+awb9m5MJlQWoipsYxGKYKw4+flhwg1DHrWitkN9XQN00wCEwRFk7tM9
         v15dYi8bqOSnCXyB3pXIsc7a0RjFksjA7Q744Y6N0W2Ie/3te5yG0OlQ7BcUySF2Y5K5
         LY3k0698HcZbubKNaoLsmG2zYKmX70BFKr96pwDqcKOieEqKwbGFouGijPyFgpa6TGTX
         f52Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=VA4iki4M;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-22.smtp.github.com (out-22.smtp.github.com. [192.30.252.205])
        by gmr-mx.google.com with ESMTPS id i17si427569wrw.4.2020.07.27.01.41.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jul 2020 01:41:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) client-ip=192.30.252.205;
Received: from github-lowworker-fb56993.ac4-iad.github.net (github-lowworker-fb56993.ac4-iad.github.net [10.52.19.31])
	by smtp.github.com (Postfix) with ESMTP id 391E9560E1A
	for <jailhouse-dev@googlegroups.com>; Mon, 27 Jul 2020 01:41:36 -0700 (PDT)
Date: Mon, 27 Jul 2020 01:41:36 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/wip/arm64-zero-exits/cb6114-e0ef82@github.com>
Subject: [siemens/jailhouse] 6bc020: arm-common: Reorder gicv2_cpu_init
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=VA4iki4M;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.205 as
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

  Branch: refs/heads/wip/arm64-zero-exits
  Home:   https://github.com/siemens/jailhouse
  Commit: 6bc020d8545af4aebc64347c81b692d021f0b0d3
      https://github.com/siemens/jailhouse/commit/6bc020d8545af4aebc64347c81b692d021f0b0d3
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-07-27 (Mon, 27 Jul 2020)

  Changed paths:
    M hypervisor/arch/arm-common/gic-v2.c

  Log Message:
  -----------
  arm-common: Reorder gicv2_cpu_init

This pulls CPU ID validation and gicv2_target_cpu_map setup to the
beginning of gicv2_cpu_init so that we can fail early if needed, before
any changes to the hardware configuration are made. This will also help
when introducing SDEI-based management interrupts.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 334288ca210b598161bcbe1da0a9b5eca6ad6125
      https://github.com/siemens/jailhouse/commit/334288ca210b598161bcbe1da0a9b5eca6ad6125
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-07-27 (Mon, 27 Jul 2020)

  Changed paths:
    M hypervisor/arch/arm-common/smccc.c
    M hypervisor/arch/arm/include/asm/smc.h
    M hypervisor/arch/arm64/include/asm/smc.h

  Log Message:
  -----------
  arm/arm64: Expand return type of smc helpers to long

This allows to evaluate all 64 bits on arm64. Will be needed for SDEI.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 3cccdb0bd07f512b481ab5805e104b5ca8c5d85a
      https://github.com/siemens/jailhouse/commit/3cccdb0bd07f512b481ab5805e104b5ca8c5d85a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-07-27 (Mon, 27 Jul 2020)

  Changed paths:
    M hypervisor/arch/arm/include/asm/smc.h
    M hypervisor/arch/arm64/include/asm/smc.h

  Log Message:
  -----------
  arm/arm64: Add further smc helpers

Will be used for SDEI. Actually not on ARM, but we add the smc_arg2 to
please the build and avoid surprises once it is used for real.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 23087472c2b4b6411920a8d6c1f51614d6a725fe
      https://github.com/siemens/jailhouse/commit/23087472c2b4b6411920a8d6c1f51614d6a725fe
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-07-27 (Mon, 27 Jul 2020)

  Changed paths:
    M hypervisor/arch/arm64/setup.c

  Log Message:
  -----------
  arm64: Reorder arch_cpu_init

This will allow to modify the hcr value based on the result of
arm_cpu_init when SDEI is in play.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e0ef829c85895dc6387d5ea11b08aa65a456255f
      https://github.com/siemens/jailhouse/commit/e0ef829c85895dc6387d5ea11b08aa65a456255f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-07-27 (Mon, 27 Jul 2020)

  Changed paths:
    M hypervisor/arch/arm-common/control.c
    M hypervisor/arch/arm-common/gic-v2.c
    M hypervisor/arch/arm-common/gic-v3.c
    M hypervisor/arch/arm-common/include/asm/percpu.h
    M hypervisor/arch/arm-common/include/asm/smccc.h
    M hypervisor/arch/arm-common/irqchip.c
    M hypervisor/arch/arm-common/setup.c
    M hypervisor/arch/arm-common/smccc.c
    M hypervisor/arch/arm64/asm-defines.c
    M hypervisor/arch/arm64/entry.S
    M hypervisor/arch/arm64/setup.c
    M hypervisor/arch/arm64/traps.c

  Log Message:
  -----------
  arm64: SDEI prototype

to-dos:
 - gic pass-through logic needs review
 - double-check if invalidating vtcr_el2 is safe


Compare: https://github.com/siemens/jailhouse/compare/cb6114f2f608...e0ef829c8589

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/wip/arm64-zero-exits/cb6114-e0ef82%40github.com.
