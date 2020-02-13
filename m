Return-Path: <jailhouse-dev+bncBCPOXAO4SYIBBUNFSXZAKGQEVQBKTMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id EE55915BFA4
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Feb 2020 14:44:49 +0100 (CET)
Received: by mail-wm1-x33b.google.com with SMTP id p2sf2013128wmi.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Feb 2020 05:44:49 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581601489; cv=pass;
        d=google.com; s=arc-20160816;
        b=I6A+EKIGXxFJmtflt1ScCgQ1oFZvQCIZgJeJiWkFJ3xRmu+WbO2BG7HJAtcQ6uEPZZ
         E3xQdPcSCskNlbGlVx0f1bSgJEKy3NxDtAZuiKYOXGXZYZCgMGP0VfCS9dDqps2ldulZ
         dHNJkwDPZSX40xAwkEfhWZ67lSuU5gLMhChhd6yA8kfvT6fDQshIQ3dMK6W9meMfFzTr
         iTkbqLvNT19B0fmYlQiWfUSIFZkDlFZ53Mr76w2UCVNJfoeINrqy/EsxM32WTkBIdQ8t
         JKJlk7sKtbJsOb6HmOI16FOa4r0sXIRSUcOt2268iCyGA3ZCv13FQnIDevpTqIpEooN8
         UCuQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=OsK2nGp8rzZel13j80B3xIcdtt5fwnxj+oCmY8tbMvM=;
        b=qAfmObgQDhG65FAOFX5hmkGlf1VeZ7gmpSQdmcg1fKPMaDSX8JMhT1uNrau40lscm+
         beoQaUirEoRKuTxxieEy+J2ny38zAWWpHTb3tLdQ/+oB4aOjdFf1d7Sb1Occ66HslBn6
         rV6M5sDkVSYD/K9hxD09OwvVpeFwQWJdoWtoqgg3D3jxMdbOQdTvc7KdwXJsfaj4BW9v
         qHpSLlCWxPdMHknElH/VIkTiLQ5fnLRh3djK7BQgjRBhFem8Cf4doRBNTU/NKMaHAuhc
         2msBZJ/bOaz/8D4iLwTw2M8lc7+EwL3MqbHdZdNXz69Q0IdELX3hlJeJEvRqRnLxQzLy
         RYGw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=QYpnnL03;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2a00:1450:4864:20::442 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OsK2nGp8rzZel13j80B3xIcdtt5fwnxj+oCmY8tbMvM=;
        b=Yn9/I1qwjx38TNDuZLPiZB4r6wZjtF0Q9yRLaJhJEJtgXo9lwBUKvT7WlWkRYVaKUd
         yHFUq/FEZmCFfzzIvmUYfYUzNRnpxhDP8gxEctP7ZMcp38i9WYPLMra6zuk72GPyxrlb
         Hgj1ShipAGq7mlaD6x5RJkTFu4mvYM7PNY1RaPj7yaEIeG+sqncDLU2otIjwG416dDfP
         nW4qZ4L31oQUOZbbpK5JQl45jRIdWbRqt+bGPCLxNWH6ZsnHllf0iIHm3ksbjn1333yp
         8t/FFWKeedwPXA7VpChLuoH4FTuxPzGQwfrmOawNxKgEPIwK5PzEs7pn47Ezha7C9Sk9
         dq6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OsK2nGp8rzZel13j80B3xIcdtt5fwnxj+oCmY8tbMvM=;
        b=as+rKF2tcQapHYeu8QxdnyagoHc2VnhrSMFPTaWMIqCJoWPFTcHhI6gLW0LL9Ekyv4
         0dLKsbmFw6SV6Db1cHz43mc52aRGu+KMl+15EaBk2cdXfHGkUvFFLOMZ4pmnpJBII5pu
         5nTzzO+vqWF4Ni8HYO4iiSLbxmXIWOChKMlS54tT4u6zAokzjW9PMfkC7jlH2qjoegO9
         Zc81JsVMr0sqnPM1Byvs7mn1F/pxDyRsOQDuEK5cusHc612EdgGvO4pN9o2DRmQrHIaa
         5YlSLawc2ye4dzP6fzKG51XfVawmWuqVQ1/GL+LQES8H87QiYfMU04jiP98PcYnOi/dM
         hKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OsK2nGp8rzZel13j80B3xIcdtt5fwnxj+oCmY8tbMvM=;
        b=dfOqVBrXFixzQhivK0a46CfOumiRtbElTCmJZReJ5Rct+HEQJrdOdyPVMSg9vS68DS
         0600S2EeNXgAr7BvkxdFGE9xhkBOZ240lvFjIRl1jKylzbAk5q4d73QtH0mFqC/SXTHz
         8Db1JoxEpW6Pzx/rYmdiZtA+ZoIIJbWsfCU3kddgQD1y37qlKxjluIQ8DFbTB85MjqeF
         aexv1lRe/z+N8bOlcvbJEokUyfaRyMTHHbuyCLK72Jfl5pEaCGaSy3lvBAAPQPx1D30h
         j6YQXfIXwnPhDesffTxaHWU4nPz3LN2yrtYlENQgjoxKQfFsGst+EzVcCRn+zuIF2OYC
         rhcQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXzUj65TX69yn9UAaqS2GxQni4/0XFpPnJ5heajqb0TnWqBM245
	zlPqEV/e2674mK6jtWvWWfk=
