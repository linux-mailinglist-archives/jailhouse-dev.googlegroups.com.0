Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBS7YQDYQKGQEJH4YGQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE0213D803
	for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 11:34:52 +0100 (CET)
Received: by mail-lf1-x13c.google.com with SMTP id i5sf3786381lfo.7
        for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 02:34:52 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579170892; cv=pass;
        d=google.com; s=arc-20160816;
        b=E7NXYmJsMlj9ysTR/G/R0Cu53xqv0f/sOYDv6WgtG4dCTYuQ2zgxL79DYsDkzXKNMu
         Pnr4J69ZQmkaNJUmJAhHv8oXK86FO9BguWCpq7IcFVZhrmarC+qzUK2vpDhR+asSNINk
         uUChvgsdKA2+W+Xsw2osd+Ql4drVXQfE8Du+PJi3Vx/WccqMAeVxSC7VBJULnWfAZjgi
         vsydOinAvWyypHOpyrfuDUq9TK7U0ahErMja8e/9DIxePwa9GooD4G5Utwydoc181xxB
         GUlj3OGqka8W+i+1NU8BF1rR5JKo9y0svsbAqjCs0D5iIAFnnxSF04LWc7Xj2HNo8bvQ
         SAvw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=W1n0H4yRsR0AHgStEFs9fF0UGhCFXwazrKGAuV6juO0=;
        b=xZeGawMzVI4tHtoHFs0jDvF7WChOc1CSGxj1TnKzV4sOPCFF8xRbWdZ6OB+xLp2jrV
         bxYJEQRyDrcz8THsHGE6b3yXyhl3PHBKnxmlI3WGh9k83+I/AEIgIsCQboWD8Y98MnFU
         MEKuHjE49gDEIpqxcD8okEmNL6Q115dHrYg9KPlJ2c/nXAup7GIgfNh9UjjUt59N9wUq
         5q6lPES02pHqfW08Uu4Dlgulx24DWe4+0VdGYyAlhAAbqi5JQuoEzkj1AaItixjcdLKF
         hTWns0KSyxWcaDaoCLoE8NG8VDsRXQFmux4t36lOCBcf9WghBlekZOeo6j4r4XWT/9bv
         3Cjg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=W1n0H4yRsR0AHgStEFs9fF0UGhCFXwazrKGAuV6juO0=;
        b=bqD+wRnalyIgXpCini+3Kuq7iAsa7XtH8UD3KCVp1pJEr4OVVYME9jFAYrPfE4monZ
         hYGDCDE2AfPXpL4lyCv8ILAcukYB+tz4R/POfnGw88lIP7Aogpw+7bioOg7Tt+t3xuFh
         G++fu5O+/90qQUFqSrgVdRs7szbVuVhVbcYGgU4Nw/KTfll4kgjdFFmo/HR4Gw5K9ttk
         T2sFv8w8kOO3Or1I+CCS/WRDEAFO34JkneLtv/DKM7bSx7hwompDY0HHUUDpqbDXH9ms
         vKQk7RBCFmxUoPuVvr7SUWYLnKj8UsrffUYi/tqNVnWAvz1Qv2VCpyPGxWzxZaxaeXSj
         yLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=W1n0H4yRsR0AHgStEFs9fF0UGhCFXwazrKGAuV6juO0=;
        b=iHHumv/MjgzXkXXqrcXZnvSXlaMgMdybo7Y2xPm4/NYDL8SIeKa5vQTBuBc/1FY0+f
         yMDGQdL5hUeZsT+sWHE9Jz9V9lnZNEfO1lqNDKoFlfIAVuqeUmDTvFXxbP9K+E8KYVnG
         IpQa6rweOkqCkYXCyGpi4D5D4y9cvER+WZ8wH4k5G0MakwnFD4fkMV5QRyxvh0NXaEHS
         XAoKrtzNa7I4cpz90nHb9E3fyVQRVB/iQ5/MmS8SA94zDNmEuEI16fB52RdZeifU6as8
         Bcrt8tCIGWoOjsdL9KJFgzkXONypW38MXziGQ3akPi7YgSJPKWiExUreqMMu7iwFzXQy
         hjNA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUWEqcxo0RMfI+BNPD8Zyq0dmzyXWL5HnFvFmhX6QBQWsn1/auW
	6HQB/o3NKVdnlK6gBnhxhsI=
