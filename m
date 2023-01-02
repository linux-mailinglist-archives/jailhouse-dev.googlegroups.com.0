Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCMHZKOQMGQE35T2FEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x640.google.com (mail-ej1-x640.google.com [IPv6:2a00:1450:4864:20::640])
	by mail.lfdr.de (Postfix) with ESMTPS id E86CA65AD94
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 Jan 2023 08:11:06 +0100 (CET)
Received: by mail-ej1-x640.google.com with SMTP id gn28-20020a1709070d1c00b007c177fee5fasf17186794ejc.23
        for <lists+jailhouse-dev@lfdr.de>; Sun, 01 Jan 2023 23:11:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1672643466; cv=pass;
        d=google.com; s=arc-20160816;
        b=H7uitrut7YiLRy+D4C249fU+ojuPhudKPetI36IxMACRGSFLzCFzEzjjxB7T0HPUfq
         /KqutdDlKrgsOGRKVW3hWoH8Mhv7RqBbA0/irlg7jQ8elnYjBT/IVTqPkGWVJu1GjFC2
         kX6fN2WWoH201/dVo5XlXuJUnH14fv40v/HFYFktC1Lap8gf7X5u0g84rJHjn+Np2vnc
         Sj/xaOymXchmCuGrvW5zYHmPP/wLrW0nh3/XpsnxjqYqrAT5dez6rAxeUpnu0Pvxn4cc
         fVtf2fMThbmS2rpuC025qGOW6u+f8CeD9kM5JD8QGWdZqIcgWaO4POqjSeu8tEWl3XhP
         J8xg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:feedback-id:mime-version:message-id
         :date:subject:to:from:sender:dkim-signature;
        bh=b9P7D38rQ4t019PGWoMsUtcmMzeLoo1syKyuwzfdLzY=;
        b=jVnM6wQBCgbCDMHaEkgzximAU0YG0hiQoflCfDiiSY+bzevvTfPBmQeWVWkUR4lgDE
         DUyp969V1zTB4bxxMv2F2cpEirmCkHL2bfnZMAfeuo98VlX+97/e4czVauEgnohYzG7p
         vwE4ZQ9YokgSsWoScMdJL4YzwGZHcmfMx+NJk7GW4M3E5ADLp1girMN9IUp6EcfcKj0H
         db3M/KDeywyKIc6HEGQVq6QwMq8e7Es9VUAje/XVfMU5h8fLafJuIRe3X0v0o0nrZz2h
         tfB6CqRMWM7rRZyKL9lnxykXobh6c3VG+G2Va29TgcCZJQa6c8twCgXk3Z0UcB3fMgLh
         LQgA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=VdnoGlJF;
       spf=pass (google.com: domain of fm-294854-20230102071104db22e81f584c7f51a7-0zriaz@rts-flowmailer.siemens.com designates 185.136.64.228 as permitted sender) smtp.mailfrom=fm-294854-20230102071104db22e81f584c7f51a7-0ZRIAZ@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:feedback-id:mime-version:message-id:date:subject
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=b9P7D38rQ4t019PGWoMsUtcmMzeLoo1syKyuwzfdLzY=;
        b=COlGPiOVX9J4KS3x6tHYFVDIgYNhkriqqEwMvZILwG4sj2VPxg9FnXGOT5PpHy2W3s
         XHoWregT3m+BGbUOgov7q4dZwk7PXBLbYfF/qQz3N9JvCV4M2PHroQIEwsEfGmggCHba
         i24Tig2BtL4yg0uJ8I+YWhZOjPXxDCSs2eeU+vlA8+28qbttb6RsRSGpelSgEt325892
         5R0KDxqfqMOIyBQhfMjLnsEWWLeX9uMEHoFYGenanP7Y3rwQPf8JcMp9KuUn77U9PWYZ
         SP+zty5Yi7rW8KAWQPBiC2rR5dbDQ89BXzSHnWeqqMsmpki7DTe4OtpRwy9RTpAi4WOU
         wJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:feedback-id
         :mime-version:message-id:date:subject:to:from:x-gm-message-state
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=b9P7D38rQ4t019PGWoMsUtcmMzeLoo1syKyuwzfdLzY=;
        b=ZByI8im69v33Wxg8uMcGwRWIAkHW0cnxzzmZIg/ApxRjZkZTJHZZ20u8ggGJkMAbkr
         lmZaqoPEpxGjWuDDtBCp8oqTY6WhwsorbaIgeRyboxBiwevoWxuAC6mfTUNDVMV+DVVi
         N+sRUpdxqSArTBxhy3Uhb9zP9Xu+ZBeXrugnHbAJm4pvfjuKCvFW+PUQ911oFMdmYe1t
         r75XKtj+rTy+7BjjWM9zcazKnY01PN8pRczm2Xdsf6bKKmnt2GcVQdcFrlbnlPP/6dDl
         QeNLuwe4XPFvGsKkRaLHmILJbgWc5qrLpSRpm5SS3jr9QyvpD7tRhp/I13G+KOKl18/2
         jdJg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kp52gyiKTbjiEgJgOKD3dOlITkXkDpYtBOnH8PyEWg7RnpTplg5
	DTx0HKpoN/JdsLa9x+xw6HQ=