X-Google-Smtp-Source: APXvYqx2QwSXvACiSgWeaMacY7xKmUTn7D1jphqoAaL9fpRfkUIQmAn4iucXmw7MbPoGoBQkO9YaWg==
X-Received: by 2002:a1c:9cce:: with SMTP id f197mr6221668wme.133.1581601489674;
        Thu, 13 Feb 2020 05:44:49 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:82aa:: with SMTP id 39ls13336849wrc.3.gmail; Thu, 13 Feb
 2020 05:44:48 -0800 (PST)
X-Received: by 2002:a5d:63c7:: with SMTP id c7mr23616253wrw.158.1581601488864;
        Thu, 13 Feb 2020 05:44:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581601488; cv=none;
        d=google.com; s=arc-20160816;
        b=SOY/6kEI6kMn+PbbP3MAoyS3s5Wh92wei9Ma4GK0GpaH0xRq2Fdk2v/QPyBw27KnvP
         Ld718sAM/XG2Ral2WsFti+qkDu4MoQWqQraxsXKWQE/+0X+h0us3NofOsCugFW5TFbZv
         XHrvWMeR9q6DaDPqClPzKJKc6j4zyTWfRFV+lk3MONbNlATJ7up0HYnfYWex2XHYieoY
         vawSEQ8igPshfCtcFI/esatmYQ8o66hNLV59D0WMbcLQu2CqZSDw+1U09ZpBSK0EDcY/
         y6gEuSKBf6NRhid0iJIQNsx3ikRZz2XFxW7hgbcpEuNmoWo4hVzdfgi+OTmo+7XhhFnp
         Pelw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=VaOSci2eypQCOAc3lRg8tx14LoKHfyU463rRKLQwFm0=;
        b=dGhmfxMsQTBV7wKAz7NPo/JPX4cMuuFUu7n4eFRT/1oRQQgrSDK4E3zsUp1QWvDbLU
         OFqDTgHQW2KtY8h9xFBN+7qhlfKkxI5oSBonGXZJdM8banZmPkUUY5SMUZXHf/Z7VQJF
         4BVAEfNKCxbb3uxV3CK3UuGi5L1/p1j1vMH45zjjrzARFHHKiAPl9YA5vpcwxIBgac5v
         HaAkDItsj/TQRBvn6tyujxGqkeiRZSXFG1NOwFIXD8a0PQVwOfdrinqeZzkuttaanZA/
         66nnc0snv1iYEv8NMdTAZ/fCkAyNtwUjllPd5mpqZsICENy8ip1DCBC+ug34zrrthAcT
         49Dw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=QYpnnL03;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2a00:1450:4864:20::442 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com. [2a00:1450:4864:20::442])
        by gmr-mx.google.com with ESMTPS id i18si110446wrn.0.2020.02.13.05.44.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2020 05:44:48 -0800 (PST)
