Return-Path: <jailhouse-dev+bncBCB7D7MXMMIKLGML5ICRUBHRN4BTW@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53a.google.com (mail-pg1-x53a.google.com [IPv6:2607:f8b0:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 481B97DA42
	for <lists+jailhouse-dev@lfdr.de>; Thu,  1 Aug 2019 13:27:36 +0200 (CEST)
Received: by mail-pg1-x53a.google.com with SMTP id u1sf44987767pgr.13
        for <lists+jailhouse-dev@lfdr.de>; Thu, 01 Aug 2019 04:27:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564658854; cv=pass;
        d=google.com; s=arc-20160816;
        b=RLJSBAFsDHcZuJUgxDW9PQvw8rXQhJiGI3FIzT4ZHDzUM7GnYw3tJQ1gxUi6DlC3Ry
         W2VHKgavVHQOMBGGyJt+YDeMGAHE/TetZcQv+ZbA3925jnZuSWe1bBappm+wanlT68v2
         PtQHUjRqeZsfcCJ6LfJPDTtAvMobzu6kWeWUY1U9Mrps5RXy3/fQuyuj1k5TBNoX4WRe
         QxwoB/lzbOs97xhTLtQItZhdjAZdx+fiOZRpfdtWLWqXPanIo8yVbBadLq17+p38LGDN
         KzwW4+4/w3lC/FygGkSeNLGUV9NnByHDJ0ZN0vS+VDHAbQcGCVosoaPFVlE2fq2tB6Kf
         ee7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=B540tFwdm/N30FZQo0hbfGo1rilOCCEDKJiDqEwn6LE=;
        b=T25ZLoGkHZj5uyTjiG7ArQR7TaLqYkwSemJ3dk0OSg7RamFsWvWffDRN21IuLoGSSg
         Qzn0e9qBKOFKbcEVu3XkbSjf2Cp/ebi85wExXKtyq7SHk8C1rEWeeS1xWAVHpYTWhNmv
         R2I0tnxucHgZy7wTD9+OJ4ccqkXmTXj4wziVnxj0np9netY9ppSQlzbYGswRUUpNOs9Z
         sM81BlDviIEjw1RWWSFfIBocgbWpIdKEydL8bEmqQ3e7IxuIrAo0Q5t9ZMF1uNg29Kcs
         51dNgcPeLFzPW9s1uF03S1fgexxJdskmIsL7C9jvWLkEa8GB6dGSPSiHZAeoOqoMDlZx
         Bp3g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YuQncC76;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=B540tFwdm/N30FZQo0hbfGo1rilOCCEDKJiDqEwn6LE=;
        b=RPMhq6bo1LP93JQ/xE8eqBqtMaljSk/wd2WkYdnmDx1SIOEI10EkVG/7OpF+pfDGCC
         DGvMLvWhHTxl6kM4709DYDB7CSO7tZODNERQqLjVhuBbsfWl98oDvwqJHxwB7gmOhcK/
         oy7c5yNwiGtupQQus02cAvv0+6LhCRLhhzr9wn2nXC4+DAaZp0xOgWyPKyorhL9AXJtU
         7/KqgUbRZMODqt566yOWyavTzNFUz1/lVcrawwMYFlfdb1rnKWIYlv7QBKavuiHTXV5E
         lFS3mBwdEShKXGGpuDNE/Y6N5rlifpElt2lAn8IwZjXyl7WFGg7+o6tECcOnZorpgnKB
         a0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=B540tFwdm/N30FZQo0hbfGo1rilOCCEDKJiDqEwn6LE=;
        b=fKmCo2g0nDvE7s1mMuGQWvYmIn5qOqSAAsNibYi5ZFn3AE36hL0t0btBZhRHbXONzy
         a9DpSMGZdycGqsA9C22dnODvAibfHO1DPk0sSrHGDAqi4OtWGcFsO9yCgvXfh27T/4W6
         NOeFeCjZZOanVl3HohJu5bcxhpfrF9FoK08q0j9JEjCDJ1UZW1S/XWBshFrqJatSJ1Sc
         +fQ8PYAf7ZV6dbA8LP262GA+2sgSFqfeXGmTDGaBc1L4PN9h9jB/03IVsmbjJU+z7I4M
         KTJ1oFRlQ+2NWKM24tJD/h0Ih6vc7knusxVUNzEZSyf+OaqDGLTkunuGXUFS3ephXLWS
         F4yg==
X-Gm-Message-State: APjAAAXXE4WDkX+gd3JoqVdzP/mcmzDiGLi0ngEtOlz0mpeKuy6hvZ3x
	sjqN0Ms8noefzLSX9x0PAcM=
X-Google-Smtp-Source: APXvYqzKz6Xl8kXxbfL/9IM1SqcrKNpweGKRkrve3d3kODhLd0Cys5faUlWha22lAqNcHwuUYh5UQQ==
X-Received: by 2002:a63:60a:: with SMTP id 10mr86961678pgg.381.1564658854180;
        Thu, 01 Aug 2019 04:27:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:680d:: with SMTP id h13ls18464877plk.13.gmail; Thu,
 01 Aug 2019 04:27:33 -0700 (PDT)
X-Received: by 2002:a17:90a:8b98:: with SMTP id z24mr8195037pjn.77.1564658853602;
        Thu, 01 Aug 2019 04:27:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564658853; cv=none;
        d=google.com; s=arc-20160816;
        b=R7Yj8eNXFZmWZf/miLEwbF5CJNUfPvex9sQyhZhQ/OhqTsKhlVe3+8+lr4cVyTzHwz
         k2N9/48xG7ByqH1j/GeQo2j/L1dkQ7fiBpFxq93ZsHoyiTH+NRu8zVjezFTPW2qpoThE
         9XAE3Rclor3WGqxQMdJ1b0/Nljj1U9elK4AVRxc4v/9smkECK55+h0tZ4MkHUnDRndDg
         NXc+1Wdj9+I6TLsrvyDLBXcxlt0Ua1ate+kd4b9QR+Mk14+htuWpIhnwBXcn9bscQKRJ
         QNZBv36HDvOPRjVU00yOd/9+mPSpkkLTd2gevwb80NSKKHmG6cIGo4LY8MzSlQ6a/qQo
         7YMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=Cfgygmv6lPomfW6maYW2HIGyF7k31oUAWKjTPjklPZQ=;
        b=bMJH3dNcEG0ttkk28wfScGothrMcLGg6EJ91ertw9D4tWkPWOVwpZjT8l9xhl02+c2
         cCakNHNz3SB+rlWhRUu4/kxs17CkNtl30koEXT+iBiylFrB4CCIo+X8HOfuaRk30hUDJ
         EJ1vQmZ9Rrgfv/9PYb0mw17xmG+NVDSIKyWBKbZkmZ+0LY3fq67BK2ufCpvjUHwg34rb
         9F4A3IgxJXPzg0jbwX1IACo1H5ZKqyISwN+7s2KJYOeY8s1XSWhkyNojfORDq8NJfz7U
         Ah7Evi3tyHawmQzirJBd3UIL4Uwm2shbuk6bgR4WJpbmiYWhoNdoV16hHDhlFtiSWJLx
         40qg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YuQncC76;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id cm10si3069021plb.0.2019.08.01.04.27.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Aug 2019 04:27:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x71BRWCJ092985;
	Thu, 1 Aug 2019 06:27:32 -0500
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x71BRWCC123675
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Aug 2019 06:27:32 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 1 Aug
 2019 06:27:32 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 1 Aug 2019 06:27:32 -0500
Received: from uda0131933.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x71BRRX0048824;
	Thu, 1 Aug 2019 06:27:28 -0500
From: "'Lokesh Vutla' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>,
        Jailhouse
	<jailhouse-dev@googlegroups.com>
CC: Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        Nikhil
 Devshatwar <nikhil.nd@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v4 0/6] arm64: iommu: Add support for SMMUv3 stage 1 and 2 translations
Date: Thu, 1 Aug 2019 16:56:42 +0530
Message-ID: <20190801112648.6569-1-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: lokeshvutla@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=YuQncC76;       spf=pass
 (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as
 permitted sender) smtp.mailfrom=lokeshvutla@ti.com;       dmarc=pass
 (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Lokesh Vutla <lokeshvutla@ti.com>
Reply-To: Lokesh Vutla <lokeshvutla@ti.com>
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

This series adds support for SMMUv3. Stream IDs have been added to the
cell config and they need to be specified in the config before a cell
can use a stream.

The SMMU driver exposes an emulated SMMU to the guests cells by trapping
access to the MMIO registers. This is not emulation in the sense that we
fully emulate the device top to bottom. The emulation is used to provide an
interface to the SMMU that the hypervisor can control to make sure the
inmates are not doing anything they should not. The actual translations
are done by hardware.

The IOMMU definition has been generalised. The AMD and Intel IOMMU
drivers have been updated to use this definition. I am not very familiar
with these drivers, so please do take a look to make sure the changes
are correct and don't create any unwanted problems.

Limitations are mentioned in the 5th patch and work left in the 6th
patch.

Changes since v3:
- Patch 1:
   - Fixed sysfs_parser.py for introducing iommu type
- Patch 2:
   - Introduce iommu_count_units api
   - Drop return value from iommu_config_commit
- Patch 3:
   - Fixed struct.calcsize to not use padding for size calculation
   - Made return pointer as const for jailhouse_cell_stream_ids()
- Patch 4:
   - None
- Patch 5:
   - Fixed crash when smmu is not present in the system
   - Dropped ENXIO
   - Converted few prints to trace_errors
   - Dropped {} for single line code
   - Added few comments
- Patch 6:
   - Converted few prints to trace_errors
   - Dropped {} for single line code

Lokesh Vutla (1):
  arm64: iommu: smmu-v3: Add support for smmu v3 configuration from
    config files

Nikhil Devshatwar (3):
  iommu: x86: Generalize iommu definition
  arm-common: Introduce iommu functionality
  core: Add stream id list in the cell config

Pratyush Yadav (2):
  arm64: iommu: smmu-v3: Add data structure initialization and stage 2
    for SMMUv3
  arm64: iommu: smmu-v3: Add support for stage 1 translations

 configs/x86/f2a88xm-hd3.c                     |    1 +
 configs/x86/qemu-x86.c                        |    1 +
 hypervisor/arch/arm-common/Kbuild             |    2 +-
 hypervisor/arch/arm-common/control.c          |    2 +
 hypervisor/arch/arm-common/include/asm/cell.h |    4 +
 .../arch/arm-common/include/asm/iommu.h       |   36 +
 hypervisor/arch/arm-common/iommu.c            |   47 +
 hypervisor/arch/arm-common/mmu_cell.c         |   20 +-
 hypervisor/arch/arm64/Kbuild                  |    2 +-
 hypervisor/arch/arm64/smmu-v3.c               | 2008 +++++++++++++++++
 hypervisor/arch/x86/amd_iommu.c               |    9 +-
 hypervisor/arch/x86/vtd.c                     |    2 +
 include/jailhouse/cell-config.h               |   23 +-
 pyjailhouse/sysfs_parser.py                   |    3 +
 tools/jailhouse-cell-linux                    |    5 +-
 tools/jailhouse-hardware-check                |    2 +-
 tools/root-cell-config.c.tmpl                 |    1 +
 17 files changed, 2154 insertions(+), 14 deletions(-)
 create mode 100644 hypervisor/arch/arm-common/include/asm/iommu.h
 create mode 100644 hypervisor/arch/arm-common/iommu.c
 create mode 100644 hypervisor/arch/arm64/smmu-v3.c

-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190801112648.6569-1-lokeshvutla%40ti.com.
