Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBV42W35AKGQEPFF4ZEI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5E0258489
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Sep 2020 01:52:56 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id h17sf688254lfc.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 31 Aug 2020 16:52:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598917975; cv=pass;
        d=google.com; s=arc-20160816;
        b=soJiuoTgLJBUsFpHGL8o6h+u05R/hmwfetil+3AqRFFEot7MM24ZH9cAl/hW7JI57j
         RjN6ZwFZHv0VullHVyYFlMSl96udvpZ2O0/MdTEH/VIKtSlWNQL59unippqexqRS/raW
         Q44z6hbhRgkcQZgAmSlRgSXgStcErO1flUSFQUGyAQn7Dd/w7biXovAxk2HlCMRvdos8
         Jb9MvVLQWBZpT1G9j/dvQvpMn+pCQbr3p5FN6k6JxCt2uc0iaiYH6LqqZFO11IGHYTvn
         bkaK4K22JnxkyiMHypCtqITCGnowLJ2vMH8aYFW8wmu64dKhwfudKJiXSPfWrVuXYXA1
         S6dQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=SpR7oGYNShyuVbclEQkx21N4H7U4ytqueojhZULd7tY=;
        b=VvUFyKKrDhOQRB88SxMfNyZxViIfJtIBXZW3DjJD3dWAg4hmbleZNoRmT+HkrWIui1
         VPeKVGkFKcMk1K1ebw6+KW8iPueWfPRzjVTtxXogOjURIa/BODxLF8ub27us4xLMpQ5m
         SxBik/+1TF2/U8kCmBgPXsLfGuAZbRi5XDCL/U7axDE8i3qbZ2HBHrkO/2irHviw+UJ3
         kzQmM6umz5ARBGstnICV1q5g9VEX9LrZvQC+pTgUbiWRppefbrTrpim1Nh0ELlskEC9f
         KdW5xfxgKUBA5py5d50xK0epVno0NhXdyy8FLbKdrd2eoepACwiqxGn8NH1z618emN9r
         dtYw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SpR7oGYNShyuVbclEQkx21N4H7U4ytqueojhZULd7tY=;
        b=F/27ZAZLViQoBZHG/S6DjV4YS2YkcsoB7qXrEH9DqC2aaIDz4eFgA/Gu0Hxgeh3IM5
         VB7uITcZLxVYwNA4U5TpIY++4QimtKKjmLBgOGz17W4Hv6f7uYkFAn60Mr6aOEXeubNv
         w4FH4Lz61RfOIu8Djy5+oynQ8BBW6zEwmgQU9JPCF4iIObsm0V+KmL+xUL7s+WFhOMn4
         XF7cBMyPL8c8hnN6FuG92p204s48FS0uN2GlY/AP8JSArpTIb0wXFStCFxxOtRSOsB5d
         5DAE/iidz1Ky9/Vj3IsR9SNJQIOOiXlVb21Ite9HjwovnCgSiNcDvPpUwaXKyl5YjeAw
         rQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SpR7oGYNShyuVbclEQkx21N4H7U4ytqueojhZULd7tY=;
        b=pktEn9aGymcbmLhdtimPxDnW9aScthvGOsQaJueG0ARERFLwPlvOowNBUew08ehrBm
         raI6BoSquN0xS7EfPkiDWw6whRu56Lxuve6AM7hDnIFuhB6YvHw6Qn8l+NRNOMBy/b0r
         vlkKe0inOTpa5p1R6xrUiavfvH6yVJKdjLNeYWQ3P1NzCtwzv4tTeyuFSW9S2d8q1EVt
         WqRceBHx195cFdJlY++KbR82ZVZiAIRi6wuAM0Ikv4zB48GXfEtn+kgypPvmxsHw0paF
         f2WLE13NsV9Y101rre8CwMtO/s90S7FPzM40ScEqfb2fYpVlFuVZBgqreJv/zjqFRq2v
         876A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530mJ30WAj3Emvq+UVgAXHXZ+KIJGgUoCv+A1Ytovl4IN+adAMEV
	Wi8A9gRN3kCLDIsUkNfkDy0=
