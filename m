Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB3PH46BAMGQEP3UPWGQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63f.google.com (mail-ej1-x63f.google.com [IPv6:2a00:1450:4864:20::63f])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7CF346093
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 14:58:06 +0100 (CET)
Received: by mail-ej1-x63f.google.com with SMTP id e13sf1081462ejd.21
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 06:58:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616507886; cv=pass;
        d=google.com; s=arc-20160816;
        b=ausAqmeI+P8jUXb/vz4RKzR8DpjqQoghz9oq2wSb5sPy8iUYVVGUbhee1Ie5t59AA0
         LI6i+hrGNZQSqBANu7OkA1uKamjnfW40MBQW+xANNCVxSlWzfHVlcVvJL9JlLlWEi5sH
         avX28kMSwaJlzA+DGWrVwdDFzJe1G1Z6qqDjdZh9bBZK8iPLj8NeK8eAm280a05Ivw4c
         phPX9tXtyIOSiYhOXMcGETTMcwgIQR+Q2GeP4QSBEb24rVJkg7om7CoQ1g9CK60cMdZm
         dffvz/csBBseX1AqcvuxT2C9yMeHGz8V8GREwYceNbSGV7h02P9mxCjaTsomcnLIO5bS
         0Pfw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=94Xgh8kARsUInM6hbuLkXbeHtsvoJEqqnqGc4HEswTY=;
        b=XgXs5/BebyhOjG/chjxdyMFnMLMKtbtkJVG+fqIRuhKRf15orkwuqKUWOE1IXPo0CB
         oM+2tbFpMWiOhWUFc9h/EHnkVe9aEs38P/ZPsUIijGEHWV1o/I1Ebhychz0FTvZSInLm
         rmGl51z0TDs4wRMOyy46sqoO4yGsRQXB/Zj1K/FWnnpPP7vkRJpUKiHGpFYJBNtcypNq
         6o37w9Ms1BP6asu+Oo1XRVVESBD79nUnCV6WLPXHOfDvLcisJsp+pcvkR8fn3BPP7/F5
         Ypl9vXwL2lX8FSxeYpYqgSG33dea301r5+ixkAhRmtXrOkkbP1w68u8MaNeykqEIbd3t
         AyfA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=94Xgh8kARsUInM6hbuLkXbeHtsvoJEqqnqGc4HEswTY=;
        b=MF2+oDwMJ/KoARJ2JCJxKlWVs6r+29xg4ut/+e4eh1ZVtqZGO5T3plB2pTYVl4m3bH
         zXpBdh8X7ljj1BbGoKlYiqLyu387Mvi7IEiJ2K+WZqeaM8HfkIJls3B2WbxfwnS5oRES
         wD7TZxqXtQIooyjLHngFwUQlVNuVmcHwUowDBiXk/XfnD2XY4gaTIgfE3omT7C9o3woM
         86LNTHW5VXbLuhIR9KFkKiNd8HOv2Z/slTtayp6Nxl1kUVyQNWdhGJm6k+VgdWLTvith
         +GMA8M93QwpQE3RyeH74FOv1WXVuTaZ7hl07qyyqyB4Embv/YsvXFtUULuql/YAmEcpL
         jVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=94Xgh8kARsUInM6hbuLkXbeHtsvoJEqqnqGc4HEswTY=;
        b=Ar/D+JxRpau/WjgrFpPyNn0w8/lkEj9zsyr3i+XQUtue7eb8J8M4b/o1D5/g+ri+6Y
         jCreH+QiDKCm1BVKbPKOVKQO5Y/P+tllOYbs8kTHhEzZKswavorju8Y7dAdm0rj6yH0c
         EfD16UCy74hukjN6mtPDGlR47EvvqPmew/hVJbegpyusWvONj3ZL3wktOy4BB/d5ClJo
         GJvuqM+pcd7c4NigjM3wugD2goofvYxtNdQICDTuT3H7vjmnVf71kZrIcjI6c07im+CL
         CtAQqvWrSrsm5UUKVokF/ckx/+d105Wg8wzO3Z2kZrXJIDz8BC78SSX74RU4GJ1Jr+Yb
         oELg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53215PlIpS9G5130gSwrxUD78Flve9eHB34GcOkPLwR4Nmthuipu
	5mlDqduI0uxLoJSq5+LlTCA=
X-Google-Smtp-Source: ABdhPJxPt4MdHEeqiPIJNNJHiV0OmLyiZJnJb40nOzse2QmmsM2chQSOeICL1hKKpvAVRiMFyDPcjw==
X-Received: by 2002:a17:906:18a1:: with SMTP id c1mr4901819ejf.62.1616507886173;
        Tue, 23 Mar 2021 06:58:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:f290:: with SMTP id gu16ls9055719ejb.11.gmail; Tue,
 23 Mar 2021 06:58:05 -0700 (PDT)
