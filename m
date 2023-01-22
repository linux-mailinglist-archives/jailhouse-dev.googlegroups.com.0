Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAE5W2PAMGQE6MM3TEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 249856771D7
	for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 20:29:05 +0100 (CET)
Received: by mail-ed1-x53e.google.com with SMTP id y2-20020a056402440200b0049e4d71f5dcsf7031982eda.5
        for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 11:29:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1674415744; cv=pass;
        d=google.com; s=arc-20160816;
        b=M29y/zs9o6bsu1tcW93pDHiJP0SwKzWUbVMbRKgJp2vEXGw5rTPurgqCWxMraTw1x+
         WIMoD3LEvpbuMt/Yi3oxyKD1QWlWJhAieO2yfMBqh/kvTLBbNslUVhehp4r4330rn24U
         iKXOrZG+asieY2w5+9CsaGbbYtFAiKdvyfG6jhkO9qwJn7Kguu7Yk6bxx0epGqxAkey6
         vIB5cYzu8uA751db0DD2vzjgN41S6ZhPrdrZPJ210iWCc8PHgsDYNCHMy/ZHasoUDJiA
         Nu1rh6IitMuh4KTi/XUgUnIeTI5ZSQ5a9itjc2JzSpmyEW3SkfEsfpnhLdMiLl7LMecg
         iXbg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:feedback-id:mime-version:message-id
         :date:subject:cc:to:from:sender:dkim-signature;
        bh=ye++c5ndZkhYW1X9VABhz82arysv0sD1O5kvuvuzU0I=;
        b=aDWHjsgsWfKFJ3W0QoTDo0VETkBHXlZdKTkS93sJ0Y8U0MGpuV1Hfvp7qjfXig5mYM
         zQpqHrqSQeZC5NNRiLUlRqe5TdKfeWnaa7hzjG7z68R2ImA8EtPVJ7d99x+Y1Yg1RUWE
         XpzCSJr9Y8NNQfKLjuCtDEFp/O5iprltBd3P/GkqQx27otrYMfZStVUwbOcUWmrh/qoT
         aw+f3ubzxdDLW1dddNQlcmJSo3pxZCOuH6e8B0UgAoT2R251NZNlfUFQ849qeBYCTtAB
         o/LEToPWOy9Wiyb0IO0fH6qusSxOFn2gwNU34Er3u/k8ZIQVVxGg2y9MxVtyyqoGiOd4
         D5zg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=ghldMZsi;
       spf=pass (google.com: domain of fm-294854-20230122192902f12fe5ae232c0e1aad-vd8ejz@rts-flowmailer.siemens.com designates 185.136.65.226 as permitted sender) smtp.mailfrom=fm-294854-20230122192902f12fe5ae232c0e1aad-vD8ejz@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:feedback-id:mime-version:message-id:date:subject
         :cc:to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ye++c5ndZkhYW1X9VABhz82arysv0sD1O5kvuvuzU0I=;
        b=qdvHv24I4HYQZUQCBu8W3ACQDXOW+U6bpuTc1VK+CEAcemBTuG9Kx2/hDYvX0qXmih
         mJ4TIj+TQ8SBpfjoG7ZGX+dmw9rzB9qq/PZnMQ3awElJjcsUBkrQlHE/f/1jLJ2mVBPV
         JFx1VlKsDxSMzJBXhFQ3L7nqv1UXRoX1nOww+F7HpJupeqaXu7IW404eUTw9U88Y0lXp
         FJVvlnkMayCGH0ciNzF1AhmFkRIcn/lgl5CtQ2jZQ45HVG+v5J4hOzDRyyhQ6se3dtPf
         v60Dq2Sa1fu/veh6LubpoJLMzBCRSBqtU62Yu+uo8XOb+OagxMAefLOiO/GDfrmUTAi2
         nDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:feedback-id
         :mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ye++c5ndZkhYW1X9VABhz82arysv0sD1O5kvuvuzU0I=;
        b=GLpLJWs+mbPcQVFESWywhRr5anTxeRkztdGFgyL1c3suca5RLkOP8TV06jJvp9l0bA
         VbnbAtVQi1Iwxvb4K8xSrJ2zv91lQAHfI3T2+3IK5thvPHbHBnQCZRyEcmGH3BcV09Ly
         Rc9kAIiZDwnEUtwatz9b5213lXpl/i1yTtG08jWIFR22q39AtzXywWZEOWDU7BN+7BWt
         NsSN/BatJ4BCN3BZSB5rcDgZnS5dbEgeY9ZMBVoKpscSGo8J+S5+RFj6QIrn2bp0ZiLr
         5pHOuJ6e8D3ziGITDZS+fxGmoL7aBvNLZ96TcyNsAs3Gja9h2C0F4OJJ0/wrpNUxs4nH
         Zcmw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kqaAjWcKIVWN5oYrvtjqpxhM/2aV9VV0zPQzilXnuLEKcmnY/gz
	hMyY9wjetm9ZMPHC4FRDls4=
