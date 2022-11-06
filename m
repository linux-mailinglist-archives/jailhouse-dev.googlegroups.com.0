Return-Path: <jailhouse-dev+bncBCFKT2ENXMKRBPX3UCNQMGQE4UORDPA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x338.google.com (mail-ot1-x338.google.com [IPv6:2607:f8b0:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E52161E76F
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Nov 2022 00:05:36 +0100 (CET)
Received: by mail-ot1-x338.google.com with SMTP id 33-20020a9d0124000000b0066adf5218b2sf4852386otu.10
        for <lists+jailhouse-dev@lfdr.de>; Sun, 06 Nov 2022 15:05:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1667775935; cv=pass;
        d=google.com; s=arc-20160816;
        b=UQbM0prWmb7Pcd//h+ZgLyzZRGWIwGzWZAiUCUl6F2wT6emkhIqBT0bgGwPwj31EJJ
         s1xOQkn7waENstDbwULs13c1mgLzz+9NGJvqsSWSPs5l8bg9wCNcAvZ/35e9yOqWlbDD
         qd7WrsEwYJt6yjry2FPdA9as/pQx5yFipZooFKlWsGxNLCNX9PVbdB5gnULx/WNrKmEB
         vPAZOet1FxY2aLXlNKJLnBAYL48w/19v8w0Vu6+K8hcCEyJVyCiNXGefurx3GhBzyGax
         8tPGknhrSpgTivHWGdfvCIdX4rhMqMfm0ID5h5M4Gvzc7+0/ya4dXjYEpZlcl3IvLUJA
         2L0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:cc:to:from
         :mime-version:sender:dkim-signature;
        bh=Fw+KXiaDqwDG/wgzklewso10lH6U4PLAJsSnCg/4yRg=;
        b=ZXcUAj+GWpOAGq9pMECLLK857CqgiUGYmPTonSDL90XmDgmKpKZchfe7xQ7M1XbieH
         V6n3SxESqXJPLUKItg5vLBne9lCEkmWlrhNQURKuaFQujm+IeMu/Y/Un7XrhDg3FI+V6
         CK287UMCIqqa68FSBtwprsXf2zuzzIafzdZ+SKM/c2KkW0P5xOyqToNmj0CD5aH941mp
         UizU8eKzagEjkZRkhiS1kZLdXaNq1v5+Jfj32M5Qxt0nF5ELttNllKWXQSKBcvOr9Wi0
         hbsYX4+th3lMLNW8fSx34C2mQMEipiZdQz5epGPZrzQ4RvDsnYz2wqQln3uGJYnk5fVW
         OzvA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of prabhakar.mahadev-lad.rj@bp.renesas.com designates 210.160.252.172 as permitted sender) smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=renesas.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:message-id:date:subject:cc:to:from:mime-version
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Fw+KXiaDqwDG/wgzklewso10lH6U4PLAJsSnCg/4yRg=;
        b=ayV+xKguOIN8meBG7I9QeeIAeZTkt1r8HaS1ZvsYRuPFiK+SOKRUEjtUyERYxVjGza
         r2ZvM+fVTlrP3eYHXXfF8mUn1ZCGBpVQLsIWFLne3SDeAkwe9NntLuWAIDA6sWS4AOkJ
         OtkW0Sd4otlp8NQbd4euT4GDasLMYs/1gcXP5dhANSlIsRAgswZk4yfwDa0ooo1MA6+o
         RZPqs72OQD3bRrqOUe7YPge77cRnBC1fkkp9mFRoFReM2yxn2i9aDfbOLgOwJJ4Dl6n4
         0kAmCXK+phCK02So23XyEqD8YKx51xYAnaxqBUnHfd4yOOvxez4798cdegMY8FlUtX/E
         12iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:message-id:date
         :subject:cc:to:from:mime-version:x-gm-message-state:sender:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fw+KXiaDqwDG/wgzklewso10lH6U4PLAJsSnCg/4yRg=;
        b=7Hrtc4eEMXNGGpmOoIAVJbYehwuhY3S0rJNJ1yEOwk02u4OuartUQJQxIH6JNdUi3M
         GSWEXMld/Okb7r+0HoGvWZw/gIUKzFgnvIPm85R3BcFeGRFA3rzTrThMz8QS866+9sfD
         AQlkozeg4T/l/Q9rvBo9DBeOzdPGJup63gkiOMlWDgY+ED8eDojEmxBk//KHBvkBODks
         4N10JaX1YOPlvR0FLshb39SAQaFBq3Ecv4ZJ8tHBLXfvnHSPSkd7nrAcHoPAit61IR4W
         2LhGuNlfCg7edYyQIiSlgpGB1CHqV0JmMb/WNU7Xq+br0Er57ReF8G6F030fIhJhg4KT
         Xasg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf16MOHTv11HXdEDoQHn4KKpkOak/3aElZI0thOqPRPcs8ugAQlL
	tfIc/ZNUGksxnghSsJ4qeSI=
X-Google-Smtp-Source: AMsMyM5+XrCziL5E3W5kRzGEtaPrbKIldrwnoeFO+Ppmpqc9v7B6hzEhwpdzhz9nnWE6hm3VXsMPTg==
X-Received: by 2002:a05:6808:11c1:b0:353:f1a5:207a with SMTP id p1-20020a05680811c100b00353f1a5207amr33397970oiv.183.1667775934939;
        Sun, 06 Nov 2022 15:05:34 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6870:e6d6:b0:13a:e471:20c5 with SMTP id
 s22-20020a056870e6d600b0013ae47120c5ls3303144oak.1.-pod-prod-gmail; Sun, 06
 Nov 2022 15:05:34 -0800 (PST)
X-Received: by 2002:a05:6871:448f:b0:13b:1c89:9930 with SMTP id ne15-20020a056871448f00b0013b1c899930mr509268oab.247.1667775934261;
        Sun, 06 Nov 2022 15:05:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1667775934; cv=none;
        d=google.com; s=arc-20160816;
        b=zELf4hB0ulOPVEdP5i37syNO0uUPV1d0xEKTR+GQz8qJckXk7bF1CkeVIR2morX/Bu
         hXA8S4rN08ar2QxSvwQmNGOiP2y2h6kbSTAHNqgInmVqhSyZSJ3AnNgZ5aDHYvHumLZb
         NFNmBNxkJSGZGSPtxVJXW8dXHhRpEwwdWU2Rg8WKROaeZb9x6gRFqKk65oQoCTg08tsx
         9zzPE0j6kBvxMFiy83rQC/KGacF5vGs5xrDCG+ep8n25OTGkPOu7H2J+3EZNSkwbVHab
         JUWzpkz9CjsIVt3AFHs50BKYGq/DV/VdZItV1/4YlwF0APhtdEkche8zsBtjq2HMaWjf
         s8yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from;
        bh=xUNnVrC+VRUx3JhN5LacxxFS19uiT91ulOlshZvK9p0=;
        b=VriS+XiAcxbtq4mrGPZXyb6xTbNHUj84baa28wHynSoKIpags4X5ycSt90jWdCpdHv
         APyv1De/DHnZ7W8dQL91tc09DMM30MSaEiRx9WLRGOd/SOVrZYmDr/u8TbUNA8KIDvxf
         tqzb2e6mPevbYnQbYOOwtGvE8Y8Nl/hRwEXU6hXs/142ah3HtPUncAsDvjDTYYOe9lyZ
         Z8C11+9q2WSat3kaeMAbkdIskO1e/gyuPYW0OQ16HuhLhHXg/M4Ae245XuNqfCbgtYex
         pX1ebsEczzl8tTYD2SjMEb6hu4KFvAa/EpOaD3NkDTN7iega22wWLUUJ4sND636fwIJY
         fLMA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of prabhakar.mahadev-lad.rj@bp.renesas.com designates 210.160.252.172 as permitted sender) smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=renesas.com
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com. [210.160.252.172])
        by gmr-mx.google.com with ESMTP id r15-20020a056870414f00b00101c9597c72si262719oad.1.2022.11.06.15.05.33
        for <jailhouse-dev@googlegroups.com>;
        Sun, 06 Nov 2022 15:05:33 -0800 (PST)
