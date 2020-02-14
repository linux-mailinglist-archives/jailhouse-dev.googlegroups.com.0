Return-Path: <jailhouse-dev+bncBCPOXAO4SYIBBWMTTPZAKGQENWCVWOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED2215E29B
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Feb 2020 17:24:58 +0100 (CET)
Received: by mail-wm1-x33b.google.com with SMTP id p2sf4151809wma.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Feb 2020 08:24:58 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581697497; cv=pass;
        d=google.com; s=arc-20160816;
        b=l8+VMT5TKkSLUMAeOHKGDCJIO5oW17ejyWc6JjiXKl9leEnh11QHg+XEvqzrIhCmHB
         ctzsrBz64AdSXcDDWqtWLhJ3wdc7Ov+ceKgR0njDfPXMRlyXp7PIVb8gb2v8ezLGpsgZ
         c8JI3zE32s7/JRj2N6XTNuYZFgUNyPOAiCkJXvLMsn8zx4oVaP+TFxmG9yO4lXtY8/Te
         Cl4Tlt5S+eL9PH4xC4/EPwqS4oF/ejUpUKIM5NWYACwSugOJUZkjZjoemFSiNusEusqp
         myyQAnuBklrdSvrUShMi5fFSBycUSPgsNdGkCwn+A/TNOGSXVG7VQ/ixobC8uq6F7j8Y
         NwLg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=CezhjFMvGwbpOz3YwQTOf1mTTrJ3tsb8GJQVKt2mgF8=;
        b=KhkEvlwfELfJdDK3RAXYnfPFKNwZDR69kNz+NbWb1ZmlpTvdSFGKAa3TLhHLhrFRSP
         3JGGYe3raPh3Guh/FNVB8xFd8DVNq4o7CuT9p5xqA5D5QO5OuQQD9C48LFrAkELvuUng
         JDZmUcUl+L1N/rQ2W49zklMdZhEE4no8I5RPoSrm2o32CH3DQvA2JpsmjOZvcnnWcnCb
         PHIpzIg7lAes+QAMYGKucc8BmbUbQo5Zk9mN7GWxscRnycsaldRcivEoH2FUTk7a6E6l
         B62eDbYdaDbkXgUOSXDjWgYsjetSwVr0RetAu++FVQ+cd1z+GTD+FzDseWino+g4sqN/
         dTTg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="W2l/UatS";
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2a00:1450:4864:20::343 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CezhjFMvGwbpOz3YwQTOf1mTTrJ3tsb8GJQVKt2mgF8=;
        b=KeyEeKjKwAZ2KuKIOBkrlyrxn/ESuQVL9TjS+QOaMT86RWsO5G+bkwCyhbC2kldvYD
         EOZkQBEjLKBmMQoCVahIhxFIeXpzy31xAIYjBjI/pUsHva3S4HQFG5qnwbqfbpccZcVG
         wfmoFVsv9nKMXA2JBhXDZj8heQObXe+Q+Wk4VkvA3nZf/TgBgtJPQOlmgJI9JaXGAzeG
         Rz7eyJVtwKb0KlY2LKKYcfWHWPUdZLW6DAdASqGd6Yd6mUrFMB81ZL6DuuZ6ZW9OndUz
         sLbFN4nfG4btkUdQDXXKWhfgxvYjqJ8ZExmfMTKOhasSg7XXoao0EZqQflEFAB4FnmZk
         B1eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CezhjFMvGwbpOz3YwQTOf1mTTrJ3tsb8GJQVKt2mgF8=;
        b=RoeQOkpIG59da8zON42bi7GrVhC5k01c8yqBd1nodzg+FXAGko5VfhVpJ49UZ5gecr
         uf41LPutZfAZhHfJDj69W/N8noToM8CB+inLHfsjfZP2eT7yx0GORJk40lb8YgSET1uZ
         4gultpVSXobM6zpZ6VevP3yUND4/6BiE7V83Mc4JBjvPdorLPs3BZmGZDXtz+kQqoavJ
         BBxgP2pz2Kz3LzKNkaTVEQccd6bcHjRdDTZGQp3ZTWkMgJbr9++sWzJBOe+pjNp957LR
         PM/pFhtktxXiJMvdLIfpIu26gBee9/gIVhFsrbad0XNhJPefAGxjNPz2iFDWLkykXVs7
         /+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CezhjFMvGwbpOz3YwQTOf1mTTrJ3tsb8GJQVKt2mgF8=;
        b=eixrNdY47mDUS1WtdWbMvSdy9HIdPeiZMvHZMpcrsGoRsU+CH/1fJJV6Ay3BO9E0Nh
         2s42nSQf159NKA7ZBVDPs27hqwTwQ+l/fpWURrVJU0BuUNb6FEI82CoLkZMGRleoY/zo
         a6k8LZ1rdTu48maJgZZdhT9d1vJJYVa7PTsmgrDud8tyTpNL8zm03HDRJamN/oqLk7Pg
         FNKMPw8yaotcdbq8LynmCPeiV/zl2ktJI8ghuQkrPlDtdgJE/H1f5xNnSQS9rgxilERf
         +W212NRm9XA3GoimWz1ArFozhyi0J3j3tyIUbaBkxC5yMOkLGEdqBXOLJR5b7shXoDlZ
         HnAQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVyZY1rMQKqBxXcBxlqBh/wGLXFvZHrHy5xB3dCsBceuNWOdpMX
	tY/rE1eW1ABZSnc2YdGzQRo=