X-Google-Smtp-Source: APXvYqxFbk5g4aFgWkE83nLVGqL9a5amj2xgx179ad0YanVkejHWaL75VsfcBUgtgrTtUWHU/MfeFQ==
X-Received: by 2002:a05:651c:1068:: with SMTP id y8mr1900036ljm.71.1579170891899;
        Thu, 16 Jan 2020 02:34:51 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9786:: with SMTP id y6ls3028676lji.4.gmail; Thu, 16 Jan
 2020 02:34:51 -0800 (PST)
X-Received: by 2002:a2e:8698:: with SMTP id l24mr1848068lji.94.1579170891134;
        Thu, 16 Jan 2020 02:34:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579170891; cv=none;
        d=google.com; s=arc-20160816;
        b=cylQ/x57SbDYiQTVZ1OAMt5ZeprZcIjuc4FLCv34Sx1WTC+l2LbsQIOhGEtUafwUnk
         xnzEgNI9iYWolQArqUpRX9bout4EBpzvyU453pbTt9iRPyWjRqF2SeTSrxXspBIRUD5q
         oOjHwvIrdeeL6DmV/+bGoL8LJ72LfwiOPDOH5j8Ttk02IstniJxRWMvo0o/xVW0uwdZd
         gnSJUTpiHgOm2AqI3v35OrXwc3SzMUUTI91YJMfveU27m+2/62o5bBoeT77b/c/tC5ks
         qwrTKOBMjJXkLA9KPSs9V5fh4vdEPmfiDLnz7EPiUOhUVfWB1kVXz/DgthmAzDwDa9xC
         E+Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=uxnFbvaxmI6la8Ly9EGZzBoBB1ICfbRFRV/qbWEA7IA=;
        b=zxG0MhSL5gCsyLu0qZcvzrQKFjW8mK1kZVBaYpjTdIVL1o0w5wMo9ncOdIGA0y5ifd
         bOpI5VsIA3aDMy4nph3VFXyRhfMIJkQH58Vw6+ZILIHok7+fztkVWs1knBUPA8DoDLY9
         7EpNKTNumcUixh0MshxEbNr370aa6JqQIloW3yUql/2mRrMrzB21Z+kX1p1aEajdAMhG
         5uWytrazjQJZSe/B4WpLdlafxxgFaPhNoWejCF/5hHcdTVdRyXQry2b20HF+UfZ1255l
         yquce+BXl+fzy1HzA6Nz2NpYbEeMpVuVh6FBGs0j4QhwceBHG4Sn+euiEiw10+dX9pxh
         Rlwg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id o193si986235lff.4.2020.01.16.02.34.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jan 2020 02:34:51 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 00GAYoG8023410
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:50 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.23.78.127])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00GAYmQR031623
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:50 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 17/18] Hook up Raspberry Pi 4 support
Date: Thu, 16 Jan 2020 11:34:46 +0100
Message-Id: <d1428ee6d639e5183002f3f13b5f948bb92337d2.1579170887.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1579170887.git.jan.kiszka@siemens.com>
References: <cover.1579170887.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1579170887.git.jan.kiszka@siemens.com>
References: <cover.1579170887.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

Add the machine, multiconfig and wks file, extend the images.list.

