Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKPD5L5QKGQE3VMKKNQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id BD28428301E
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Oct 2020 07:39:53 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id d9sf3543325wrv.16
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 22:39:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601876393; cv=pass;
        d=google.com; s=arc-20160816;
        b=OSdseShedmqehIDQNhYguoQ+EFnhKqgHJVLuoe4qjjK27ifEmaeFJgj7tdZ5idygeE
         2tgFxEdFlw+cKW6T93mx0JrmHAdKwxMRFG6KzGovlS+ItiV0dgBzg6dkR0ACKu6pj0Lo
         7MxXdt7eRkbGtf9nRdwI4jgGM6KDkoaj5ZhRq8Kv8KVjqUCfuX6Sjn3clPF7TWzVx1Cj
         +B/+O5PBFGR0SN6DmQN1npAUUjb4Yk7O0xN1doDIAd5JCjDOMfmHT4+pM2uEnHO828Tp
         bX/p2XgxDahBqhqSFpymQe6mCwlDsWrn+aZr9Phin1JBz/BEFtNdnSZzql7yCTwJ/s2x
         xs4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=yf4OT3BQvRnrGRBey9VnKyqOdmEqNcPkYG/LWSojMGU=;
        b=QcJ31cwrwjRI3K2grNjTR8PRKbimWsCtD+3f2LVJU7LwVMsCbLinPSQn5J42hfgTUR
         vyZfeTYJQwPToFOWZgekt+FndMmuRjo2T9g1On7mNvhqeXx/hLMCQXqUqkx6tH3BuXJ2
         QdKDGVxTuqTQ5Zs5jX0VIF0skxrQBBs1BGEA0rFvfB2B6y6vRKx5ksIWb8wAtBMWIIUL
         kNUGxd0xEE4/DNWyHqgbk+5/GMSrTkAWExo9YpvH1MVP8Jea+oLAShp7f6I1SEe1DlOo
         V6T7JDvtqSy9o/PWoJcdLjYQc6i9KUbHw9Ev0RXLitd2D1/mvynaDiAWlUWh/UEtDJYm
         Wpkw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yf4OT3BQvRnrGRBey9VnKyqOdmEqNcPkYG/LWSojMGU=;
        b=ZspDJATyrNyf5l8ckAyT2qnBFl8XoudDMEjDPpf7oj0qmSnZvYsKXfAWNHPRLiXJfx
         HfsdZUWh2n4Tns8Kx8EhF3u3NQnbsKU5WE1YVEOnkFDGNp7DKYIG30/Yp5e9lBnTdQ3C
         ab3rnbgOiChMYazQ+EC4+S2+M/gs5gSlTCyc0vI7o6eeSM5qElVEBpRaIWRXw7hLvWq5
         ll8zZDnF7yKUx1eygalSH4Cfs7LWW3xDRPxSwolWQJ9eNvIKqqT4xfslO6jl4vBzrTj+
         1ABFc/IpWVGqsMV5csWQK7eVfNL+yLGjQgI64PJ75+UTEQUDUpGgL8v3orA21n1R4f+f
         Q4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yf4OT3BQvRnrGRBey9VnKyqOdmEqNcPkYG/LWSojMGU=;
        b=rW/lAkDh1NX53b+7pKnk6fnEwsZNQbnP/IlchYOSTw9Dv+0UQ5VDLTmWqJ7EZgPIX0
         /bjnGhgm5egP+ks15CzecHJpusuxWhEv7DXrpt/gEBmgZ7hq8Mt3RE98dj2hcGkHEGiS
         9b7Pk7+A1Btv5aN/WT9yFB5X8bRzR6cUa66mvXoye4glUZWnykebNmix5x/0B+TlNQDb
         vZ4EWxWWkH+NcNxcom/THhUONPh/0oiarwiYAl+d9lekdyrVDz1PDUrLkXnbbKqUw0Dj
         s5Kx/Az/tdDAJEusj8mK3RMNA2HCFClxvwU2u5h2uCRb3Bx6t+jwd0IwdVSbIkfvqpRM
         p7wA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5323hB+2FROxBgJWOEal9iwW6UZrxRcBTeYR5zlUg440CvF/AebZ
	58BQleBVnc85K5xJOE2GkGA=
X-Google-Smtp-Source: ABdhPJyz4bJZ2Zd5L4M6qo4jYgueD2Oo5LqwcX4ZfzzoXP60UAYTBUthtMttoItXxNONmYv3cm5HlA==
X-Received: by 2002:adf:e312:: with SMTP id b18mr16431218wrj.372.1601876393461;
        Sun, 04 Oct 2020 22:39:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:98d8:: with SMTP id a207ls4073060wme.2.canary-gmail;
 Sun, 04 Oct 2020 22:39:52 -0700 (PDT)
