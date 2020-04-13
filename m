Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBK4Z2D2AKGQEN2IG7GA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBDF1A633E
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Apr 2020 08:54:35 +0200 (CEST)
Received: by mail-wm1-x338.google.com with SMTP id f128sf746274wmf.8
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 Apr 2020 23:54:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1586760875; cv=pass;
        d=google.com; s=arc-20160816;
        b=TZwlpJYIoCw6Upt3rqjxN98q3cVGvyWeDyh0oj5axsMb/UhKiG2hDSZ40QWXFWyUfS
         QyRlDRyYye8U9v6hXTRcDlK9KcS70viavYNTkiGf3zgaJ5KJ4Fs2YcEWb6w2zntMbUM2
         parwzME84u6JnyBgI2oQhroFT4d0kakwASw8kD41y0xstdUPvBqhfULmrvFTg9jvX557
         27FcULHLiFXDXs7C9GHDmCJDdzUWCYyqE8Ktun3r2GmAesPTpP5W3iQ3uHkvJdt03cpZ
         PxYpqR7NVrkOBBO1vl6IRc7UwW3VKZEqiM18TUzojPtVjwFcknEsJhBXMF8paj47Qv09
         bZpg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=usfhgHfxkj1heGpOGkrXC3mXzIvRFosD3haX4hjRbko=;
        b=CxgJa7dC8Q3wWCmokCeCSI18isdRNB347MCbUmxCBbZF/+N16jaiXpA9KF8rpmS9mC
         PXar/KLfQDO2+IqyLwz13eTJ++EhiTItfglSTSXbPc6mH6B8lv0D1FVLK+QyIrsp9wgG
         ziWW5tAOb+fruLwj8il5BA4gHY9EbMQim8EMi9QP4nwF66E8uuXYs5/pbV7venoNgBVD
         AaU9PyApHeOS+CE7FXLVZ9yyOV2EtXkYuTmq+E1+wPal7QFOfZsK06F4CNdHI30rjJko
         H4Nk8BDGFPtefk1vtyhSKZtbubBUuYI64SbhW8CldnFK7M1U2abg6Me3Nt00MZQRyspE
         003Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=D8fBhBS7;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=usfhgHfxkj1heGpOGkrXC3mXzIvRFosD3haX4hjRbko=;
        b=guB5KB5UcD/DUA5MvRot6iBGplwnVE2NLv9hncBbuZtpguYPreQQcpdTElaZ0jdBOv
         /Tw0mvs84fj2mS7VqivqPetNPBhWVWeI/J2iEhrUq8T/ty9SIQoevduvAS317MU7I2P/
         zdfYuqHgWhReom8t76eylY0Fo2L8kt37pfmiardz+vS31gcfeIm8Cf/NHAsrkiU4D5B1
         xvsgOu5ABN1C8b6PUZSMs2Qa7l+9xFYyH9wwfc/+3arCK7I0nJHFetKQ9S8W/kXsiC5y
         TMOz/ZH5S/Yk83DzqrMzQkizRf2EPhUmoPVRyEgh9iwUk0RO+pqK9MeTTlrCvEw2LSS/
         pSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=usfhgHfxkj1heGpOGkrXC3mXzIvRFosD3haX4hjRbko=;
        b=S4plHQB/ykT/NkeXmB9fCOfrNU+IR6JfZ0vf7DXJ2PQrpMSo662dS3QSabyIdOYD5j
         QSbEbEoxdstXuRjiWkpv4+m/V0/m0O/LqE/ptj82yDleTNJvhiLee320LUN2RyV8Gjl6
         wSGsBIDIhFEh9kT03Ugo4c1ryWfsYv+To4MEM298zQGpvkbNQyoNBNC8mJRRODaJfabf
         gLo1DEUbLpj7PZnhtKBYaGUFks43VfyHIRoTfceScAl0GZMGSyJQ+Jt01CCbcYoodPqJ
         6N4Jg8XOyQ+IqpF5mf53ZbesR1fd96bXbWdiDa4lXFyv9Hm43/HM6h9Wnlcf6p2zVtxd
         wA5A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuaN5Pn/V1vNQdQiwhtyV5TvDQ0sQxPo0ZWkKTgmI9NjvnMOcXYE
	+Vk/uPI6MUd+ePx4aALEkes=
X-Google-Smtp-Source: APiQypLWAtVRl16Av+Z28faDs//fLcqhnAxgHIdc6pAYlTUGqZqypSIc7fZPN7fUA46ExHXCYWd7tQ==
X-Received: by 2002:a1c:ed18:: with SMTP id l24mr17034622wmh.122.1586760875580;
        Sun, 12 Apr 2020 23:54:35 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4690:: with SMTP id u16ls16804928wrq.11.gmail; Sun, 12
 Apr 2020 23:54:35 -0700 (PDT)
