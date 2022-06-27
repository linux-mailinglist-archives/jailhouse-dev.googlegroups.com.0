Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBAW242KQMGQEIDHAOKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 8110855B9B8
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:13:39 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id m8-20020a2eb6c8000000b0025aa0530107sf952595ljo.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:13:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656335619; cv=pass;
        d=google.com; s=arc-20160816;
        b=QXGfwz2uDv1HBYmnkcOmVpX2yYMK0hzZ0Z0b8eSJZCM8sz/py1R3a8PwRqJq0cXWTw
         HRVVieSD05seFWyAklvrNUp6BzSNRyiiiQ9c+9lUYMqN22NqTyp19CQSKDfYqKZH+UwW
         toRj1GuLa+A+3crQwVxNLSk0+TTJm2JZlHY8sJj9rj4IPaBX/znTvmQL6q+zco07Ndfj
         ko514LANksBKZRmw7MrLfOqU6n/rK2l/2ZQZx7IPBhGkd05BhvVQrrdKqzPwE0Yj01ud
         IGL374DGiEEuFSbEzNqobwdpHwWHa+2HuBM8m9vn/WMTp0GRsVn/sWmuka50iSA2PrBS
         D3wA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=xlYj3U4NWQk2D4K1c5kKDpHuI0fCsF9v7AdSn8a86IE=;
        b=VP95ieAm31szRh5/rA0mq7YDVTOlk+1rL23n7RIS8D68Y8wx1XN3Hb5nPpIuAZfAck
         yUOqNXbak2GD+1t0T4ttsFaqY3FW1lY1131iRKsc7oUCvKRvyd/gyyFUywqIGE1oX5T+
         ofYzAz+fgMgD3nbcDav0X8sdy0rOXGT41kU4RGfeGJLGtX7f9y5MFGcTi0Ib/ffkKwWv
         FPB/LUphmiV7Tu/cmOBaWq+CufHOD7NgyEZyy4KpSmBhDorwwRNEr3F29ic0vh5VBmSv
         Fhi0smWJFfEDqvsptXceCyvHV7bdKi04Yyw8HpDtWEwr7epakA/mkVrUdqtMNUVm/jw2
         puuA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=tZa1c3aW;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xlYj3U4NWQk2D4K1c5kKDpHuI0fCsF9v7AdSn8a86IE=;
        b=dICJai7Miuyg7Vy/maTONkBeQANxne6d8wdXWp0/g8N/U7OBWD2HQNTknJ31hqt6Wu
         pw/UyyojDjj89mNqsT6mQhTp8BIXnEk+ZiVljbCA9KJX6vQsW/+wFz+Mnvl+2bVCEfrc
         DGlf7vd0gev/hO7+X3hrbXF4lBT/gT+iwrPxgsRGhdiOV9HKIhG0vDijAdElCfYXJ+K/
         js2oydvDm/chMPqwXc5VgQjg2wDIobJuzwmE2iIntWhKigGYOi7jnCWEssnkBog6559m
         h2trL8V/X2HbLkwWh7E9lkgWaU9PeVILQzZnouV8xOSum35OJTCsjgg5Dw2YKcSCW4Ol
         qJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xlYj3U4NWQk2D4K1c5kKDpHuI0fCsF9v7AdSn8a86IE=;
        b=xS/r0FAPpPTXRmoAkiYhOD04I+6cXZv97c/tRFRkHnPTVOkUYV4f9vJZHnjMZ2Fmpy
         UgxldYqO42BD9xZqhtBanoxkr8DVAWlZiCDFerZSPr0Q838rNAdl8DxqkgRISn3NmVDK
         PhKPHrbt68iKPR2+8rYTcj86EMakro4kUcN+QrvfYVAhppj/MH2dgL8OE9THqhXd4sZZ
         2jAz14y1V1UoSj+WRqGHEXvIbfZ/NTJgAe8P/tsEVvLM7W1bBTI/1QhUx8lhfWhgDvnc
         5zw/7Nzf1QWIfrWXXhk/49VQogpH63GDLeNgWJJAE2jaGhL93Ho3r0Br6aHRats3FLkO
         MHbQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora9xLLmonfCQNeBJD3FWkQFTvxjazq43eDxeCYNdE4xfId92UWbu
	lp5ST+znU40/WHxNT3qOVgw=
