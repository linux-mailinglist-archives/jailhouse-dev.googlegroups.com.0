Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBFPGXKAAMGQEKRRJEFA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E1F302488
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 13:01:25 +0100 (CET)
Received: by mail-wr1-x439.google.com with SMTP id x12sf7666098wrw.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 04:01:25 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611576085; cv=pass;
        d=google.com; s=arc-20160816;
        b=wys69wvKpy+aP4lut3QVGbU9ZWGV4K+EpiVGuStnHntjotHiYBXHa5YA0TbWzIkmnj
         EGjm0gUl85qPms6NHeAqYXjOAQRKDxw1IyAhoe0s6a8WuZKBk3abvTjdZv4G66pWWKB/
         Tjkl6CcnA2jyVUS8sIGoIODWoliSzL54uCIPqTXlGPyJskpnvczBuiE082JLuBYf6EP5
         MVOw7NpHlduvQ1FQlNe4WFWPXXY6cwVzhOX0sw0hvTXJeiiR1ZmoDtms5JzqcC4x0f2K
         ga3snHLU+YBdCDZoO+wQOn1SrjnrA5MG/F16vfRXqDA3rrftU2480cUq4tHmIY+ZczMc
         TVag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:sender
         :dkim-signature;
        bh=s9WM9yiz2n6nEMpCqahDCgubvjUKgzLwSwGVecs92es=;
        b=g2gBKvYTMKSp6bQ7lb6xSCaWDFvtpiLKOhuHmdo981/gaaqsRjltHK/aHDR/4646AK
         YTIWUcz1e/dg0FRQfhX6ZuBAMCWJ5S3ziEp63RMjpVYryh2ELMlpOlU5RMGwU12l6ONK
         brT3NjDQjCN0d47T/SPB13f2aGmFd2qzS/fA2n+QtyqF2GYgX6gOvlW0nNcGbcdkEgSp
         KZmxuYWLSjRwIZUBsRp5RdXZACOlYvzP3RGPDQyX2b54xpgO1h5vzP7gKq3yr71EjkWP
         onP3k/nZ99MxIlheUcwBbAxgDLnbAsnCdXk7fdOjc9rGaKgpfHsLAAPZ16JCV3X6QEAn
         GdVg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=Q0CRqGeA;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=s9WM9yiz2n6nEMpCqahDCgubvjUKgzLwSwGVecs92es=;
        b=oqAj7xyV1NaXTrMOicabQYCxQXuhSz432fpx+M0IvjO3ULVuQczdgTe1/Ev//omhhG
         DDcESAngx//kjRJYOIMHR2xBOhYdHhm5k/8S1KuMZu8R/AUGqO7Zl5vGfvbvQHSStf6Q
         bzL6aNwUOi7nz06tYcIZs5zw6sjjUrprkQ3XYio2DE9K1PbUucAJqvIFT4c7yxL6V1mD
         +z730RzL0244xUcW/SIlbw2Bi4EWNEafDVoGxFgPOpofzT+J1zQtoemFQtGhr1BxSq/b
         /ExRBywWGUgvcVZUM09ZCBZgxJGEkpzUaidQ3lF36OyXwFsQkHZ/jmGmcPV8oeMfOtAS
         ObHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=s9WM9yiz2n6nEMpCqahDCgubvjUKgzLwSwGVecs92es=;
        b=eZQl9Fd+7lltdbvk3StBBsoxGZ/knX40L7OnmL42fYrJjwbwbfodAOQGa/w7fLeCsX
         RINVRvv08j0vmIa5AGAyQPdgN9NrGmylB5rHbe0YFCX8PH95yeGzd7YfDG+ntRsZQm1q
         IKq/xCJ+YvOOxIyUslCKGh4qgJk6aFFaQ80E0vqaP0v7KvMwP5b81RVs/IjB7Xj+ZPAy
         nR8KUtgu0jkTwZ7pKpQF9d5fT5hbPstbZccB/29BGkaVxzvVrlu76meMCzFLgtb8z1Yh
         myuB22a1N3GpmHQlim37836Ee38nd0C4oXpcgnN23yXrhIN8P2mYUm4ZhUAuyQsMWoro
         9w7w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530h0zPImB1/sgAYQsuab2MJO47UKp6dZ2tcLc5jaY4eJIvXkQ5e
	Wn5xv2uduLgny2r9WZhIy6U=
X-Google-Smtp-Source: ABdhPJwfET0A8j1TTcfhRlPohOp67aoYmkauNHpoe+LRNiC/AR3LayxkuiuoIWpOXS8DKcyZ6jp8XQ==
X-Received: by 2002:a1c:a9ce:: with SMTP id s197mr24239wme.146.1611576085390;
        Mon, 25 Jan 2021 04:01:25 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e608:: with SMTP id p8ls95069wrm.2.gmail; Mon, 25 Jan
 2021 04:01:24 -0800 (PST)