X-Google-Smtp-Source: ABdhPJwk2g8GHryb05gqoA99hxpgXRDqGBJsYJPTa0OuxtNua9b7KQ2xl0Ze8t8+o2KvAFsqZdVMyw==
X-Received: by 2002:a2e:b04e:: with SMTP id d14mr1808454ljl.16.1598917975770;
        Mon, 31 Aug 2020 16:52:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5c44:: with SMTP id s4ls2109276lfp.3.gmail; Mon, 31 Aug
 2020 16:52:54 -0700 (PDT)
X-Received: by 2002:ac2:47ec:: with SMTP id b12mr1858954lfp.124.1598917974575;
        Mon, 31 Aug 2020 16:52:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598917974; cv=none;
        d=google.com; s=arc-20160816;
        b=Xx0vNnIEscYTBvXww5alTSXSiMGYAGlt1eeVCUlvg1coDpXKbBLNj0G4WZakwrhSth
         oGAJqBz0T/DJ96/egEsQEpJiN433pahzpgmZPzmhuB6q4SMEj+ANmdk6OuM5+GjuJCkM
         3XRmZ28coJJ1XaEAz5YZxiFPvXC1PY2Ymeqn2ENCh35FAlIa7f+xWegWGS20IfJCCSRa
         uh9e1e+4BKZQcVMknm30z7u4twLL+8115sxLFRrYn9pBb+zTaKm85pst0tLj5jY8g3pW
         lJeYF7qynLDioUShSZRAo5dwskNH7aw/dccResrHs0qBooEhpd4gOZUqXLipX14xcuBX
         4wOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=5mpNpHvvXormdRB6hioRbcUbAJGTP629XhvZjqt43mY=;
        b=aln84UMO4KVvBHILYvaw6DOCbvQrz9wfVan4c68LYFAMbstFrec8OqiWTdFdaF3HhC
         cUxF2+IB8W5Vl8pUgDQqk5FN0Bs88jMIAP8d71qey26PlxJDyiePgqo1NG7ZM1c0TEw8
         S9CV388m/DeTWfyeDi6zHDqRnmMHASfiMb8/6P09/ksTFtYNndJDA/5VeLMiPz6sB1ke
         FM44t+tw6X/YRxQNmdRUrd/3if3foRyc7lmF6J48Je2M+u+J6O0+fIR3VnfsZBSvpYKK
         ieqR1FBd1AUHIUVbM2/v6w1UeX5iO+9xm9em1Vti0FL73cddiw/PvOXoNsy9VYw4h50u
         b6+g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id 14si110280lfq.5.2020.08.31.16.52.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2020 16:52:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 07VNqrLi022592
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 1 Sep 2020 01:52:53 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.128.15])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07VNqorH007358
	for <jailhouse-dev@googlegroups.com>; Tue, 1 Sep 2020 01:52:52 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 1/7] jailhouse: Add GICv2-related upstream fix to 0.12
Date: Tue,  1 Sep 2020 01:52:44 +0200
Message-Id: <c52407ae4a03855062c9c195d00aa50110127194.1598917969.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1598917969.git.jan.kiszka@siemens.com>
References: <cover.1598917969.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

From: Jan Kiszka <jan.kiszka@siemens.com>

The issue fixed this way is visible so far only visible with the
upcoming RPi4 kernel update but conceptually affects all GICv2 targets.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 ...on-gicv2-Fix-byte-access-to-ITARGETR.patch | 52 +++++++++++++++++++
 recipes-jailhouse/jailhouse/jailhouse_0.12.bb |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 recipes-jailhouse/jailhouse/files/0002-arm-common-gicv2-Fix-byte-access-to-ITARGETR.patch