X-Google-Smtp-Source: AGRyM1vjSKJVPDT8gaGfFn1pboFbV2H3IO+p5gpz04olhY9r1m1vGdk2jiuKY4kk8v1HNFR7tACLfg==
X-Received: by 2002:a05:6512:131e:b0:47f:7510:6f33 with SMTP id x30-20020a056512131e00b0047f75106f33mr8455157lfu.178.1656335618833;
        Mon, 27 Jun 2022 06:13:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:97:b0:25b:be22:345d with SMTP id
 23-20020a05651c009700b0025bbe22345dls452996ljq.8.gmail; Mon, 27 Jun 2022
 06:13:36 -0700 (PDT)
X-Received: by 2002:a2e:900e:0:b0:25a:9940:75fc with SMTP id h14-20020a2e900e000000b0025a994075fcmr6871415ljg.354.1656335616871;
        Mon, 27 Jun 2022 06:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656335616; cv=none;
        d=google.com; s=arc-20160816;
        b=R5I+hjvGwV9ks/uzqSjKkqxIVTECt0T9jvtzdoOkUtGDTx1E2O9LZUsFkWV5wAvsm9
         0BKWXIRMELBPbIzX41NegDMvDYw8RbZG5gRWxarTCeFYSg8DWWJ6fGNtaJ7fb1HAFNR3
         O8UBDHMhrroaWGuQfzASftEyuP6YMVLM1X0GjNOS+1WfO2PjOUa4pmWeme7kOWG/jIFp
         Llb7zNPsr8msxiWzEqBTwVshK0LIA376UKYyOhSK46q83/PGJFgJmbDnluvlVQzLihOB
         y0/KhuMWW6LN0w86fOQe5OioIYTx1PbT9TatJDImH2HmDpeVmKAv3aiFI/5k3qbYSUDZ
         OIZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=zAZ0neRV6mNJvFrH6+X8OnkJIqNx0GDKvK1wQ7DF448=;
        b=G5zYhwRlY9TgGeVeN/jS1I1tFEETxSTRjL0hFZvfIs0UllCQujeImBsmZXTC27kHZU
         LRoE0XlQXf6T1nLCV4JsNHqADui//qvStXq3kYwW/rUUXrbJZnm5gj3kWj9LxpVna3ox
         hbmMkIrejZsTPSHtNsyha8E5HUJ7tTe7N4SaGDLvJzW8QVB/GsaaGZ08fQG5bl38s2Da
         2WZTJbmrsRYdsl/VUN074bPxAYJzMisLMeqJVEXgpwH54Xrzm2+5meogvopBRQTGYECm
         xpUWNQHiqlyD805ZRjNvsrwCmTwSxYFhL5zmuua8Fv5JXf7gbgV+EZ2UV3h/vlTEVKQD
         2P1g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=tZa1c3aW;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id z14-20020a0565120c0e00b0047f750285c2si342327lfu.5.2022.06.27.06.13.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:13:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWp7z6GbrzxxQ;
	Mon, 27 Jun 2022 15:13:35 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:13:35 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 00/20] new-cpu-config + RISC-V Cornerstone
Date: Mon, 27 Jun 2022 15:13:09 +0200
Message-ID: <20220627131329.3659-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=tZa1c3aW;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi,

this is a rebase of "wip/new-cpu-config" branch of Jan. We will need
these patches for RISC-V support, which will land on the list soon.

Basically, this series adds support for both: logical and physical CPU
IDs in Jailhouse.

Thanks
  Ralf

