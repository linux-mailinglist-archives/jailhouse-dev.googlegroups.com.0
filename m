Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB2676HYAKGQEIC7EPAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F593139220
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 14:26:04 +0100 (CET)
Received: by mail-lj1-x239.google.com with SMTP id m1sf1969299lji.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 05:26:04 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578921963; cv=pass;
        d=google.com; s=arc-20160816;
        b=bNQc4u9o2sSXo9nOTtZK3/42WsNKghdrKS3vC8GKJNxrNoEavf7RrzWHQL3fRtu7h2
         pBTyR1GVg0jm4r8eBcBy6d74MESb7MosH5Zsfw3+zSTU4UgE32KfabzLMzvsQ4Xz3f+t
         /t6Gf5eRn0paUEzXMlLepnpbaDwj82kwYlkcb6Dy7xPfAn39kAO4oSozsLzIS5qvbuIa
         iqbPFzfluLpEod8XAeUCBxKJv+oui8HKwjMSJD9jQRscX79VSK6y5uBOb2FRBB6JoLKG
         ZDwVe1JK6TNfsKzQBUDcKUFnyelgyeBs3F93jnPA91MmvQa3P/JK3B3fJwmnam5Qjflv
         UA6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:cc:to:subject:from:sender:dkim-signature;
        bh=ehAK5cLHkVRkW9wIh3WaRGBx/b/PlXFQKF8oV/xUV2E=;
        b=RAJvESMm4l6HeddsnIag02B/JPMz+8GiUy2zGpoUuXkfNBKMlDW1M+OHqVUY14f7Ki
         MtfhsYYa4cdO4/AADFUR+0w28tuqFUXggnorolXdfQNcNkay3FogDUm3aVL2Wz0ItLen
         zb6ETNMC1XjNW+tODgJI6qkLYUBoIywyAO9wLS1yGgnuDvhUCjuueRyShLib6it+bdIn
         KAuNhZyaSQawlQ2ZYxuhNSexBMk5PPw1F2cO0CbYW6n8RufI9DKWQSC5HhaSdZiz36s1
         vmv8/K8vOAOIT5x5plQBM7Z34kEnDiqXlJwwU+jVQ/EWXcF0DipnGh2JDcndIM3rnum1
         Djjw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ehAK5cLHkVRkW9wIh3WaRGBx/b/PlXFQKF8oV/xUV2E=;
        b=M+mBTJu7ljJ4FCkeEVXZv+3Oe9VW+dU4ahgoh/R/tNR1tkMvXR/TmFsv/ev+BuuUDQ
         w2qWLMrH9++thtGVMjf8AAOQ8ZIrol2EmbiP5qTRh2b7+qZns2Qxp17bY++hVRjzXU0P
         QmYcUq7f0rebswUHQ14LmmTV87mLfa7dz0GoItAr7O2S1eDtMyijy2GwCxqsglgEXEqy
         vQzRsdUBv5jd8tKwfM9hif7sx3y3JrAzxFlzjeGdmIhZBMj4f710ny+VG+PkbkaWpY6s
         IMrv2KuABzJIOqwzlEgdd6WXEUspMY1XlW6g3MYN0lNYEqdr4NRLRoQyOKNtIjewSQI5
         WbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:cc:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ehAK5cLHkVRkW9wIh3WaRGBx/b/PlXFQKF8oV/xUV2E=;
        b=d0wRUQNYOkaNjZjlgFe58GB9jeNcpwbJ8dWWP+F0t1mnVebD9KxPdIm1bUIJGdoXO3
         hzlI74S/JUbig3WNGglSl1D+ZOUvTNTeW34/QZ4soKxpmn7Q18Vu+xav7EjbwbDJNUNN
         3oD9KDAAejr/Q4Xw0fwwYI6L3M2KKajceG0jcgrvZHKRnRumqZlH518e3rKEkoU3aFX3
         TLNERJCaLPlUwGLtL11pTqkwcVwXFhudLkYs4XR3aF70EEtv0HAwnMwkrY9uSqRlFWhw
         6uSUPe4uXpmwyCsfsZ2CKWZ+d3gKKcnvdp/eGKkeCmItmYwV3ePysukn2xttDzYTBABv
         z0mA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWFYpbqRv4rY33yoqWTBzPojcmDUk/C7gFqgR+mIM6CKYnQ5Sqv
	FWT+XLWZL/GeSGwKE7yZ0Ls=
