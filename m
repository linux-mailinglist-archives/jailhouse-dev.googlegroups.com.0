Return-Path: <jailhouse-dev+bncBCFKT2ENXMKRB4PZR6MAMGQEBAT6THQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd40.google.com (mail-io1-xd40.google.com [IPv6:2607:f8b0:4864:20::d40])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D45459CB47
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Aug 2022 00:02:28 +0200 (CEST)
Received: by mail-io1-xd40.google.com with SMTP id g4-20020a6b7604000000b0068a39eb2b95sf1370358iom.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Aug 2022 15:02:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1661205746; cv=pass;
        d=google.com; s=arc-20160816;
        b=niD0hXD2/G1NFhgdP5Xmm4ICJSvsx8DqCELXexjjC9fFvL+RGxdSNr8+7Gr4Gffx8I
         +J7mEda/Zq009HUEuEMObyVFm6prhiLn7Uo4XkvIKTRmI75WB9FsFoWELKcxYqlKfLT4
         ZJcIeGc6ZO6AtrI7suSsXCdnyDN27fTcr3X1n+/k4XiKUgNkX17nYOJK+1Cu0cpk9sdv
         iEngAruhzrQHn7DL0tuSmMlWsoE81TEgyCUzkVhKfZSRiFZzCA9V8RoVVDJVw2OrNFIc
         to7XMYPgxG7v8P2T7wfrkxAuhyoSn2f2lEmLHO4JGG68rNuLRBUTk+IAQ0jlwDnIftEZ
         2UNw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:cc:to:from
         :mime-version:sender:dkim-signature;
        bh=Ipb+7wqbkqHfBJdtBb+kZCqUAkj1LBAWr2wL6/fr/1c=;
        b=FbxJDflubj3w5RBqWHLBIfA7Vsz6zcvxnQtEsMbH4+uOFxZDuiuwX12lTLJQaLQUxA
         +MmCE15J041jgNBqbXdCpq3T+cJKHSXV4tTpi2r5iYNKLOoEX9mBP1F3UB1IMT/xPCO8
         89zZQleYJUREciB7JvsVJ5Re2nkg9qvSDblxtb0uF6bBsJi/GPZk5N6h51Yo1gTHS8yW
         FZB+NLKsYY5mDzZFYwf1GlvWBOXbUD2XyO5JULa2/g3tXrUpJwDJHYmH74ciM+2wCCPG
         9QpzD8gGTicUlI2xvIayV2aqhd8ez1eeI8wMjxJa5mTU8B6jzu9jdSKO4j49uvDldBhn
         m6jg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of prabhakar.mahadev-lad.rj@bp.renesas.com designates 210.160.252.172 as permitted sender) smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=renesas.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:message-id:date:subject:cc:to:from:mime-version
         :sender:from:to:cc;
        bh=Ipb+7wqbkqHfBJdtBb+kZCqUAkj1LBAWr2wL6/fr/1c=;
        b=RBeB/FpYl+fLviuECyVjrxaT69ptmdT3XJUbVsOv6NE1/XxvRMyp/SB1tQ1SVOZ7Ck
         4XXgMDU6u3CIOw15z0CXRLxgmRlMbcwXMPHkbP+R0S4x/1LcA6kytzlGdqGAIi2Gb0nY
         XIgHAH9A5osxvIMAaQJvOaJyNIsRBhotAB8nh1kaT6vkfmeJc9FpIfMxbbB2SYMjv5h/
         8ftg5wUnEEo8aqw8Hty9orldJ10E0IcF40mYuBnu6wOPqeyx9cmAtOL7AkjM3sjEbjvw
         idtIbN/QRhVmRoEA87bjFQN4Hh9HotkUSWoUF2yn03Bf/4ORndPbRfZoISLy/fU9cnM1
         rIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:message-id:date
         :subject:cc:to:from:mime-version:x-gm-message-state:sender:from:to
         :cc;
        bh=Ipb+7wqbkqHfBJdtBb+kZCqUAkj1LBAWr2wL6/fr/1c=;
        b=qRdx29PlRqA16hwWGgEV/Fl16sAyFrSCMnSZ6nztrnBb0MZOgJsEPtUS/9DvR8/CEk
         cBESmwewfD6JHyQkMZ26yndl/KsMg65pm/EeUZCHG1Lw3g+80947Tk5jYjSRCklZSuSF
         EgLVt+CP2OaXg95t7bH5kQEcVWsJXNG6c8Pa2W+UJ8a4EooR8bvOtF9TaaVSK12eIbRE
         dZGZJTDPH28Soxj2PssXehXZmHTYjc3fzKi4cMIbCh1YR0FbCXGKo/MbqTLqEaoHPnaI
         9Sz8jBNwJAgqxqZ94lCZYMv5tNzkOE4ONKI57RtA1hikMeCsrQqfyTx5f2Z9J9cX242j
         tKjw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACgBeo2TDE6Eb8Hj0mqK2VFiMDHprOF/w37k5n5IfXge9Qh7VfSaRLcS
	cIzZma4XIIUD+aRX6ZcEMJk=