X-Received: by 2002:a7b:c305:: with SMTP id k5mr15512707wmj.102.1601876392387;
        Sun, 04 Oct 2020 22:39:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601876392; cv=none;
        d=google.com; s=arc-20160816;
        b=kYTGb+Bw7QNVvX7kSFgPILCRyLRxGfYD6hc3JMkBo5DbdL0wPSi8kg+Lm7FSGvQzg3
         cDbEvLA0Yqrx6VhFt6if7ZU5lEHpeFvs+zzfSFaBCeooMw+riXmDU9U1MAXzB267oc2h
         6Flkl03caXFuUIcMn/vKi2jA9nxiHwWMI/PjE3Xlra/KOVDGToblMsBvYTx03AHqNxSH
         ul/rS2s+PoW+QC8VViHPTw79HddduxOlaXoLGJ+Uuwku8LfDWPurm+GB2Uz4dVdN9FVN
         W7kBxNbbxjIp84jitYMGm9lVzOyFbid1WGLzhHoMdnLC0H9CyhC9OFHztUL/Pn56jDRC
         vRJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=jOq/OEtlrYC+3wxUV6lb/j0DJQXfGZi7zigpgBFVtzA=;
        b=S4OMqhwwBsoWIwP8UMlB13bLjo93dacCTux28aQqzUMCTTuoyYLWvVk4SqfPqfBlSV
         loyO5DPxOBd93NLXv48wbE1AL32gjI/BvstIdleh9m9JJu2RRjIiaAiRJtkencOXUvZA
         D8VXLIhAGB8SIB3rMcX5MIltydvRRVbKdwrL5MlDtZagy298T192kz/EMlcwlBdHzYOy
         w7bLznwHMXFTdOPUi0M8EdKcUMQOF1T8ecAH32uaH90QBkb4TsJgdse1VlNqjcAaj4VI
         8L7RUhyLH2QPGzxYl1fbGYaW82u19s3ipBFhvEWua5Pu/P+PPlVQ45PkY48E01O2qlxX
         +5pQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id p17si94916wre.2.2020.10.04.22.39.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 22:39:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 0955dqaa002211
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 5 Oct 2020 07:39:52 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.39.163])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0955dncF025569
	for <jailhouse-dev@googlegroups.com>; Mon, 5 Oct 2020 07:39:51 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 06/19] wilc: Add out-of-tree wifi driver for Ultra96-v2
Date: Mon,  5 Oct 2020 07:39:36 +0200
Message-Id: <b293faaff3a3d2f6969d7b48013a091212a0ffc1.1601876389.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601876389.git.jan.kiszka@siemens.com>
References: <cover.1601876389.git.jan.kiszka@siemens.com>
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

The v2 has a different driver than the v1, which apparently had
regulatory reasons. The big downside is that the driver is not yet
mainline. Pick up the fork that Avnet generated for the Ultra96-v2 for
now. This should be clean up later by moving to the original downstream
version or to upstream once the wilc1000 support there is expanded.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-kernel/wilc/files/debian/wilc.install |  1 +
 recipes-kernel/wilc/wilc_15.2-avnet.bb        | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 recipes-kernel/wilc/files/debian/wilc.install
 create mode 100644 recipes-kernel/wilc/wilc_15.2-avnet.bb

diff --git a/recipes-kernel/wilc/files/debian/wilc.install b/recipes-kernel/wilc/files/debian/wilc.install
new file mode 100644
index 0000000..4a5b92e
--- /dev/null
+++ b/recipes-kernel/wilc/files/debian/wilc.install
@@ -0,0 +1 @@
+../../*.bin /lib/firmware/mchp/
diff --git a/recipes-kernel/wilc/wilc_15.2-avnet.bb b/recipes-kernel/wilc/wilc_15.2-avnet.bb
new file mode 100644
index 0000000..1a1d680
--- /dev/null
+++ b/recipes-kernel/wilc/wilc_15.2-avnet.bb
@@ -0,0 +1,33 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2020
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+require recipes-kernel/linux-module/module.inc
+
+FIRMWARE_REV = "a67c351f9028c7a559330365c649a07721965cd4"
+
+SRC_URI += " \
+    git://github.com/Avnet/u96v2-wilc-driver;protocol=https;branch=v15_2 \
+    https://github.com/linux4wilc/firmware/raw/${FIRMWARE_REV}/wilc3000_wifi_firmware.bin;name=firmware \
+    file://debian/wilc.install"
+SRCREV = "01ab7484e0e6b2191c69d7ec7c6e89da5ca51f0f"
+SRC_URI[firmware.sha256sum] = "8cc0328e80d8e0e96b295777b58e7f48fea25d29808df6dd0fabd3ea283b3da1"
+
+S = "${WORKDIR}/git/wilc"
+
+AUTOLOAD = "wilc-sdio"
+
+do_prepare_build_append() {
+    mv ${S}/debian/wilc.install ${S}/debian/wilc-${KERNEL_NAME}.install
+}
+
+dpkg_runbuild_prepend() {
+    export CONFIG_WILC_SDIO=m
+}
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b293faaff3a3d2f6969d7b48013a091212a0ffc1.1601876389.git.jan.kiszka%40siemens.com.
