Return-Path: <jailhouse-dev+bncBCPOXAO4SYIBBTNFSXZAKGQEZCIPEYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A9F15BFA2
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Feb 2020 14:44:46 +0100 (CET)
Received: by mail-wr1-x43b.google.com with SMTP id w17sf2349370wrr.9
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Feb 2020 05:44:46 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581601486; cv=pass;
        d=google.com; s=arc-20160816;
        b=FuJ60F7QzcN0C1qJZMKkcq12h1Q7PqX1POHvdZJCzKfzpL4mrqqfJby+QGyC1O+6xO
         SPV7H8rxyc6Ho8F9EQ3j3ZLHPE6oRFZFym7APqI5UIFBz5f5QFfamsql+ZUjhiWkjokX
         uGlzxqPSgXeRYjLOTN1MsDgiv8O3wpoqGGihxzsjqZvRB3DveMCn0ErrrExCyJXIpaiK
         GTEEgwOvWiYTioJ4YgvQxgSSsN0qVEdVQF81AfMs+hI/GxvHyuKWD3AqAN/Z0XhiyQkb
         tLlMsktyJ/dxsOFaqjzIe/AgDP9BRKCxAnMgbkjIpbR2DUBvyFHOOPSS7HVHYkYRT+yz
         EZMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=nS5lm/gFTMYDiWmLuAELfwvMmu+dc+ebS4n3UO97BQY=;
        b=q35Vp3GxnU5HWGXTj8Fz39u/PjkJiS/Rxd8745ZPZhSbvjTdxhCRzGC44QDM0dYIVd
         i6YTiR6aUjicsyM93G9aNgz0B70RdfVc2HcdiQEzJFxhHFWiCn1VU+fVLfGn2AdGvutC
         wklQO2fhnCC4vgwIgwTNn9cRO+wCoJHxlN4WlJrTSevjibXyLmq4Vvm4b9B1bCcNOk86
         wynxMP2ZJ90zMgLTN63q+3t04aagG/lPp914WLjaRQnfHoCE/XMkyVectqCUR4k385o3
         NS/ZpHh6lGjo9r1lfGbaInxzrbkF0DJ1NfO6KfNkYESxb6/H1seo/0Ivtuui0NZzMxay
         +EBA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=faMpBeyE;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2a00:1450:4864:20::343 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nS5lm/gFTMYDiWmLuAELfwvMmu+dc+ebS4n3UO97BQY=;
        b=OeQBPCMfN9kHqGn6MTMss2PMi4YoFQxTLbS8ZauzmtbnQGvxFLk2KFs8WnVl8PQW0M
         mKiw5nAxrtReQeGIxOcqhKkaIkJQyMSuESWk/zzHc50LrWtwySEcpy/0tzpcvgJofAxu
         uHB8P4MOdY22TncMIgRhJ5NNrbNcevi6XmToQzS6UEVBPS4E0uLCLbvnwTSePkFHx/j1
         oqU/T355Jo3uHMiNpHvO7h7CWBWP34K7pISK3KSUTGKyUDeLKQqD/hO0HkmPRL0rQocp
         AUH/r5c1DTweGA65q/s/NhTaGHECCTBt1nN/s2TVk+KpMSMFta8wUZulEB2FIPpthyfx
         KcaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nS5lm/gFTMYDiWmLuAELfwvMmu+dc+ebS4n3UO97BQY=;
        b=Nx/Y2Dte7ZYtAjEfYLcN8LGY9nKUJudDOwpBhqqBPqef1T9v2MAS943B5NNbbW+8//
         NURCT6iLwL3KOdZR7u6YVs+GYLCx0+00UBBjnuURIidWllcYz4qelpqQHnGoVhdRyMRK
         KO3de0JOgTy2Ojx4NoAvZGT/ZHtGFECx75MWGgT3rYELMWrtsRTqgon5BwueYEEEaZCa
         5UEpnuyovKLfat4TOEmXfw1bydb1jZejnljskao0beNzVup+Zd5I5wINFnIalMMmhEZA
         YvakTw0F1QKOsAN2XBE00RLYMv9iITke5F9FHoaObjwX2JAHbdMHqNdWOnCe/jJVONYg
         Ymrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nS5lm/gFTMYDiWmLuAELfwvMmu+dc+ebS4n3UO97BQY=;
        b=BiR670yROw4CZdG3rA0Fha8G1Xb+ZZVGvFMnu6j6C6IQqTR4hxku/Fem5AivsXT68v
         1Uv48HOfAPON2U/Ey0NJtOYG9V76bhpoz8WiYgfgXIYG5gZzQFYB9UaJqDBSP8VtGRxi
         PfGBBGlcP/800/iLBsZ5wYS0xFUEgVCAMUzsxvrG6A/s6Cw8ALHRQKuvHY1oC27R0ZlY
         ZHusqnkD45BBeCu41/Tsc9OV5QXwGYNndIhfU7VF7F/vn8Zpvi7DQRo/J6vILDk2B7Vn
         g5h9i8OXe6d/laFkfoIKTnEYwdWVXsITKRdtqOOvDMV5S36QmU+r1zF2x934tg+Lliu3
         QUTw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVaI1H6QW2IdXVaYknNHysCacQM32smtGZpazS0uS0aAbtNWdcH
	fMFXltBqfYOW118CQ3Uq2ww=