diff --git a/recipes-jailhouse/jailhouse/files/0002-arm-common-gicv2-Fix-byte-access-to-ITARGETR.patch b/recipes-jailhouse/jailhouse/files/0002-arm-common-gicv2-Fix-byte-access-to-ITARGETR.patch
new file mode 100644
index 0000000..8682f1b
--- /dev/null
+++ b/recipes-jailhouse/jailhouse/files/0002-arm-common-gicv2-Fix-byte-access-to-ITARGETR.patch
@@ -0,0 +1,52 @@
+From 8e1aea00f77d1c1a4b2313255966b741c2f1fd93 Mon Sep 17 00:00:00 2001
+From: Jan Kiszka <jan.kiszka@siemens.com>
+Date: Sat, 29 Aug 2020 08:08:08 +0200
+Subject: [PATCH 2/2] arm-common: gicv2: Fix byte access to ITARGETR
+
+Byte-size write accesses overwrote all fields the issuing cell owned,
+not only the target byte. And byte-size read accesses may have returned
+the wrong value. This was broken since the beginning, just wasn't
+stressed properly so far. Latest jailhouse-enabling/5.4-rpi revealed it
+finally.
+
+Fixes: ee6b35ba9037 ("arm: GICv2: handle SPI routing")
+Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
+---
+ hypervisor/arch/arm-common/gic-v2.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/hypervisor/arch/arm-common/gic-v2.c b/hypervisor/arch/arm-common/gic-v2.c
+index 6a81f77b..b63b0fbc 100644
+--- a/hypervisor/arch/arm-common/gic-v2.c
++++ b/hypervisor/arch/arm-common/gic-v2.c
+@@ -421,9 +421,8 @@ static enum mmio_result gicv2_handle_irq_target(struct mmio_access *mmio,
+ 	offset = irq % 4;
+ 	mmio->address &= ~0x3;
+ 	mmio->value <<= 8 * offset;
+-	mmio->size = 4;
+ 
+-	for (n = 0; n < 4; n++) {
++	for (n = offset; n < mmio->size + offset; n++) {
+ 		if (irqchip_irq_in_cell(cell, irq_base + n))
+ 			access_mask |= 0xff << (8 * n);
+ 		else
+@@ -441,6 +440,8 @@ static enum mmio_result gicv2_handle_irq_target(struct mmio_access *mmio,
+ 		}
+ 	}
+ 
++	mmio->size = 4;
++
+ 	if (mmio->is_write) {
+ 		spin_lock(&dist_lock);
+ 		u32 itargetsr =
+@@ -454,6 +455,7 @@ static enum mmio_result gicv2_handle_irq_target(struct mmio_access *mmio,
+ 	} else {
+ 		mmio_perform_access(gicd_base, mmio);
+ 		mmio->value &= access_mask;
++		mmio->value >>= 8 * offset;
+ 	}
+ 
+ 	return MMIO_HANDLED;
+-- 
+2.26.2
+
diff --git a/recipes-jailhouse/jailhouse/jailhouse_0.12.bb b/recipes-jailhouse/jailhouse/jailhouse_0.12.bb
index a87b6ea..67df3fa 100644
--- a/recipes-jailhouse/jailhouse/jailhouse_0.12.bb
+++ b/recipes-jailhouse/jailhouse/jailhouse_0.12.bb
@@ -17,6 +17,7 @@ SRC_URI += " \
     file://0002-configs-arm64-Add-inmate-demo-for-pine64-plus-board.patch \
     file://0003-configs-arm64-Add-Linux-demo-for-pine64-plus.patch \
     file://0001-inmates-x86-Add-LED-blinking-support-to-apic-demo.patch \
+    file://0002-arm-common-gicv2-Fix-byte-access-to-ITARGETR.patch \
     "
 
 SRCREV = "92db71f257fabd3c08fa4b99498fa61a41ea831d"
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c52407ae4a03855062c9c195d00aa50110127194.1598917969.git.jan.kiszka%40siemens.com.
