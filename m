Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBK4Z2D2AKGQEN2IG7GA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D3F1A633D
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Apr 2020 08:54:35 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id y71sf2351767lff.4
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 Apr 2020 23:54:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1586760875; cv=pass;
        d=google.com; s=arc-20160816;
        b=WjESll4BhgE6kvWOHcroaajbB6NwE62wBvfdNNG7qLr5VvwvBPMw9Q8PhfDIdnBmNI
         B8znAZ91W8k3bCFOlVYoRgtAcHzdhftwbxYeu6seYkn/t86x5eEAwPvaJAZja8Omlz/E
         MX01RqQh3ER8nEuRQ4OXR7YsrLD3FzkG8j9wvTckOVOEc7i9EYIyXrInYFl1RCzO5ucl
         cNCQhbeQmzrRNzG/G1k6P5I/z9UKqkYMSjVPa9+nYkgzJ5/4R1bHIXJGHzxTjFQ8ivzq
         Rlh087R0hcnE62So1nP3xOu4OvjV8HO9smIE1g5/DY0SpgplpXbhGv5Hk14vvvIxiF35
         N/iQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=DXUZw7Wol4ZFZLNzjyHPZCzlnKItwJjIeaAq3CO8bHU=;
        b=R11b669ilZthUg4XyJtxAFRE2nxdwkxZCiGsgONduuyf7lMIy5jDPDwVWZI9jNkY+5
         cAw1aF/aZdcPsptvKJwADVGKyYZhGW0FOJRZearxGSuunekCUyhv9UZWtiUnoJjzBxD7
         qsXurWFIlF4GmY3m8yiKw2oc3f49z/ispkFRGjAwYTFHktoBVH0a7i/3YhYcaeFr4Yeb
         DNUVjnxAHZT57jta7Ds5tFV60sVUREmuXnwU0mk95ahDOBOG6kL9WJSh02WswMXz1Gcf
         75XwtYeA2Bbm3L+mfVjHGybm51RtQTMmHmL3pJMt6+dtkvs9MZYdR33spTOm5LIFMeWE
         Eu4w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=MYcf3oHG;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=DXUZw7Wol4ZFZLNzjyHPZCzlnKItwJjIeaAq3CO8bHU=;
        b=efaAivKTdV7u+r09LXAZT7bGszBfazQO++qNxJOn0kAyKQs9LkRZG5M90RheS/PqSn
         YuZgrUnuAyp/OeVgCaZmviRNMTWf5/JB7a74052cqt0kBxwtnnj4T2/XmqSeOkZrzxYn
         FdmOtoyFNMlMCubkG0bLYjhMRnBrRcyCDgarXS960KgWQyG76EByE0swmIvViqoj+Mrc
         3omhISzFCkiCG0Y2h4XNtC0cp/WtaftuS6eAOHD0935+iBlyU3z14MSKAj/BkNrH1/0V
         GYcj0Is5FlZwl6ZX/ZVY5zVJ4avHZ9NeDuExNQXpYhfRxVEHT8Q7Aj1qrzbtiKu/Fszy
         tyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=DXUZw7Wol4ZFZLNzjyHPZCzlnKItwJjIeaAq3CO8bHU=;
        b=ojT1BJYnYb2u9/ufBgxUxKpqvTVDtRevYhgfSWsVca+vyCQjlwQ32ELZsuJKAtiK9k
         dB0zI9p52EoViUejKFMZsZj2ZHsKOYkaMJkYcLoTNJl8EsUaQh6AR90mC/8qu0Go+oqV
         rstDJgVpPehmpHS+em9W2oLEwT27TB5R8JYTSi4xd4XbeHU4YqFZ+0qGjf32SPKvgM7r
         gvsHmyg7+fgZ087FqHYtPq6iSxTAqusWSXCJM7unOaRPSyFzL/8sv21j/b3r9QlQ2iTK
         GOdNJdKbqB8hjHVKE93G9PNJn2pRlrKcIhFJyr87Uoru3DVROz0GmAV3Qkz0NG7JCCQF
         R1og==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuZ3WEjE8zqFA7X0g0pi5f509hOV1B7FIu3jQXJA11GaL/kLHCj5
	gaanOWajIdUqGF+3scevbVg=
