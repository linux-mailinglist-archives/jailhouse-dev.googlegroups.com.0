Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSXYQDYQKGQEUO5UEIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 026EA13D7F9
	for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 11:34:51 +0100 (CET)
Received: by mail-wm1-x33c.google.com with SMTP id s25sf484536wmj.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 02:34:50 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579170890; cv=pass;
        d=google.com; s=arc-20160816;
        b=c+gl342QuQDZhrSbw4xSqlN4YiimSjov9sR4lmt1id52vWASPN+Z9IcPSdAk7OcZ/U
         OcMYc3zVmVfaiaE1JMvkDQ148SLS9NFZZ2TtPCwto/dgf9ODXoqSs/gtVsqcihpBS2Q8
         6Nvor5/nRa0YlKQjSBy9gBllowI9GiuXnyzaf4Pqe4aGzG8ilaDwI+X95NuSQK5AE7x6
         /mjhb/fVM8Ofcs+yQ88Au02+u/GlCIcJ6qeeDpUS2pnZaI67xa1n3bUiVavQr8f3CHVG
         +PJhFW1lnTHyBqDzU39XZ5Q6NhTUkNqmEUNi8zFMsLOFVsgByXpW/OizE9mgRZL4A78j
         0QwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=hpL58YC25YO9WUWjd6fJJb2kQG6eZmVYKCrs68YebyY=;
        b=ghROVKOrDZeMTUY9MxBaB2+5jCv7Ji4bg8GL5Z1We45khvslnkzTbvqbYdMfzbrU3J
         rhIkqaVawTJWbTc7eEaYwa8DHSS8q6QVL5OaOhh5oFRKF4OgyCIh1Z3ADZhDY8SuaXYf
         QJ6KpT7ChdrAenyHXL/SbB4EfYXLS+K91NDHKg9RIbRClDJl2/IIQDqlC0VPcmojFowW
         dioeY62a+YyO9QJc2EHKHhiaqulpqjqbQIsuuhyxte/YC8EUiy3vfIcncioPVlg9V8aC
         eWvkFlBiuah8egScgV4pW8NAX3E/elMJkEesNmIJ75LuYWMOeUCBCSYPCCvR7a+/+fJk
         gS9g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=hpL58YC25YO9WUWjd6fJJb2kQG6eZmVYKCrs68YebyY=;
        b=NwxWtiAv/bwq3vuaAl7XIQ0bD9icae+LF7kV1JSKV8Z1QWE1uSWLrxP7507IcjkRuH
         4tCtHNnbGX3KWAUQKoKS57LMScx1xuZbHPpFbHmHts5zp/3PyEAmjrEaWZHbqDYh5gNk
         fy6sHY979yLryPN9Nd8owt7nGCGnCw0ZBnijcd8XiGD7Ud2OQmUYxrRO6Mofa2iSeNeL
         cOUGsTuB6DhFAA2Zx+C6jthLxMDO8T6WY7zg1YDyRY5FFOR1MAZHNhdd6LLVNR/iVisP
         yUKIbpiQJ7m0qE62TXEREbzw2OEKQjO9dWv7Tum5HkdRlUacQWnwmx1wGG/UtC8Rv76z
         5rQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=hpL58YC25YO9WUWjd6fJJb2kQG6eZmVYKCrs68YebyY=;
        b=Zm7+yZnHI26TBcYIH5X7MmD8VBKrTxmW9DuO60Os2s8fRPBONGZJxnyY7gJw1S4Jwz
         lsw919wmbwE7y1jxLOH3kbfTZzaiVKkIUrxSZ2qq9E7aWeyfDRiLFbyB7VyqBxS7zTCK
         s/GqdAQyz98uRp/0GIAv4NBQ60gtFF2L+IFzQGb0II38XaHURCUQFxopXoT/f9oVy0hO
         jGNhanIehZOmLtNRsWFRKBtO8FqiDWE4rTpm5z5ppzvbngW8YC/2VvWv8c+cvYwpcZsM
         UDJy6MwAQHWcKAYlv+5eq9QIkukfeJ5lKhvfwMYB0Kjyq5VvwpcNGIvAKcK3kma+lxv6
         526Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX0ZKEbXa7DqEZrJsJldQuajoHudqdweDs2cPYyEnK+rTzzgfwv
	ubPCFqkEbs7qcvmz7rt31fQ=
X-Google-Smtp-Source: APXvYqx1MXTJ0Z3kI6GlDfIfSH/+2WwpSSSNXcyYYmWwz7gz1qXITB1nE6MxCR8K0w9MtjoyhiqngQ==
X-Received: by 2002:a7b:c218:: with SMTP id x24mr5455697wmi.149.1579170890679;
        Thu, 16 Jan 2020 02:34:50 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fc89:: with SMTP id g9ls7783334wrr.5.gmail; Thu, 16 Jan
 2020 02:34:49 -0800 (PST)