X-Google-Smtp-Source: APXvYqzTvonzcH28t5j6Tf2juAj2mET9bu/KbD4fNeabn1a0JudncDNmMMPfuoxHSyZChHurkDP+Pw==
X-Received: by 2002:adf:8b54:: with SMTP id v20mr22893165wra.390.1581601485866;
        Thu, 13 Feb 2020 05:44:45 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:1f04:: with SMTP id f4ls159173wmf.0.experimental-gmail;
 Thu, 13 Feb 2020 05:44:44 -0800 (PST)
X-Received: by 2002:a7b:c407:: with SMTP id k7mr6145052wmi.46.1581601484855;
        Thu, 13 Feb 2020 05:44:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581601484; cv=none;
        d=google.com; s=arc-20160816;
        b=wVsRwagWXcuJFz3IubUYqEhTQSN5V+V0FJKZf0vFzPWXnEoE5CBVeVlj554CMTbSdi
         /ReOyqYEhcRwc96pXg2hep14r8m3JlR6os3CZ0PA9rcAlAOaov+k9X2lkxoHDVc52rNF
         w3y0uNfgvmhXd2w0L0VwTC/2YMZi8eTtXwV9fJD3o48LMNJIV5cm6DvSmSF8VkpjUEMO
         zn3zOu5Pv+ZKa2avedmuQBGOr0xVHAkgZoNeIYtq4OTLX1+Msgl3WapcW9WtsYJrpbqt
         6eFp1utmIAqRmVDDZqYgF6j5upx73Z7TVsdO+nTa/YsIOn7jqOcDvP6Xzi4T3tmGpdy9
         1rng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=g0rSFXcou1ijd90xbcfF6jhylVtD+B6eQG/E9Xb6DE8=;
        b=MqzXglelpo7V99bPuqjbD16LwjTSejgO9I65qKQedoMx+RcI/Li3sv6y1T/N5C/KgR
         hsFIyjenhDKiwzGWXdgnYz8tvgAmNwBNKth/cOyYHiyI18xJIIJSOAQYADyqA/mRzlW2
         n6yIWPRT6nFhYPWkHwg/HPF12AwQci9vQb758UsKZy6iSj6r6P6fSEOTqH+IoMw/DYok
         E/G+1dJRQw458zT0Gpet6gyNeq3ksAOI3WSsxvM6uoQhFYZ2JK0z8//Cj0g7CFA3Pfx1
         /BKX9T/njZNj+UpE+0PtLIMx7faQcMc2iDWockV4F7btJkQR/x6Tup2W4v4Bg0wOs1Vy
         StFg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=faMpBeyE;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2a00:1450:4864:20::343 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com. [2a00:1450:4864:20::343])
        by gmr-mx.google.com with ESMTPS id p29si101793wmi.2.2020.02.13.05.44.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2020 05:44:44 -0800 (PST)
Received-SPF: pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2a00:1450:4864:20::343 as permitted sender) client-ip=2a00:1450:4864:20::343;
Received: by mail-wm1-x343.google.com with SMTP id p17so6797255wma.1
        for <jailhouse-dev@googlegroups.com>; Thu, 13 Feb 2020 05:44:44 -0800 (PST)
X-Received: by 2002:a1c:ac46:: with SMTP id v67mr5751534wme.153.1581601484225;
        Thu, 13 Feb 2020 05:44:44 -0800 (PST)
Received: from oxygen.mgc.mentorg.com (nat-sch.mentorg.com. [139.181.36.34])
        by smtp.gmail.com with ESMTPSA id z133sm3162729wmb.7.2020.02.13.05.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 05:44:43 -0800 (PST)