X-Received: by 2002:adf:ea05:: with SMTP id q5mr18595985wrm.180.1586760875036;
        Sun, 12 Apr 2020 23:54:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586760875; cv=none;
        d=google.com; s=arc-20160816;
        b=gt4UqLhBL0rywVdtywsGEoiMrBdSTSBjKQa2Ce5Q8UukvoPBCJq+RNZKXbkHIuIAm3
         uq1rYiuSc6jftwwU0bixPd4RJpUO4eVqgREKjK7ntoXg8buTDWUX0QYoKbl3P6o6awin
         Bxd/1Z/B2iPtHjcgMIXU+Jgq0c2gUD5Fp4T+YCp0c8Y3/1MafnrZDdaNqfP79kt75ItX
         cv8kRFe2n4TZofvD3a2Ogu/93e5An8cn+3/awkbmsLyHLL2H1CyQO+WyhTaXld5YvuAR
         sF2LObAoKW6ibb2foG2PPZlA2MaUA2Hi1tCyRE03qmubLpLQ+6qknF3bmLqgS3rT2CcP
         Oj2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=fPmCL4/dF12EP2SgjUClnDOsk+/ZRoZTlKVigdtgPLg=;
        b=m9C1H1pyPWFRNh+AReB+2vBUcgjJsBjxSjl17WjyxkY8R5blfEo3DnBbTpTj/y4PB+
         YqZb1f6Xe1LOGJYN7opcpozAO2HAM8NIzJ2vqdx4pZrzQvBWRdvsjekE/PYCCm02klAV
         s41n33qpnDSGDQddfZmoWKpA7mqCcYoyAPdsYmDAldNye6NaFDJ5gx6fdxPuGaJp7+ca
         6DtEaVMHxib1tNL5d0sfn4TJW546jifgBCOopUEhfjMd9LNqEaWyds5s7MQL/VxnSVMb
         pez9gKfQgbrnnBDNond5hNtGEaYLtjhlTNRVDFgknJGJy0b7nMYBc2OXyMjIrzLMvx4Z
         lONw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=D8fBhBS7;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id g78si553549wmg.0.2020.04.12.23.54.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Apr 2020 23:54:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([109.41.193.243]) by smtp.web.de
 (mrweb103 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0MI63m-1jPWc82MeM-003x9w for <jailhouse-dev@googlegroups.com>; Mon, 13 Apr
 2020 08:54:34 +0200
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 07/13] linux-jailhouse: Enable USB WIFI adapters in amd64 kernel
Date: Mon, 13 Apr 2020 08:53:49 +0200
Message-Id: <fb06f0343d8ad1cadead4e1a39fca3131ec52457.1586760835.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1586760835.git.jan.kiszka@web.de>
References: <cover.1586760835.git.jan.kiszka@web.de>
In-Reply-To: <cover.1586760835.git.jan.kiszka@web.de>
References: <cover.1586760835.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:9BorwpVq+SjvkSYqwx+nciefH5vdGEgwlJYY7LG2tC8ZKs7l2y7
 NvYl5W6hHpDPyu0YbEwBVBUmxu1rizW7mQ+FjTuRCamP26KqVBfBTwetU3qZDDabhScVGcx
 5ejvyNVB0Z8e94PCxnmo3XIrbLoz098THZ8TA1PSH4W1UFMAxLQc82CxKU2apdvf9lCecqd
 Q8hE4tc93bsMdBF6l8XRg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QEO6zBj+NEA=:P5ji2DC171RmOHweiqqt09
 NPkFdSTDuB0a4aAYEpv4Yk4Mx6aaNKNgPDmZaeo0MLKll8X5MK33jlli2/8P2ilqoCCefWcQl
 smmctyT5wnComm5subvE4ToMkvwTwIcO1+GYM/A/Krwzpn0/WochxriFxQfETPgc1dYkU2+jB
 Dl20kRwInERznUn5cdZp+AAdg/n0hu2TZGeP0H/xtx3CkgtVfZI0DM6d/9zj362sXGzv2kNZx
 dKFuDrqIRrw7TjizOHlvWSF6wNn1SNxZH7y94xDcHPUlaBVbFs8U0SP/91RxPPd6UMFGp3PFa
 ir09BjKLQgj93hXjmFRTZiT5zCOLSfb28TMCQzHVRVU5/xuLk7VFHsobHJVwNqV4lJ8Gjzehr
 4fYX7mt1fewWhcMrgCRAiRO9xlAIu1E47iBCpSl21GUp2+QKGyNWY28OBwLZKhtCqid3kq72I
 aRRoEtASr6lTbSV2v1yqjizQ6asYKpU0T5UhQ17SAqX+YzhUIM00dNTGXE9EupvePI0VRtkdy
 u/mERNaTb/1vBTm5uL0k5Wd3agN7wEFuBstabn6YT2YgaHpn40KtfHw1QvrBDPKAnILzkrHpB
 iAnj+hCPt5ejiwjKcGFODngcwPzFVCHHXgoWgon+CX91LAoYaFBb3Q0A/cbvVYh1+weZ0VaGw
 wPNATAiC7Vhd8ixlT2syXFyMQ0Y2ELNorIP3nNJyRNQnPQcLSa85wrwKm6DGjlJkxrWSE44KK
 Ywf9YpsW77B8QpwtyakSw02m/HfFXYtg7S51QKKFOLfqgn5UocfO0MMDVwZOgrmiU6qRUmQCN
 9UQ3xYue8qXerTbL6TyCA477Mvl4JQzZ9p5PDiSZYmcrozSw8WyiQ0A43Q/q+mtjG3T5pUhkp
 eCD4tQhxB/X39r7dHSSJgvHLscGCMh8C57eMr6rUEkO7eWVSn+yP2k5jFKzBzOyR7h9OgKCP0
 k+B6qzxyo+uo08kkOoCSfc28+qjn5+TRcA6iTz8HUdmQ0Y8R33168kY0E42xSlzXj8RRodMi2
 0ycyvQ7iK78+IpLMaEB0nN6dCTvRTeh53nwedEoFOETtrLe/cMOxUOVngLzI2fvXT7/y1tM5G
 Mk3Pifed7UkmfXuuTvmIwbJTb2Ej9U65+IUwemxZkoQuCMvrh2K1kehJquVC9Gu6yrw6wShYY
 UPcAK+YKRVU7dL3NWkIk/y0l+2i+W3Ko8OteI5d6Y43zrhxI6E15gMlzg2qqXty9Z9/UmsOiH
 HrmATjWX54x83SQEV
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=D8fBhBS7;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
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

