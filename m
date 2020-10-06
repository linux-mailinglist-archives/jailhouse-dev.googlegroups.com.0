Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOHG575QKGQESWLPLFI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F9A2844E7
	for <lists+jailhouse-dev@lfdr.de>; Tue,  6 Oct 2020 06:31:53 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id i10sf4833976wrq.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 21:31:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601958713; cv=pass;
        d=google.com; s=arc-20160816;
        b=W92zuEZQyYrra7gZZtOUHGzIIALcK0sINN2fJkakwfKoAnCMHFfbhhxt3DD/1CEcr8
         E+8Ip5XAVZiJtC4U19Sk1Ql96F+09YTc424LuDJmDDAX+6PT1HeNuUtqiI50jCge46Gc
         7B+xI1iepchkNd52VSe93dLI9EiFpXIYc0A6t65ON6cJeRRWvXp898sU2EcNU9Ibt8Wl
         ejEnymT5nN1jkiZmdLf5j/y6sWmn+wZOGDbiJhVVprhUJ1h6NgZPCsKsG7NnRHaGgikv
         0zm6LdGS0HKGUyuXMm5qNa4Z/dKJ3cGvt1/UtP4JIJ8jKETzRs5YZxIDk+oADPXinEM4
         vwpQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=gb7iiedtyEcYx03+JUSMEgkolt4kxigMWB9ifS5r46o=;
        b=E+JeKoYv4UIW1iJJHMiB9bkwP0EEwnBnMIsIbgKCWZtX0/xS9HTRAU0yrMl5T5Wacs
         iS/MHu+DridVgzybxwJsvO7J0chdItz4LMF0RNaeTrnHrJYwX39R5j0hSvtpG6vrjFvp
         hAx7kWiz23awGY03lwNL2s6ZMHtttx92nawUmgHR8ctOumrQtbcJVu8Y1ipVXbC+XLKY
         1XcJNFoJTIBxJVYGT3lfMrVgWFCKXc/cKTA0mdhkMyIRc/Y/EFGS+8kwdrnFx/3w3TpU
         ir6lrrzF9qPp1w15PiYrIa1+fDr1efpg0Rx1r6t7N02xyWKeHxY14817fFM2i3pPvvKq
         1J1A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gb7iiedtyEcYx03+JUSMEgkolt4kxigMWB9ifS5r46o=;
        b=MRV/0jeREAHUl41ORx/2APlYGUKBcwNBXBwH7OY+saRjiQP4VXCFewMTU1oBGuhPFt
         4gMHItxjSYapxzsDXFweQoOLzvB6bhN0zB53n4FsY7sqvewVeYIVYpm0KBL2RPfpJ6Bt
         IdnG4HvuaBZitmEbolzx+RGaaPbiwndVxTBaheDjyliQv0VA7uFORtRpgYPyIA2DzZjg
         0Hk2q5xst4/2nJiKYok9hwTI5zDmDeo9fYtqK7MRg/StnAyA7YyXFQcNRPpqzaw0FVPI
         pcTd7sIvmr8PZ/KA2LNHjzOoZjG9a1JTUPd8iM9jZY+C7YvDy9Iem44h/IbAfnLKDltC
         Gr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gb7iiedtyEcYx03+JUSMEgkolt4kxigMWB9ifS5r46o=;
        b=AA9OK2l8SCKDfJqwV8eSrOGxx9+q0fCCCV81h2oFN/1rrOQ46RsUV0Wf6t32RFK7jU
         +KQRgiafwc8L6KjiPhtUVvDBrkkIaD82jP+QEL1ADuANiGeFZ3iWOf50fl4d/I+s1I2d
         TKWjqdS/AZXIh6pALC9fNBXxCIpgEmvy4+kToTACK/ccYS6pEUpG5yykZmPo60OprsxX
         Y6FFTwL8O2al4/uFDyN7gdmDH++7nDvoodQG3rfkfFhuOOyNVu9B//XFeLH51YcJcCuk
         YHnoj0Pll8GYmAbXAAXnA+lgbY5ODmbNI4j13ECvIpb6aS1YNSzeq55j6DG3T7Ol7R3u
         Eoaw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533QK94WcV4dWMcVXkDOmYryGHuhVz+cifgdswIbDFVtSu1druAu
	KTOZLZdfRUT1VS7XPHnnL70=
X-Google-Smtp-Source: ABdhPJyBeRm6AhcQ4hGXiA164Xi4vejKNzgui2rJPuYXFkRujvu31h7WT7R8EqCpUTi6jcmKeJQX1w==
X-Received: by 2002:adf:a3d4:: with SMTP id m20mr2778482wrb.29.1601958712892;
        Mon, 05 Oct 2020 21:31:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9986:: with SMTP id b128ls527081wme.3.canary-gmail; Mon,
 05 Oct 2020 21:31:51 -0700 (PDT)
