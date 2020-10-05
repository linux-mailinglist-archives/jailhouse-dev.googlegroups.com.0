Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLHD5L5QKGQEFZV2TZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F2228302B
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Oct 2020 07:39:56 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id 23sf2806350lfy.15
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 22:39:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601876396; cv=pass;
        d=google.com; s=arc-20160816;
        b=Py7hEY/92rNk3spR+TRrkwTtYnAH//1w8HcwFsdS6QBB4G6pz8b/So7B9hIXXfzeSV
         IKYYuhomJ3ax63OfyVq0BlArXBHsHtMdS5s6UcG2FVmVpCnf2yDDz2bKPNeW5ILiGRcu
         Cka5fkRxZzVMSSjFAT5hS5+P+WJPL1E0JXTE49r/8ViIfHs++M1Ryo94+kiuudhvMvWG
         /EdulZAiuUgdDU8tcEwbQSBVciJ+bTbTBOEYWQP7k+2kXi9fdeA9RAs3qA9jMCBYl6Lw
         hMI30sobd5fYgVW1d8mqSj1bbUNU9kPy+LUeauzmtDglxlW1BXXwkgTrV5UlRq2bgNKp
         xLSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=LbbnaDI3jbykcmqXiSeRQcmnCDtxF/X1Boj+XkGvTpI=;
        b=De+Xf2QEaHQAQpuqmT9HwC3B645L+sH1m9c0eLfxgcZsfbxb0PudbMH56Papn0EKKm
         Lz5QkPkBIajMhKWKV2UeqKNz3scN93XAn92jGQTR63DNqT81CyVEiLbPAPfPSbL9fIqd
         oAjLJLsCGmjmm7ll6fnTvP7oM+81MuUfQ1ZQ0K8me1Aw7wzHBS5kCYBWh1aGfFBDRpg5
         purDQjmIpF8cfUuHtsiRTw/dVmp9v8M7q/p+iyrHfQHlBQHy96jOICJ1YmudHtmsAZiZ
         cSUI6iBW+00yxy6T0J4HAuGgx1AqAw9ilM/ERERE8DO+i/AHm72CpaDAdk4jimKurzSs
         LOXw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LbbnaDI3jbykcmqXiSeRQcmnCDtxF/X1Boj+XkGvTpI=;
        b=F/TaJvUP9rfDLY8FgqV4Mb4WahsjuhAudosvYS5KvJowIy/HMzh5MGgnK2XX9fIqyx
         fvg+Zv8ImKsX6GshqGyh8We1ezOq9VlVuKKHIgIhlPrEUgV+TC+qz7Pps00JgegYIi+M
         fIU7IOvJYSElHC7bgEAPPxwp5gpeiWLpzcnCNaXYFq5TEkx+ZB5ECH+EWvEyWo2C6B9u
         dEFfKI1gtfMIFUk+DvCPjdRQ5J77zZyZBTyQx3LHYPN/3suhbjpUpR4V7PTSooGymLH7
         H9IFSbFXIYODcS4j5cMAc4zDjYopeAHAMhm47JC+F09q6H8sSseK3cLzuIvxLLBspGvu
         8pgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LbbnaDI3jbykcmqXiSeRQcmnCDtxF/X1Boj+XkGvTpI=;
        b=WsqoLrE1so4H4QwqJm6Q9tO3BNJT5QQaY/0bASwl8uHSUPgdSwUdSAcV6RKg4X4FqZ
         5FfGbjc02oqVFRWyyj7diTxRVPfDroVFhDEMZhSIZKqHIiT6IdMpOmu/SBLGKNfzdDk3
         pG3YL3/u2LOnIAn8ZmY5uhl2NZYTz7++07D59C/0ELjaZTDPcP54BLGI/rdv1M7PIvvW
         BYMjMkZD2qXIu4ClECybLk9ktKAMMYe2oQp78d1HlqF5lUZRgDw3NotcB8KpbbIRiVJ0
         23muKZMUy/ZXdvRW5hJTIWwN8FXhiROIMoJQg/kZXDn06QZNQXkIDNZ/QxVQoBX2pjL4
         4urg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533A/P3mm3yPH38UV8cxqAS6wDWmVDHGviZqYxnk+VaWpX+8Zhh6
	7s0KYYrsys7TzGA8Z7xHdlg=
