Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB26LZTYAKGQEJK53MMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DF81311E3
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:19:55 +0100 (CET)
Received: by mail-wm1-x338.google.com with SMTP id o24sf1328602wmh.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:19:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313195; cv=pass;
        d=google.com; s=arc-20160816;
        b=C5BMAmVsvKX5XADV23rGbwTKRzSIHsCHSY9/mOIndixf/Cfdld7npWQe37r5r0t4MU
         AiIJLCY9f4XvC0tNV9qn05pEDFaTSaEKDZVCrHbucH1+p8XiT2SErZ7fOEijXuq+3XQA
         cJda65iS6sfsQsCVKx7nMZ4lKeobdR52YECL7XdE2y1eRSofH72LrVV6zuhjVCq4+Wsc
         mNK54AUB2xRO9gGOEtCgw9aQ5k2AU8VcTzH5IQcWLD9hEEbE4LJ0EQoUYf0piaIUs0lY
         ONmHUWNd/qPdYDmiT178Sazo4vpw6Pk+azSOCYhQtDzGCEzI/WZ9cTm8H5E247eeZgsY
         q3WQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:to:from
         :mime-version:sender:dkim-signature;
        bh=8DXkgflwBFyUoZl1YclNN/lcG0hBGcc3J3U+EViGaUc=;
        b=et0be2NjIarrIm0FyIDRgNS8Ld6lBY25mvdOcXCleIuW3GQzvr4BUBmWvhylleCvpr
         CPgSOUKYo2EZPEGa2gw3jcuExWVHKVLu1WrENoV2ckmgE/aP4EnH1jrgv0pYhHM8pARH
         bKvFV271y5vbUUbvABFXXLcz1ZtrQlMhN+DTJl9QjlU2UjSYTDV3orRvsvDx7gu/2ui9
         XWagABZ6HKOJ7jKAQFCv745jh7JfmzcrPp6hfr8II/UL0qftNgSz7ILDmzdfopt3+oex
         7pns7r/AlbsuubSwLeEAzpAriXbPV/tbW/Y2Z74+x9XI/YJFuFLqPu7NxiMnVRLUEQT7
         3uWA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8DXkgflwBFyUoZl1YclNN/lcG0hBGcc3J3U+EViGaUc=;
        b=goNW294MluDLS+w2RxKeY0V5KbMeZzOEvaoyRkh3HUMmQNRAgVCVNno4ivkQvi4Gi4
         xrOLo5JY75wwePOLZM7hhAdXbJgKBSSB2WuwMF+65RNkpL5kGs+XezXKKl4wEykx3dNq
         zWa6nGHd36gh56CKA75qBzCgu7cGwA7Qi32lJ1Vure7/9VwkUAn9NVuQIUIKdKlYvbbh
         KvlCjaJraw/TfORkEK7lj/KaEGJt5q5aiJfeGSMdt1ipKsUp7/STpt6DIWueJ///ibpT
         Ra8h952KMC3SgtCs6UCw9MWMIHJGGAJS+RNQlvVSfg54bzM1CWwz6QC87z+VppA0ph9U
         IpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=8DXkgflwBFyUoZl1YclNN/lcG0hBGcc3J3U+EViGaUc=;
        b=ZDo8HrGdRIZeQXxEpe7gxm9vu5bkXCJTjjiIHUtRKRrlkoR8yvGOh2ftq/J0MjxhOJ
         1NIjqHC5cPSdhACHKPth4OqClIsWRsHuRSHj/vVMPzzYDKEWfvDVtiNMJgwwGr5JB3wn
         nr6diM5Vo3dxvruxRYce0JdawgfQ2kkdcBhy6FhP/98EaREeDE3sKoXKKIfu17N/mjwG
         Dc7ov4t/L35tHydH8d/tfJxQwhAVThjnepgkvH34L8Qg9xlUvRhA3VCullvWKhl3ZGaF
         qw1Q/5mUX63T2gHy9fBnOCiVfWqbgnUnPY8sPbwCUy2M16H3KSWbqV+nVh3+38olsmEW
         q7Fw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXRSmgD5p09ZlUMTVpJJNDpIrE78N0VJxjzaacUWSUZRdpbR1rV
	sOZc478nuX8PiyYPnwnB68M=