X-Google-Smtp-Source: AMrXdXuUIvkEQBpDO13NGo9Yel/oqUr0LoY4DIZ1ea+u0bMv6blhnPF5idud6dzCCoOdJaYvKnu2hw==
X-Received: by 2002:a50:e60a:0:b0:46f:fe46:df81 with SMTP id y10-20020a50e60a000000b0046ffe46df81mr5117946edm.56.1672643466481;
        Sun, 01 Jan 2023 23:11:06 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:3a4e:b0:7b2:77f0:9d5 with SMTP id
 a14-20020a1709063a4e00b007b277f009d5ls2585972ejf.5.-pod-prod-gmail; Sun, 01
 Jan 2023 23:11:04 -0800 (PST)
X-Received: by 2002:a17:906:d216:b0:7ae:ccf3:7be5 with SMTP id w22-20020a170906d21600b007aeccf37be5mr44780347ejz.32.1672643464871;
        Sun, 01 Jan 2023 23:11:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672643464; cv=none;
        d=google.com; s=arc-20160816;
        b=Vcl7lpXK3T7WTlQeG68PAF92ufTRwrZqt2IYF9NRjsfvR/87kX5+FC4+SK10yrcHE7
         uyOp6BUtkvJVoCM6UGNvciBtj/JklL9ygFvJyMrANieIi+gDxBrH3mp/SCJCT4q0ybnq
         YSce50SFk5if8/FQW2/ZUEcGAovV3vf2+3IeESBfW8JjKQsFgxOphgZHq0Ab60UYAsZO
         EqXlaH7vSfdiMOgmW8kJdJvG3spHumdsa4Iez+e54H7mv/bYrU57R1ueRfFkug2r96RJ
         y0ZFvEnz64+EVf1CI7eP+WQ3oXXFSwzGzxntrTORxmKpi/tymC0JLwoQmW5X5zfqzNru
         zgww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=feedback-id:content-transfer-encoding:mime-version:message-id:date
         :subject:to:from:dkim-signature;
        bh=ponQfuufxjWZZ8vC48+r3TRVOYtY9FkdMKR6/D085Yw=;
        b=UVBq6uiYNZA0l9P25lm0GiI34Ndps7KqLI4Dv2uXYJ1UCguFeWgk5SkQzKloGE6Qeo
         stKgSqpc1CIx5cmaZNUp/A5AIzH/m5+WNy8YUBwiQdnRKJP0WoAFHNHHVMeDiALFUYbj
         CAGW/NktaqnFspL5GWGQvgAex/tvE5FJVuPQ9NUpISUfHkiDyBUwkRWcrBc4NMv+uVZC
         uIaAjnCOGEtBLGcX55SXGCroEy4cZH4Kz0Uhmh5QvB+ck/rk0vv/uCyf7Cn4BeadF+4z
         2wv0Z/kyQ5wnGKd8hDxblavkI9hLV8JwL0uTiP2mfOXwsoVPtWQmwllj/F/f99GMycBz
         /Okg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=VdnoGlJF;
       spf=pass (google.com: domain of fm-294854-20230102071104db22e81f584c7f51a7-0zriaz@rts-flowmailer.siemens.com designates 185.136.64.228 as permitted sender) smtp.mailfrom=fm-294854-20230102071104db22e81f584c7f51a7-0ZRIAZ@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net. [185.136.64.228])
        by gmr-mx.google.com with ESMTPS id x15-20020aa7dacf000000b0046920d68fe2si995826eds.4.2023.01.01.23.11.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Jan 2023 23:11:04 -0800 (PST)
Received-SPF: pass (google.com: domain of fm-294854-20230102071104db22e81f584c7f51a7-0zriaz@rts-flowmailer.siemens.com designates 185.136.64.228 as permitted sender) client-ip=185.136.64.228;
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20230102071104db22e81f584c7f51a7
        for <jailhouse-dev@googlegroups.com>;
        Mon, 02 Jan 2023 08:11:04 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 0/4] Re-enable ivshmem support in latest x86 QEMU
Date: Mon,  2 Jan 2023 08:10:59 +0100
Message-Id: <cover.1672643463.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-294854:519-21489:flowmailer
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=fm1 header.b=VdnoGlJF;       spf=pass
 (google.com: domain of fm-294854-20230102071104db22e81f584c7f51a7-0zriaz@rts-flowmailer.siemens.com
 designates 185.136.64.228 as permitted sender) smtp.mailfrom=fm-294854-20230102071104db22e81f584c7f51a7-0ZRIAZ@rts-flowmailer.siemens.com;
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

Happy New Year, everyone!

Long time no activity from my side, but now I finally found a few days
to do some long overdue renovation work. One outcome is this patch
series which allows to use ivshmem devices with latest QEMU again, see
patch 3 for the background.

Will now look into refreshing the demo images and the kernel patches
over the next days.

Jan

Jan Kiszka (4):
  pyjailhouse: sysfs_parser: Fix IOMMU assignment for PCI bridges
  x86: vtd: Drop source-id validation while parsing root cell IRTE
  configs: x86: qemu: Move ivshmem devices behind hotplug-capable bridge
  README: Add pcie-pci-bridge to qemu command line

 README.md                    |   4 +-
 configs/x86/ivshmem-demo.c   |   2 +-
 configs/x86/linux-x86-demo.c |  34 +++++-----
 configs/x86/qemu-x86.c       | 118 +++++++++++++++++++++++++----------
 hypervisor/arch/x86/vtd.c    |   3 +-
 pyjailhouse/sysfs_parser.py  |   1 +
 6 files changed, 106 insertions(+), 56 deletions(-)

-- 
2.35.3

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1672643463.git.jan.kiszka%40siemens.com.