X-Google-Smtp-Source: APXvYqyjOmx99rOmupVvtfhmOKbUPty9ZzTbfXDgsKUy2t1p09JSvfAeWr8BxYDpseCnx4+HurGzIQ==
X-Received: by 2002:a05:600c:224d:: with SMTP id a13mr5738250wmm.82.1581697497707;
        Fri, 14 Feb 2020 08:24:57 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c09a:: with SMTP id r26ls45648wmh.1.experimental-gmail;
 Fri, 14 Feb 2020 08:24:50 -0800 (PST)
X-Received: by 2002:a7b:c651:: with SMTP id q17mr5690412wmk.5.1581697490699;
        Fri, 14 Feb 2020 08:24:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581697490; cv=none;
        d=google.com; s=arc-20160816;
        b=MysKYl+4dQA1fd/AELkXNndPsY7LANk+3bP1iRoXNuCP0zjEFHn4CTcC7J7Usfs0dX
         uX6XfJ+y5huKhxN1eh0VRo2z2s+54fLl6MA8z6zwr00DW9lQjnUWlEeRhvcHLe02O/og
         rgi6ao3bjWk8Nb80QAQdBY5/j9WL9EtXDoSVnqTiSkDYHHyv0p/Gseiifjmd7Dr+9X1e
         mk8aSGlctgwYHkr/wNNrOSDdhMM+bStjYYtjHQOCoW3SqCU5zIU/GBv3teONbnIrgUzu
         1pbFEhVkiwOXA4jGpSdaGvwKvxaiRev2ym/EK7VRrR068GKLZXRAa1SWwm/gu+g3FKJA
         P2yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=ie/zFPRzBDRta0ij6l4OWi0gF7bsLhA+H7GRqJF/85U=;
        b=dayJGq+97A3Sonp/b/UDet271SVNeheI4N/jIi1+fRyTzp9Cm4gLx4vUM6ujT8GxVp
         njn/i+QOcl3VYuTqcXej9cjw0kMJcri0eOmT2nuhrSqa6aji6Cnbi/Xil7WfLvRTLNIH
         S6X5UMerytNtuPkDXfw7LudxsTgbFJn4B09SzKJyWYnz6rWOdPNH/C5ZndfMrXJ83zeW
         HhzTgg+SB3H/h1WW/pZYx42xYClj88x63qt1sqYd9UynB7pN6oLvmH4PLLgbX3WNEPzL
         JnC+NAylt2XLmFJIiFiBlUypxnA5bMJSxH5bvVP8eu/S4UdG7d9qh3AbUS2hBqXhmZ+f
         qSvA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="W2l/UatS";
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2a00:1450:4864:20::343 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com. [2a00:1450:4864:20::343])
        by gmr-mx.google.com with ESMTPS id i15si364308wro.2.2020.02.14.08.24.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2020 08:24:50 -0800 (PST)
