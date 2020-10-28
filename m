Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBHF4476AKGQEPX46LVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F3729D237
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 22:09:49 +0100 (CET)
Received: by mail-wr1-x438.google.com with SMTP id 33sf329344wrf.22
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 14:09:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603919389; cv=pass;
        d=google.com; s=arc-20160816;
        b=IUAb8saNZ5Tlpm5jm+q7RXu5Zpa9OE/sOhRUv6OIou/MieMJ0ztXppTkTyySZuzwZc
         EMqgG+P6e4ZXb7TVtlNx2rHc+8t7yg+3GPXpmzcC0UaYhD9VNuMFrUUMmtBxBLt0JXYk
         XQ1grBLqw5BESqRmITVoTLF/QZn8emtc2DnHmR+Rgqrt0erObYI9YvQFmQxmfH8DZ+KU
         HmdcY1vLUEQQr5DpZFT5RRpClaMZHtMutlFF0mFTXqCYwJk/8Ow2TMhQuRI8wN+kE2RM
         VI0sQ19XitLWKPS0+/PenZ7O3B40qyjb94+5duV9sTsKit322sZzMHAUk5OeX0Bk0/Uj
         xHtQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:to:from:sender:dkim-signature;
        bh=inCiciJkKtXDkXpLPnTsn4RJ9T543WAbJYKibWHde7A=;
        b=DGmppTxC+3Uuf6QZhj0RI7GifnvWHtg7aDyPsxBtb6Xe/x9wfNi5HI5l/TqMVjxifn
         6iQNpGlu2K1aaMKaI0bAkpaEhEq0nNWVQkug3fqH6EMUQxtr8wWeqYZwRpnI793wmuJL
         Sk5h4kqknkWrt7Z7D6JNvUDY4cHtk00q/2KkpDBXjzJT2htdWg9ZWuEi3ictOZMNYac6
         0J5N1E3AwvTKUrsCRU8+MpMtz/cejGfW/VNcinuho1lfyZ5UacEUmr3bmMC4tP77D5wS
         HaFr4g1mqjQ9H7MKVVoPTAyL8xKczqT+hHqgjBJ+1WKPEY7iX0H4hgXQt7/RetGUB6Pq
         I54g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=Ny3iSMPo;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=inCiciJkKtXDkXpLPnTsn4RJ9T543WAbJYKibWHde7A=;
        b=qtXe1EH3fq34f++CNn9bXmxZLdbdh1sCnBI3w61sI5wTcitTQhibUDDeeNUenVXntR
         Rt7iHCQ/Awl99kZ6L5pL9jnCLWPUkfL7hMAiqJLxSLmJOe9IiPNmuz9+GGvpNN9sgkyE
         5abMhu14VD71wOYhv3qUPDGy+nygFOLk7Zfb0bf0j0nCKGxGFjR9/64AowPRJCgYA9Pk
         dLwf3CxsDFbKfiftUbdy1HUsEdV0uQB3kB3PQ32Uy7X7drF0NGQqxg8qAz/3XVTkHCcF
         e/1pnkU9Gu/yM69BvZ6S5g7YGy8z+zlZGzSHberu1QZCWtEYiCYSmMG2AJGlObRe+vRN
         fnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=inCiciJkKtXDkXpLPnTsn4RJ9T543WAbJYKibWHde7A=;
        b=Le6fHdjxlxgT4G4+zNuG4PPy1dTvv90SyOAuqJCv5qwSgYd7Ybd1H+ZTmSbCGih9cE
         yNuWo3OEPHjZUh/0B0XJWu6qD+hxcfUotENHiTqvRBa/Ciznf4YWE1HLQt2P9Qs8gXQe
         My8LCPeK66QmZxDtt8sCgfiIWJvfC/MOzK5or4aw4Eh8MdC1HtCUa/6DhG3Rru20jXts
         VEg5FWQANRrs/faBqGMm2WCT/WXVfSNZQCQtYdJY8pGpgXdDVrq0ZMyo4oExqUVj2WiM
         ad9ezO76c/tJZfU1R2maC5lmNYNka9StK4fb+Fy9YBxEkQ7LjHQ7OzdyY0mE6LeLcHVL
         eSsA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533aO3U2jbGiaEqeUx+Ts3FsoAqBoJYBUA7VhRdnZzJ7k1vy3u+K
	X/7J8xPX5AEAAELBxlo1gvw=
