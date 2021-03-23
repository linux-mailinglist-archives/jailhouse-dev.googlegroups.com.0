Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQHF46BAMGQEK33RJTQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E297346032
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 14:53:05 +0100 (CET)
Received: by mail-lj1-x23f.google.com with SMTP id s17sf1446816ljs.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 06:53:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616507585; cv=pass;
        d=google.com; s=arc-20160816;
        b=aLCGo1IstFhf3Q2vUgKpUZnd9oBb3yL1zr7uT23e9CoSHrkP1a/QEmnf7yvpHkFUqv
         L+yts8KqyRiXUEtXUgsVaW5wt1/qpOwWRNVvbqq5JPnqmstt9kBln0phsaYo9ScEMmrm
         +GTiFBzcBYzX3pNjAhptfb9qt7/cFZoDHnWTJltowRGjBhtihMb7h6MND6k9kjyVrPc+
         jKntSvOF0ApOrYAKyIFiroCb1tDkMIzBbQSle9zMfuX52zh7rvFTFRK0b/G/SOM2+AVe
         rYbd7Vv3dlbhzGEZXNq3FYH38H8kkHilVU8V2luVU0x8vF60rfHRNRJGXDsXGFFSgtLf
         V8UA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:to:from:sender:dkim-signature;
        bh=InsLf3cMdCkxygHjUTxxuYJe+6aeyfxxbgWSi/bQbAM=;
        b=qaabVN080AN7UMCgzooJaYnpNFR2NICMPc1esldIPVBeco0LGac03P59IbuBNkg/wo
         qrfUzxQhO9PeyrUTfPSmnr5BwdYtRDu3Ni7ZqSf42EwSP20AI8SgNCCyGNOLu+XTTCAX
         Js1bS2jYRSm7+5VtZXRUFFzs126xxEuhkqjTma/o70knqiIvtu+O5CRRsVIsPHyMKAEo
         Pa/W5FstZQ3qPvCaz68ZX2n/UKRkQvi6n4MPSsMpaikrgLmskYgNmtmh0Ah5SxSIVfmH
         6dNSfbh+nAmXhzfD19TQuP+E4VzJ2TA2kUugXeGpKJN9CtIpUef3+YG4CZiFxGwKNA0h
         /caw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=InsLf3cMdCkxygHjUTxxuYJe+6aeyfxxbgWSi/bQbAM=;
        b=GzCvStniecFk3buFVqz7yS3m1X42N/wmhNIzubdaPE5ENN5z0DUoXhmAHGVB9FaBY9
         neEhFndV41teggMfbgmAav8UMFtGvWd0mRj7LRKWbNRnCZTXw3z/I+W+sKdU3cU2Qhta
         Q5ggRVO0g1yqRDrsL76avLg9ayPtMzIhSw149XA1cBn8bRNXDOMTwjXCgJBDavn5Sy8g
         uAcf8hy4t511ugvnMARknP1ztlMqK1uQScq5kCBIfwIDmyhqCVKDuERHmQPWLGDl5deh
         gCEqSrfV1YLTptW9eUbsGsGD33I2Cov0oJCJe6ezKjcVRtkUCRLx/JOL4TrsjvHQ1FVF
         SpJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=InsLf3cMdCkxygHjUTxxuYJe+6aeyfxxbgWSi/bQbAM=;
        b=TJClvO6IJcC391hADeBkkBf1758OD8qzPPzC1Hb6FWHuLpMc8q8OCixJGHZlGO5Xcs
         D5ZVHkzn6h61cdnPlKoU0X3JiSopooy+6SZcAEAEIFeNVDtBfpv2s4ouSecwc6Jp2zdn
         /C47C0ncCiNqUdkPRzKyvskNRYyDqrsqLqCwUZOLJkcX2G36PSC8q1HHDh6BVekIvWnw
         5b73F0aejrHt37LHs2R4w/cdbusxDSLewtMbfoWI87PDkurLtC5R0JpxfsdmAiaYqS3A
         CHwuZpNYmTUat1GItfixJ38DJmEgcvyunqMeZWnHJKvAAaT0Gh3g5SgouwO6SGymDiW9
         eK9w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532crLeiFwj3z/4Ri51q7eIil984MX/i1grLmLlMHeKVngzMTdPs
	5lC6ZcX94viRV7GiAEa9joQ=
X-Google-Smtp-Source: ABdhPJyx32T9gABk/anRqOR83e0Z1rZuIZPU1enYyu0xNGJiB38+JWPbrsN8HEOEu9M3CYIFvC26bQ==
X-Received: by 2002:a2e:a0d0:: with SMTP id f16mr3341319ljm.215.1616507585209;
        Tue, 23 Mar 2021 06:53:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:58f8:: with SMTP id v24ls5225348lfo.2.gmail; Tue, 23 Mar
 2021 06:53:04 -0700 (PDT)