X-Google-Smtp-Source: AMrXdXtbYTqrrVRck0mFDRyhFLlsN4kxEaLyZP1WbBfnAVFCsVIyYCYp1PeE8IMMiyMGeltMvnv0Pg==
X-Received: by 2002:a17:907:8b87:b0:86e:4acc:f294 with SMTP id tb7-20020a1709078b8700b0086e4accf294mr2414235ejc.415.1674415744698;
        Sun, 22 Jan 2023 11:29:04 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:2691:b0:49e:29ce:a2b with SMTP id
 w17-20020a056402269100b0049e29ce0a2bls5798126edd.0.-pod-prod-gmail; Sun, 22
 Jan 2023 11:29:03 -0800 (PST)
X-Received: by 2002:a05:6402:1f05:b0:46d:731f:d726 with SMTP id b5-20020a0564021f0500b0046d731fd726mr22974420edb.22.1674415743061;
        Sun, 22 Jan 2023 11:29:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674415743; cv=none;
        d=google.com; s=arc-20160816;
        b=MZxiJqUy2RgJA1mMgYRxS30anspcqnIbq4xjL3KaeAUrfIjxfjeDY6rffk8eVHvksQ
         X15KJ6XAXCHUifL4nNuXKWLnbnbWy8fXI6Y/ASgOfmTRg6PlI/L5OrWymeOuivep1nbZ
         G52NjRUJtB6jzwQ2jSD+mrQ2ckUGusG7Vwi4uwKzrZG0LX5axL99xf5WDlkQ6IE38Rxi
         ZVh+pgyLTFiO6Rkm7LD5JiVM9VAV3dikyigG6i89+IzLL1Wyknl1xKOBVw++L17lggxT
         T1Y7JOCaKwe4aVO4fJ1yFjBrWa0C3LO3VJ/9+ErkhG+eHPpix0ntmbbaDnscswYkY3dx
         cO/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=feedback-id:content-transfer-encoding:mime-version:message-id:date
         :subject:cc:to:from:dkim-signature;
        bh=+//zEWorHDMXJNYngS4T9TKsgwvI0xEvgOwAfKZIZ4I=;
        b=UYHphPv5qbb2325soyBbEkodA/9LpzRZTVVjZdka7FDN9g4s9stR+sN1FN16UEOmYe
         1dWOMOYS5otJ0Z1JHXAAM6hXsh5oZoiTaa4tkdmsHLL//F0gLEGU4VQSc8wjUXCgT0Lh
         6EU7t2niC5RcZmTXU0r2sO6c877Wq7u5q2qPvoY+A+hSr66+WQ3L3m9pddX2cT4Fn3ev
         /pOsQ2gkaP8lOV7nRqxj/aOA13oeJE1mREquJc0b4CMyXbcvXK1gN2Fc2cp69f8hN0am
         D2tt6eEhhzh6miMbuD0iqS5BUMBToO00Wh1kCaa0W8I0CYID2dtA7TsCB34w+HkHwXkl
         U+Mw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=ghldMZsi;
       spf=pass (google.com: domain of fm-294854-20230122192902f12fe5ae232c0e1aad-vd8ejz@rts-flowmailer.siemens.com designates 185.136.65.226 as permitted sender) smtp.mailfrom=fm-294854-20230122192902f12fe5ae232c0e1aad-vD8ejz@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net. [185.136.65.226])
        by gmr-mx.google.com with ESMTPS id k20-20020a05640212d400b0047014e8771fsi2007424edx.3.2023.01.22.11.29.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Jan 2023 11:29:03 -0800 (PST)
Received-SPF: pass (google.com: domain of fm-294854-20230122192902f12fe5ae232c0e1aad-vd8ejz@rts-flowmailer.siemens.com designates 185.136.65.226 as permitted sender) client-ip=185.136.65.226;
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20230122192902f12fe5ae232c0e1aad
        for <jailhouse-dev@googlegroups.com>;
        Sun, 22 Jan 2023 20:29:02 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Alice Guo <alice.guo@nxp.com>,
	Jiafei Pan <Jiafei.Pan@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Matt Ranostay <mranostay@ti.com>,
	Peng Fan <peng.fan@nxp.com>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 00/14] Configs housekeeping
Date: Sun, 22 Jan 2023 20:28:47 +0100
Message-Id: <cover.1674415741.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-294854:519-21489:flowmailer
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=fm1 header.b=ghldMZsi;       spf=pass
 (google.com: domain of fm-294854-20230122192902f12fe5ae232c0e1aad-vd8ejz@rts-flowmailer.siemens.com
 designates 185.136.65.226 as permitted sender) smtp.mailfrom=fm-294854-20230122192902f12fe5ae232c0e1aad-vD8ejz@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