Received-SPF: pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2a00:1450:4864:20::442 as permitted sender) client-ip=2a00:1450:4864:20::442;
Received: by mail-wr1-x442.google.com with SMTP id w12so6750656wrt.2
        for <jailhouse-dev@googlegroups.com>; Thu, 13 Feb 2020 05:44:48 -0800 (PST)
X-Received: by 2002:adf:f109:: with SMTP id r9mr21288832wro.406.1581601488177;
        Thu, 13 Feb 2020 05:44:48 -0800 (PST)
Received: from oxygen.mgc.mentorg.com (nat-sch.mentorg.com. [139.181.36.34])
        by smtp.gmail.com with ESMTPSA id z133sm3162729wmb.7.2020.02.13.05.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 05:44:47 -0800 (PST)
From: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
To: jailhouse-dev@googlegroups.com
Cc: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Subject: [PATCH 4/4] Enable pine64-plus support
Date: Thu, 13 Feb 2020 19:14:30 +0530
Message-Id: <20200213134430.3052-4-vijaikumar.kanagarajan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200213134430.3052-1-vijaikumar.kanagarajan@gmail.com>
References: <20200213134430.3052-1-vijaikumar.kanagarajan@gmail.com>
X-Original-Sender: vijaikumar.kanagarajan@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=QYpnnL03;       spf=pass
 (google.com: domain of vijaikumar.kanagarajan@gmail.com designates
 2a00:1450:4864:20::442 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
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

- Add the necessary machine, multiconfig and wks file.
- Add entry in images list.

Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
---
 conf/machine/pine64-plus.conf                 | 19 +++++++++++++++++++
 .../pine64-plus-jailhouse-demo.conf           | 14 ++++++++++++++
 images.list                                   |  1 +
 wic/pine64-plus.wks                           | 16 ++++++++++++++++
 4 files changed, 50 insertions(+)
 create mode 100644 conf/machine/pine64-plus.conf
 create mode 100644 conf/multiconfig/pine64-plus-jailhouse-demo.conf
 create mode 100644 wic/pine64-plus.wks

diff --git a/conf/machine/pine64-plus.conf b/conf/machine/pine64-plus.conf
new file mode 100644
index 0000000..0949ab4
--- /dev/null
+++ b/conf/machine/pine64-plus.conf
@@ -0,0 +1,19 @@
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
+DISTRO_ARCH = "arm64"
+
+IMAGE_TYPE = "wic-img"
+IMAGER_INSTALL += "u-boot-pine64-plus"
+IMAGER_BUILD_DEPS += "u-boot-pine64-plus"
+PREFERRED_PROVIDER_u-boot-pine64-plus = "u-boot-pine64-plus"
+
+IMAGE_INSTALL += "u-boot-script"
diff --git a/conf/multiconfig/pine64-plus-jailhouse-demo.conf b/conf/multiconfig/pine64-plus-jailhouse-demo.conf
new file mode 100644
index 0000000..5e66c94
--- /dev/null
+++ b/conf/multiconfig/pine64-plus-jailhouse-demo.conf
@@ -0,0 +1,14 @@
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
+#
+MACHINE = "pine64-plus"
+
+DISTRO = "jailhouse-demo"
diff --git a/images.list b/images.list
index 26a802d..b794d85 100644
--- a/images.list
+++ b/images.list
@@ -7,3 +7,4 @@ macchiatobin	Marvell MACCHIATObin
 hikey620	LeMaker HiKey (Kirin 620 SoC, 2 GB edition)
 ultra96		Avnet Ultra96
 rpi4		Raspberry Pi 4 (1 GB edition)
+pine64-plus	Pine64+ (Allwinner A64, 2GB edition)
diff --git a/wic/pine64-plus.wks b/wic/pine64-plus.wks
new file mode 100644
index 0000000..aacca04
--- /dev/null
+++ b/wic/pine64-plus.wks
@@ -0,0 +1,16 @@
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
+part u-boot --source rawcopy --sourceparams "file=/usr/lib/u-boot/pine64-plus/u-boot-sunxi-with-spl.bin" --no-table --align 8
+
+part / --source rootfs-u-boot --ondisk mmcblk0 --fstype ext4 --label platform --align 1024
+
+bootloader --append "rootwait mem=1792M"
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200213134430.3052-4-vijaikumar.kanagarajan%40gmail.com.
