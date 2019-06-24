Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBXOWYHUAKGQE7KFGYNQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23c.google.com (mail-oi1-x23c.google.com [IPv6:2607:f8b0:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFEA5020C
	for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Jun 2019 08:19:10 +0200 (CEST)
Received: by mail-oi1-x23c.google.com with SMTP id a198sf4906370oii.15
        for <lists+jailhouse-dev@lfdr.de>; Sun, 23 Jun 2019 23:19:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561357149; cv=pass;
        d=google.com; s=arc-20160816;
        b=jqjtXk59JHNKgqMIMa84sjWQab1CS0YMrGkGNvWmi4S9MicumbYhXH2AwjVFXEbXFs
         W2ICEkHKyE7L9KH1FDPQgxVVjlFTZbNWPxwvPUzgP/ShoX7Nka5GWABLRkwo7X0Y9bae
         2obpIZU7s3tOaNxcnzZGf7lH15Vkha0Iasu+fjB1WfStNP08XEcYb6dfjdAM/xs0rafo
         QwnovYlKN6OcNuITPdMhqRqgbjph6qiH6SVZUIYVhLZQaDkJeGkdS7Z3n3Dw+UZSoGZt
         64w4nEUXSJAlk/Ko1qzu4f6qaY+Sfkxl02A3fzmrDV5AsLigwpMC0+r4dhv5tpVZZGpt
         NqnA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=lflPZS8c2rz+2wB0gHzSbjnaWDlSQ9WCdRTxhhr3J50=;
        b=0xAbnj2Yjr34ou8UVHRpvnA1ZoiFuuBdqjTwmjf/kh1/kPc4ml7mDN4AbqvZgU0Xb0
         8rFvvj6Q2ostUj2DCcuyCbOwRZZk9ipVWh+vk8htixaDoRBxQ5Rv39x/jvY2Uzcnkl15
         Jm8BrSBA071dLXX/SGS4Q0tEZM1Xny9g94NzUNzg+6jIqM5EnnbZxK6HB04vsztzkQf7
         TSsoDeH9oEYuqfgGSML76frTkB4TRXa4V8lCU67XIyRF7iL9QENA/Wpzp93LSl1tOGRH
         o/fG81XwHyV0dlk8QlLXPDYS3ME3ldN1BNIRNMlCQn4xEZz/tFTEhePMfzMWevBBGkwC
         HCgg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="PG+TQy/B";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lflPZS8c2rz+2wB0gHzSbjnaWDlSQ9WCdRTxhhr3J50=;
        b=Vb4xdAcNESr3SucS5Lai1ZgLsKvkoi1AxroPiqdyQua5M0xWu9GMFdkgnMHXyxLSNV
         yos25M1jpigS+vHs+aGhWw5L4JhDfCfMPrxS4589l8nXDtVOV+xE3uOei/ceavL2A568
         F4Aga7oblrQmF8ASdEyqhjsqCE2yGrOBnWy60l5zufiuGmO+R9KSrXtfDoGG1SzaMMpa
         5SS+27QLB5gBnKLlBXC/rHaYzAIbFTi765VucRc3bc1jtBHzXWBPvJ23gzZUmoGUuWqN
         p9NeYShtucOwq7qk17L+z97+eGJmloigJazvkXnsyTtsz3ENdkfhvmIM2hDYM73rLqGt
         2PlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=lflPZS8c2rz+2wB0gHzSbjnaWDlSQ9WCdRTxhhr3J50=;
        b=kkCwa6cQF/Oik5xuYuS7Ln9pkB8M8PdtPIHPr0pdsnkSF/OjDxLoOjVV+sYc8nA8My
         /Hz5+MaFfMUUOoMGD0u7CByyN+SBzEHNASzV76BNdGfDLWTzfimkA0SHMvcfqBhAzlkk
         uhaemQFsP9mh5i7Eyo70SWzdnULYV+wwYWAAvZRQn6AL8aoO3wq2AzDgxBemvlUtzsmz
         qR9CfmjYtmEYTQoitGR3GvoH22pZQS6glAma8Phd4mbG9dcybqfbls6zNnPzZvkgCwYJ
         BxVNlivE4zCdT8Dl5n/4k4htRtlI0We4re/i7ad55hEy+MWO1ijUtXkA/8Rqs5cPFwhu
         Lp+A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUGvqXiO6JCReFE3VKGLeaunkn1Id/e3cs/471qmQXuzwuO0a5I
	mnGF3jZGmRBdpWKu3kU00+4=
X-Google-Smtp-Source: APXvYqwsfjP/2zdbpzzN4M6PhbQaTZMA+tAkKIRXmoC22q8FmA2niCUKTPyFJWlECKiXXO2A1lwY+A==
X-Received: by 2002:aca:a853:: with SMTP id r80mr9901688oie.156.1561357149136;
        Sun, 23 Jun 2019 23:19:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:3cb:: with SMTP id f69ls293338otf.5.gmail; Sun, 23 Jun
 2019 23:19:08 -0700 (PDT)
X-Received: by 2002:a9d:6201:: with SMTP id g1mr26087078otj.195.1561357148855;
        Sun, 23 Jun 2019 23:19:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561357148; cv=none;
        d=google.com; s=arc-20160816;
        b=uAUa+uwwm+5lroYitoDOxeF6giFYQK5pdxbYP4CAywWwRZcolK1LSio4M+w2SW56t9
         qNamTZ2OOdw7Ns1HjxhkXVe9FSO6ozqCdQIVc9dATyIVHoJVI2ruK+4c7T7qD2Rm7ed0
         d+eur+EApAnQLVLc/X/6x4pdHsjn/KrtRF25BAdmQzA9HZjKlmMP1aQAUCK6xiaWbPp1
         Vi7XyxrdXSU2j/WsdqEJv8vvLlPL75eNwVINVWBDnFYnYGQGE2Tj8EstHgIl79TX1o9W
         JgBLvTT0Bmv5mD95lMbVBcMiGxyJHN0AbpHI1nd/ksJD/6uOSaPVXAU7GtppE6oTTWwJ
         z0WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=1++EwpGYfCYTSGR2zkI5cqPbBUeJuF1WPNWJbc63ALE=;
        b=IHntD37YyTPQiGpBWilvi5avCpQdgIgc/rxe4ieqSwWPLflrk7qTtEm1YSzbceSTO2
         WExt6kFSuTY32MJT+yeSNjA7/+bC4RzFoUnQ4sC2130Dqw3lNQ0+PNQGkJTmCLOo52RI
         0DWcFDtAiAN18DWD/88fzcT5iM4qlf23u0hw7AlwzVswi3C9ZSBh8YaVfRFivnYrMPpq
         B10B2/K2u8+h/wOF2NS/i95ailcGlDoArkblZzENi+HvYyh79TunQMMmxF0dhcSC0Dul
         Z44XOJHPEpJ0b8aXAq+WKnVMQKS6JfztbkNmFbXTyc1Z7QvLFJ/WUS6yQsUuEyNJU1qp
         vZhQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="PG+TQy/B";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-23.smtp.github.com (out-23.smtp.github.com. [192.30.252.206])
        by gmr-mx.google.com with ESMTPS id v141si463140oif.2.2019.06.23.23.19.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 Jun 2019 23:19:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) client-ip=192.30.252.206;
Date: Sun, 23 Jun 2019 23:19:08 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/dd6efa-0ecdd0@github.com>
Subject: [siemens/jailhouse] ac81ed: core, tools: Add msi_maskable flag to
 jailhouse_pc...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b="PG+TQy/B";
       spf=pass (google.com: domain of noreply@github.com designates
 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
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

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/siemens/jailhouse
  Commit: ac81edf1aa7ed9f58e4ee5a5e1dca8ea00762143
      https://github.com/siemens/jailhouse/commit/ac81edf1aa7ed9f58e4ee5a5e1dca8ea00762143
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-06-24 (Mon, 24 Jun 2019)

  Changed paths:
    M include/jailhouse/cell-config.h
    M pyjailhouse/sysfs_parser.py
    M tools/root-cell-config.c.tmpl

  Log Message:
  -----------
  core, tools: Add msi_maskable flag to jailhouse_pci_device

Will be needed to avoid injecting interrupts from masked vectors.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 243a7537af27a963c00e936462b705dcde7cb970
      https://github.com/siemens/jailhouse/commit/243a7537af27a963c00e936462b705dcde7cb970
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-06-24 (Mon, 24 Jun 2019)

  Changed paths:
    M hypervisor/arch/x86/pci.c

  Log Message:
  -----------
  x86: pci: Do not inject masked MSI vectors on handover

Recent Linux versions initialize MSI with a placeholder vector,
MANAGED_IRQ_SHUTDOWN_VECTOR, but keep them masked. As we ignored the
mask so far, we injected this vector on handover. That caused and
spurious interrupt warning and, worse, blocking of vectors with equal or
lower priority because Linux does not ack unused vectors anymore (an
issue of its own).

We can avoid the issue by evaluating the mask state, if any, prior to
injection.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0ecdd03e1fbff6388ea6ad6ad2f29f06f2fc29db
      https://github.com/siemens/jailhouse/commit/0ecdd03e1fbff6388ea6ad6ad2f29f06f2fc29db
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-06-24 (Mon, 24 Jun 2019)

  Changed paths:
    M hypervisor/arch/arm-common/pci.c
    M hypervisor/arch/x86/pci.c
    M hypervisor/include/jailhouse/pci.h
    M hypervisor/pci.c

  Log Message:
  -----------
  core: Rename arch_pci_suppress_msi to arch_pci_set_suppress_msi

As this function both enables and disables the suppression, add a "set"
to its name. Also align the parameter name.

No functional changes.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/dd6efa9840fb...0ecdd03e1fbf

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/dd6efa-0ecdd0%40github.com.
For more options, visit https://groups.google.com/d/optout.
