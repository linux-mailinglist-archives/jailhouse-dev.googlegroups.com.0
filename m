Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBQ4WT7VAKGQEDKN7HTY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x63d.google.com (mail-pl1-x63d.google.com [IPv6:2607:f8b0:4864:20::63d])
	by mail.lfdr.de (Postfix) with ESMTPS id 173348122D
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Aug 2019 08:23:01 +0200 (CEST)
Received: by mail-pl1-x63d.google.com with SMTP id j12sf45590162pll.14
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Aug 2019 23:23:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564986179; cv=pass;
        d=google.com; s=arc-20160816;
        b=BcuR97urX/TaEZ+Rt6sH9N4bNdsNVPXWrvy75tvg5bbePzWA2bBfjHk6aP6j7rPCpB
         FVbe2ctGQkwrZeBGGsFEp6XAcYcNihndZcH3fT10706SXfmxc2XXtWpeMlvSh8KRmQVn
         pAQrvsWhap5CLshtQXkRom4KBIrJCScZbU4csdvYnugI7apGwpXXRdCWzwt1wXqCghI2
         bShHxX1I6jVdYIarljk0J+sVPKppzCNrsQt+7SJqSGFhmSkRZDNA2faYa8FGhv1T7PN2
         S/173XOnjA/Axzt825HUqYXlVYXh5xaaquoXNPafgK/FXrmzFzfYbuvbD2K+lGqfNWJx
         qJHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=49eTs2KCZif9AieyyfY6bEUMu4hTDWvIZJdVy7dg1t4=;
        b=fBhICxqOW8+dvVkOPoAwsuvSkPGO5wt2uZgvPtJCZKD3NywpRWQHlQwahXDT+3pVyL
         g5LB6qvLCxAalnA0n9yvJSZHY4nKjKzLHAJQ82Id7s5D7sCeKKzc8CS9UD3kDcW6jFEz
         98wPQcIMqjIyMfQ1VPoOLso8wr3oqX6ZxKUCMVrEaIsfrIRbUg9vjrjlvmbsE5Jq+jKH
         af5e4OlmpZCfcBlTP7bDxBY/cG/2vx6hvVZm6WiuBcLSI6XGTPTdqwH67cxtMo8gZSBr
         IlbOSZlVQGzIsPDCLn2WKpYmFKLWpeeL2TORjs+3iqeE8kdzd0jOAHxfp6TyTLgO4nQ6
         uX6w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=YkccoEne;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=49eTs2KCZif9AieyyfY6bEUMu4hTDWvIZJdVy7dg1t4=;
        b=jPeJlN86aZq5ZBmcTj0slCC7LcRYhtiXyA3M0ZFNvIaGs5qFQqiH2iKGnk7rxhemhJ
         xHfHlpj9i2JLCOCZEaWtAEbHOPh1q1LlU6KtCizGkhzeB0SCz87YbE2kSsyawMH1SuKl
         sBZD8JF4tBPq1EstmZwiKET1SwhjOQaZtuL/jZNA5Q/aGTQEV1DvJlglSayBhVDDLrMG
         r65Fab1iB4KHT9QcZPeVHbd8GE4EOr45RQp937khLBAouJ2SJagdumR0nD3blwvmwEOf
         zUIJoj83L/91YqwGtfvmq8f/XqXM1GeZFuMZh/7fVaZ8DwHlo6YwXj4IyoXiGhnMJumA
         KNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=49eTs2KCZif9AieyyfY6bEUMu4hTDWvIZJdVy7dg1t4=;
        b=HB2LZB/jwjdfjV83Vtf/3W6845+TM6xQ27xnXzwEupio5bJPR70lbQz1YfOO8XOc5V
         BWym+hOODsQPXb8fhmYTV94cHl/577w0gzZCMU8Om0MM79W+vb+i+DefPvnEDV5isuFZ
         qeJ4pLmvnGISweUGmkVFa36MewAZXYrLwzRj9Pd8rQ7FxTJU3Gs69tBvh8rMKN5YHWoX
         5IDgbUKoc0IpFFgHn33LLYBfEx0dxnx+7p2qp4ETR4INA1vBOMcHBVPfli59RzEihF/J
         d5ZJk4TYCK2+vd2vmAI37/3BP1wPYiKm47EvJVlUb03+FPV4ZapXu0CeXuIQlg1DLbV7
         k7uw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV6z5NkXsS8Tv0te8sE1xVDsj6NAXmDeQbQUkDl8LFMNDCn91PU
	cZ8PYeJA2tEGoCwkWnKlcEM=