Will be useful for the upcoming SIMATIC IPC127E.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-kernel/linux/files/amd64_defconfig_5.4 | 38 ++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/files/amd64_defconfig_5.4 b/recipes-kernel/linux/files/amd64_defconfig_5.4
index 9c2a00d..977af5e 100644
--- a/recipes-kernel/linux/files/amd64_defconfig_5.4
+++ b/recipes-kernel/linux/files/amd64_defconfig_5.4
@@ -125,7 +125,6 @@ CONFIG_NET_CLS_ACT=y
 CONFIG_NET_ACT_POLICE=y
 CONFIG_HAMRADIO=y
 CONFIG_CFG80211=m
-CONFIG_CFG80211_WEXT=y
 CONFIG_MAC80211=m
 CONFIG_MAC80211_MESH=y
 CONFIG_NET_9P=y
@@ -174,10 +173,46 @@ CONFIG_USB_NET_GL620A=y
 CONFIG_USB_NET_PLUSB=y
 CONFIG_USB_NET_MCS7830=y
 CONFIG_USB_NET_RNDIS_HOST=y
+CONFIG_ATH9K_HTC=m
+CONFIG_CARL9170=m
+CONFIG_ATH6KL=m
+CONFIG_ATH6KL_USB=m
+CONFIG_AR5523=m
+CONFIG_ATH10K=m
+CONFIG_ATH10K_USB=m
+CONFIG_AT76C50X_USB=m
+CONFIG_BRCMFMAC=m
+# CONFIG_BRCMFMAC_SDIO is not set
+CONFIG_BRCMFMAC_USB=y
 CONFIG_IWLWIFI=m
 CONFIG_IWLDVM=m
 CONFIG_IWLMVM=m
 # CONFIG_IWLWIFI_DEVICE_TRACING is not set
+CONFIG_HERMES=m
+CONFIG_ORINOCO_USB=m
+CONFIG_P54_COMMON=m
+CONFIG_P54_USB=m
+CONFIG_LIBERTAS=m
+CONFIG_LIBERTAS_USB=m
+CONFIG_LIBERTAS_THINFIRM=m
+CONFIG_LIBERTAS_THINFIRM_USB=m
+CONFIG_MWIFIEX=m
+CONFIG_MWIFIEX_USB=m
+CONFIG_MT7601U=m
+CONFIG_RT2X00=m
+CONFIG_RT2500USB=m
+CONFIG_RT73USB=m
+CONFIG_RT2800USB=m
+CONFIG_RT2800USB_RT3573=y
+CONFIG_RT2800USB_RT53XX=y
+CONFIG_RT2800USB_RT55XX=y
+CONFIG_RT2800USB_UNKNOWN=y
+CONFIG_RTL8187=m
+CONFIG_RTL8192CU=m
+CONFIG_RTL8XXXU=m
+CONFIG_USB_ZD1201=m
+CONFIG_ZD1211RW=m
+CONFIG_USB_NET_RNDIS_WLAN=m
 CONFIG_IVSHMEM_NET=y
 CONFIG_INPUT_MOUSEDEV=y
 CONFIG_INPUT_MOUSEDEV_PSAUX=y
@@ -255,7 +290,6 @@ CONFIG_USB_STORAGE=y
 CONFIG_MMC=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PCI=y
-CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
 CONFIG_SYNC_FILE=y
 CONFIG_UIO=y
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/fb06f0343d8ad1cadead4e1a39fca3131ec52457.1586760835.git.jan.kiszka%40web.de.
