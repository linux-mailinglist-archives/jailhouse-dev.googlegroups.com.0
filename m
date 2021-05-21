Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB5U2T2CQMGQEA6E2DLI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id C248C38C514
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 12:37:42 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id f4-20020a2e97440000b02900e0cf71110dsf8697585ljj.14
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 03:37:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621593462; cv=pass;
        d=google.com; s=arc-20160816;
        b=Y1NFSazlXhZno+eooX9wgq0GhbA5gtSA5lnvis6BKTfzQ+ZmCD+MhtNto6gInuXkq/
         OOngZBsdkoVMCxhf6oqNx6vRhBpTi5MhZHQ+0otsU4LN8UXNa1ayey9wH/pMeZ8xPBFq
         vv0MmKHjuBCc+4u++D/pmi24PMVjy0gNLfbKsP6T2f2nHHvguWpzxcOeyJSC8+AFp4Rf
         m7CDAv4w6HkXqDghmU9kEyihtB9WrBPBKCZId4c5LNQUy8xIAeWh1sxDHSn2U95kh0D0
         zm6j+GiKsIv/SaiYOoF5Hc2rPiMvnZhg0XJoFzZIakERpKp9AAUFq6R/IHffDgPR4eCD
         38vw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=P48Tcc/69PnAGrGizL2lZe4jLLNdOHtuUTUg/kHwIMs=;
        b=N6E6uESz5rAHvzvB7BvJDLvQqLXYty9AK1HQTzIY7AU3a3Z3buQFsQRuK6VkJ9fEnD
         B2qtK8AiveKy4Z799fcJVtvlvAyaND0t3o19FS6HwLBoj6qz+zDebNYRcvgSGZzftm8Y
         Ph9EtGJqDUJeb1tUQVQKcGHIp4E8aQ5CzRaOUR3y8AD/7ZrNOt9CRTfA1jPJ5NNWWTZO
         7kfuYxo3wi73D2782Msq60kNS5I8oiaipDQPn9hhbxPdupYbvj3KA7zy197aYc9HgqMI
         x4ME5q7XyPVxdxnxrGvvGS793zV0aESUXByzZXkY2GYt/u189LmqV53NPOVkvmSaGPBb
         RG5w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=P48Tcc/69PnAGrGizL2lZe4jLLNdOHtuUTUg/kHwIMs=;
        b=pjofwRrffzc+dOX+1ke2R4RK/QYuTlWXABda0Kh73EMxysZ2UKt2ybzMUAbWzPM0cn
         fnN8aOQNPxWMw56j6J/t+Raf/PeEsFSQoVprDosMeKgos1BEV1+PXyXJNAagMEg//9on
         WlqpT9W2OAn/+ez92/HNynoP6RI6odPtIKJ/pv6guSg0XPn5O9iTkFFplb62nnyrlbrN
         sXCX1FrzTVRZIY/7T83f3zCj76JD3s+UGUvVT14lfZYjhCxQp4zHAKdHg0W+s5r62Ovd
         grrdOJEfVIfn/QfsR0Y52pj6Z1iYgUV++cfWcTwOE6j1v/3jd0OY5l1nGVkuavJ6J3sW
         byJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=P48Tcc/69PnAGrGizL2lZe4jLLNdOHtuUTUg/kHwIMs=;
        b=tevRB3zB1vNTSEZahRb3avuvGvvqf0FEfQ1GB6ZijkYs/3At+AF1c27ETQR2k0/Avd
         0yb7vgOIBq4Ad9dcm3JqdEXE5UfM8ViC2gjcsZHD/4yHu3x0f/pFD2cXE5zy9+xhSu23
         0K0OkZECft4PPpcgtuSdMh4whVgJEc9HMfvaJTt/gwQNHv/64nGnT0Z3xkNBQNuXMEIY
         CrExjgY0fQrAr3xvHChrKwDBR4SZFugJrAthQ/yyzifvuoIsq4q1nr+9bo4wHyZ0o9ft
         NODDMl0dLu2VjSsGwR6H7VvWFJdlTQbnz4JMGep7PBNbSKEwdlD5lVa5zkZ415j6QTZT
         kuGQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Q/7t1GpwCyaGwD0qbfEB+TlEDKVDJFk/Rp54s5jDDaK0VuXtC
	nFF1o6mR03ZI/T0wrtDda9s=
