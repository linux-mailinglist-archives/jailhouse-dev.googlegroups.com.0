Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKXD5L5QKGQEWOAJTJI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 9591F283024
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Oct 2020 07:39:54 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id 13sf2017994wmf.0
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 22:39:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601876394; cv=pass;
        d=google.com; s=arc-20160816;
        b=mY1gh/4XCkPtfRYUK6wMR/GfMHgVo0b+xIvmutbWb9snm5AJASd6O25C/YpD0XSt06
         ebx+CTfIkAgFFSX4grM6Lr95Ancx98Yvc6dvZCvspHfsOIT7UVg9XvC1QSMiRO++ChPW
         yt1milddn7DtKnu9Gbd70auQpH9Rc7X8XnjNGht/F8tJp0zrF6Mxl9Bz1VfUvOFLqU7A
         Y7XJYav+XPuEBbZE6sEIdBrjRBA23YsmE7mTxI4Ee5VbnU/VX/XZGzzYPaEscIS3Fb5p
         jfuuVn/N7tf5FHj4S91GPx7l78DgCWRrbI6uOXrYkihmo+dPgbT2Apr9i2e8g6AColaG
         eyoA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=8oB/IWPXj9BH9Vuh4tkZjWJLPlhNVRXqVZjKoXWojRU=;
        b=hxLwdVH01w3z8/HgAmLu1VKyRa4IFKlYhZYkxhMQSlLclF6depIr2/BMlQwkmHcfAz
         LLNn9H0QDv3EbVz5NMqAts3UkXZY8qix2u43rsz1zpGEDn0CXzlmvfpnXSIifCt5RKyU
         o99ZEr1rFI+W2ZbBLGdgaFuv2RBeWaiUM2cqL7a6lEEv/K3anS4FLXKhozPoQPk9yZ0a
         V2NUy+03o4pJTPpNYAo0haPjIVIVARPozW5YVBfXshI8R3Si109WVL4w8TYcXiYYcj+R
         rVG22DRr3whHVyKF3echhz75PBU3FdjiAyvwAHx4SVpDmFts3rXsubysYNLEc045XNE2
         UB9g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8oB/IWPXj9BH9Vuh4tkZjWJLPlhNVRXqVZjKoXWojRU=;
        b=jieFtHye8NoIQNte383BVdpI7MoiNiq0dsvrCC3WRWhQ9qyL/uHyY8vVklFgviduqw
         rLaqYH0/qJeK3ptCFGd0r5afJGE3YUow8mDJVV1cVL88i78motjnCFFR/HwwcL1Xvuq1
         bkpNESmOoDWk8bxDMBoPCJr7fb9oMS0+bbX/4kL2qA1WMOj3gh7kWQpdpER81tNAjPmr
         1Z1ePGZRZILPEztvVyNICa9PIj4d6925VaqOEg2Sb8IniwjD3iSaor95kw2xnYzoATiF
         Ut3p/8knjM6MFS2UW5G8HNenISfQDbnOpc2X3EnA4RMqLxzrTovm7rBAvE5ufQsFlJhM
         LOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8oB/IWPXj9BH9Vuh4tkZjWJLPlhNVRXqVZjKoXWojRU=;
        b=kdbpg7h8xny8rrEBgTUcPBJBOViuxZODCLKuwqL4EPnr8ZbG25SU/sd+CuM850c20Z
         STO2hUnSYmWkUwx2Ia52PDaEbsqjl+9/LeInZeHXFCFk31wHrs6/KML5GaItBwF9x3Cq
         SWuK4gY1kr1ZYN/W/68ws6XzTrotkwL/Q7ASRINYNoU4hhJ2tOk392yIXsgdMhrD4U04
         UPCRSx3U9cQvIeeGhN5Fouy/bwRvwpIj6ERO0b+huD3dddB0RvmSfQNo7A7X8EByu+Bf
         bO7mYVnYvHceT/iqPZ1n0dkJjOq7LJCdIBr/grlztEBWtztlO4hShHPhFC4GgOerQtdT
         Imxg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533tMSmTREY3jSiD4+eygSQevEhVyuiaBE/tA5sPCncBIwwGukEH
	3Eu407hskj0iA5jiTX89A8A=
X-Google-Smtp-Source: ABdhPJxO5H40K8WbkpMtPEATeWl0eVnTj9EK0CWZefGR/7sjkLEJnYaidWfcVCT86lxL0ns2CtCvbA==
X-Received: by 2002:a1c:4943:: with SMTP id w64mr8823192wma.165.1601876394381;
        Sun, 04 Oct 2020 22:39:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:e08b:: with SMTP id x133ls2245287wmg.1.gmail; Sun, 04
 Oct 2020 22:39:53 -0700 (PDT)
X-Received: by 2002:a1c:d5:: with SMTP id 204mr9908654wma.56.1601876393497;
        Sun, 04 Oct 2020 22:39:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601876393; cv=none;
        d=google.com; s=arc-20160816;
        b=cjao3O3Xk2rQqe0TKlnBCnuIr2UYTXRqWRE10FmeAfOrwONjtv/LvlJuTxH41dTOTu
         gbB5t5mG5MCH9CJRDlRkUyO2hP/jlM8WRflu/2SUfYcju8jsV4z1aPX+jDk3KJPctAwT
         DJUFl3K5oCkhW52Yazrl/Ia7MOHWblyRL1p0DkG6iAYD/FIm4OuFcx+lzS2X5M5jzwZJ
         41qRKtMOX/wQx4wffsKB23sfFgFMYUSLjJiF92a9QDlBmLVsl9BBIpwsyH7GzQzxnZoo
         PDl6JJ/dKsLzXcFUK6h0aivIOR1Z9lvDo9w77W4MTbhOSSJZ2CPI6K4+II6oDhYFvYL0
         1ZxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=oUC4UBvdLgV/xoDwJwthXd+TvoyOi1vXtBydEGkkdC0=;
        b=rtoAEbkg73vXsOyIk7tt4E9+og5aKOMVwjRQgMIlII3vOhZKXmdFGUd3/wbDWa2JIw
         7ftfTBNPF1LA6IwvI7KeNUOl1cpL/4yXVUmmWo3cQdityHlDcFh4ep5xaHCYvHqWHGOk
         Q5Pa1/fQHhxQ6x/3lFtqNqaCY7UzMa0R+Ab7FnsECYjjkJKzbSZjATritJ2JM2Z6wPlB
         NQ2HxjnQoAOJHZ6UJSTmF92jibezaF2u+6A8xsMI39AtWCSIFCxoZlFwyFaqryO7jRPe
         0PAKQ77pG6igfTumRc6+xAdwWGGh/7q5GkF8E01IqQx1O2l2cj+CQZ1pk7/BMtw7RLHT
         u9jA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id z11si333544wrp.4.2020.10.04.22.39.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 22:39:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 0955dr36031126
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 5 Oct 2020 07:39:53 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.39.163])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0955dncJ025569
	for <jailhouse-dev@googlegroups.com>; Mon, 5 Oct 2020 07:39:53 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 10/19] ultra96: Disable initrd usage
Date: Mon,  5 Oct 2020 07:39:40 +0200
Message-Id: <a80458ba61689ac6537afdc3794392884372f9be.1601876389.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601876389.git.jan.kiszka@siemens.com>
References: <cover.1601876389.git.jan.kiszka@siemens.com>
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a80458ba61689ac6537afdc3794392884372f9be.1601876389.git.jan.kiszka%40siemens.com.