X-Google-Smtp-Source: ABdhPJzfyna7DMNyr9KGtGcx6NlEwz1uG/69lf6pLVVX8L81H8pcpCdH/fO8xCuLmFDUey+rHi9rjg==
X-Received: by 2002:a1c:6489:: with SMTP id y131mr759382wmb.107.1603919389018;
        Wed, 28 Oct 2020 14:09:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:6886:: with SMTP id d128ls206718wmc.2.canary-gmail; Wed,
 28 Oct 2020 14:09:48 -0700 (PDT)
X-Received: by 2002:a1c:9a49:: with SMTP id c70mr745928wme.117.1603919388151;
        Wed, 28 Oct 2020 14:09:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603919388; cv=none;
        d=google.com; s=arc-20160816;
        b=OMxxT0HPca6N4bs49UTzVqniCMWYLxWwU4Ows11XlrM+83pxleIZqn1CXaooq7pBda
         N31Qa6F5d/0WCFSogfuC6TWHSmHoczPw4XvZfBlvS/ISeqdyQrU4NJVkLEdRofXrj8ax
         tkINlQ16pzB40HDVmDI+DCIotsdh6KsB/u24oZnAuTPGm232P3jGIHGGHZcbrUn5Vd0E
         E4zQxlRBGRh2CJ65aj7Dwu0RK45bKsL6X5GrFF417ct7QX/CVPFwVdm6/cErc3/chPZO
         9wgadvgjM6gYUD23rxUs+Xykt9t6wAv+m1juSgPC7+nV1o0az8CxhtwMEgsoyBRZepeW
         7jIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:dkim-signature;
        bh=srpJPUNWfBafQTQqG7fKEDED5wUdtcRnqMC19lq4Y3E=;
        b=h8dsj+qSTCAKX2iECi4+o1LvKzZTUPcSoj/F10c8Rn0jIfPbakrMcArJ2Y4DWBquMy
         RJlXytS7u0WyEcytDEjU+V+d15eLO3A/wdm9VwqcnnTJbRuGJh53sZ/oyPRe38in3BF2
         4pooLzCdr0/5r6KEpXg7mrfnhmy23eLiieFELtWy+GTFdKx12To+SyGwxpFhN1U+5ItZ
         u4fmmPYAC3NNZqq5nbZC/WhugtOp7ZUd79pic0It4HNRyQwuwyCG1yAxBBxBjAcinA0t
         ED/ma7mo1+fvJ4u+6hYO+ifsniAwnu5F6xynFO7O2jBmzBHslpPXC3MoJGmduzeQ74pH
         HtjA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=Ny3iSMPo;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id k3si16525wrl.5.2020.10.28.14.09.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 14:09:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CM1Rb6w5mzyWr
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:47 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.878
X-Spam-Level: 
X-Spam-Status: No, score=-2.878 tagged_above=-999 required=5
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
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_SPF=0.001, LRZ_TO_SHORT=0.001]
	autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id Tqloxo06Og2D for <jailhouse-dev@googlegroups.com>;
	Wed, 28 Oct 2020 22:09:47 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CM1Rb34cvzyWR
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:47 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v3 00/22] Extend hypervisor compile warning set
Date: Wed, 28 Oct 2020 22:09:11 +0100
Message-Id: <20201028210933.138379-1-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=Ny3iSMPo;       spf=pass
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

Thanks for the previous review.