X-Google-Smtp-Source: APiQypLPeuIfHWmIncpc3ZXrodB4z/Avd4Oio5n1PjvRhItjRCsB082R+isbfdUc5ChJBjWe/+hatA==
X-Received: by 2002:ac2:5e26:: with SMTP id o6mr9196655lfg.49.1586760875352;
        Sun, 12 Apr 2020 23:54:35 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:74f:: with SMTP id 76ls2608991lfh.0.gmail; Sun, 12 Apr
 2020 23:54:34 -0700 (PDT)
X-Received: by 2002:a05:6512:3081:: with SMTP id z1mr9628214lfd.102.1586760874760;
        Sun, 12 Apr 2020 23:54:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586760874; cv=none;
        d=google.com; s=arc-20160816;
        b=xVXuw1g7c71CAQpMwN35vUYMjoZF0k8whANZHGMI43OyEvZYnr7kfdxLdZr8piUMQG
         DzEJErMYXscwEDTozUOkkPby9PwGEdBj2iRT6wXzQYonM6wpnzA2h4OJqu/J6I3pO8eT
         +I5N4ZNQCtymk6XKA5zLM6JnnsZpb/iV3OFdJ4hJS14mZLY6PRVmiIepi+5VIb5u26Az
         NScaWTDX+HK1j1b52guj3fUzo4UeM7U6TWyYBjnQw0XUZ2M9HOqJlLIEYb6S8fVQpbRH
         SWPi9g+r3OvZB9eJqNUow/xITwnqyES3WLftiaUqmpfQ8AFZngZW75cRLd54wRDx8QYC
         G6Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=S+wBnncUrqsbolA22vNTm3d7c+c8R5jCZYFxQaDuhaQ=;
        b=H3oczXtXXxRA7pPpqz2ZcVZPx6DFv3nGEz1kjq5znzl8HlgFzmraFYB3psNiEVKQ2s
         5R6RwvbzB8jNFkGfecwu6+5zUWGNPQKYMNj3aeZEempg26E4x5CYyrHSfq52oh64OW5P
         28ksbLqyzbheDIY/QhQUGZbQrY73pCXu67vO4QrQvTmmJyDHt4G2ebc9OLLQ5VO7yfOA
         ssOZQvKm036xWulYn7kRMicDUZsnyw6OsVIojNmYCZ3F3vdT/PBaw5vB2aPD4jEEjwqj
         Xcd8gADSaSmo5hX481YfV7Qita3fH41udzemQ6DE2XKv7rfoAXS2Omcyc5rrzAAdzXQ4
         g8nA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=MYcf3oHG;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id e4si374415ljn.1.2020.04.12.23.54.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Apr 2020 23:54:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([109.41.193.243]) by smtp.web.de
 (mrweb103 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0LfiuU-1iw1HX3r8E-00pNJg for <jailhouse-dev@googlegroups.com>; Mon, 13 Apr
 2020 08:54:34 +0200
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 04/13] linux-jailhouse: Update to 5.4.31, 5.4.28-rt19, 5.4.29-rpi
Date: Mon, 13 Apr 2020 08:53:46 +0200
Message-Id: <bba024804682552ca1d8970971d8b99859a330b3.1586760835.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1586760835.git.jan.kiszka@web.de>
References: <cover.1586760835.git.jan.kiszka@web.de>
In-Reply-To: <cover.1586760835.git.jan.kiszka@web.de>
References: <cover.1586760835.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:05SFdka/XgpVKVEoQNG4bCIIwgeuDEdFt8n4ZpeSEI/SMI7Qqqn
 ssQFmZy/PW/DC9lYr4c83CbSO6PfhFDgkAErJuGPTu8IFCA2h8Ni1voq4HXiTMrMByI02gv
 lKkjB9OP9Tr1AyDgnP85AYNWCEDGzXPJXV/SDskJHBQaYblHUnz7AlRSiptTZjMteCn8kh8
 m25wULbmlgW2V2GmZCKEA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PzFBgbPTRA4=:W+pk+tu7pMCGXOop/Cww5T
 arSwSeMrupFRSY8AxdOPhw90vwLELiCK/5dTKVgPUBioM/1Xe3Wa4VYycxTjU7CI46bvIGfL9
 ErVFHbGMPTLgii4adBR3tcR4xN7cdFglab9mGskpQ/WAmllhqesQVz5s1azdXyuPRR7XGfqAL
 KzqB9kaZ0pqt9FYpFZUmfwnfMJ1aQhovjqlsl5Nhq9OcOO2XCn6GkkL7R4NGQrsqox0LUFVoR
 gJFmK+F5mkVKkoc9bs3jXtff3KqKANLhCQeOHluK0esMVpd4akThV2De/GZGZzfP0+/70SBPE
 IPkPfV9/qtqt1aNCy6EVamprT8mwcEShyTY67xvNYodcPdxrdcyIr11sEua7PzDcvSXWQPA2q
 4qeZtyQM+skMURctwM6oTIAgjSOK9pLfY7f0SblOZUPr7f+6fVgaapFwLUo1zRLsl2qterKjg
 4twAAgdhEz6joQcD/iA1zCFJSebwrQ9320V8a3F0UJA+3nqwKfag5yy5hjwTzQ39F+GpxB9Gs
 abtcVQfKOYwUfFp3VpG1TL1eZzmqG/Wf7/Xck2PeVDQG8OS6lhZIGbtYXtqMgPebyQUXd4uKc
 4PThLIKD0CRQUtke+F3fmPbChZkaWfkTg3EcCdeuFpv+Q00k5S3IWox2WFzx6I1B+Rr2Q1jKK
 hS+ob7h4s8fB8Rng7aBaMfgLl/S9f739HCuabKo4w/4KjMI1tR2mJafyK3hitRlrXibozOjka
 rHkpMStsTe1YvJjneYe0w1MIF68a4PYSaQDzX5l0uCGfTC9PZL2UudtIoMrDfle5c9os8pqk3
 WmYpSlGjp8Z1ZqWptpaZWu2yHXdUxm+WDRK2vu6FjqPXhS+laqxCKJ1BGi6Y2nE4VWR2iAqNj
 JdHIm0txgomdcAyRDuvHeO8AFeLuduNFd0XQLcPEblDlsl/hikzRWZiAySXQksFYbeDqiyiHO
 2AlGZ460o4HLCjcLyhauV7e68yvq0sft93QohWPSGLuH62oOzDEMv8OTokTQC6tlIldhvWgQR
 kOgDgvUjbSMiOFglRHr0hmhUiMbP2wpPb+oLHMAsZNnsUVPjGBS9CTEnshF9aYxRPNrCa8xdV
 GCM2KzUF37p40yJtPHDH9vvWBiTvK1JsDsV3wsE5wac5N+LNhmoJGjS4HSVcD6lFASogGVLJT
 MegetyyLmNNlH5I4rMRRR9ffqX/4NpuWwaQ4uWN+XFK7MBH3GYVm1FrtX8XY0LFOabieTqVZo
 5kpYV+WzNUcATQ3z4
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=MYcf3oHG;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