X-Google-Smtp-Source: AA6agR7qJVdmnkaLgRyV9xjKBhCP4SQi6+hQjmjJL8/fw7l94G3NtzqFDNUUw8fO+s9L4Mfzuh2Veg==
X-Received: by 2002:a05:6638:dd1:b0:349:dee3:4b1e with SMTP id m17-20020a0566380dd100b00349dee34b1emr2813405jaj.56.1661205746375;
        Mon, 22 Aug 2022 15:02:26 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a02:9387:0:b0:348:2f1c:9948 with SMTP id z7-20020a029387000000b003482f1c9948ls2109290jah.3.-pod-prod-gmail;
 Mon, 22 Aug 2022 15:02:25 -0700 (PDT)
X-Received: by 2002:a02:ab9a:0:b0:349:c87e:d90e with SMTP id t26-20020a02ab9a000000b00349c87ed90emr5135165jan.39.1661205745379;
        Mon, 22 Aug 2022 15:02:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661205745; cv=none;
        d=google.com; s=arc-20160816;
        b=jJcpT98DOjSVbUkjfmgzPIbUcX1YO2uusBcfFgpXPHX3MKHQBjmdgjtncxLUf3/iFm
         jnKuV0PuoAzsl2fpK7WNYoPp66hiqBsyRZ1V1LpN2xEwVPR5x9b5xQw7UK1eXq0gV/Ut
         wwgzwPeqXjrFfOBxExBrunejAgR/Oh5CD08WoP+36d2pwisDH/IsdcIcJOE33Cl2sQEL
         xOLejWaKsAdsKFuq5Re80+5uYuSN+6xLImO79MPP2syvBn4LvgVafWYD9vbDDwfxXLTm
         xcRgWYhc2tUJQ+LPJTwYOjtBxkpVi+8MGXZUQlnr6HyVuL6lEkTgCKmImpYg0zWIhijq
         vaYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from;
        bh=z89efwsZtBkn0cNDAOQrgdD/4S+jqqdV4sk87FogHuU=;
        b=p+fO1erpb1q0VvbHFSTs3iMBnfQGjZ4CXqhO9YhdYNmZi8n5ZjyqfQfNMeNjj6a9ZM
         1mvfYomkSl0OT9AGP31z2q/6WIwCWQbslBQmLIOBKnNDyyJqJx284X0C+CqlCe/4rwIf
         KJFL/sUe7t3oCQ4DEZycwQ4UQ63usXrTfJo3q5g2ZEDmfpwwZ9uxw4ZChpyw3whFnb18
         rzOYWQ5NzF5qWEoI73hfllsRtiDpqqO4dJQPsRC/OdSOkCYht1QBD5ERjGZbyaS2kV91
         V2OsQFLpsymAUtaogcbO7JM24ks1g519FRQLKA9SnTX02BpCCMYJDdNKGyLYWE39wmso
         WtSg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of prabhakar.mahadev-lad.rj@bp.renesas.com designates 210.160.252.172 as permitted sender) smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=renesas.com
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com. [210.160.252.172])
        by gmr-mx.google.com with ESMTP id g17-20020a056638061100b00349d0b68f0asi253105jar.4.2022.08.22.15.02.24
        for <jailhouse-dev@googlegroups.com>;
        Mon, 22 Aug 2022 15:02:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of prabhakar.mahadev-lad.rj@bp.renesas.com designates 210.160.252.172 as permitted sender) client-ip=210.160.252.172;
X-IronPort-AV: E=Sophos;i="5.93,255,1654527600"; 
   d="scan'208";a="132167608"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 23 Aug 2022 07:02:22 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C268E400755E;
	Tue, 23 Aug 2022 07:02:20 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Chris Paterson <chris.paterson2@renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3] Add support for Renesas RZ/G2M
Date: Mon, 22 Aug 2022 23:01:59 +0100
Message-Id: <20220822220202.26218-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

[0] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg2m-ultra-high-performance-microprocessors-arm-cortex-a57-and-arm-cortex-a53-cpus-3d-graphics-and-4k
[1] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg2m-hihope-rzg2m-reference-board#overview
[2] https://github.com/siemens/jailhouse/tree/next
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220822220202.26218-1-prabhakar.mahadev-lad.rj%40bp.renesas.com.
