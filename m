Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBS7YQDYQKGQEJH4YGQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id EC35213D801
	for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 11:34:51 +0100 (CET)
Received: by mail-lf1-x13f.google.com with SMTP id q16sf3777351lfa.13
        for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 02:34:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579170891; cv=pass;
        d=google.com; s=arc-20160816;
        b=WrcYHuj9OG25ovHKdicot9f+ZegvQfvnMg4v0n1LIIvNv+h9zswS/Dffhycv5W86bj
         IVmommKfAm0ROrzPBPyuBISJcoATjfVIgE8r8iMKT7QAqbrTtsLuUtynV6zrgFA+wD6G
         bQcqqPHjRrmU57MdFsXeqo+QxaRyMZVC6EHhbksPxhcYWOsTtzpl2pvy1blMmrnAEGXX
         OFnYBs38X2MSkSHJlTQ0nQiFq+w/ENvWfZtdCoWE6ebBep0s2DG8uRJp3JIrUocoM3Qx
         5vB13eCVJGvlreQTfo1HVTAR0g17iC5ubDlLBuhtwvJXpGUoLaBMopVOxNb6SpNy0tdi
         WoLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=26oWDu6ojMroEhGrZwI/vUL8TJj7WxjBPCNlNvkVf4c=;
        b=jVfPT0fVpFzCSU5BDWFUeadA9T8nhf+YhLjuSi/W+Q7440Pn7vCL13mZFU8vDZNQnA
         8zf3bJpG4tuFm49p1ad8WnK1rixHgs1ViqHcdKlnA+hY2rCP++iLUK9UxuuTqgYk+P60
         WGYFFN9WS8fOeB7aSBj4j3KSQnMoctDo2shux1Zrg2HXpKC9G1pU/VXC9dA2nJXH7ywI
         eRiFSvx6BK6kefk+LTv9uAnjoVn1ffWKFhYbQnSiRyAx2OrwwwWLnSaBaYwgDES8QjNL
         Vk/Nraqf22mrBVuhSzkoD6MuI43z7a+00ieK5HkyuWR4TWNCjXYUtAUuXVmv6vdJhjKd
         pdJQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=26oWDu6ojMroEhGrZwI/vUL8TJj7WxjBPCNlNvkVf4c=;
        b=pT4KW92xUmyAu/Y6iVCYUDRj/8GscaIXkIyIwJIsFg7QclScTmyrcQVnrsnHArp8Ct
         2E449eMLy25U69/Q0Rkh5cf+mwUWsEjw38qWjsY7sKuBWaUBWHFplfgK1j+A/d4GVjJM
         JGBBQv0MCYWbUQdMFXkkpYgy3d5tK6irS6DEd+4lh5ae/OBB/CQd6fxDu5C6Jl2LmboH
         HdLTLI2+kxHaAcA//poqrtMbNJ3np4gYCoydRjJXXKWHmkUdyxkmWjAadD05wxcXAHBC
         iA8B3vFBPXqYnl9ccGnheYKtmQCdP7QdFsqKTuC3/T3FUN40yo5hJgEdiy9cum3DEwWD
         PkAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=26oWDu6ojMroEhGrZwI/vUL8TJj7WxjBPCNlNvkVf4c=;
        b=X5ilV1w/IgIoP8jFD2YR80Kss32C1iZKWQeCm3l7WGr+rzP1A6HuzPOwsL9BRpU5s/
         pI9XkSsdJz60wsk+BThudLz7r8BDRrw98xJ/x72vOKR/Dq5O5cZzMd9eBCi/OiOEhtV5
         4+j5ratSfpRfCeujlZizDIafaCWww74hA2Fx67f+aYRU41s4TvDZ/WtQ8JdVF0zcEr7A
         Pz2Drk4wctLQ3PQscu3Txq1tshXy6qsL/PdiZ4OnGZTzYvFGVUG9+zT/ANaGQ+i5arJ9
         v7PoBIwuvXqScNCBxDrhx7+NmAz4bARv3ZoqBXJREeSkiWxbtKyKZPID02scNGp5NUPb
         FO3A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX5o105as8RHBCq913kWpUtiWAG8TYduiRPaURPjF8/ezImlm3R
	j5FU+ODarlG7+hwUEXpWwTk=
X-Google-Smtp-Source: APXvYqy6RJQqk5XlLyW8xMjxOM20omINwveSZqXQTyem3BWCuP/7GkZnWunpQp8b8h78XNi0hK2BlA==
X-Received: by 2002:a19:98e:: with SMTP id 136mr2176782lfj.108.1579170891509;
        Thu, 16 Jan 2020 02:34:51 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:8808:: with SMTP id k8ls2092922lfd.6.gmail; Thu, 16 Jan
 2020 02:34:50 -0800 (PST)