Received-SPF: pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2a00:1450:4864:20::343 as permitted sender) client-ip=2a00:1450:4864:20::343;
Received: by mail-wm1-x343.google.com with SMTP id t14so11242173wmi.5
        for <jailhouse-dev@googlegroups.com>; Fri, 14 Feb 2020 08:24:50 -0800 (PST)
X-Received: by 2002:a7b:cbc9:: with SMTP id n9mr5540900wmi.89.1581697489676;
        Fri, 14 Feb 2020 08:24:49 -0800 (PST)
Received: from oxygen.mgc.mentorg.com (nat-sch.mentorg.com. [139.181.36.34])
        by smtp.gmail.com with ESMTPSA id s22sm7721336wmh.4.2020.02.14.08.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2020 08:24:48 -0800 (PST)
From: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
To: jailhouse-dev@googlegroups.com
Cc: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Subject: [PATCH v2 1/4] recipes-kernel: Add support for pine64 plus
Date: Fri, 14 Feb 2020 21:54:37 +0530
Message-Id: <20200214162440.27509-1-vijaikumar.kanagarajan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <276d18e9-3f9b-4b93-8f5b-7223a4bea0f5@googlegroups.com>
References: <276d18e9-3f9b-4b93-8f5b-7223a4bea0f5@googlegroups.com>
X-Original-Sender: vijaikumar.kanagarajan@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b="W2l/UatS";       spf=pass
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

Enable support for pine64-plus ethernet, watchdog, pmic and regulators
in arm64_defconfig_5.4.

Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
---
Changes in v2:
 - Consolidated pine64 config changes into arm64_defconfig_5.4 and
   removed the extra config.
 - Added entry in README

 recipes-kernel/linux/files/arm64_defconfig_5.4 | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/files/arm64_defconfig_5.4 b/recipes-kernel/linux/files/arm64_defconfig_5.4
index ccfd7d7..a972ad6 100644
--- a/recipes-kernel/linux/files/arm64_defconfig_5.4
+++ b/recipes-kernel/linux/files/arm64_defconfig_5.4
@@ -125,7 +125,6 @@ CONFIG_PCIE_QCOM=y
 CONFIG_PCIE_ARMADA_8K=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
-# CONFIG_SUNXI_RSB is not set
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_SPI_NOR=y
@@ -166,6 +165,14 @@ CONFIG_SKY2=y
 CONFIG_RAVB=y
 CONFIG_SMC91X=y
 CONFIG_SMSC911X=y
+CONFIG_STMMAC_ETH=y
+# CONFIG_DWMAC_GENERIC is not set
+# CONFIG_DWMAC_IPQ806X is not set
+# CONFIG_DWMAC_MESON is not set
+# CONFIG_DWMAC_QCOM_ETHQOS is not set
+# CONFIG_DWMAC_ROCKCHIP is not set
+# CONFIG_DWMAC_SOCFPGA is not set
+# CONFIG_DWMAC_SUNXI is not set
 CONFIG_MDIO_BUS_MUX_MMIOREG=y
 CONFIG_MARVELL_PHY=y
 CONFIG_MARVELL_10G_PHY=y
@@ -297,8 +304,10 @@ CONFIG_ARMADA_THERMAL=y
 CONFIG_EXYNOS_THERMAL=y
 CONFIG_WATCHDOG=y
 CONFIG_S3C2410_WATCHDOG=y
+CONFIG_SUNXI_WATCHDOG=y
 CONFIG_RENESAS_WDT=y
 CONFIG_BCM2835_WDT=y
+CONFIG_MFD_AXP20X_RSB=y
 CONFIG_MFD_HI655X_PMIC=y
 CONFIG_MFD_MAX77620=y
 CONFIG_MFD_SPMI_PMIC=y
@@ -306,6 +315,7 @@ CONFIG_MFD_RK808=y
 CONFIG_MFD_SEC_CORE=y
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_REGULATOR_AXP20X=y
 CONFIG_REGULATOR_FAN53555=y
 CONFIG_REGULATOR_GPIO=y
 CONFIG_REGULATOR_HI655X=y
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200214162440.27509-1-vijaikumar.kanagarajan%40gmail.com.