X-Google-Smtp-Source: APXvYqwh7wMii5NFPAjneGvw88Dr/cUqwRwiQbWqSCCYlHWMDOmgE/8/+LeF6L1SVx/fMy06JwS+Hg==
X-Received: by 2002:a5d:6a8e:: with SMTP id s14mr105934348wru.150.1578313195313;
        Mon, 06 Jan 2020 04:19:55 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:65d0:: with SMTP id e16ls12888338wrw.1.gmail; Mon, 06
 Jan 2020 04:19:54 -0800 (PST)
X-Received: by 2002:a5d:51c1:: with SMTP id n1mr101738134wrv.335.1578313194552;
        Mon, 06 Jan 2020 04:19:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313194; cv=none;
        d=google.com; s=arc-20160816;
        b=K4+LzEyZzoEu52tkGx/lOK9bBlalQTwojjsDjcesrGx0oMLSIBVzgaEilcSTpoKt70
         +R/l/4uWW732iDh2hTkAq4LIbERiBYnZ/lGUUY0AZQrEX1gLANDgr7ot4b4Dos7TG2AP
         Ole9VyWUECXeLCb2pacGXHdVKbOlPCdhOOpsYMMzBJ/ALoZ7mOWKoef7zogf41PnbT90
         3NH+OFc+RXLD+N3f2XgRrYztJWaJsOFUye7kwkGiMGSrBlYvYZwf7gdSlGWjHyaDZE2k
         kv5xcCFJ0P3c2iq1HyCb8YYVz/eifhE2wER+IHlfbZEXGUJGEP5F2IminaA2/4fAXS+V
         Hgaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:to:from;
        bh=z4Q88wOu0fJpNMTw2r6J0FIlitLnSXkgA64z1UjZ5ic=;
        b=LGUsbUQW9XQRrcEz28WeARwWWdrN63taBI/DhnGBKxh074qC+pISQos4sbQW3WWS3k
         AYB34TwnDMCyscVzxYzqJLCEfS9bDv18Cfqx/ex1gPdgQXIcMuwrhXQ17e0Yc5XFmN0w
         0+2SBjAAPAX/sb0GSlqcwZqJGzHXcGBOqrdvkyt4/Q7fZ2TRNkeiOBtD5sFLWCbEj3ez
         P2PoSfM4CMRXmqvJFcBeFTqh4Mj+p/2Lh6gDc4FbkOhYKFLxO0EGlE+5tjxQBHmcDRi/
         nynWW69a1qGhq0MojYcEZOwsq2GSzxv77ULBqhnBm0OmkyRQhFW4zd4XY7CCzSRtIoex
         cB0g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id o139si842711wme.1.2020.01.06.04.19.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:19:54 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 006CJsgH019065
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:54 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKEY029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:18:20 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 00/38] Rework ivshmem device to new specification - Part I
Date: Mon,  6 Jan 2020 13:17:41 +0100
Message-Id: <cover.1578313099.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

These changes are fundamental to the inter-cell communication in
Jailhouse. The primary enhancements are:

 - multiple peers, up to 12 per link with Jailhouse
 - peer state table in shared memory (faster access)
 - optional exclusive output regions per peer (unidirectional shared
   memory sections)
 - multiple interrupt vectors per device (up to 16 with Jailhouse)
 - support for unprivileged and faster UIO access under Linux
   (page-aligned MMIO registers, one-shot interrupt mode)
 - separate PCI device ID (from Siemens pool) to avoid confusion with
   QEMU's current ivshmem model

All this have been cooking in WIP state for a long while, the oldest
patch started in later 2016 in fact. While the specification of the
reworked device is still under discussion with the QEMU and virtio
communities, we need to move forward on the Jailhouse side to break the
chicken-egg issue: No specification without prove of its usability.

