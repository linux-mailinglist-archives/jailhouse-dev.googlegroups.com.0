Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBP5NWP5AKGQEKJ5ZYXA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9B12577C4
	for <lists+jailhouse-dev@lfdr.de>; Mon, 31 Aug 2020 12:53:51 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id m125sf888892wmm.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 31 Aug 2020 03:53:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598871231; cv=pass;
        d=google.com; s=arc-20160816;
        b=wn5m4KdGVpiT5eoO+eFbEE+/x2pWHCjZbMOtIadNOPBKFst0A5H5h49vXmfBouPRDc
         sxUYZ32JxLkU8sPm8JQ0h4OZhTYXH4N30QGYDNRJiWDGaUF0s1dw0HTKmkCccTIlMNXU
         wuZ/oOe73vP4u3AJaJ5oCDKMvFxsDAOdjxynEAW3WgDQEwPit04Pc2I7Kwd8n2wzM+wC
         QnNon9XBZTh3RzgMdkvDjylO62uIWbvb8dbqfIcFCf0ljHpI/sdk2HzVmxxS4L5n9RAG
         pT/yTLKpKbDyXm3RoGNA8RW48gX/a0ejCQOTQP9LlgpGuI4Sw7udxw86RTsQevqFlKqP
         gvPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=kfezkR/hyvbSvtkIPEpo4KprK8qMWdZIB5+RScyTQf8=;
        b=wx59KSTX1txwS8TU5alg5nkkqDNparak8PTtgs2iExlv9HR55p8qMNfnJxm0EppORL
         CF5wH2ei35miVX4hmfE1b27q6IMp6rsisizGQZmAHdeA06K0GCFQkoc5GG0yx4jS2NrR
         g2G2eIHtK5jnXZGi5UKaqCTcjucYMHPEZDOXSqrNNn+JfmSpWOON2TeHm4vbmBGNJgTx
         l0U2YcRd2qxFvDh/wIZLiADKA+4XVser5kwLZVx6Iwy/dqGjEnHeYVLGkQCkbYFjwecN
         adyLCOXvwA9N87unKCpD5eQkN1zv1NDtiwwGu6Zxg0uQ+r+P5Oe0qvCF31v35BydtsR6
         c0dA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kfezkR/hyvbSvtkIPEpo4KprK8qMWdZIB5+RScyTQf8=;
        b=UkE5aC463L/rZsj5v26ISo00xfeF+9MJMS5BUYtAE7ww/TvYFL9Zv4A0xdBfHqHOys
         9EnS9+fSU7oWPfB26Uqd4m8L56I/8AsdJWXf5RtcSYtHfFSx2CKFDoFEXdeF+gyAeGU8
         AGPW6bFK+bE0YD5XuQc8V+9in/x8pSUGrS2QhWnZc4rw5ntJ9ZGbaGGRrg5X2nMXV1oZ
         Vdx/pi5oqP+Ge5yihC70/yoUmcyRE8Iv+mPb1VG7g5biZwcOu6WUxaEinXh10EMydv/b
         o1RAuBG02vjnMDz/M+Lo5EYYoi67J1eLuErdy8ZjkGO3fe6XxRYGDgKseQmobfAxEKjW
         6weg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kfezkR/hyvbSvtkIPEpo4KprK8qMWdZIB5+RScyTQf8=;
        b=gtHIRqi3Si1aaTtoyMo3Tysv97xTzLSzVaYfT9kZJPnEKU0WB/EPeGlod4+rKd7yIS
         ZZJXX9dwpIBGDdeuZeCGqFKk9eRYoEHjl+beSLClNmoaVoWyGm8p/0Zr/baHTYcKoHLk
         ArzTRobWM1B5MkzZlMSgQfYkS2UdNDAuX0dmza0Hg17GUmfDI7uGdK48/Y1yXcXKHqkT
         MMwO3/BFVAdkqyTEKo4tl6fFVfZTVZkYmjAh5NVovHpx/gHL5MoHGd2azM+TK6sXwX4L
         po/Y5qJKkB9eicnYnkjjkCETRf0ZOJvEYlPuRBUhbeH28OIU0J8fEN6gSRn048K/4a8p
         tp7A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5333iWXPOaptcl3Aq+Ah+vBqMKNWTe3zWsz5Jz/oU/UcRY9moe9/
	57Q9qk1DDgmuQo1RBnJL1mw=
X-Google-Smtp-Source: ABdhPJydsS+s6bAGfMzSQ3mWpm1YKqxwjkqxxrr7ReASpyOYGFhoI3L3E4Pj3yy9g4wpEuJiALae6Q==
X-Received: by 2002:adf:b19c:: with SMTP id q28mr1190802wra.392.1598871231459;
        Mon, 31 Aug 2020 03:53:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:dd0a:: with SMTP id a10ls4095187wrm.2.gmail; Mon, 31 Aug
 2020 03:53:50 -0700 (PDT)
X-Received: by 2002:a5d:67d0:: with SMTP id n16mr1218923wrw.198.1598871230566;
        Mon, 31 Aug 2020 03:53:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598871230; cv=none;
        d=google.com; s=arc-20160816;
        b=uszwd+AG42c7KqCbMr6RkYFoYPFOr3QNWiabtcGpq4VOay7ohMqfs9VKZL+kCT8BWT
         lWnJcy626MGAzu+lrkpT1uaNIDODK1S0FgZazS66pGSclFmheMfC49cHsW2V3pqrbANp
         foYSpX+4s0OxzAK9Q3PUCf8utLwb4RnStEq00GOzVNfwkj7XJLzGzPtHqHPTh2UopBMi
         sUqSUmoYVzI0i91DqCqx1bG88+F15IDdTd/qZuJRdrw0gBCYhYbXeSlVKCmOrjt+kwBO
         G3Y3sO+Ein2sQhAiwv3YaCFdOZHDzdNtuGeR3YqOzdX3fmhQmK06SQNgJU04c7BsBmen
         ez5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=5mpNpHvvXormdRB6hioRbcUbAJGTP629XhvZjqt43mY=;
        b=VkpLCA+xi/6KUP3Je6H+WkLUyUxsxjxNr1KVYlyCDAU5JDDyVlOrecfFK7HQJzI9X6
         A6n8zOOrG8EIy5cd2gu+lNCD4mEMCETTcfKD+bybpqNg52BiPCxrJD9O0BixJP7lwnyk
         NTIaV/1dGu1ZxOcxA+1HK1BV1mXT5wD9gYk1A5etjCYG96vLScEHbPohYW+LBTZlvRdT
         08cKtN5nfmWo9u0RabZ/JeR1F111BpuFnEiE0A8vmrrclIJkp43c0U+yUm0eAYO3rwxl
         0O09AXZUCMPOEJMpUGZEfutX8o1NzO3uBW6Z/B5JTkjSPDtdk9Uqo5m1zyXYvBBKkllY
         rskQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id g5si33938wmi.3.2020.08.31.03.53.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2020 03:53:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 07VAroGV015376
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 31 Aug 2020 12:53:50 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.39.104])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07VArnQh026382
	for <jailhouse-dev@googlegroups.com>; Mon, 31 Aug 2020 12:53:49 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 1/5] jailhouse: Add GICv2-related upstream fix to 0.12
Date: Mon, 31 Aug 2020 12:53:45 +0200
Message-Id: <c52407ae4a03855062c9c195d00aa50110127194.1598871229.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1598871229.git.jan.kiszka@siemens.com>
References: <cover.1598871229.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c52407ae4a03855062c9c195d00aa50110127194.1598871229.git.jan.kiszka%40siemens.com.