X-Google-Smtp-Source: ABdhPJzdjfNwyEEF4GQys4olihpNInJRCuCPj5fsaGysX+2+a9zriYukqnx7fXOte8Bx3HPqVlTJOw==
X-Received: by 2002:a2e:3910:: with SMTP id g16mr1072458lja.18.1601876396491;
        Sun, 04 Oct 2020 22:39:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7c08:: with SMTP id x8ls871523ljc.6.gmail; Sun, 04 Oct
 2020 22:39:55 -0700 (PDT)
X-Received: by 2002:a05:651c:1023:: with SMTP id w3mr1177226ljm.63.1601876395336;
        Sun, 04 Oct 2020 22:39:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601876395; cv=none;
        d=google.com; s=arc-20160816;
        b=GuqDz3wZNBASHUBbNHOmmAZ/chQBzLdhNimef4l8qo0KqO0Vk4xLCSNMSngm5PrbK/
         7Mz+b6rqIledvZth2nCNJU/KqG71AI//RI5ylYaBX3iuGKNmk4vVdzYNTw65dsjksHCO
         mcpZQM3uGXYa7EHYAI2bKbqxpFfUqfxxJnLjbyIOrxPNbiQwPARfnW66BLb2ZLSX899s
         5aHjFiEwldJmbHHsA2Io9AlDiIUpW0C92XVa0GM1Wi6ugHJZbhFeWQ0gwr7s2M0RTeSa
         UNcf/QD3DNfZXT2hKDUvM/jirv66wSRZloZoTGHX3SwSoCEfPk0SBHl6c6cfwsA0f4xK
         UMyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=3b4xCseBtrcyED4ZlqVBO9MH0wC7Fh01o7emHT+ufy0=;
        b=RSKOi72zC12L7GI7xfIaXR1EZHOmEBt0Zj1Xm3lBIROctTVrX9aDd5R5hOsSsgRGR4
         lOTnT2fCwkVuqooGAko0HoiNGSd7Bvm3WDnSiTa3JLsPbVcaU/87B4LqjyjWJaT6iy+h
         /K9P39/qBhFCfmONKRWXg4h+Sz6/BKoQ85eQayGyRTzxLAQBsJt94FZdaBlgYtoRJGsn
         XaCyUfX6JX6SdoCAI0Diifu4x35VCovmwxcb0FUDRwY7O49Nf0k5cbCjEPQ7aM0LAe/y
         hluqBmopbLrqUjcMT1o5gYiMvPzNO0h5dJnevg/JJG3LNFGH5A8g+Xod71qceKd2N3bl
         BeOA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id q20si225149lji.2.2020.10.04.22.39.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 22:39:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 0955dsWE024040
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 5 Oct 2020 07:39:54 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.39.163])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0955dncO025569
	for <jailhouse-dev@googlegroups.com>; Mon, 5 Oct 2020 07:39:54 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 15/19] rpi4: Convert to stand-alone TF-A recipe and update to 2.3
Date: Mon,  5 Oct 2020 07:39:45 +0200
Message-Id: <928a923e71da182db79e78d38ff9131c33579e85.1601876389.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601876389.git.jan.kiszka@siemens.com>
References: <cover.1601876389.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

Use the trusted-firmware-a-custom.inc to model the rpi4 build. This
comes with a package renaming.

It also gives the chance to update to release 2.3 which allows to drop
patches. They will be removed from the tree later on, when the last user
of the old arm-trusted-firmware recipes is converted.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 conf/machine/rpi4.conf                        |  4 +--
 .../arm-trusted-firmware-rpi4_2.2.bb          | 28 -------------------
 .../arm-trusted-firmware/files/rpi-rules      | 23 ---------------
 .../trusted-firmware-a-rpi4_2.3.bb            | 14 ++++++++++
 .../trusted-firmware-a_2.3.inc                | 17 +++++++++++
 5 files changed, 33 insertions(+), 53 deletions(-)
 delete mode 100644 recipes-bsp/arm-trusted-firmware/arm-trusted-firmware-rpi4_2.2.bb
 delete mode 100644 recipes-bsp/arm-trusted-firmware/files/rpi-rules
 create mode 100644 recipes-bsp/trusted-firmware-a/trusted-firmware-a-rpi4_2.3.bb
 create mode 100644 recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.inc

diff --git a/conf/machine/rpi4.conf b/conf/machine/rpi4.conf
index 8ccef6b..b26effa 100644
--- a/conf/machine/rpi4.conf
+++ b/conf/machine/rpi4.conf
@@ -12,7 +12,7 @@
 DISTRO_ARCH = "arm64"
 
 IMAGE_TYPE = "wic-img"
