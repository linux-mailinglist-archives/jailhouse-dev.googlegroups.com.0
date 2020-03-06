Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCMTRLZQKGQEHQVEUDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E27217C47D
	for <lists+jailhouse-dev@lfdr.de>; Fri,  6 Mar 2020 18:34:02 +0100 (CET)
Received: by mail-wr1-x43a.google.com with SMTP id x14sf1291928wrv.23
        for <lists+jailhouse-dev@lfdr.de>; Fri, 06 Mar 2020 09:34:02 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1583516042; cv=pass;
        d=google.com; s=arc-20160816;
        b=BGRqdkWSrDTdxSnObbqb8SUsVtYbj3GiEEFEAsKY9viu5i952vooq47GfUDcKqBW7k
         +R5d7fnHfcfQBZXsHGafWw2WK7w9GyLlplbpUL4xQSRKxJhfoDqIKDW3V4Q6uFplVZdw
         zW5FoAmEeIfPJ8b7L5zwv81ZXm9RtpCqmh6a+nlQJcFMm9fKt0hXZLICvDRCYvaJR6f6
         mXTKoyepMtgTxKqS7Ei6FSzw/bnJ9S0h3V503QxNbghFkjiQzmgVmzUuVoVRFfLLgL3d
         xPQr3e8p7VaHaE3nItVut0xjHVMKrax/KMiMkxERKoJbU6AZBa6ZGY66nsZ2rBi4NkzQ
         dRoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:to:from
         :mime-version:sender:dkim-signature;
        bh=p94D2UV5TFwkNVwjbktSt9VhMNUtTP6/zc98Z4mwPT0=;
        b=KS0TEqi9KaYI65PNjktcv2atRZEtwr+22q6kE7Fg2SKosFP36YUBZEiCgPq6H7F0mT
         QYMWpiAhs4st6GkJpMy0+lBKaWgya1z76CSlwy1q66wNWVz/IUCo7JL4KL1hdXPZ8w/9
         z6jZazUsuDVWYBRemCzBQbbW7pjjQ4O1QaPvGpgD5Z4LVMMC3YCNrne/5y8Rgk4UW/VU
         g/3uZdOpUqfs5RK8pr4RW8SsFcMAAmQLpPpQgYk+0SGWH8DZomnHlvI03yGFgEGxwtQG
         4OVD19qUG9FlyY/plZtxqKLeEwQfahE36ggXkGJYPFSTPz7SFnR7C16WDSDaujaSazdM
         3k4Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=p94D2UV5TFwkNVwjbktSt9VhMNUtTP6/zc98Z4mwPT0=;
        b=DRUUiCxfnBLs8wgF0XOuaVkz/NHlldGhHR2yV7yq54lT1ticRQ2pH3L0c6Zjnd/VqN
         srT+ECF1Dd0XzidfY2B+fmwIflilojQ9+2SP6PDZOv6b8xYM1fD/gjvmh25ie0qYX/FI
         Jvh9tK+qrmw4+zSz3ZKkk2+rNd5QhHD6UxR32KMRUIB1PFE3IgnJN6nNRbOSo9Q6ymt5
         hKl1bYXG7cvINAwRFBZuOLJk4kzrLDxtznk7In/vtm30h41jqJxotDNUwICkCUkdWb0s
         F2LrKoIrdhVTWI1fcgPiDnnzw3GSYrYezEOYS5C/z1CglD4qLCwduWBl2euvpiqFR3nn
         r4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=p94D2UV5TFwkNVwjbktSt9VhMNUtTP6/zc98Z4mwPT0=;
        b=gLxw65E1OlmMQ8b5PknCrLKkkzlriOoPk+tDmt52eVgzgg4PnVlrvphAckQWlJjSbA
         Uu3AgipSSZ/oR3AkWPFMLy+HrI93dmDYNQn0ZT2zM1XszmhjWHKZWpeTpryT53s9yhT4
         h8Ke4/KICkmBZ0XoTawNqXDkVqtb8Lm7xWmmUnyFHOGGJSIx1e2aO++aUDeWgQUmK8O8
         J+PSHRUA6utmqtll77pYy2YGaMlj/Mer8t6aN1iAZUzNxff3k/dUnTp04Vh1kPFvSmfk
         oY1lsXYHwwOWQE5rcae2BVM6Jg+Tck85gEKqhgk1trv1nnQliElw3A1I50GcXhZjN+vt
         CFVw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ2o+i1p5EZWxEIw75lBBtiZv4Q665pmkbY2/c1HZTOW1IFNNPSR
	q0hSU+F4vihk2iSKKj2qSfE=