X-Google-Smtp-Source: APXvYqx3A+RPEm7D412IO6oiVyYqIUbT7gnV5jeq1eYhecGp/rPWRrPvhuRjH2rSgP9/cpClufefyw==
X-Received: by 2002:a19:48c5:: with SMTP id v188mr10077657lfa.100.1578921963711;
        Mon, 13 Jan 2020 05:26:03 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4acf:: with SMTP id m15ls1081917lfp.13.gmail; Mon, 13
 Jan 2020 05:26:02 -0800 (PST)
X-Received: by 2002:ac2:4c2b:: with SMTP id u11mr9824098lfq.46.1578921962955;
        Mon, 13 Jan 2020 05:26:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578921962; cv=none;
        d=google.com; s=arc-20160816;
        b=QeVNcaYeDu3BEz/uNEUTw4Y5R8k+SfWEikFDwFzIRWdbLYULp/v7oThv88dDQqAdnf
         fKr9tVeH+ZEY/pTmdxAumCIRwHXVc68s/CB3V6NILX3pme/sjseP79ByDdtf0jk1EIY2
         t5SaPtm4eqgBkgURP4O3vX08E5a3ZRvUFoDmcZBFIvVhuP/araCzy/Suypk1Fi723V6R
         C2PHHoibKY2klssVcvIIWR+dFWsHFk7r90STKzyYJpoWRe1Hr/H5qInIU3NsvMCwNpq/
         InZjrL5V1e94nMpNFl8h+WXPnP367/i5hpYkR7SpZYXbMPyUmV46TJpCDR5fBHV0dnu/
         e5Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:cc:to:subject:from;
        bh=Fm7s6L9Ys+QB238LAUZrMJLMAYJ9u2zPXNcHBwKossA=;
        b=HOy1hav/ikBXhFFaELwZKk0fAk67iRHTOxStDxpJxYNLZ1HltBwL0uCaoHXTaQGVX8
         dTJBd4XEa8dvJN7Do6Ug+tuVHTCTIALFFnHNKl+WKNOHERsNFJdm2znkCuWNQO/iKDH9
         W6jHbkqCO7mudfm2gv/wNVXGGpBqPTreysfRe59k0/kBIzG67sil2+WI9hEYYjMGptSy
         oi4m6rO8sI9Tn2dzvsvH5LkZS9i84I49//RPgNOwUliYrxOKFVGhFM2oF1bXim3W5mHG
         yhA4gB2T3KZtp8zxEx+d4G2WltkZoSHhXYY6/07qcL8Y7a5PKE0WzlVKUF+Oavn8vfcu
         MzkA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id o193si542129lff.4.2020.01.13.05.26.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jan 2020 05:26:02 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 00DDQ11U031697
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2020 14:26:02 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 00DDQ1i4016741;
	Mon, 13 Jan 2020 14:26:01 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] arm/arm64: Move iommu.o out of arm-common
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Nikhil Devshatwar <nikhil.nd@ti.com>
Message-ID: <075622da-c587-1c36-4476-cd946890ea99@siemens.com>
Date: Mon, 13 Jan 2020 14:26:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

From: Jan Kiszka <jan.kiszka@siemens.com>

There is no IOMMU support for 32-bit arm, and it's likely to now show up
there anymore. Make the iommu binding module arch-specific so that we
can add calls to the arm64 variant without affecting arm.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---