X-Received: by 2002:a05:6512:3490:: with SMTP id v16mr2742610lfr.644.1616507583994;
        Tue, 23 Mar 2021 06:53:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616507583; cv=none;
        d=google.com; s=arc-20160816;
        b=Ay4p+cT5KZ/osL3BwDOqOtNEKCQPrYy5Ny9zdCC/Zg0PWDUyIJWaIW/3sMDIUznO3q
         EM1VAggLHFqvEk+WuIK0Uc5BIpJyc0EDl37slX6fOFGIylWBSbkO+7yiJ8fk2UwS/8jz
         BeWEVEVWwFQ+YXyNmVHuVKUp8HMxgBHqj8pLTLVE393SPUn2JGekeaoyYSZsuoOrU85O
         1QGRe4hjyrlzWFuuyJ3u6XQnwPAOSJoP39USMwjyUx7bUUbvo3XodbeACoisr7BdElnV
         i9ZJhVfLmEQYcuyoFgHngCTT0vjI+KYAb+VUmpDLDDMza+4iPz4qLIStjcYeBUOX06VM
         z1VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from;
        bh=HglpGEKubHt6yDQ+R82Ct87t0DDDoPzhOT7KbCrWk4s=;
        b=I9TH7EEM3LqbqCoBvvKCKxDczDPghy14rrqDPm0brYVV6M92z+YgyAGzyRXlkn5cBr
         uUVtbecTG2GBGf5PdAfAt7VQ6m55DXEFQDFEq/m2i9eVJj+7H8QvikLEtMyjYQt+JNXU
         F+OCObg7d5KwVvV6WqoutSXfNAQrZWJ9mrlj9rQPzVX3waxpPP1C/iutsoVaWz6UFLYM
         kLTlVIpQZ64awLBg7xdTe6+vp0WzxcPwMd3b8mNYhmkENOpjycYr6EvlK2BVkYZ5hxtn
         25d+kWetDN80MnKHdj4OldtBYovqJMFZjAJARqXaQrjEv+iwpGOX0FayXuum/Vfihk+S
         OaLQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id n13si220710lfi.5.2021.03.23.06.53.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Mar 2021 06:53:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 12NDr3B3003977
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 23 Mar 2021 14:53:03 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.18.33])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12NDm2Mg029573
	for <jailhouse-dev@googlegroups.com>; Tue, 23 Mar 2021 14:48:02 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 00/11] Updates, QEMU 32-bit ARM support
Date: Tue, 23 Mar 2021 14:47:51 +0100
Message-Id: <cover.1616507282.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

First wave of updates, targeting Isar, kas, OPi-Zero Wifi and buildroot.
In addition, this adds support for a 32-bit QEMU target, just only for
the latest Jailhouse branch.

More to come.

Jan

Jan Kiszka (11):
  Update Isar revision
  Update to kas 2.4
  Address shellcheck reports
  linux-jailhouse: Generalize armhf config
  customizations: Add QEMU ARM
  Hook up QEMU ARM support
  README: Add QEMU ARM support
  xradio: Update source and firmware
  non-root-initramfs: Update to buildroot 2021.02
  non-root-initramfs: Update ivshmem-demo
  non-root-initramfs: Purge buildroot download cache on cleanall

 .gitignore                                    |    1 -
 .gitlab-ci.yml                                |    2 +-
 README.md                                     |    4 +-
 build-images.sh                               |   43 +-
 conf/distro/jailhouse-demo.conf               |    2 +
 conf/machine/qemu-arm.conf                    |   14 +
 conf/multiconfig/qemu-arm-jailhouse-demo.conf |   14 +
 images.list                                   |    1 +
 ...de-for-building-custom-Trusted-Firmw.patch |  127 -
 kas-container                                 |  372 ++
 kas.yml                                       |   12 +-
 opt-latest.yml                                |    2 +-
 opt-rt.yml                                    |    2 +-
 .../trusted-firmware-a-macchiatobin_2.3.bb    |    2 +-
 .../trusted-firmware-a-ultra96_2.3.bb         |    2 +-
 .../u-boot/u-boot-pine64-plus_2020.10.bb      |    2 +-
 .../u-boot/u-boot-ultra96-v1_2020.10.bb       |    2 +-
 .../files/.bash_history-espressobin           |    2 +-
 .../files/.bash_history-hikey620              |    2 +-
 .../files/.bash_history-macchiatobin          |    2 +-
 .../files/.bash_history-pine64-plus           |    2 +-
 ...istory-hikey620 => .bash_history-qemu-arm} |    8 +-
 .../files/.bash_history-qemu-arm64            |    2 +-
 .../customizations/files/.bash_history-rpi4   |    2 +-
 .../files/.bash_history-ultra96-v1            |    2 +-
 .../non-root-initramfs/files/amd64-config     | 3799 +---------------
 .../non-root-initramfs/files/arm64-config     | 3756 +---------------
 .../non-root-initramfs/files/armhf-config     | 3885 +----------------
 ....11.1.bb => non-root-initramfs_2021.02.bb} |   10 +-
 ...zero_defconfig_5.4 => armhf_defconfig_5.4} |   16 +-
 recipes-kernel/linux/linux-jailhouse_5.4.inc  |    1 -
 recipes-kernel/xradio/xradio.bb               |    6 +-
 scripts/make_release                          |   10 +-
 start-qemu.sh                                 |   37 +-
 wic/rpi4.wks                                  |    3 +
 35 files changed, 506 insertions(+), 11643 deletions(-)
 create mode 100644 conf/machine/qemu-arm.conf
 create mode 100644 conf/multiconfig/qemu-arm-jailhouse-demo.conf
 delete mode 100644 isar-patches/0001-Add-recipe-include-for-building-custom-Trusted-Firmw.patch
 create mode 100755 kas-container
 copy recipes-core/customizations/files/{.bash_history-hikey620 => .bash_history-qemu-arm} (62%)
 rename recipes-core/non-root-initramfs/{non-root-initramfs_2019.11.1.bb => non-root-initramfs_2021.02.bb} (64%)
 rename recipes-kernel/linux/files/{orangepi-zero_defconfig_5.4 => armhf_defconfig_5.4} (96%)

-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1616507282.git.jan.kiszka%40siemens.com.