This also pulls in the ivshmem-net fixes.

The RPi defconfig is aligned to the updates of the RPi kernel.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-kernel/linux/files/rpi4_defconfig_5.4                    | 9 ++++++---
 ...nux-jailhouse-rpi_5.4.16.bb => linux-jailhouse-rpi_5.4.29.bb} | 4 ++--
 ...lhouse-rt_5.4.17-rt9.bb => linux-jailhouse-rt_5.4.28-rt19.bb} | 4 ++--
 .../{linux-jailhouse_5.4.17.bb => linux-jailhouse_5.4.31.bb}     | 4 ++--
 4 files changed, 12 insertions(+), 9 deletions(-)
 rename recipes-kernel/linux/{linux-jailhouse-rpi_5.4.16.bb => linux-jailhouse-rpi_5.4.29.bb} (62%)
 rename recipes-kernel/linux/{linux-jailhouse-rt_5.4.17-rt9.bb => linux-jailhouse-rt_5.4.28-rt19.bb} (65%)
 rename recipes-kernel/linux/{linux-jailhouse_5.4.17.bb => linux-jailhouse_5.4.31.bb} (62%)

diff --git a/recipes-kernel/linux/files/rpi4_defconfig_5.4 b/recipes-kernel/linux/files/rpi4_defconfig_5.4
index 1b06ab1..2da7c35 100644
--- a/recipes-kernel/linux/files/rpi4_defconfig_5.4
+++ b/recipes-kernel/linux/files/rpi4_defconfig_5.4
@@ -731,6 +731,7 @@ CONFIG_REGULATOR_ARIZONA_MICSUPP=m
 CONFIG_REGULATOR_GPIO=y
 CONFIG_RC_CORE=y
 CONFIG_LIRC=y