Received-SPF: pass (google.com: domain of prabhakar.mahadev-lad.rj@bp.renesas.com designates 210.160.252.172 as permitted sender) client-ip=210.160.252.172;
X-IronPort-AV: E=Sophos;i="5.96,143,1665414000"; 
   d="scan'208";a="141674348"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 07 Nov 2022 08:05:31 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9AD784005B2A;
	Mon,  7 Nov 2022 08:05:29 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: jailhouse-dev@googlegroups.com,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Chris Paterson <chris.paterson2@renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RESEND 0/3] Add support for Renesas RZ/G2M
Date: Sun,  6 Nov 2022 23:05:20 +0000
Message-Id: <20221106230523.22567-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-Original-Sender: prabhakar.mahadev-lad.rj@bp.renesas.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of prabhakar.mahadev-lad.rj@bp.renesas.com designates
 210.160.252.172 as permitted sender) smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=renesas.com
Content-Type: text/plain; charset="UTF-8"
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

Hi All,

This patch series adds support for Renesas RZ/G2M SoC [0] (root cell
config) and adds demo cell config for HopeRun HiHope RZ/G2M platform [1].

Changes apply on top of next branch [2] and the kernel used for testing is
5.10 (-cip) based on BSP-3.0.0 [3] release from Renesas.