X-Received: by 2002:a1c:3cc3:: with SMTP id j186mr2666680wma.155.1601958711736;
        Mon, 05 Oct 2020 21:31:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601958711; cv=none;
        d=google.com; s=arc-20160816;
        b=0nbTKIFqfBcaClka76u6nG8a+R7eg6o2EVLGPzG+HYM5qpLO9N0QildlLzsfJ1/wDc
         XTchYlMLHyQZZY9Tz6qvqDxFMYsAyOdX6Ek0U37vTZ3gYafFNBCHv572v6AqYg+BJKEF
         PTVuJnxOU0C0WbGe7BfxYHap2tjKAbT9IpJgCzDOerqt6kYf1fztpoKIjY8cb0yT/7fk
         F8t3PMWEy1la1wdhpolXi9ybwX4iTpKZBg2YAZuAYKEpTvTyzyyra/+5tC3knXyweXX0
         /jj7trfaTp6U07iCpZ5rX70JRPXa5Of1Dxrw9hKQTM2h/jACgiBzYcyf0D8XuXk/NwGr
         bBug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=oUC4UBvdLgV/xoDwJwthXd+TvoyOi1vXtBydEGkkdC0=;
        b=kYqearwzebA/eUkiGzsm5fDaqwMi79qXPf3hHkEgzh5EcCZRgLQxWZ1GP2USHwwGQ+
         sE0rHdisyenZ4Y+WXevj+aTFwFhsaksLLUa6/lutPnAMkAIaTMU0umjhh68oimajnEsJ
         0EWXSIuMAE18RnAT04j/EIZpCiW1dKDfZZdZmSS9HXOWJXhfvs8vhurpXzJRQtiaoBEH
         /l2VYH1TGR6dwwpS8KwvuU7UdAS8LouGrcheYAzkSm6uRycRMeI8e6hmPHSgpigdkaSF
         BS3AbAG/SmSE+SGBCkoYWk2YeWg1jR1+JuFjyFHNFJi3kEKPkOfqiXG1KohH3D5879vs
         qz3A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id k14si49494wrx.1.2020.10.05.21.31.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 21:31:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 0964VpKI028622
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 6 Oct 2020 06:31:51 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.160.159])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0964VY7u008537
	for <jailhouse-dev@googlegroups.com>; Tue, 6 Oct 2020 06:31:50 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 10/19] ultra96: Disable initrd usage
Date: Tue,  6 Oct 2020 06:31:25 +0200
Message-Id: <a80458ba61689ac6537afdc3794392884372f9be.1601958694.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601958694.git.jan.kiszka@siemens.com>
References: <cover.1601958694.git.jan.kiszka@siemens.com>
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

U-Boot may move it into the reserved region, and it is actually not
needed when compiling also GPIO support for the zynqmp into the kernel.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-kernel/linux/files/arm64_defconfig_5.4 | 2 +-
 wic/ultra96.wks                                | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/files/arm64_defconfig_5.4 b/recipes-kernel/linux/files/arm64_defconfig_5.4
index a972ad6..cfa2da6 100644
--- a/recipes-kernel/linux/files/arm64_defconfig_5.4
+++ b/recipes-kernel/linux/files/arm64_defconfig_5.4
@@ -287,7 +287,7 @@ CONFIG_GPIO_PL061=y
 CONFIG_GPIO_RCAR=y
 CONFIG_GPIO_XGENE=y
 CONFIG_GPIO_XGENE_SB=y
-CONFIG_GPIO_ZYNQ=m
+CONFIG_GPIO_ZYNQ=y
 CONFIG_GPIO_PCA953X=y
 CONFIG_GPIO_PCA953X_IRQ=y
 CONFIG_GPIO_MAX77620=y
diff --git a/wic/ultra96.wks b/wic/ultra96.wks
index 305cc1e..2ce1785 100644
--- a/wic/ultra96.wks
+++ b/wic/ultra96.wks
@@ -11,6 +11,6 @@
 
 part --source bootimg-partition --ondisk mmcblk0 --fstype vfat --label boot --align 1 --size 16 --overhead-factor 1 --extra-space 0
 
-part / --source rootfs-u-boot --ondisk mmcblk0 --fstype ext4 --label platform --align 1024 --active
+part / --source rootfs-u-boot --ondisk mmcblk0 --fstype ext4 --label platform --align 1024 --active --sourceparams "no_initrd=yes"
 
 bootloader --append "mem=1820M"
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a80458ba61689ac6537afdc3794392884372f9be.1601958694.git.jan.kiszka%40siemens.com.