X-Received: by 2002:a19:5212:: with SMTP id m18mr2094786lfb.7.1579170890697;
        Thu, 16 Jan 2020 02:34:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579170890; cv=none;
        d=google.com; s=arc-20160816;
        b=I07EGdN5IHI1UPxTsIvFk4hG5T8lnog1rcCyskVzX/YYm0mE2Pew1O4gg3umkSSkd3
         u/Xwyya/Vjqc1jmvII0XOr/4rUxYLkLmmilKJL1lbHqiPJpDi+Yr5ISUs/dFO5e7XYwT
         Cbm2u91DVzjB1q76Vi3F5o0Hl2ZZ8EuAD3sPddHnwybKi5CNC+vBG+dw/90DbErmhI2a
         M2LEhuTJ80G6JL2KpaWdp+4P55ycsMitK+UwQdjbsQ0n/0g1HuR/tEgUW5Cv3eqj6OLX
         6WhK2oqSRWC0ZR1mx39tD+EXGTUUxnyJoZS0sIPLCaDhyAETXtImUhfDkFWUXlKUChN3
         j3zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=3sH0ugbRme0HVWJmCHHSF3sDnKQBkWcIe540vPvlPoo=;
        b=bXThZjrIZMG6jnCRL3VgV8zOzSGaDZqT0T6eShldwXWjXA4gYlWUvCd0yZnz12FeSy
         DO+2bzWjj3uOjb7X0v55IMR1o9cHWaa1+PLTOspiJeezFLVQAZ9/iURdsZbGyM6+ah6f
         m2p7SPIdf62Qwj8JY+GLEkiYXh4vN4r4HWrKqLuM72PhwgA5Sz/QNyZna6y96FYPfhEh
         wSzwwrJCl9SjXkfneNyS/qWOjgy1SaVurDdnngB7Fa/0asXPIP1mh2OpZicOyQAIgheI
         bFxb2yfDWIVVi8pi+sLFvUVMBstURjh4Se9UOcRno2iUAQBFOIg86kLxASLSgQYI/an4
         iRBw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id 68si1013634lfi.3.2020.01.16.02.34.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jan 2020 02:34:50 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 00GAYngY015299
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:50 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.23.78.127])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00GAYmQN031623
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:49 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 13/18] arm-trusted-firmware: Build for RPi4
Date: Thu, 16 Jan 2020 11:34:42 +0100
Message-Id: <cdb73c8bfafc1c97fecdbceac8a9c5ee59eeb28b.1579170887.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1579170887.git.jan.kiszka@siemens.com>
References: <cover.1579170887.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1579170887.git.jan.kiszka@siemens.com>
References: <cover.1579170887.git.jan.kiszka@siemens.com>
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

From: Jan Kiszka <jan.kiszka@siemens.com>

This will be the key to enable PSCI-based CPU hotplugging on the RPi4:
Include ATF into the boot process and patch it to provide also the
CPU_OFF functionality. The patch is pending for ATF upstream.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .../arm-trusted-firmware-rpi4_2.2.bb               | 28 +++++++++++++
 .../arm-trusted-firmware_2.2.inc                   |  1 +
 ...001-rpi3-4-Add-support-for-offlining-CPUs.patch | 46 ++++++++++++++++++++++
 recipes-bsp/arm-trusted-firmware/files/rpi-rules   | 23 +++++++++++
 4 files changed, 98 insertions(+)
 create mode 100644 recipes-bsp/arm-trusted-firmware/arm-trusted-firmware-rpi4_2.2.bb
 create mode 100644 recipes-bsp/arm-trusted-firmware/files/0001-rpi3-4-Add-support-for-offlining-CPUs.patch
 create mode 100644 recipes-bsp/arm-trusted-firmware/files/rpi-rules