+CONFIG_BPF_LIRC_MODE2=y
 CONFIG_RC_DECODERS=y
 CONFIG_IR_NEC_DECODER=m
 CONFIG_IR_RC5_DECODER=m
@@ -955,6 +956,7 @@ CONFIG_SND_BCM2835_SOC_I2S=m
 CONFIG_SND_BCM2708_SOC_GOOGLEVOICEHAT_SOUNDCARD=m
 CONFIG_SND_BCM2708_SOC_HIFIBERRY_DAC=m
 CONFIG_SND_BCM2708_SOC_HIFIBERRY_DACPLUS=m
+CONFIG_SND_BCM2708_SOC_HIFIBERRY_DACPLUSHD=m
 CONFIG_SND_BCM2708_SOC_HIFIBERRY_DACPLUSADC=m
 CONFIG_SND_BCM2708_SOC_HIFIBERRY_DACPLUSADCPRO=m
 CONFIG_SND_BCM2708_SOC_HIFIBERRY_DACPLUSDSP=m
@@ -1042,6 +1044,7 @@ CONFIG_HID_SAMSUNG=m
 CONFIG_HID_SONY=m
 CONFIG_SONY_FF=y
 CONFIG_HID_SPEEDLINK=m
+CONFIG_HID_STEAM=m
 CONFIG_HID_SUNPLUS=m
 CONFIG_HID_GREENASIA=m
 CONFIG_HID_SMARTJOYPLUS=m
@@ -1257,6 +1260,7 @@ CONFIG_DMA_BCM2708=y
 CONFIG_AUXDISPLAY=y
 CONFIG_HD44780=m
 CONFIG_UIO=y
+CONFIG_UIO_PDRV_GENIRQ=m
 CONFIG_UIO_IVSHMEM=y
 CONFIG_VIRT_DRIVERS=y
 CONFIG_JAILHOUSE_DBGCON=y
@@ -1314,6 +1318,7 @@ CONFIG_IIO_BUFFER_CB=m
 CONFIG_MCP320X=m
 CONFIG_MCP3422=m
 CONFIG_TI_ADS1015=m
+CONFIG_BME680=m
 CONFIG_DHT11=m
 CONFIG_HDC100X=m
 CONFIG_HTU21=m
@@ -1384,6 +1389,7 @@ CONFIG_NFS_V3_ACL=y
 CONFIG_NFS_V4=y
 CONFIG_NFS_SWAP=y
 CONFIG_NFS_V4_1=y
+CONFIG_NFS_V4_2=y
 CONFIG_ROOT_NFS=y
 CONFIG_NFS_FSCACHE=y
 CONFIG_NFSD=m
@@ -1438,9 +1444,6 @@ CONFIG_NLS_KOI8_R=m
 CONFIG_NLS_KOI8_U=m
 CONFIG_DLM=m
 CONFIG_CRYPTO_USER=m