In this version, the unused-parameter is suppressed by default as soon
as Wextra is added. The warnings that can be triggered by Wextra are
manually listed with Wno-error. Eventually, all Wno-error are removed.

Thanks,
Andrea

Andrea Bastoni (22):
  hypervisor: Makefile: hook-in Wextra
  hypervisor: add wordsize dependent size_t type
  hypervisor, arm-common: provide an explicit uint INVALID_CPU_ID
  hypervisor: mmio: fix Wsign-compare by casting index to u32.
  hypervisor: printk: Fix Wsign-compare in align()
  inmates: lib: fix align() in printk similarly to the hypervisor
  hypervisor: Wsign-compare: force the "right" promotion direction
  arm-common: paging: fix old style declaration
    (-Wold-style-declaration)
  arm-common: provide unsigned int PSCI_INVALID_ADDRESS
  arm-common: gic*: use uint instead of int when needed (Wsign-compare)
  arm, arm-common: Wsign-compare: arm_dcaches_flush(): take unsigned
    long as size
  arm64: smmu-v3: use uint instead of int when needed (Wsign-compare)
  arm64: smmu-v3: rename 'i' -> 'n', 'j' -> 's'
  arm64: ti-pvu: fix Wsign-compare by casting size to u64.
  arm64: smmu: Wsign-compare: make iterator uint
  x86: fix simple Wsign-compare warnings
  x86: apic: Wsign-compare change to uint and update comparison check
    accordingly
  x86: cat: fix Wsign-compare
  x86: vtd: fix Wsign-compare
  x86: vcpu: force cast to prevent Wsign-compare
  x86: introduce EXCEPTION_NO_ERROR to avoid int to uint comparison on
    error frame
  hypervisor: Makefile: remove Wno-error from CFLAGS

 hypervisor/Makefile                           |  7 ++--
 hypervisor/arch/arm-common/gic-v2.c           | 18 ++++-----
 hypervisor/arch/arm-common/gic-v3.c           | 10 ++---
 .../arch/arm-common/include/asm/dcaches.h     |  2 +-
 hypervisor/arch/arm-common/include/asm/psci.h |  2 +-
 hypervisor/arch/arm-common/lib.c              |  2 +-
 hypervisor/arch/arm-common/paging.c           |  4 +-
 hypervisor/arch/arm-common/psci.c             |  4 +-
 hypervisor/arch/arm/mmu_hyp.c                 |  4 +-
 hypervisor/arch/arm64/smmu-v3.c               | 39 ++++++++++---------
 hypervisor/arch/arm64/smmu.c                  | 17 ++++----
 hypervisor/arch/arm64/ti-pvu.c                |  2 +-
 hypervisor/arch/x86/apic.c                    |  4 +-
 hypervisor/arch/x86/cat.c                     |  3 +-
 hypervisor/arch/x86/control.c                 |  2 +-
 hypervisor/arch/x86/entry.S                   |  3 +-
 hypervisor/arch/x86/include/asm/processor.h   |  2 +
 hypervisor/arch/x86/paging.c                  |  2 +-
 hypervisor/arch/x86/svm.c                     |  2 +-
 hypervisor/arch/x86/vcpu.c                    |  2 +-
 hypervisor/arch/x86/vtd.c                     | 11 +++---
 hypervisor/control.c                          |  3 +-
 hypervisor/include/jailhouse/control.h        |  5 ++-
 hypervisor/include/jailhouse/string.h         |  5 ++-
 hypervisor/include/jailhouse/types.h          |  6 +++
 hypervisor/lib.c                              |  5 +--
 hypervisor/mmio.c                             |  2 +-
 hypervisor/pci.c                              |  3 +-
 hypervisor/printk.c                           |  5 ++-
 hypervisor/setup.c                            |  4 +-
 inmates/lib/printk.c                          |  5 ++-
 31 files changed, 102 insertions(+), 83 deletions(-)

-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201028210933.138379-1-andrea.bastoni%40tum.de.