The image is assembled very similarly to Raspbian, just focusing on the
support for the model 4. It is using the Raspberry bootloader to start
Linux directly but pulls in ATF before that. This implies that Linux
kernel updates on a target would need another manual step to update also
kernel.img in the boot partition.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 conf/machine/rpi4.conf                    | 35 +++++++++++++++++++++++++++++++
 conf/multiconfig/rpi4-jailhouse-demo.conf | 14 +++++++++++++
 images.list                               |  1 +
 wic/rpi4.wks                              | 14 +++++++++++++
 4 files changed, 64 insertions(+)
 create mode 100644 conf/machine/rpi4.conf
 create mode 100644 conf/multiconfig/rpi4-jailhouse-demo.conf
 create mode 100644 wic/rpi4.wks

diff --git a/conf/machine/rpi4.conf b/conf/machine/rpi4.conf
new file mode 100644
index 0000000..8038c1c
--- /dev/null
+++ b/conf/machine/rpi4.conf
@@ -0,0 +1,35 @@
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
+DISTRO_ARCH = "arm64"
+
+IMAGE_TYPE = "wic-img"
+IMAGER_BUILD_DEPS = "rpi-firmware arm-trusted-firmware-rpi4 linux-image-${KERNEL_NAME}"
+IMAGER_INSTALL += "${IMAGER_BUILD_DEPS}"
+
+IMAGE_BOOT_FILES = " \
+    /usr/lib/rpi-firmware/bootcode.bin;bootcode.bin \
+    /usr/lib/rpi-firmware/cmdline.txt;cmdline.txt \
+    /usr/lib/rpi-firmware/config.txt;config.txt \
+    /usr/lib/rpi-firmware/fixup4.dat;fixup4.dat \
+    /usr/lib/rpi-firmware/fixup4x.dat;fixup4x.dat \
+    /usr/lib/rpi-firmware/start4.elf;start4.elf \
+    /usr/lib/rpi-firmware/start4x.elf;start4x.elf \
+    /usr/lib/rpi-firmware/bcm2711-rpi-4-b.dtb;bcm2711-rpi-4-b.dtb \
+    /usr/lib/rpi-firmware/overlays/*;overlays/ \
+    /usr/lib/arm-trusted-firmware/rpi4/bl31.bin;bl31.bin \
+    /vmlinuz;kernel.img \
+    "
+
+KERNEL_NAME ?= "jailhouse-rpi"
+
+IMAGE_PREINSTALL_append = " firmware-brcm80211"
+IMAGE_INSTALL_append = " rpi-firmware-brcm80211"
diff --git a/conf/multiconfig/rpi4-jailhouse-demo.conf b/conf/multiconfig/rpi4-jailhouse-demo.conf
new file mode 100644
index 0000000..be37063
--- /dev/null
+++ b/conf/multiconfig/rpi4-jailhouse-demo.conf
@@ -0,0 +1,14 @@
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
+MACHINE = "rpi4"
+
+DISTRO = "jailhouse-demo"
diff --git a/images.list b/images.list
index 8dfeca8..26a802d 100644
--- a/images.list
+++ b/images.list
@@ -6,3 +6,4 @@ espressobin	Marvell ESPRESSObin (1 GB edition)
 macchiatobin	Marvell MACCHIATObin
 hikey620	LeMaker HiKey (Kirin 620 SoC, 2 GB edition)
 ultra96		Avnet Ultra96
+rpi4		Raspberry Pi 4 (1 GB edition)
diff --git a/wic/rpi4.wks b/wic/rpi4.wks
new file mode 100644
index 0000000..12a8509
--- /dev/null
+++ b/wic/rpi4.wks
@@ -0,0 +1,14 @@
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
+part --source bootimg-partition --ondisk mmcblk0 --fstype vfat --label boot --align 1 --size 32 --overhead-factor 1 --extra-space 0
+
+part / --source rootfs --ondisk mmcblk0 --fstype ext4 --label platform --align 1024 --active
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d1428ee6d639e5183002f3f13b5f948bb92337d2.1579170887.git.jan.kiszka%40siemens.com.