X-Google-Smtp-Source: ABdhPJwZ7EZh9rTXSY53OMr6NjDexAo40Q6dFL24hFPqZPhVDF3XO9Qluofwq0hi/MnOudCTUe92aA==
X-Received: by 2002:a05:6512:3772:: with SMTP id z18mr1768487lft.423.1621593462354;
        Fri, 21 May 2021 03:37:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:bc06:: with SMTP id b6ls1139731ljf.6.gmail; Fri, 21 May
 2021 03:37:41 -0700 (PDT)
X-Received: by 2002:a05:651c:3cf:: with SMTP id f15mr6193451ljp.404.1621593461168;
        Fri, 21 May 2021 03:37:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621593461; cv=none;
        d=google.com; s=arc-20160816;
        b=vn4gN+gg99YWcl/f3YMjvfjaopIxeyT93lGqq++3EdF11Nc30ZFWMpd/VLxOiXgdbz
         iNVx+v6yWfYSl8899ZSzu5uZwWD+uqnOuBuJsAyDn6zOJ5S82EAoZzyGa/TIxFA6yBXA
         lGA86k83GfXTtn8/UWf3oo5nVRu0hfjr4otutlXMNJjgb41q4+bTv+tH3dIWbL8ZG22R
         lkHXLbR+j5GxzCZLlNpJWF7cuIngDbH7pgL1D2cUkhdnK9jgyouP0Oznh5a2DBehMQPf
         xUxf3wy51s1hs6I299D3J+ZufifnH7SkNEr4osIGf5/3XK/bVq5Ss7klMLHUavC2yLdE
         17dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=thosdWXXK92IoVzq4Ou942efniMhmNHNn/7fsEbyNtE=;
        b=L9TqRZYSFM2B4LpNtvc72rQCqMDVoCBtyZrtJnzzmDiPpuUz3lEv8H93wael9u7SZD
         Liaplx7ybdkDnSZCCSpUXzR1wgyHXh8lHJeBZ8PbVGJaHQA7irBZ5n43LU+sGmNk4vqZ
         IDtpUvxmj+6K75wOOZD/DEGPlsTGmztOq28WI4Uk5u2OBuEq2MbeRa8IhLjyB2Uv7T7D
         Hqo5KXunO8ELFprt0hqLrgLhwf1IL7NYYxQoSGGMHlL41H+BZGr2NeJjFOJOXakugKE7
         21wINUcf+HZo/IdqVLm6jUHaJZ4WfKkISiZNaFRSbrA2lXV65gaRNH39Xjr0VBKCIq0N
         RF6g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id q8si348627ljg.4.2021.05.21.03.37.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 03:37:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 14LAbeA6002696
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:37:40 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.49])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14LAbYcQ032504
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:37:40 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v3 21/22] nuc6cay, ipc127e, hikey620: Fix wks files for newer Isar versions
Date: Fri, 21 May 2021 12:37:33 +0200
Message-Id: <3e097f04612418d2bf91011b06174669e9dfd300.1621593454.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1621593454.git.jan.kiszka@siemens.com>
References: <cover.1621593454.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
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

Since the wic update, the boot partition is actually tried to be
mounted. This fails due CONFIG_SYSFS_DEPRECATED - systemd simply does
not find the device node.

We also need to move the mount point to avoid overriding the content in
/boot. Finally, --use-uuid permits to use it irrespective of the boot
medium.