X-Received: by 2002:a05:6000:1ce:: with SMTP id t14mr526852wrx.297.1611576084607;
        Mon, 25 Jan 2021 04:01:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611576084; cv=none;
        d=google.com; s=arc-20160816;
        b=t3wKUg6PUz+Jp1flfJhqGp4QX3IP1h/cZ1EqNifBiZt5y/P1AajlgD8JopPKcilLkR
         ehUkaOEpa5DFYPRR0ZKPieqvVPGaAWCfZqDzuV7tIC+eWhc3KNUlaepx3Jcaog+IyWAd
         oTDDH0P75FmHso0s73obbGC+NZHi4FhbCWlnW+lHCRyTgYKkU67lS7FYvVAVTgugRm78
         uEDES1aqjccXm2cpv+L3kPp7PSddr2GQ1dCF/P3RF+Q/UxD37XCXw2F+XQm4MIJYrSYS
         xxlG6AV9hFYIeOblzvYaY92fgXfpeSLFaEM7m5sRjs1A4qm5hqcJf7xU113Sh8GQNwy3
         Oglw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=IvNEfgnu+YCSsSSdAz247ZFc+IdHVh0vBQ0+TtjZ7fw=;
        b=oEA+i6Ajmk2GoVJ/LKP3R668vI2b8/+KIGnE416fixfjQPEOVrmdBTlq6kIWFZsosh
         qdpTgNRisf84IVBjiDXY4jJSZqnaNLPsGKp3u6KNi0CUBzL5O7jGuga6Ah3aF74Ne51W
         vUu8p8e0HTS77irno2APggOFFJ2DiVD/EA7cL2gbm1Yrpnor1U7U4vjHZQ2Dr4NnOrfm
         wHlmOPLhzO06fALPxdbmHpLmrgag36/Yr7eL6JGHnoCGI5OWfVpOfCdCNdyNfrrlemXR
         Cleiev8W7PYUyZZRSFsBpoSXLjSik5LW73DOufCIPd1r1Q5bMKy9YlMaYfh/rXrOmtKE
         LeWQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=Q0CRqGeA;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id b5si276472wrd.4.2021.01.25.04.01.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jan 2021 04:01:24 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4DPT3m23JXzydb;
	Mon, 25 Jan 2021 13:01:24 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.876
X-Spam-Level: 
X-Spam-Status: No, score=-2.876 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_SPF=0.001, LRZ_HAS_URL_HTTP=0.001,
	LRZ_URL_HTTP_DOUBLE=0.001, LRZ_URL_PLAIN_SINGLE=0.001]
	autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id 35EZJoMNcTd4; Mon, 25 Jan 2021 13:01:23 +0100 (CET)
Received: from kabal.lan (ip5f5ac6e3.dynamic.kabel-deutschland.de [95.90.198.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4DPT3l23nHzyd8;
	Mon, 25 Jan 2021 13:01:23 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v1 00/23] Cache-coloring for Jailhouse
Date: Mon, 25 Jan 2021 13:00:21 +0100
Message-Id: <20210125120044.56794-1-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=Q0CRqGeA;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

Hi Jan,

Here a proof of concept for the cache-coloring with/without driver approach=
 (works, but hasn't been tested as much as the old version, and we have see=
n at least one crash in our tests, but it should be sufficient to have a di=
scussion about the direction).

The patches until 0018-configs-arm64-add-coloring-example-for-qemu-arm64.pa=
tch implement the previous coloring approach (+ bugfixing + qemu-arm64 inte=
gration). The patches from 0019-config-always-rely-on-the-availability-of-w=
ay_size.patch are the proof of concept to realize a colored jailhouse iorem=
ap in the driver, keeping the same logic between the hypervisor and the dri=
ver.

The "get_bit_range()" is refactored in a single place already (0020-colorin=
g-extract-get_bit_range-logic-and-remove-offs.patch), but the main logic ne=
eds to be replicated between hypervisor and driver [*], coloring.c doesn't =
get considerably shorter, and control.c gets more complicated because we ne=
ed to distinguish when the remapping is colored and when it's not.

Most of the code reduction comes from the removal of the cache_layout autod=
etection, which is "debug only" (and could have been removed in the previou=
s version as well).

Overall I count for the previous approach (patches 01 - 18):
 42 files changed, 1337 insertions(+), 121 deletions(-)
For the new one (patches 01 - 23):
 41 files changed, 1233 insertions(+), 127 deletions(-)

I've also pushed both versions here (if it's easier for you to take a look)=
:
old: https://gitlab.com/bastoni/jailhouse/-/commits/for_upstream/202101_col=
oring
new: https://gitlab.com/bastoni/jailhouse/-/commits/for_upstream/202101_col=
oring_driver

Thanks,
Andrea

[*]: There's the possibility to consolidate the double loop preserving the =
logic and taking a pointer to the function + arguments to call, but we want=
ed first to show the full logic.