X-Google-Smtp-Source: APXvYqyR4io8zFMCxxrwta7wQRekD+JtAGvA+X9b4pe5B9gKY10L0KJr7QO8+BPAQzK7LnaA3LNe2g==
X-Received: by 2002:a17:902:bd06:: with SMTP id p6mr146462649pls.189.1564986179819;
        Sun, 04 Aug 2019 23:22:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:1021:: with SMTP id b30ls23277796pla.1.gmail; Sun,
 04 Aug 2019 23:22:59 -0700 (PDT)
X-Received: by 2002:a17:90a:db44:: with SMTP id u4mr16579294pjx.52.1564986179379;
        Sun, 04 Aug 2019 23:22:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564986179; cv=none;
        d=google.com; s=arc-20160816;
        b=HczjWwbpLVHKy+R+QarpuWu4XiLux01Xl8VQr8UHo1ob9BAayWuzFztHTiSLWbAFwv
         cUTgZtW73IV6mAP/zrBhenz4+3ISOThEAe5xH5dM3xJ1FGfeHnA7pfecepCFzl1MemMm
         j0ZCL3gO6jLBAnc5ibrHpwTZtcTUeyL0f826DQe4voAc9mhutPPBEknnbPAZpjQVacRr
         18yDjC6LWzh86MtdIoNklwdYA5YSHeeTq/gBO90YzotwShs2ajemkK/Pdzn34mx12GvP
         +oc3/Jiaps+W42/71UPa3ZzmsPUf9JMZk+8eVz4fkWvxZQajwY6HTwzpQ10LJ20E6UqY
         QpCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=cC7e2FEIdRh/wWvh1rbGGPJah4W/YyQYHowl4fqB3+w=;
        b=TnSiUY/kruRrf+NtVcpsHVzN5UHL+0RGvcZJrTpNUJjsGxcCp1eL9UgpltIqWyp9bb
         4zF/ahnURNUVCVs5tSvMw8rrPtFKo5bkiNeakiiBemTcOhWe2m2wBpR5BMcqIf8OPAYu
         u/b2kBpFd/P6z0/N736m8f0JT1wdi7xB/ZPPFkrWXCquLdFWZ7aN2ETXLLWJO2nATnX3
         BgKBNxPa/fYN27+8qrG5tN48BvB+a5Ba6LFEdmNtp+4w8C1/PVXtqiWTA+pib+IolNVx
         a+mve/HbnkGxlnaCutilCppw8SYstqH7pYbcaBQl/SRnqx6rLxfmeUE6i5523dzMoNMY
         BOmQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=YkccoEne;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-19.smtp.github.com (out-19.smtp.github.com. [192.30.252.202])
        by gmr-mx.google.com with ESMTPS id h14si3760686plr.2.2019.08.04.23.22.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Aug 2019 23:22:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) client-ip=192.30.252.202;
Date: Sun, 04 Aug 2019 23:22:58 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/fbcfb0-fe9dfb@github.com>
Subject: [siemens/jailhouse] fe9dfb: arm64: iommu: smmu-v3: Add data structure
 initiali...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=YkccoEne;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.202 as
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: fe9dfbcc2cf30721f71dc1fc19003a4c3b0b7b4f
      https://github.com/siemens/jailhouse/commit/fe9dfbcc2cf30721f71dc1fc19003a4c3b0b7b4f
  Author: Pratyush Yadav <p-yadav1@ti.com>
  Date:   2019-08-05 (Mon, 05 Aug 2019)

  Changed paths:
    M hypervisor/arch/arm64/Kbuild
    A hypervisor/arch/arm64/smmu-v3.c

  Log Message:
  -----------
  arm64: iommu: smmu-v3: Add data structure initialization and stage 2 for SMMUv3

A System Memory Management Unit(SMMU) performs a task analogous to a
CPU's MMU, translating addresses for device requests from system I/O
devices before the requests are passed into the system interconnect.

Implement a driver for SMMU v3 that maps and unmaps memory for specified
stream ids.

The guest cells are assigned stream IDs in their configs and only those
assigned stream IDs can be used by the cells. There is no checking in
place to make sure two cells do not use the same stream IDs. This must
be taken care of when creating the cell configs.

This driver is implemented based on the following assumptions:
- Running on a Little endian 64 bit core compatible with ARM v8
  architecture.
- SMMU supporting only AARCH64 mode.
- SMMU AARCH 64 stage 2 translation configurations are compatible with
  ARMv8 VMSA. So re-using the translation tables of CPU for SMMU.

This driver is loosely based on the Linux kernel SMMU v3 driver.

Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
[Jan: dropped comments about SMMU emulation - not present here,
      added iommu_count_units() check to arm_smmuv3_cell_exit]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/fbcfb0-fe9dfb%40github.com.