X-Google-Smtp-Source: ADFU+vt4FqqqzcvaKKK1hxct+LADgIghor5v1uBW3CG+JYR+4x5oVub42Fe8R3Ek/UNXdWaRQWVf/g==
X-Received: by 2002:adf:edd0:: with SMTP id v16mr5293374wro.357.1583516041932;
        Fri, 06 Mar 2020 09:34:01 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:208f:: with SMTP id g137ls2016772wmg.1.gmail; Fri, 06
 Mar 2020 09:34:01 -0800 (PST)
X-Received: by 2002:a7b:c41a:: with SMTP id k26mr5156789wmi.111.1583516041034;
        Fri, 06 Mar 2020 09:34:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583516041; cv=none;
        d=google.com; s=arc-20160816;
        b=vZ2D1clxjM5735h5CnBGYHMESh1nwJylKYp3TfWckw7TJNplBvtJr3M6yw3J55qrhH
         rGMePFLg6Qlt0jYzCWx0mWdyJ1gncsOn/ZxXPA8AFwk8PuVX0fgWKjz6rCZsWLTL1PC8
         zlpPQ7qeZ0EwwaVMr58CDWJfadbGTEZwkAFEKB6o1Tl+ple3J3TA/wgGkZvAawW3u7iJ
         IpYjnIivg54nMJ6AjHjz0JntW6szppGp+OYDu6p6T9R+49Ie0KiOanvq07Pxr/Eq8AyB
         tUBfQG1bVu+tV33/URsRxjbZRersQhoTnSjpGP+jHqW6qrM9f816Vc49yGpNWMvQGhtX
         khng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:to:from;
        bh=l4jkBkG9ug098J4eEjgqWrj/QEp3ll1KPL2N5zQu9Rw=;
        b=Hm138e2dZUTr9DGHLmbTXGWfaMXbaPfPZw/HvF97cgat2hw7cb6ejieuW8YmVUVANe
         XKfXyr4vKfH5zIjGIpx1NmhLmUWCbBSU/uRmJl9v0x93PnVwxF9vdeRAaOmv0ZMWSK2r
         eYLvL1VKe6kgUOlTafMQYls6YXgKOPHcdA1XZjNR2jl9os1R330pQetWxQD87PTP8UNY
         AcDSm6fvfNPffnww5QH9lHMfIKM7F65+eOCcjBnOxuFx95TYjzJ+DXd1AvXkpiODzzfD
         gHU7wmLLxPz5nXV4ltBFBx11UNb1tzCmNv5Hj9SA88WwF6mINXL6UWQDKx32e0PngIiY
         Upsg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id u9si140314wri.3.2020.03.06.09.34.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Mar 2020 09:34:01 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 026HY0WG000978
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 6 Mar 2020 18:34:00 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 026HY0a6016750
	for <jailhouse-dev@googlegroups.com>; Fri, 6 Mar 2020 18:34:00 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 0/6] We need more barriers
Date: Fri,  6 Mar 2020 18:33:53 +0100
Message-Id: <cover.1583516039.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Fighting with some potential race in ivshmem-net, I noticed that we lack
the right memory barriers before sending ivshmem doorbell events. On
x86, this even revealed some potential issue of Linux [1].

This series cleanes up our dirty corners, adding the right IPI barrier
for x2APIC mode and changing the spec and implementation of doorbell
writes to include a memory barrier. There are also some ARM cleanups
along this.

Please review carefully!

Thanks,
Jan

[1] https://lore.kernel.org/lkml/20200305174708.F77040DD@viggo.jf.intel.com/

Jan Kiszka (6):
  x86: Add proper fence before sending IPIs
  arm-common: Add memory barrier before ivshmem interrupt submission
  arm-common: Get rid of arm_cpu_kick
  core, arm-common: Clarify role of spin_unlock before event submission
  arm-common: Factor out irqchip_trigger_external_irq
  Documentation: ivshmem: Require that doorbell writes act as memory
    barriers

 Documentation/ivshmem-v2-specification.md        |  4 ++++
 hypervisor/arch/arm-common/control.c             |  3 ++-
 hypervisor/arch/arm-common/include/asm/control.h |  6 ------
 hypervisor/arch/arm-common/include/asm/irqchip.h |  2 ++
 hypervisor/arch/arm-common/irqchip.c             | 14 +++++++-------
 hypervisor/arch/arm-common/ivshmem.c             | 11 +++++++++--
 hypervisor/arch/arm-common/psci.c                |  7 ++++++-
 hypervisor/arch/x86/apic.c                       | 11 +++++++++++
 hypervisor/arch/x86/control.c                    |  3 ---
 hypervisor/arch/x86/include/asm/control.h        |  2 --
 hypervisor/control.c                             |  4 ++++
 hypervisor/include/jailhouse/control.h           | 15 +++++++++++++++
 12 files changed, 60 insertions(+), 22 deletions(-)

-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1583516039.git.jan.kiszka%40siemens.com.