Also drop the unused --ondisk parameters at this chance.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-kernel/linux/files/amd64_defconfig_5.10 | 2 --
 wic/hikey620.wks                                | 6 +++---
 wic/ipc127e.wks                                 | 4 ++--
 wic/nuc6cay.wks                                 | 4 ++--
 4 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/recipes-kernel/linux/files/amd64_defconfig_5.10 b/recipes-kernel/linux/files/amd64_defconfig_5.10
index 11bc670..ac6fdc2 100644
--- a/recipes-kernel/linux/files/amd64_defconfig_5.10
+++ b/recipes-kernel/linux/files/amd64_defconfig_5.10
@@ -29,8 +29,6 @@ CONFIG_NAMESPACES=y
 # CONFIG_PID_NS is not set
 # CONFIG_NET_NS is not set
 CONFIG_SCHED_AUTOGROUP=y
-CONFIG_SYSFS_DEPRECATED=y
-CONFIG_SYSFS_DEPRECATED_V2=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_EXPERT=y
diff --git a/wic/hikey620.wks b/wic/hikey620.wks
index 9fe9e70..a438bf6 100644
--- a/wic/hikey620.wks
+++ b/wic/hikey620.wks
@@ -9,8 +9,8 @@
 # SPDX-License-Identifier: MIT
 #
 
-part /boot --source bootimg-efi-isar --sourceparams "loader=grub-efi" --ondisk mmcblk1 --label efi --part-type EF00 --align 1024
+part /boot/efi --source bootimg-efi-isar --sourceparams "loader=grub-efi" --label efi --part-type EF00 --align 1024 --use-uuid
 
-part / --source rootfs --ondisk mmcblk1 --fstype ext4 --mkfs-extraopts "-T default" --label platform --align 1024 --use-uuid
+part / --source rootfs --fstype ext4 --mkfs-extraopts "-T default" --label platform --align 1024 --use-uuid
 
-bootloader --ptable gpt --timeout=3 --append "mem=1820M"
+bootloader --ptable gpt --timeout 3 --append "mem=1820M"
diff --git a/wic/ipc127e.wks b/wic/ipc127e.wks
index 777d446..fbbcb35 100644
--- a/wic/ipc127e.wks
+++ b/wic/ipc127e.wks
@@ -9,8 +9,8 @@
 # SPDX-License-Identifier: MIT
 #
 
-part /boot --source bootimg-efi-isar --sourceparams "loader=grub-efi" --ondisk sda --label efi --part-type EF00 --align 1024
+part /boot/efi --source bootimg-efi-isar --sourceparams "loader=grub-efi" --label efi --part-type EF00 --align 1024 --use-uuid
 
-part / --source rootfs --ondisk sda --fstype ext4 --mkfs-extraopts "-T default" --label platform --align 1024 --use-uuid
+part / --source rootfs --fstype ext4 --mkfs-extraopts "-T default" --label platform --align 1024 --use-uuid
 
 bootloader --ptable gpt --timeout 3 --append "intel_iommu=off memmap=82M\$0x3a000000"
diff --git a/wic/nuc6cay.wks b/wic/nuc6cay.wks
index a8cbff9..94aded8 100644
--- a/wic/nuc6cay.wks
+++ b/wic/nuc6cay.wks
@@ -9,8 +9,8 @@
 # SPDX-License-Identifier: MIT
 #
 
-part /boot --source bootimg-efi-isar --sourceparams "loader=grub-efi" --ondisk sda --label efi --part-type EF00 --align 1024
+part /boot/efi --source bootimg-efi-isar --sourceparams "loader=grub-efi" --label efi --part-type EF00 --align 1024 --use-uuid
 
-part / --source rootfs --ondisk sda --fstype ext4 --mkfs-extraopts "-T default" --label platform --align 1024 --use-uuid
+part / --source rootfs --fstype ext4 --mkfs-extraopts "-T default" --label platform --align 1024 --use-uuid
 
 bootloader --ptable gpt --timeout 3 --append "rootwait intel_iommu=off memmap=82M\$0x3a000000"
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3e097f04612418d2bf91011b06174669e9dfd300.1621593454.git.jan.kiszka%40siemens.com.