-CONFIG_CRYPTO_CBC=y
-CONFIG_CRYPTO_CTS=m
-CONFIG_CRYPTO_XTS=m
 CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_TGR192=m
 CONFIG_CRYPTO_WP512=m
diff --git a/recipes-kernel/linux/linux-jailhouse-rpi_5.4.16.bb b/recipes-kernel/linux/linux-jailhouse-rpi_5.4.29.bb
similarity index 62%
rename from recipes-kernel/linux/linux-jailhouse-rpi_5.4.16.bb
rename to recipes-kernel/linux/linux-jailhouse-rpi_5.4.29.bb
index 44f0201..ed157f5 100644
--- a/recipes-kernel/linux/linux-jailhouse-rpi_5.4.16.bb
+++ b/recipes-kernel/linux/linux-jailhouse-rpi_5.4.29.bb
@@ -11,5 +11,5 @@

 require recipes-kernel/linux/linux-jailhouse_5.4.inc

-SRC_URI[sha256sum] = "53de4d966d6072302fdc87ddce3ec94a22132638bcb8bf2c0944e0159d8db611"
-SRCREV = "e569bd2d6d2d7b958973bb8c6e9db9cfc05c790b"
+SRC_URI[sha256sum] = "458ee382435a4b546a1caa2d0bd7b732278f352aabc427e296102529bc668233"
+SRCREV = "a584b7ff4b4b151703547ac384c2f12a6cdbc83d"
diff --git a/recipes-kernel/linux/linux-jailhouse-rt_5.4.17-rt9.bb b/recipes-kernel/linux/linux-jailhouse-rt_5.4.28-rt19.bb
similarity index 65%
rename from recipes-kernel/linux/linux-jailhouse-rt_5.4.17-rt9.bb
rename to recipes-kernel/linux/linux-jailhouse-rt_5.4.28-rt19.bb
index 13ad237..e6bfa7e 100644
--- a/recipes-kernel/linux/linux-jailhouse-rt_5.4.17-rt9.bb
+++ b/recipes-kernel/linux/linux-jailhouse-rt_5.4.28-rt19.bb
@@ -13,5 +13,5 @@ require recipes-kernel/linux/linux-jailhouse_5.4.inc

 SRC_URI += "file://preempt-rt.cfg"

-SRC_URI[sha256sum] = "49ee37658114f123390e5c2b00bf177aa110e77ebfd62325a3267e29f34ec873"
-SRCREV = "83e85c7a8e18f1d72e5c78952a853b656def48b6"
+SRC_URI[sha256sum] = "807290fdb1f17aa20201b9814d78e9256645765654bc2befb8100110a4af5f47"
+SRCREV = "e24c5d5d42ceea850df147cbe71d77600941524a"
diff --git a/recipes-kernel/linux/linux-jailhouse_5.4.17.bb b/recipes-kernel/linux/linux-jailhouse_5.4.31.bb
similarity index 62%
rename from recipes-kernel/linux/linux-jailhouse_5.4.17.bb
rename to recipes-kernel/linux/linux-jailhouse_5.4.31.bb
index e0d685c..44acedb 100644
--- a/recipes-kernel/linux/linux-jailhouse_5.4.17.bb
+++ b/recipes-kernel/linux/linux-jailhouse_5.4.31.bb
@@ -11,5 +11,5 @@

 require recipes-kernel/linux/linux-jailhouse_5.4.inc

-SRC_URI[sha256sum] = "55cbeb4ba845f191006c4cd1611c13fbbc7b7248efeee374165d76306204d648"
-SRCREV = "6d9ce684e169f54e4cdf19f4e785600cac603fd8"
+SRC_URI[sha256sum] = "d84c78d0931d2e5c784d30d73aa63cd6b1a849f5d957d87e1a660aa1f5a4c070"
+SRCREV = "45e6cf9c5dfd149cccadaf960907bd99408a2e70"
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bba024804682552ca1d8970971d8b99859a330b3.1586760835.git.jan.kiszka%40web.de.