This will go before the PVU series, and the latter will be adjusted to 
work against arm64 where needed.

 hypervisor/arch/arm-common/Kbuild             | 2 +-
 hypervisor/arch/arm/Kbuild                    | 2 +-
 hypervisor/arch/{arm-common => arm}/iommu.c   | 8 +-------
 hypervisor/arch/arm64/Kbuild                  | 3 ++-
 hypervisor/arch/{arm-common => arm64}/iommu.c | 0
 5 files changed, 5 insertions(+), 10 deletions(-)
 copy hypervisor/arch/{arm-common => arm}/iommu.c (76%)
 rename hypervisor/arch/{arm-common => arm64}/iommu.c (100%)

diff --git a/hypervisor/arch/arm-common/Kbuild b/hypervisor/arch/arm-common/Kbuild
index 6f57ef02..78b9e512 100644
--- a/hypervisor/arch/arm-common/Kbuild
+++ b/hypervisor/arch/arm-common/Kbuild
@@ -17,6 +17,6 @@ ccflags-$(CONFIG_JAILHOUSE_GCOV) += -fprofile-arcs -ftest-coverage
 objs-y += dbg-write.o lib.o psci.o control.o paging.o mmu_cell.o setup.o
 objs-y += irqchip.o pci.o ivshmem.o uart-pl011.o uart-xuartps.o uart-mvebu.o
 objs-y += uart-hscif.o uart-scifa.o uart-imx.o
-objs-y += gic-v2.o gic-v3.o smccc.o iommu.o
+objs-y += gic-v2.o gic-v3.o smccc.o
 
 common-objs-y = $(addprefix ../arm-common/,$(objs-y))
diff --git a/hypervisor/arch/arm/Kbuild b/hypervisor/arch/arm/Kbuild
index e1bec1b7..2afc09c0 100644
--- a/hypervisor/arch/arm/Kbuild
+++ b/hypervisor/arch/arm/Kbuild
@@ -19,7 +19,7 @@ always := lib.a
 
 lib-y := $(common-objs-y)
 lib-y += entry.o setup.o control.o traps.o mmio.o lib.o
-lib-y += mmu_hyp.o caches.o
+lib-y += mmu_hyp.o caches.o iommu.o
 
 # in here we switch of the MMU and stuff, cant profile such code
 # NOTE
diff --git a/hypervisor/arch/arm-common/iommu.c b/hypervisor/arch/arm/iommu.c
similarity index 76%
copy from hypervisor/arch/arm-common/iommu.c
copy to hypervisor/arch/arm/iommu.c
index b3100d03..2c02c812 100644
--- a/hypervisor/arch/arm-common/iommu.c
+++ b/hypervisor/arch/arm/iommu.c
@@ -10,17 +10,11 @@
  * the COPYING file in the top-level directory.
  */
 
-#include <jailhouse/control.h>
 #include <asm/iommu.h>
 
 unsigned int iommu_count_units(void)
 {
-	unsigned int units = 0;
-
-	while (units < JAILHOUSE_MAX_IOMMU_UNITS &&
-	       system_config->platform_info.arm.iommu_units[units].base)
-		units++;
-	return units;
+	return 0;
 }
 
 int iommu_map_memory_region(struct cell *cell,
diff --git a/hypervisor/arch/arm64/Kbuild b/hypervisor/arch/arm64/Kbuild
index 323b78b6..aa018ae7 100644
--- a/hypervisor/arch/arm64/Kbuild
+++ b/hypervisor/arch/arm64/Kbuild
@@ -20,4 +20,5 @@ always := lib.a
 # irqchip (common-objs-y), <generic units>
 
 lib-y := $(common-objs-y)
-lib-y += entry.o setup.o control.o mmio.o paging.o caches.o traps.o smmu-v3.o
+lib-y += entry.o setup.o control.o mmio.o paging.o caches.o traps.o
+lib-y += iommu.o smmu-v3.o
diff --git a/hypervisor/arch/arm-common/iommu.c b/hypervisor/arch/arm64/iommu.c
similarity index 100%
rename from hypervisor/arch/arm-common/iommu.c
rename to hypervisor/arch/arm64/iommu.c
-- 
2.16.4


-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/075622da-c587-1c36-4476-cd946890ea99%40siemens.com.