diff --git a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware-rpi4_2.2.bb b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware-rpi4_2.2.bb
new file mode 100644
index 0000000..2dd180a
--- /dev/null
+++ b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware-rpi4_2.2.bb
@@ -0,0 +1,28 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2019
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+inherit dpkg
+
+ATF_PV = "${PV}"
+
+require arm-trusted-firmware_${PV}.inc
+
+SRC_URI += "file://rpi-rules"
+
+S = "${WORKDIR}/arm-trusted-firmware-${PV}"
+
+do_prepare_build[cleandirs] += "${S}/debian"
+do_prepare_build() {
+    cp ${WORKDIR}/rpi-rules ${WORKDIR}/rules
+    deb_debianize
+
+    echo "build/rpi4/release/bl31.bin /usr/lib/arm-trusted-firmware/rpi4/" > ${S}/debian/install
+}
diff --git a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.inc b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.inc
index 2281d72..dbf3d8f 100644
--- a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.inc
+++ b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.inc
@@ -13,5 +13,6 @@ FILESPATH =. "${LAYERDIR_jailhouse}/recipes-bsp/arm-trusted-firmware/files:"
 
 SRC_URI += " \
     https://github.com/ARM-software/arm-trusted-firmware/archive/v${ATF_PV}.tar.gz;name=atf \
+    file://0001-rpi3-4-Add-support-for-offlining-CPUs.patch;patchdir=${WORKDIR}/arm-trusted-firmware-${ATF_PV} \
     "
 SRC_URI[atf.sha256sum] = "07e3c058ae2d95c7d516a46fc93565b797e912c3271ddbf29df523b1ab1ee911"
diff --git a/recipes-bsp/arm-trusted-firmware/files/0001-rpi3-4-Add-support-for-offlining-CPUs.patch b/recipes-bsp/arm-trusted-firmware/files/0001-rpi3-4-Add-support-for-offlining-CPUs.patch
new file mode 100644
index 0000000..33d288b
--- /dev/null
+++ b/recipes-bsp/arm-trusted-firmware/files/0001-rpi3-4-Add-support-for-offlining-CPUs.patch
@@ -0,0 +1,46 @@
+From 92ff7ed78f8600adc9733663380706a1bdb3e4a9 Mon Sep 17 00:00:00 2001
+From: Jan Kiszka <jan.kiszka@siemens.com>
+Date: Sun, 8 Dec 2019 20:48:46 +0100
+Subject: [PATCH] rpi3/4: Add support for offlining CPUs
+
+The hooks were populated but the power down left the CPU in limbo-land.
+What we need to do - until there is a way to actually power off - is to
+turn off the MMU and enter the spinning loop as if we were cold-booted.
+This allows the on-call to pick up the CPU again.
+
+Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
+---
+ plat/rpi/common/rpi3_pm.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/plat/rpi/common/rpi3_pm.c b/plat/rpi/common/rpi3_pm.c
+index 8c2d070c4..2a6bf076b 100644
+--- a/plat/rpi/common/rpi3_pm.c
++++ b/plat/rpi/common/rpi3_pm.c
+@@ -123,6 +123,15 @@ static void rpi3_pwr_domain_off(const psci_power_state_t *target_state)
+ #endif
+ }
+ 
++void __dead2 plat_secondary_cold_boot_setup(void);
++
++static void __dead2
++rpi3_pwr_domain_pwr_down_wfi(const psci_power_state_t *target_state)
++{
++	disable_mmu_el3();
++	plat_secondary_cold_boot_setup();
++}
++
+ /*******************************************************************************
+  * Platform handler called when a power domain is about to be turned on. The
+  * mpidr determines the CPU to be turned on.
+@@ -224,6 +233,7 @@ static void __dead2 rpi3_system_off(void)
+ static const plat_psci_ops_t plat_rpi3_psci_pm_ops = {
+ 	.cpu_standby = rpi3_cpu_standby,
+ 	.pwr_domain_off = rpi3_pwr_domain_off,
++	.pwr_domain_pwr_down_wfi = rpi3_pwr_domain_pwr_down_wfi,
+ 	.pwr_domain_on = rpi3_pwr_domain_on,
+ 	.pwr_domain_on_finish = rpi3_pwr_domain_on_finish,
+ 	.system_off = rpi3_system_off,
+-- 
+2.16.4
+
diff --git a/recipes-bsp/arm-trusted-firmware/files/rpi-rules b/recipes-bsp/arm-trusted-firmware/files/rpi-rules
new file mode 100644
index 0000000..abb65be
--- /dev/null
+++ b/recipes-bsp/arm-trusted-firmware/files/rpi-rules
@@ -0,0 +1,23 @@
+#!/usr/bin/make -f
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2019
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+ifneq ($(DEB_BUILD_GNU_TYPE),$(DEB_HOST_GNU_TYPE))
+export CROSS_COMPILE=$(DEB_HOST_GNU_TYPE)-
+endif
+
+PARALLEL_BUILD=-j $(shell echo $$(($$(nproc) * 2)))
+
+override_dh_auto_build:
+	CFLAGS= LDFLAGS= $(MAKE) $(PARALLEL_BUILD) PLAT=rpi4
+
+%:
+	dh $@
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cdb73c8bfafc1c97fecdbceac8a9c5ee59eeb28b.1579170887.git.jan.kiszka%40siemens.com.