Jan Kiszka (20):
  core: Add internal event check before hypervisor activation
  core: Skip arch_flush_cell_vcpu_caches during setup
  x86: Do not kick targets of vcpu cache flushes
  core: Clarify invocation context of arch_flush_cell_vcpu_caches
  core: Convert config_commit into a unit callback
  arm64: Update unit link order comment and save a line
  arm, arm64: Make GICv3 arm64-only
  x86: Rename CPU_ID_INVALID to APIC_INVALID_CPU
  core: Beautify for_each_cpu helper
  core: Use statically sized cpu sets
  core: Move cell_init() of root cell from init_early to init_late
  core: Change CPU configuration to an array of structures
  driver: Convert to new CPU configuration format
  core: Convert to new CPU configuration format
  tools: Convert to new CPU configuration format
  configs: x86: Convert to new CPU configuration format
  configs: arm: Convert to new CPU configuration format
  configs: arm64: Convert to new CPU configuration format
  core: Optimize parsing of large CPU sets
  RISC-V cornerstone

 configs/arm/bananapi-inmate-demo.c            |  10 +-
 configs/arm/bananapi-linux-demo.c             |  10 +-
 configs/arm/bananapi.c                        |  13 ++-
 configs/arm/emtrion-rzg1e-inmate-demo.c       |   8 +-
 configs/arm/emtrion-rzg1e-linux-demo.c        |   8 +-
 configs/arm/emtrion-rzg1e.c                   |  11 +-
 configs/arm/emtrion-rzg1h-inmate-demo.c       |   8 +-
 configs/arm/emtrion-rzg1h-linux-demo.c        |   8 +-
 configs/arm/emtrion-rzg1h.c                   |  29 ++++-
 configs/arm/emtrion-rzg1m-inmate-demo.c       |   8 +-
 configs/arm/emtrion-rzg1m-linux-demo.c        |   8 +-
 configs/arm/emtrion-rzg1m.c                   |  11 +-
 configs/arm/jetson-tk1-inmate-demo.c          |  10 +-
 configs/arm/jetson-tk1-linux-demo.c           |  13 ++-
 configs/arm/jetson-tk1.c                      |  19 +++-
 configs/arm/orangepi0-inmate-demo.c           |  10 +-
 configs/arm/orangepi0-linux-demo.c            |  13 ++-
 configs/arm/orangepi0.c                       |  19 +++-
 configs/arm/qemu-arm-inmate-demo.c            |  10 +-
 configs/arm/qemu-arm-linux-demo.c             |  13 ++-
 configs/arm/qemu-arm.c                        |  31 ++++-
 configs/arm64/amd-seattle-inmate-demo.c       |   8 +-
 configs/arm64/amd-seattle-linux-demo.c        |  11 +-
 configs/arm64/amd-seattle.c                   |  29 ++++-
 configs/arm64/espressobin-inmate-demo.c       |  10 +-
 configs/arm64/espressobin-linux-demo.c        |  10 +-
 configs/arm64/espressobin.c                   |  13 ++-
 configs/arm64/foundation-v8-inmate-demo.c     |   8 +-
 configs/arm64/foundation-v8-linux-demo.c      |  11 +-
 configs/arm64/foundation-v8.c                 |  17 ++-
 configs/arm64/hikey-inmate-demo.c             |  10 +-
 configs/arm64/hikey-linux-demo.c              |  13 ++-
 configs/arm64/hikey.c                         |  31 ++++-
 configs/arm64/imx8dxl-inmate-demo.c           |   8 +-
 configs/arm64/imx8dxl.c                       |  13 ++-
 configs/arm64/imx8mm-inmate-demo.c            |   8 +-
 configs/arm64/imx8mm-linux-demo.c             |  11 +-
 configs/arm64/imx8mm.c                        |  19 +++-
 configs/arm64/imx8mn-inmate-demo.c            |   8 +-
 configs/arm64/imx8mn-linux-demo.c             |  11 +-
 configs/arm64/imx8mn.c                        |  19 +++-
 configs/arm64/imx8mp-inmate-demo.c            |   8 +-
 configs/arm64/imx8mp-linux-demo.c             |  11 +-
 configs/arm64/imx8mp.c                        |  19 +++-
 configs/arm64/imx8mq-inmate-demo.c            |   8 +-
 configs/arm64/imx8mq-linux-demo.c             |  11 +-
 configs/arm64/imx8mq.c                        |  19 +++-
 configs/arm64/imx8qm-inmate-demo.c            |   8 +-
 configs/arm64/imx8qm-linux-demo.c             |  11 +-
 configs/arm64/imx8qm.c                        |  25 ++++-
 configs/arm64/jetson-tx1-inmate-demo.c        |   8 +-
 configs/arm64/jetson-tx1-linux-demo.c         |  11 +-
 configs/arm64/jetson-tx1.c                    |  17 ++-
 configs/arm64/jetson-tx2-inmate-demo.c        |   8 +-
 configs/arm64/jetson-tx2.c                    |  17 ++-
 configs/arm64/k3-am625-sk-inmate-demo.c       |   8 +-
 configs/arm64/k3-am625-sk-linux-demo.c        |  14 ++-
 configs/arm64/k3-am625-sk.c                   |  17 ++-
 configs/arm64/k3-am654-idk-linux-demo.c       |  11 +-
 configs/arm64/k3-am654-idk.c                  |  17 ++-
 configs/arm64/k3-am654-inmate-demo.c          |   8 +-
 configs/arm64/k3-j7200-evm-inmate-demo.c      |   8 +-
 configs/arm64/k3-j7200-evm-linux-demo.c       |   8 +-
 configs/arm64/k3-j7200-evm.c                  |  11 +-
 configs/arm64/k3-j721e-evm-inmate-demo.c      |   8 +-
 configs/arm64/k3-j721e-evm-linux-demo.c       |   8 +-
 configs/arm64/k3-j721e-evm.c                  |  11 +-
 configs/arm64/ls1028a-rdb-inmate-demo.c       |   8 +-
 configs/arm64/ls1028a-rdb-linux-demo.c        |   8 +-
 configs/arm64/ls1028a-rdb.c                   |  13 ++-
 configs/arm64/ls1043a-rdb-dpaa-linux-demo.c   |  11 +-
 configs/arm64/ls1043a-rdb-inmate-demo.c       |   8 +-
 configs/arm64/ls1043a-rdb-linux-demo.c        |  11 +-
 configs/arm64/ls1043a-rdb.c                   |  19 +++-
 configs/arm64/ls1046a-rdb-inmate-demo.c       |   8 +-
 configs/arm64/ls1046a-rdb-linux-demo.c        |  11 +-
 configs/arm64/ls1046a-rdb.c                   |  19 +++-
 configs/arm64/ls1088a-rdb-inmate-demo.c       |   8 +-
 configs/arm64/ls1088a-rdb-linux-demo.c        |  11 +-
 configs/arm64/ls1088a-rdb.c                   |  29 ++++-
 configs/arm64/ls2088a-rdb-inmate-demo.c       |   8 +-
 configs/arm64/ls2088a-rdb-linux-demo.c        |  11 +-
 configs/arm64/ls2088a-rdb.c                   |  29 ++++-
 configs/arm64/macchiatobin-inmate-demo.c      |  10 +-
 configs/arm64/macchiatobin-linux-demo.c       |  13 ++-
 configs/arm64/macchiatobin.c                  |  19 +++-
 .../arm64/miriac-sbc-ls1046a-inmate-demo.c    |   8 +-
 configs/arm64/miriac-sbc-ls1046a-linux-demo.c |  11 +-
 configs/arm64/miriac-sbc-ls1046a.c            |  17 ++-
 configs/arm64/pine64-plus-inmate-demo.c       |   8 +-
 configs/arm64/pine64-plus-linux-demo.c        |  11 +-
 configs/arm64/pine64-plus.c                   |  17 ++-
 configs/arm64/qemu-arm64-inmate-demo.c        |  10 +-
 configs/arm64/qemu-arm64-linux-demo.c         |  13 ++-
 configs/arm64/qemu-arm64-zephyr-demo.c        |  11 +-
 configs/arm64/qemu-arm64.c                    |  55 ++++++++-
 configs/arm64/rpi4-inmate-demo.c              |  10 +-
 configs/arm64/rpi4-linux-demo.c               |  13 ++-
 configs/arm64/rpi4.c                          |  19 +++-
 configs/arm64/ultra96-inmate-demo.c           |  10 +-
 configs/arm64/ultra96-linux-demo.c            |  13 ++-
 configs/arm64/ultra96.c                       |  19 +++-
 configs/arm64/zynqmp-zcu102-inmate-demo.c     |  10 +-
 configs/arm64/zynqmp-zcu102-linux-demo-2.c    |  10 +-
 configs/arm64/zynqmp-zcu102-linux-demo.c      |  13 ++-
 configs/arm64/zynqmp-zcu102.c                 |  19 +++-
 configs/riscv/qemu-riscv64.c                  |  65 +++++++++++
 configs/x86/apic-demo.c                       |  10 +-
 configs/x86/e1000-demo.c                      |  10 +-
 configs/x86/f2a88xm-hd3.c                     |  19 +++-
 configs/x86/imb-a180.c                        |  19 +++-
 configs/x86/ioapic-demo.c                     |  10 +-
 configs/x86/ivshmem-demo.c                    |  10 +-
 configs/x86/linux-x86-demo.c                  |  13 ++-
 configs/x86/pci-demo.c                        |  10 +-
 configs/x86/qemu-x86.c                        |  19 +++-
 configs/x86/smp-demo.c                        |  16 ++-
 configs/x86/tiny-demo.c                       |  10 +-
 driver/cell.c                                 |  20 +++-
 driver/main.c                                 |  98 +++++++++-------
 driver/main.h                                 |   5 +-
 driver/sysfs.c                                |  20 ++--
 hypervisor/arch/arm-common/Kbuild             |   4 +-
 hypervisor/arch/arm-common/control.c          |  22 ++--
 hypervisor/arch/arm-common/gic-v2.c           |   2 +-
 hypervisor/arch/arm-common/include/asm/gic.h  |   1 -
 .../arch/arm-common/include/asm/iommu.h       |   1 -
 .../arch/arm-common/include/asm/irqchip.h     |   2 -
 hypervisor/arch/arm-common/irqchip.c          |   8 +-
 hypervisor/arch/arm-common/lib.c              |   6 +-
 hypervisor/arch/arm-common/psci.c             |  13 +--
 hypervisor/arch/arm/include/asm/arch_gicv3.h  |  53 ---------
 hypervisor/arch/arm/include/asm/types.h       |   4 +-
 hypervisor/arch/arm/iommu.c                   |   4 -
 hypervisor/arch/arm/traps.c                   |  13 +--
 hypervisor/arch/arm64/Kbuild                  |   9 +-
 .../arch/{arm-common => arm64}/gic-v3.c       |  48 ++++----
 .../arch/arm64/include/asm/arch_gicv3.h       |  30 -----
 .../include/asm/gic_v3.h                      |  10 +-
 hypervisor/arch/arm64/include/asm/ti-pvu.h    |   2 -
 hypervisor/arch/arm64/include/asm/types.h     |   2 +
 hypervisor/arch/arm64/iommu.c                 |   7 --
 hypervisor/arch/arm64/paging.c                |   5 +-
 hypervisor/arch/arm64/smmu-v3.c               |   1 +
 hypervisor/arch/arm64/smmu.c                  |   7 +-
 hypervisor/arch/arm64/ti-pvu.c                |  14 +--
 hypervisor/arch/arm64/traps.c                 |   2 +-
 hypervisor/arch/riscv/Kbuild                  |  17 +++
 hypervisor/arch/riscv/Makefile                |  13 +++
 hypervisor/arch/riscv/asm-defines.c           |  19 ++++
 hypervisor/arch/riscv/control.c               |  78 +++++++++++++
 hypervisor/arch/riscv/dbg-write.c             |  17 +++
 hypervisor/arch/riscv/entry.S                 |  17 +++
 hypervisor/arch/riscv/include/asm/bitops.h    |  37 ++++++
 hypervisor/arch/riscv/include/asm/cell.h      |  24 ++++
 hypervisor/arch/riscv/include/asm/control.h   |   0
 .../smmu.h => riscv/include/asm/ivshmem.h}    |  10 +-
 .../arch/riscv/include/asm/jailhouse_header.h |  14 +++
 hypervisor/arch/riscv/include/asm/mmio.h      |   0
 hypervisor/arch/riscv/include/asm/paging.h    |  54 +++++++++
 .../arch/riscv/include/asm/paging_modes.h     |   0
 hypervisor/arch/riscv/include/asm/percpu.h    |  23 ++++
 hypervisor/arch/riscv/include/asm/processor.h |  33 ++++++
 hypervisor/arch/riscv/include/asm/sections.h  |  14 +++
 hypervisor/arch/riscv/include/asm/spinlock.h  |  27 +++++
 hypervisor/arch/riscv/include/asm/types.h     |  14 +++
 hypervisor/arch/riscv/ivshmem.c               |  29 +++++
 hypervisor/arch/riscv/lib.c                   |  19 ++++
 hypervisor/arch/riscv/paging.c                |  23 ++++
 hypervisor/arch/riscv/pci.c                   |  49 ++++++++
 hypervisor/arch/riscv/setup.c                 |  32 ++++++
 hypervisor/arch/x86/amd_iommu.c               |   4 +-
 hypervisor/arch/x86/apic.c                    |  24 ++--
 hypervisor/arch/x86/cat.c                     |   5 +-
 hypervisor/arch/x86/control.c                 |  26 ++---
 hypervisor/arch/x86/include/asm/apic.h        |   4 +-
 hypervisor/arch/x86/include/asm/control.h     |   4 +-
 hypervisor/arch/x86/include/asm/ioapic.h      |   4 +-
 hypervisor/arch/x86/include/asm/iommu.h       |   2 -
 hypervisor/arch/x86/include/asm/types.h       |   4 +-
 hypervisor/arch/x86/ioapic.c                  |   4 +-
 hypervisor/arch/x86/iommu.c                   |   4 +-
 hypervisor/arch/x86/svm.c                     |   6 +-
 hypervisor/arch/x86/test-device.c             |   3 +-
 hypervisor/arch/x86/vmx.c                     |   4 +-
 hypervisor/arch/x86/vtd.c                     |   4 +-
 hypervisor/control.c                          | 106 +++++++++---------
 hypervisor/include/jailhouse/cell.h           |   8 +-
 hypervisor/include/jailhouse/control.h        |  31 +++--
 hypervisor/include/jailhouse/pci.h            |   4 +-
 hypervisor/include/jailhouse/percpu.h         |   4 +-
 hypervisor/include/jailhouse/processor.h      |   4 +-
 hypervisor/include/jailhouse/types.h          |  14 +--
 hypervisor/include/jailhouse/unit.h           |   7 +-
 hypervisor/pci.c                              |  11 +-
 hypervisor/setup.c                            |  22 ++--
 include/arch/riscv/asm/jailhouse_hypercall.h  |  68 +++++++++++
 include/jailhouse/cell-config.h               |  22 ++--
 inmates/demos/riscv/Makefile                  |   0
 inmates/lib/riscv/Makefile                    |   0
 inmates/tests/riscv/Makefile                  |   0
 inmates/tools/riscv/Makefile                  |   0
 pyjailhouse/config_parser.py                  |  13 ++-
 pyjailhouse/sysfs_parser.py                   |  20 +++-
 scripts/include.mk                            |   3 +
 tools/jailhouse-config-create                 |  14 +--
 tools/root-cell-config.c.tmpl                 |  15 ++-
 207 files changed, 2206 insertions(+), 848 deletions(-)
 create mode 100644 configs/riscv/qemu-riscv64.c
 delete mode 100644 hypervisor/arch/arm/include/asm/arch_gicv3.h
 rename hypervisor/arch/{arm-common => arm64}/gic-v3.c (95%)
 delete mode 100644 hypervisor/arch/arm64/include/asm/arch_gicv3.h
 rename hypervisor/arch/{arm-common => arm64}/include/asm/gic_v3.h (94%)
 create mode 100644 hypervisor/arch/riscv/Kbuild
 create mode 100644 hypervisor/arch/riscv/Makefile
 create mode 100644 hypervisor/arch/riscv/asm-defines.c
 create mode 100644 hypervisor/arch/riscv/control.c
 create mode 100644 hypervisor/arch/riscv/dbg-write.c
 create mode 100644 hypervisor/arch/riscv/entry.S
 create mode 100644 hypervisor/arch/riscv/include/asm/bitops.h
 create mode 100644 hypervisor/arch/riscv/include/asm/cell.h
 create mode 100644 hypervisor/arch/riscv/include/asm/control.h
 rename hypervisor/arch/{arm64/include/asm/smmu.h => riscv/include/asm/ivshmem.h} (60%)
 create mode 100644 hypervisor/arch/riscv/include/asm/jailhouse_header.h
 create mode 100644 hypervisor/arch/riscv/include/asm/mmio.h
 create mode 100644 hypervisor/arch/riscv/include/asm/paging.h
 create mode 100644 hypervisor/arch/riscv/include/asm/paging_modes.h
 create mode 100644 hypervisor/arch/riscv/include/asm/percpu.h
 create mode 100644 hypervisor/arch/riscv/include/asm/processor.h
 create mode 100644 hypervisor/arch/riscv/include/asm/sections.h
 create mode 100644 hypervisor/arch/riscv/include/asm/spinlock.h
 create mode 100644 hypervisor/arch/riscv/include/asm/types.h
 create mode 100644 hypervisor/arch/riscv/ivshmem.c
 create mode 100644 hypervisor/arch/riscv/lib.c
 create mode 100644 hypervisor/arch/riscv/paging.c
 create mode 100644 hypervisor/arch/riscv/pci.c
 create mode 100644 hypervisor/arch/riscv/setup.c
 create mode 100644 include/arch/riscv/asm/jailhouse_hypercall.h
 create mode 100644 inmates/demos/riscv/Makefile
 create mode 100644 inmates/lib/riscv/Makefile
 create mode 100644 inmates/tests/riscv/Makefile
 create mode 100644 inmates/tools/riscv/Makefile

-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627131329.3659-1-ralf.ramsauer%40oth-regensburg.de.