Andrea Bastoni (20):
  arm-common: bitops: add most-significant-bit operation
  hypervisor, driver, archs: add basic empty infrastructure for coloring
  hypervisor: arm64: add cache coloring implementation
  hypervisor configuration: hook autodetection for coloring_way_size
  configs: arm64: add example configuration for colored ZCU102 inmate
  hypervisor: protect inclusion of control.h
  hypervisor, driver: add platform information to configure coloring
    params
  configs: arm64: hook-in coloring parameters for ZCU102
  hypervisor: provide runtime assert() helper for DEBUG only
  hypervisor: provide implementation for __assert_fail() and group
    panic-related functions
  hypervisor: coloring: use assert instead of "BUG"
  hypervisor: coloring: make cache autodetection debug-only
  arm64: coloring: panic if a coloring operation is requested but
    way_size is not configured
  coloring: config: use u64 for the color bitmask
  configs: arm64: add coloring example for qemu-arm64
  config: always rely on the availability of way_size
  coloring: extract get_bit_range() logic and remove offset dependency
  configs: remove color offsets for remapping
  driver: coloring: add colored version of ioremapping
  hypervisors: identify when using colored/non-colored (re/un)map for
    root cell

Luca Miccio (3):
  Documentation: add description and usage of cache coloring support
  pyjailhouse: add support for colored regions
  coloring: fix physical start address computation

 Documentation/cache-coloring.md               | 198 ++++++++++++++++++
 configs/arm64/qemu-arm64-inmate-demo-col.c    | 134 ++++++++++++
 configs/arm64/qemu-arm64.c                    |   3 +
 configs/arm64/zynqmp-zcu102-inmate-demo-col.c |  75 +++++++
 configs/arm64/zynqmp-zcu102.c                 |   3 +
 driver/cell.c                                 |  16 +-
 driver/main.c                                 |  75 +++++++
 driver/main.h                                 |   4 +
 hypervisor/Makefile                           |   2 +-
 hypervisor/arch/arm-common/control.c          |   1 +
 .../arch/arm-common/include/asm/bitops.h      |  10 +
 .../arch/arm-common/include/asm/dcaches.h     |   8 +
 hypervisor/arch/arm-common/mmu_cell.c         |  52 +++--
 hypervisor/arch/arm/control.c                 |   1 +
 hypervisor/arch/arm/include/asm/coloring.h    |  59 ++++++
 hypervisor/arch/arm/traps.c                   |   1 +
 hypervisor/arch/arm64/Kbuild                  |   1 +
 hypervisor/arch/arm64/coloring.c              | 144 +++++++++++++
 hypervisor/arch/arm64/control.c               |   1 +
 hypervisor/arch/arm64/include/asm/coloring.h  | 120 +++++++++++
 hypervisor/arch/arm64/setup.c                 |   3 +
 hypervisor/arch/arm64/traps.c                 |   1 +
 hypervisor/arch/x86/amd_iommu.c               |   1 +
 hypervisor/arch/x86/control.c                 |   1 +
 hypervisor/arch/x86/efifb.c                   |   1 +
 hypervisor/arch/x86/include/asm/coloring.h    |  45 ++++
 hypervisor/arch/x86/ioapic.c                  |   1 +
 hypervisor/arch/x86/svm.c                     |   1 +
 hypervisor/arch/x86/vmx.c                     |   1 +
 hypervisor/control.c                          | 129 +++++-------
 hypervisor/include/jailhouse/assert.h         |  37 ++++
 hypervisor/include/jailhouse/control.h        |  34 +--
 hypervisor/include/jailhouse/panic.h          |  40 ++++
 hypervisor/include/jailhouse/printk.h         |   4 +
 hypervisor/panic.c                            |  86 ++++++++
 hypervisor/pci.c                              |   1 +
 hypervisor/printk.c                           |   1 +
 hypervisor/uart.c                             |   1 +
 include/jailhouse/cell-config.h               |   9 +
 include/jailhouse/coloring.h                  |  46 ++++
 pyjailhouse/config_parser.py                  |   9 +-
 41 files changed, 1233 insertions(+), 127 deletions(-)
 create mode 100644 Documentation/cache-coloring.md
 create mode 100644 configs/arm64/qemu-arm64-inmate-demo-col.c
 create mode 100644 configs/arm64/zynqmp-zcu102-inmate-demo-col.c
 create mode 100644 hypervisor/arch/arm/include/asm/coloring.h
 create mode 100644 hypervisor/arch/arm64/coloring.c
 create mode 100644 hypervisor/arch/arm64/include/asm/coloring.h
 create mode 100644 hypervisor/arch/x86/include/asm/coloring.h
 create mode 100644 hypervisor/include/jailhouse/assert.h
 create mode 100644 hypervisor/include/jailhouse/panic.h
 create mode 100644 hypervisor/panic.c
 create mode 100644 include/jailhouse/coloring.h

--=20
2.29.2

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20210125120044.56794-1-andrea.bastoni%40tum.de.