From: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
To: jailhouse-dev@googlegroups.com
Cc: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Subject: [PATCH 2/4] recipes-bsp: Add support for pine64-plus uboot
Date: Thu, 13 Feb 2020 19:14:28 +0530
Message-Id: <20200213134430.3052-2-vijaikumar.kanagarajan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200213134430.3052-1-vijaikumar.kanagarajan@gmail.com>
References: <20200213134430.3052-1-vijaikumar.kanagarajan@gmail.com>
X-Original-Sender: vijaikumar.kanagarajan@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=faMpBeyE;       spf=pass
 (google.com: domain of vijaikumar.kanagarajan@gmail.com designates
 2a00:1450:4864:20::343 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

Add support for building pine64-plus u-boot. Use mainline u-boot + ATF.

Build only the necessary envtools. u-boot tools-only build is broken
upstream and hence not supported here.

Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
---
 recipes-bsp/u-boot/files/pine64-plus-rules    | 32 ++++++++++++++++++
 .../u-boot-pine64-plus_2019.10-atf2.2.bb      | 33 +++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 recipes-bsp/u-boot/files/pine64-plus-rules
 create mode 100644 recipes-bsp/u-boot/u-boot-pine64-plus_2019.10-atf2.2.bb

diff --git a/recipes-bsp/u-boot/files/pine64-plus-rules b/recipes-bsp/u-boot/files/pine64-plus-rules
new file mode 100644
index 0000000..f6340f7
--- /dev/null
+++ b/recipes-bsp/u-boot/files/pine64-plus-rules
@@ -0,0 +1,32 @@
+#!/usr/bin/make -f
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Vijai Kumar K, 2020
+#
+# Authors:
+#  Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+ifneq ($(DEB_BUILD_GNU_TYPE),$(DEB_HOST_GNU_TYPE))
+export CROSS_COMPILE=$(DEB_HOST_GNU_TYPE)-
+SET_CROSS_BUILD_TOOLS=CROSS_BUILD_TOOLS=y
+endif
+PARALLEL_BUILD=-j $(shell echo $$(($$(nproc) * 2)))
+
+override_dh_auto_build:
+	$(MAKE) $(PARALLEL_BUILD) -C ../arm-trusted-firmware-* PLAT=sun50i_a64 bl31
+	$(MAKE) $(PARALLEL_BUILD) $(U_BOOT_CONFIG)
+	BL31=$$(readlink -f ../arm-trusted-firmware-*/build/sun50i_a64/release/bl31.bin) \
+	$(MAKE) $(PARALLEL_BUILD) $(U_BOOT_BIN)
+	$(MAKE) $(PARALLEL_BUILD) $(SET_CROSS_BUILD_TOOLS) NO_SDL=1 envtools
+
+override_dh_auto_install:
+	mv tools/env/lib.a tools/env/libubootenv.a
+
+override_dh_auto_test:
+
+%:
+	CFLAGS= LDFLAGS= dh $@ --parallel
diff --git a/recipes-bsp/u-boot/u-boot-pine64-plus_2019.10-atf2.2.bb b/recipes-bsp/u-boot/u-boot-pine64-plus_2019.10-atf2.2.bb
new file mode 100644
index 0000000..4842ef8
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-pine64-plus_2019.10-atf2.2.bb
@@ -0,0 +1,33 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Vijai Kumar K, 2020
+#
+# Authors:
+#  Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+U_BOOT_PV="${@d.getVar('PV').split('-atf')[0]}"
+ATF_PV="${@d.getVar('PV').split('-atf')[1]}"
+
+require recipes-bsp/u-boot/u-boot-custom.inc
+require recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_${ATF_PV}.inc
+
+SRC_URI += " \
+    ftp://ftp.denx.de/pub/u-boot/u-boot-${U_BOOT_PV}.tar.bz2;name=u-boot \
+    file://pine64-plus-rules \
+    "
+SRC_URI[u-boot.sha256sum] = "8d6d6070739522dd236cba7055b8736bfe92b4fac0ea18ad809829ca79667014"
+
+U_BOOT_CONFIG="pine64_plus_defconfig"
+U_BOOT_BIN="u-boot-sunxi-with-spl.bin"
+
+BUILD_DEPENDS += ", libssl-dev, swig:native, python-dev:native"
+
+S = "${WORKDIR}/u-boot-${U_BOOT_PV}"
+
+do_prepare_build_append() {
+    cp ${WORKDIR}/pine64-plus-rules ${S}/debian/rules
+}
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200213134430.3052-2-vijaikumar.kanagarajan%40gmail.com.