-IMAGER_BUILD_DEPS = "rpi-firmware arm-trusted-firmware-rpi4 linux-image-${KERNEL_NAME}"
+IMAGER_BUILD_DEPS = "rpi-firmware trusted-firmware-a-rpi4 linux-image-${KERNEL_NAME}"
 IMAGER_INSTALL += "${IMAGER_BUILD_DEPS}"
 
 IMAGE_BOOT_FILES = " \
@@ -26,7 +26,7 @@ IMAGE_BOOT_FILES = " \
     /usr/lib/rpi-firmware/overlays/*;overlays/ \
     /usr/lib/linux-image-*/broadcom/bcm2711-rpi-4-b.dtb \
     /usr/lib/linux-image-*/overlays/*;overlays/ \
-    /usr/lib/arm-trusted-firmware/rpi4/bl31.bin;bl31.bin \
+    /usr/lib/trusted-firmware-a/rpi4/bl31.bin;bl31.bin \
     /vmlinuz;kernel8.img \
     "
 
diff --git a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware-rpi4_2.2.bb b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware-rpi4_2.2.bb
deleted file mode 100644
index 2dd180a..0000000
--- a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware-rpi4_2.2.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-#
-# Jailhouse, a Linux-based partitioning hypervisor
-#
-# Copyright (c) Siemens AG, 2019
-#
-# Authors:
-#  Jan Kiszka <jan.kiszka@siemens.com>
-#
-# SPDX-License-Identifier: MIT
-#
-
-inherit dpkg
-
-ATF_PV = "${PV}"
-
-require arm-trusted-firmware_${PV}.inc
-
-SRC_URI += "file://rpi-rules"
-
-S = "${WORKDIR}/arm-trusted-firmware-${PV}"
-
-do_prepare_build[cleandirs] += "${S}/debian"
-do_prepare_build() {
-    cp ${WORKDIR}/rpi-rules ${WORKDIR}/rules
-    deb_debianize
-
-    echo "build/rpi4/release/bl31.bin /usr/lib/arm-trusted-firmware/rpi4/" > ${S}/debian/install
-}
diff --git a/recipes-bsp/arm-trusted-firmware/files/rpi-rules b/recipes-bsp/arm-trusted-firmware/files/rpi-rules
deleted file mode 100644
index abb65be..0000000
--- a/recipes-bsp/arm-trusted-firmware/files/rpi-rules
+++ /dev/null
@@ -1,23 +0,0 @@
-#!/usr/bin/make -f
-#
-# Jailhouse, a Linux-based partitioning hypervisor
-#
-# Copyright (c) Siemens AG, 2019
-#
-# Authors:
-#  Jan Kiszka <jan.kiszka@siemens.com>
-#
-# SPDX-License-Identifier: MIT
-#
-
-ifneq ($(DEB_BUILD_GNU_TYPE),$(DEB_HOST_GNU_TYPE))
-export CROSS_COMPILE=$(DEB_HOST_GNU_TYPE)-
-endif
-
-PARALLEL_BUILD=-j $(shell echo $$(($$(nproc) * 2)))
-
-override_dh_auto_build:
-	CFLAGS= LDFLAGS= $(MAKE) $(PARALLEL_BUILD) PLAT=rpi4
-
-%:
-	dh $@
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rpi4_2.3.bb b/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rpi4_2.3.bb
new file mode 100644
index 0000000..2a655a3
--- /dev/null
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rpi4_2.3.bb
@@ -0,0 +1,14 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2019-2020
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+require trusted-firmware-a_${PV}.inc
+
+TF_A_PLATFORM = "rpi4"
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.inc b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.inc
new file mode 100644
index 0000000..8480b0d
--- /dev/null
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.inc
@@ -0,0 +1,17 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2019-2020
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+require recipes-bsp/trusted-firmware-a/trusted-firmware-a-custom.inc
+
+SRC_URI += "https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/snapshot/trusted-firmware-a-${PV}.tar.gz"
+SRC_URI[sha256sum] = "37f917922bcef181164908c470a2f941006791c0113d738c498d39d95d543b21"
+
+S = "${WORKDIR}/trusted-firmware-a-${PV}"
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/928a923e71da182db79e78d38ff9131c33579e85.1601876389.git.jan.kiszka%40siemens.com.