X-Received: by 2002:a17:906:6c93:: with SMTP id s19mr5003574ejr.151.1616507885091;
        Tue, 23 Mar 2021 06:58:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616507885; cv=none;
        d=google.com; s=arc-20160816;
        b=cD1cHPybWRhE4nXVbKu0TuezUFjUuY3w65G0Jx23ipNPcHFhy03TxSbb/ew3Dumyed
         SUQsFvfuZOHqck88Oi0199WjH5klERLcxWqPubjOY/71+zWJRlNxvh0Elhh8MgABDg/K
         W7ixuqRT+wH++3rC0MxAKspfYXARGre7fcYORF2VS2BTuaM+ka9uvowTXhAImTQzz44O
         bF59+PitelVQ0kNhsp3U7nFxesX7ap37E75GGu+fdldyIXWrZRle+RG4zU7ycKpDqSu0
         re9njuU5+5mMq+RuF7/R3dfkbfTqL2XkFHe93xt/hstmXZb1NdEIu6Kv5PXks3kojAu0
         i2iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=0zMyp59Pgd/SKstXdiZa39ZJxeTG0E13yQohSmH9zAw=;
        b=wHUCjkkRuPPZvt8z+uWVwkXpFfaf0GTM21RSGofh4fut1SA0wDExmQwinviWUdAvLy
         7YkDRMps4HUqHYqu5U7bSPf5nnfX0MgXRfkcEuoOemL496FNnSnnEjZr5FeBPX/6+sm8
         8sR5jwsTU+iV72rq9Y64UKnF7ybgOAatXD/ZT28aBFvXUcGz9caRZezB7vSWZSgiEtox
         4z+aaU1EyXzIbFV8tPlpT1YhzORESRAXVaYc5YnXAXB6I9M8AVVZ1n0ypeBDQnavwGJY
         VdJrDfY9q+3Kr4JZruz0D9G8x9LQBi2mB1j9342lKpaSw83Jiuw2so38gx3etKM12Knv
         HAbg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id df17si810859edb.3.2021.03.23.06.58.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Mar 2021 06:58:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 12NDw4WE001069
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 23 Mar 2021 14:58:04 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.18.33])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12NDm2Mm029573
	for <jailhouse-dev@googlegroups.com>; Tue, 23 Mar 2021 14:48:04 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 06/11] Hook up QEMU ARM support
Date: Tue, 23 Mar 2021 14:47:57 +0100
Message-Id: <2a29c82045914dad283ac2175eb7d08741d98f59.1616507282.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1616507282.git.jan.kiszka@siemens.com>
References: <cover.1616507282.git.jan.kiszka@siemens.com>
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

Currently limited to --latest because config files and a number of fixes
were not present in last release 0.12.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 conf/machine/qemu-arm.conf                    | 14 ++++++++++++++
 conf/multiconfig/qemu-arm-jailhouse-demo.conf | 14 ++++++++++++++
 images.list                                   |  1 +
 start-qemu.sh                                 | 15 +++++++++++++++
 4 files changed, 44 insertions(+)
 create mode 100644 conf/machine/qemu-arm.conf
 create mode 100644 conf/multiconfig/qemu-arm-jailhouse-demo.conf

diff --git a/conf/machine/qemu-arm.conf b/conf/machine/qemu-arm.conf
new file mode 100644
index 0000000..7bfe8c9
--- /dev/null
+++ b/conf/machine/qemu-arm.conf
@@ -0,0 +1,14 @@
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
+require qemu-machine.inc
+
+DISTRO_ARCH = "armhf"
diff --git a/conf/multiconfig/qemu-arm-jailhouse-demo.conf b/conf/multiconfig/qemu-arm-jailhouse-demo.conf
new file mode 100644
index 0000000..fd642bc
--- /dev/null
+++ b/conf/multiconfig/qemu-arm-jailhouse-demo.conf
@@ -0,0 +1,14 @@
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
+MACHINE = "qemu-arm"
+
+DISTRO = "jailhouse-demo"
diff --git a/images.list b/images.list
index 4e52648..128ed2e 100644
--- a/images.list
+++ b/images.list
@@ -1,4 +1,5 @@
 qemu-amd64	QEMU/KVM Intel-x86 virtual target
+qemu-arm	QEMU ARM virtual target [requires '--latest']
 qemu-arm64	QEMU ARM64 virtual target
 orangepi-zero	Orange Pi Zero (256 MB edition)
 nuc6cay		Intel NUC (NUC6CAY, 8 GB RAM)
diff --git a/start-qemu.sh b/start-qemu.sh
index 65385a7..7e95ec8 100755
--- a/start-qemu.sh
+++ b/start-qemu.sh
@@ -55,6 +55,21 @@ case "$1" in
 		KERNEL_CMDLINE=" \
 			root=/dev/vda mem=768M"
 		;;
+	arm)
+		DISTRO_ARCH=arm
+		QEMU=qemu-system-arm
+		QEMU_EXTRA_ARGS=" \
+			-cpu cortex-a15 \
+			-smp 8 \
+			-machine virt,virtualization=on,highmem=off \
+			-device virtio-serial-device \
+			-device virtconsole,chardev=con -chardev vc,id=con \
+			-device virtio-blk-device,drive=disk \
+			-device virtio-net-device,netdev=net"
+		KERNEL_SUFFIX=vmlinuz
+		KERNEL_CMDLINE=" \
+			root=/dev/vda mem=768M vmalloc=768M"
+		;;
 	""|--help)
 		usage
 		;;
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2a29c82045914dad283ac2175eb7d08741d98f59.1616507282.git.jan.kiszka%40siemens.com.