But the spec is also in a pretty advanced state by now. So, even if
there might be changes needed again after this is merged, to comply with
an ideally virtio-accepted specification, I would not expect major ones
anymore.

The changes are unfortunately invasive to the cell configurations, so
downstream configs needs to be updated. Please study the changes to
similar in-tree configs for the required adjustments. Some of them
should make future changes less invasive.

As this series is already large enough with only the core conversions,
updates and enhancements to inmates in order to exploit and test this
will come as "Part II" on top. What remains usable with this series
alone is ivshmem-net, provided you use the driver included in [1] or
[2].

Also broken for now will be jailhouse-image "latest" build. I have
started to adjust it locally and will make those changes available soon,
at least for testing. I'm not planning to change jailhouse-images in a
way that it continues to work for both 0.11 and current next, though.

But I'm planning for a Jailhouse 0.12 release after both parts are in.
So, in case you have something cooking that should hit that release,
make it ready as well!

Jan

[1] https://github.com/siemens/linux/commits/jailhouse-enabling/5.4
[2] http://git.kiszka.org/?p=linux.git;a=shortlog;h=refs/heads/queues/jailhouse

Jan Kiszka (38):
  core: ivshmem: Use Siemens-provided device ID
  core: Restrict asm/ivshmem.h to inclusion by jailhouse/ivshmem.h
  core: ivshmem: Derive MMIO register region size from cell config
  core: ivshmem: Enable unprivileged MMIO register access
  configs: Use constants for bar_mask of ivshmem devices
  core: ivshmem: Convert MMIO register region to 4K and 32-bit
  core: ivshmem: Move MSI-X region into 32-bit BAR1
  core: ivshmem: Move shared memory parameters into vendor specific
    capability
  core: ivshmem: Reorganize MMIO registers
  core: ivshmem: Rename IVPOS register to ID
  core: ivshmem: Add MAX_PEERS register
  configs: Add field for shmem device ID
  core: ivshmem: Use device ID from config
  core: ivshmem: Add PCI-conforming INTx mask
  core: ivshmem: Mask MSI-X vector on reset
  core: ivshmem: Reintroduce ivshmem_update_msix
  core: ivshmem: Fold ivshmem_write_msix_control into caller
  core: ivshmem: Rename ivshmem_data to ivshmem_link
  core: ivshmem: Avoid assumption about size of ivshmem_link
  core: ivshmem: Introduce link pointer to ivshmem_endpoint
  core: ivshmem: Relax peer matching rules
  configs: x86: Rework ivshmem settings
  configs: Factor out ivshmem memory region macro for network devices
  configs: Move ivshmem memory regions at array start
  core, configs: ivshmem: Add state table
  core: ivshmem: Rework interrupt configuration and injection
  core: ivshmem: Re-add target ID to doorbell register
  core: ivshmem: Switch to ivshmem_endpoint as parameter of
    arch_ivshmem_update_msix
  core: ivshmem: Add support for multiple interrupt vectors
  configs: Expand number of ivshmem vectors
  core: ivshmem: Expand interrupt control to device level
  core: ivshmem: Add one-shot interrupt mode
  core, configs: ivshmem: Add shared memory output sections support
  core, configs: ivshmem: Add multi-peer support
  core: ivshmem: Drop revision protocol ID
  core: ivshmem: Reorder ivshmem_endpoint fields
  Documentation: Add specification of IVSHMEM v2 device
  Documentation: Update inter-cell-communication

 Documentation/inter-cell-communication.md        |  79 ++++
 Documentation/inter-cell-communication.txt       |  76 ----
 Documentation/ivshmem-v2-specification.md        | 376 ++++++++++++++++++
 configs/arm/bananapi-linux-demo.c                |  20 +-
 configs/arm/bananapi.c                           |  19 +-
 configs/arm/emtrion-rzg1e-linux-demo.c           |  20 +-
 configs/arm/emtrion-rzg1e.c                      |  19 +-
 configs/arm/emtrion-rzg1h-linux-demo.c           |  20 +-
 configs/arm/emtrion-rzg1h.c                      |  19 +-
 configs/arm/emtrion-rzg1m-linux-demo.c           |  20 +-
 configs/arm/emtrion-rzg1m.c                      |  19 +-
 configs/arm/jetson-tk1-linux-demo.c              |  20 +-
 configs/arm/jetson-tk1.c                         |  19 +-
 configs/arm/orangepi0-linux-demo.c               |  20 +-
 configs/arm/orangepi0.c                          |  19 +-
 configs/arm64/amd-seattle-linux-demo.c           |  22 +-
 configs/arm64/amd-seattle.c                      |  21 +-
 configs/arm64/espressobin-linux-demo.c           |  20 +-
 configs/arm64/espressobin.c                      |  19 +-
 configs/arm64/hikey-linux-demo.c                 |  20 +-
 configs/arm64/hikey.c                            |  19 +-
 configs/arm64/jetson-tx1-linux-demo.c            |  20 +-
 configs/arm64/jetson-tx1.c                       |  20 +-
 configs/arm64/k3-am654-idk-linux-demo.c          |  19 +-
 configs/arm64/k3-am654-idk.c                     |  19 +-
 configs/arm64/k3-j721e-evm-linux-demo.c          |  20 +-
 configs/arm64/k3-j721e-evm.c                     |  19 +-
 configs/arm64/macchiatobin-linux-demo.c          |  20 +-
 configs/arm64/macchiatobin.c                     |  19 +-
 configs/arm64/miriac-sbc-ls1046a-linux-demo.c    |  24 +-
 configs/arm64/miriac-sbc-ls1046a.c               |  19 +-
 configs/arm64/qemu-arm64-linux-demo.c            |  20 +-
 configs/arm64/qemu-arm64.c                       |  19 +-
 configs/arm64/ultra96-linux-demo.c               |  20 +-
 configs/arm64/ultra96.c                          |  19 +-
 configs/arm64/zynqmp-zcu102-linux-demo-2.c       |  38 +-
 configs/arm64/zynqmp-zcu102-linux-demo.c         |  38 +-
 configs/arm64/zynqmp-zcu102.c                    |  36 +-
 configs/x86/apic-demo.c                          |   2 +-
 configs/x86/e1000-demo.c                         |   2 +-
 configs/x86/ioapic-demo.c                        |   2 +-
 configs/x86/ivshmem-demo.c                       |  53 ++-
 configs/x86/linux-x86-demo.c                     |  29 +-
 configs/x86/pci-demo.c                           |   2 +-
 configs/x86/qemu-x86.c                           |  75 ++--
 configs/x86/smp-demo.c                           |   2 +-
 configs/x86/tiny-demo.c                          |   2 +-
 hypervisor/arch/arm-common/include/asm/ivshmem.h |   9 +-
 hypervisor/arch/arm-common/ivshmem.c             |  40 +-
 hypervisor/arch/x86/include/asm/ivshmem.h        |   9 +-
 hypervisor/arch/x86/ivshmem.c                    |  77 ++--
 hypervisor/arch/x86/vtd.c                        |   2 +-
 hypervisor/include/jailhouse/ivshmem.h           |  49 ++-
 hypervisor/include/jailhouse/pci.h               |   3 +-
 hypervisor/ivshmem.c                             | 481 +++++++++++++----------
 hypervisor/pci.c                                 |   2 +-
 include/jailhouse/cell-config.h                  |  50 ++-
 scripts/header_check                             |   6 +
 58 files changed, 1247 insertions(+), 925 deletions(-)
 create mode 100644 Documentation/inter-cell-communication.md
 delete mode 100644 Documentation/inter-cell-communication.txt
 create mode 100644 Documentation/ivshmem-v2-specification.md

-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1578313099.git.jan.kiszka%40siemens.com.