While preparing the CPU-config changes for upstream, I first of all
added checks regarding CPU usage to our config checker. This confirmed
what I saw in manual review before: a lack of consistency in the core
assignment to permit running linux and inmate demo in parallel (on >2
cores systems).

The more I ran the checker on older configs, the more issues I found.
Many are resolved - but not all. This adds a new script to scan all
compiled configs, at least rool cells, inmate and linux demos, and run
the checker on them. So, you can check what is still broken:

# scripts/check-configs -q
...
Checking imx8dxl.cell imx8dxl-inmate-demo.cell... FAILED
...
Checking imx8qm.cell imx8qm-inmate-demo.cell imx8qm-linux-demo.cell... FAILED
...
Checking k3-j7200-evm.cell k3-j7200-evm-inmate-demo.cell... FAILED
Checking k3-j7200-evm.cell k3-j7200-evm-linux-demo.cell... FAILED
Checking k3-j721e-evm.cell k3-j721e-evm-inmate-demo.cell... FAILED
Checking k3-j721e-evm.cell k3-j721e-evm-linux-demo.cell... FAILED

Please check, some issues look fatal (mapping GICD/R...).

Jan


CC: Alice Guo <alice.guo@nxp.com>
CC: Jiafei Pan <Jiafei.Pan@nxp.com>
CC: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Matt Ranostay <mranostay@ti.com>
CC: Peng Fan <peng.fan@nxp.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Jan Kiszka (14):
  pyjailhouse: config_parser: Build CPU set from cell configuration
  tools: jailhouse-config-check: Add CPU set checks
  scripts: Add config checker script
  configs: arm: dts: Silence style warnings
  configs: arm: jetson-tk1: Move inmate demo to core 1
  configs: arm: jetson-tk1: Avoid memory region overlap
  configs: arm64: Consistently move inmate demo to 2 core
  configs: arm64: imx8dxl: Mark 32-bit demo also as 64-bit config
  configs: arm: emtrion-rzg1{h,m}: Fix config checker findings
  configs: arm64: jetson-tx{1,2}: Fix config checker findings
  configs: arm64: ls1046a: Resolve overlap between two RAM regions
  configs: arm64: ultra96/zcu102: Carve out SMMU from MMIO region
  configs: arm64: k3-am654: Rename inmate demo
  ci: Update to actions/checkout@v3 and actions/cache@v3

 .github/workflows/main.yaml                   |  4 +-
 configs/arm/dts/inmate-bananapi.dts           |  6 +-
 configs/arm/dts/inmate-orangepi0.dts          |  4 +-
 configs/arm/emtrion-rzg1h.c                   | 42 +++------
 configs/arm/emtrion-rzg1m.c                   | 21 ++---
 configs/arm/jetson-tk1-inmate-demo.c          |  2 +-
 configs/arm/jetson-tk1.c                      |  2 +-
 configs/arm64/dts/inmate-k3-am625-sk.dts      |  7 --
 configs/arm64/imx8dxl-inmate-demo.c           |  3 +-
 configs/arm64/imx8mm-inmate-demo.c            |  2 +-
 configs/arm64/imx8mn-inmate-demo.c            |  2 +-
 configs/arm64/imx8mp-inmate-demo.c            |  2 +-
 configs/arm64/imx8mq-inmate-demo.c            |  2 +-
 configs/arm64/imx8qm-inmate-demo.c            |  2 +-
 configs/arm64/jetson-tx1-inmate-demo.c        |  2 +-
 configs/arm64/jetson-tx1.c                    |  2 +-
 configs/arm64/jetson-tx2.c                    | 11 +--
 configs/arm64/k3-am625-sk-inmate-demo.c       |  2 +-
 configs/arm64/k3-am625-sk-linux-demo.c        |  2 +-
 ...mate-demo.c => k3-am654-idk-inmate-demo.c} |  2 +-
 configs/arm64/ls1046a-rdb.c                   |  2 +-
 .../arm64/miriac-sbc-ls1046a-inmate-demo.c    |  2 +-
 configs/arm64/renesas-r8a774a1-inmate-demo.c  |  2 +-
 configs/arm64/ultra96.c                       | 13 ++-
 configs/arm64/zynqmp-zcu102-inmate-demo.c     |  2 +-
 configs/arm64/zynqmp-zcu102.c                 | 13 ++-
 pyjailhouse/config_parser.py                  | 12 ++-
 scripts/check-configs                         | 90 +++++++++++++++++++
 tools/jailhouse-config-check                  | 26 ++++++
 29 files changed, 193 insertions(+), 91 deletions(-)
 rename configs/arm64/{k3-am654-inmate-demo.c => k3-am654-idk-inmate-demo.c} (99%)
 create mode 100755 scripts/check-configs

-- 
2.35.3

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1674415741.git.jan.kiszka%40siemens.com.