X-Received: by 2002:adf:f501:: with SMTP id q1mr2635841wro.263.1579170889877;
        Thu, 16 Jan 2020 02:34:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579170889; cv=none;
        d=google.com; s=arc-20160816;
        b=b7Q3eAF95qyvbt0xD4Xgu61581hwVuR/WmNBeSRy9+dke1yIGpBa2obmhneKHevd0q
         Onf0CnNmYSDQnjOFq12BiXt5Lzylid76nl4PKajsBK6H25CGXNiSxyw/hF0nbvYNgmrX
         NSO4+ZemC9/B7VlOA8mDynW2y7oYwXP81uyyQMhflygkUjSA0ElaFi7h6ThPMANgd3sM
         4m8tiCORZebXQltYNVpo2vhU3OfLiSNQ41kptRZ4aqdgDboop5Q9KLLKcI3hHXrkHmjp
         9CNEFdixlB4iH+Yn7CD3RYs/tNEfNAOm7jSTfmUq6nh7TUxTZyJDD75f9belP77sXsQm
         tJUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=RyGXFUyNUfUHCoyOVaEZA6FIfhHoPod0tmCzPtOKCvo=;
        b=I2TvBtXmBftPSGBY8ngjeVnmWukqtStTMJKuJRYyucym+fxsnlNTowllpbAEaGeYaR
         fCw0tj+Wja+WMOZo0/AvHv5ACds5P2IAH+ZF7yZq4WeTWdfdy5tRT7KQuo8TharrzpWL
         4zDYOKZT3p1IWZyZhMUFuVZ1JnbyS4/Svh2oCHGuRjgSKMsiODRXyoUz4XUPBSHr1O7P
         VrS6phlJK9ynA14xkgeh5lbHEETCk5Qis9Kg/3+pr/nGKwl5+1IxurY5y1wOtzIPsHt5
         CBv9A7nXBLN1zummoP1syeBEMtetCWqCTo+OfsU6t9t+UpKgXQgpo7svUiQB5IWzYgNn
         yilA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id m2si430144wmi.3.2020.01.16.02.34.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jan 2020 02:34:49 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 00GAYneC015289
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:49 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.23.78.127])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00GAYmQJ031623
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:49 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 09/18] linux-jailhouse: Add built-in uio_ivshmem driver
Date: Thu, 16 Jan 2020 11:34:38 +0100
Message-Id: <7db1d60ef3a20a092b808b69e7ea1cace00b20c0.1579170887.git.jan.kiszka@siemens.com>
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

This driver comes with jailhouse-enabling/5.4 and needs to be built in
so that it is also available for the non-root cells.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-kernel/linux/files/amd64_defconfig_4.19         | 3 ++-
 recipes-kernel/linux/files/arm64_defconfig_4.19         | 3 ++-
 recipes-kernel/linux/files/orangepi-zero_defconfig_4.19 | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/files/amd64_defconfig_4.19 b/recipes-kernel/linux/files/amd64_defconfig_4.19
index 4d5313b..d76215b 100644
--- a/recipes-kernel/linux/files/amd64_defconfig_4.19
+++ b/recipes-kernel/linux/files/amd64_defconfig_4.19
@@ -267,7 +267,8 @@ CONFIG_MMC_SDHCI_PCI=y
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
 CONFIG_SYNC_FILE=y
-CONFIG_UIO=m
+CONFIG_UIO=y
+CONFIG_UIO_IVSHMEM=y
 CONFIG_VIRT_DRIVERS=y
 CONFIG_JAILHOUSE_DBGCON=y
 CONFIG_VIRTIO_PCI=y
diff --git a/recipes-kernel/linux/files/arm64_defconfig_4.19 b/recipes-kernel/linux/files/arm64_defconfig_4.19
index a79e0e9..c4814c3 100644
--- a/recipes-kernel/linux/files/arm64_defconfig_4.19
+++ b/recipes-kernel/linux/files/arm64_defconfig_4.19
@@ -415,7 +415,8 @@ CONFIG_QCOM_HIDMA_MGMT=y
 CONFIG_QCOM_HIDMA=y
 CONFIG_RCAR_DMAC=y
 CONFIG_SYNC_FILE=y
-CONFIG_UIO=m
+CONFIG_UIO=y
+CONFIG_UIO_IVSHMEM=y
 CONFIG_VFIO=y
 CONFIG_VFIO_PCI=y
 CONFIG_VIRT_DRIVERS=y
diff --git a/recipes-kernel/linux/files/orangepi-zero_defconfig_4.19 b/recipes-kernel/linux/files/orangepi-zero_defconfig_4.19
index 7e925bc..79f8f79 100644
--- a/recipes-kernel/linux/files/orangepi-zero_defconfig_4.19
+++ b/recipes-kernel/linux/files/orangepi-zero_defconfig_4.19
@@ -200,7 +200,8 @@ CONFIG_RTC_CLASS=y
 # CONFIG_RTC_DRV_SUN6I is not set
 CONFIG_DMADEVICES=y
 CONFIG_DMA_SUN6I=y
-CONFIG_UIO=m
+CONFIG_UIO=y
+CONFIG_UIO_IVSHMEM=y
 CONFIG_VIRT_DRIVERS=y
 CONFIG_JAILHOUSE_DBGCON=y
 # CONFIG_SUN8I_A23_CCU is not set
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7db1d60ef3a20a092b808b69e7ea1cace00b20c0.1579170887.git.jan.kiszka%40siemens.com.