No changes from previous version sent to ML, just rebased on the next branch.

[0] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg2m-ultra-high-performance-microprocessors-arm-cortex-a57-and-arm-cortex-a53-cpus-3d-graphics-and-4k
[1] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg2m-hihope-rzg2m-reference-board#overview
[2] https://github.com/siemens/jailhouse/tree/next (9391d30a)
[3] https://github.com/renesas-rz/meta-renesas/tree/BSP-3.0.0

Cheers,
Prabhakar

Lad Prabhakar (3):
  renesas: Add SCIF support
  configs: arm64: Add root cell config for Renesas RZ/G2M SoC
  configs: arm64: Add demo cell config for Renesas RZ/G2M

 Documentation/debug-output.md                 |    1 +
 configs/arm64/dts/inmate-r8a774a1-hihope.dts  |  228 ++++
 configs/arm64/renesas-r8a774a1-linux-demo.c   |  114 ++
 configs/arm64/renesas-r8a774a1.c              | 1134 +++++++++++++++++
 hypervisor/arch/arm-common/Kbuild             |    2 +-
 hypervisor/arch/arm-common/dbg-write.c        |    2 +
 hypervisor/arch/arm-common/include/asm/uart.h |    2 +-
 hypervisor/arch/arm-common/uart-scif.c        |   44 +
 include/jailhouse/console.h                   |    1 +
 inmates/lib/arm-common/Makefile.lib           |    2 +-
 inmates/lib/arm-common/uart-scif.c            |   65 +
 inmates/lib/arm-common/uart.c                 |    2 +
 12 files changed, 1594 insertions(+), 3 deletions(-)
 create mode 100644 configs/arm64/dts/inmate-r8a774a1-hihope.dts
 create mode 100644 configs/arm64/renesas-r8a774a1-linux-demo.c
 create mode 100644 configs/arm64/renesas-r8a774a1.c
 create mode 100644 hypervisor/arch/arm-common/uart-scif.c
 create mode 100644 inmates/lib/arm-common/uart-scif.c

-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20221106230523.22567-1-prabhakar.mahadev-lad.rj%40bp.renesas.com.
