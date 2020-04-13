Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBKUZ2D2AKGQEF5B5RIY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id A01021A6339
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Apr 2020 08:54:34 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id j22sf6308670wrb.4
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 Apr 2020 23:54:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1586760874; cv=pass;
        d=google.com; s=arc-20160816;
        b=YuT3EWUtckccBGtCIoIq2T/tQmx/1A/cxxuS5A0vmHaC6tPvvCvrDQ05Ts5Gt+2PkX
         NhfbIyR57+91skLkmvS61Xk6LkiHKlQsq553JCJ4zjx9gbP4zWN4k05qKtjo41Vl0inF
         Mn8aFiPw36a1znk9PCRSIQIoSL2cUorXu8MdO9H5gH1s/xhlT7CwlTyII3lY1FKpRX5L
         I13/DDttJoiKNsF0/ZvkWGAXp42jLn5vJVRxHcPDXhv4WasJrCgYiDAPe+1KtGs2WXC7
         oNGpfFwkTGNaunkwU5DHR+jdBFLMxiPzOYbmg/NfofASJDawg5rMTmY7RV3vsEP0kOrQ
         69ow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=1sKl130r7giM/X8rNOkss+7p7/EQ+Ab8NCzidClFo98=;
        b=Cu9ls/7V5K9tbQ1nsLP0+kZrFmpNUTQ47mHJqxUo07FaBpV9G+v48BXBaMUxJlmbGU
         PiZrD/PH/HkGNd0XV2Pk6BIZxSX0O5G20I3XggAuMs85sTsVVdvt7/7HM/3+dneT1H9S
         2tcbB7Tq1SLiarijrwizNTFINHn1TJJEaqCjXEQCmuBax/TmS+KvB0iZryIx32HWocTy
         U5//qmZRQz5ab3ogVmu1M78M2T+7BEbIikAlTn49P2JSIODIEHnyMPvIgD0TOUEbiWPW
         WLgD9L2n4V7lAcGkMNqz61cXRFc7V27BS7h625wvOPhrI0eqBH8O8IQxP3IbPqKPZJGd
         Uj2w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=AbAXPzKC;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=1sKl130r7giM/X8rNOkss+7p7/EQ+Ab8NCzidClFo98=;
        b=T7zkKMHAAhHYzX5mznN1lTUMrRvq5JtGE3NlrjgZ3ZlnvK8vPe+ZJCGOiKoHvjfV07
         aK8OSEYINjHfDeRplt/BQNqX861NomdcVikJPHFaaXjjXY+RcXqxM0kHLxRVdQrc+pvz
         0GsZhDZd8tv7Ts60Z+BvgRGfIELeJU+BGD2vA7zXFOEh6T4W4Or+jCIwNl0kd/f9k1FN
         9aaXh29l1nQ9P+gkZKhW7DhIR6BjBSTfWBc+TWoB8wrtlS3QhJKMdapIjddvMj4I+tAJ
         cvx4BokVdQ9PDcdHr2ThGL1Jp4vtQJOXh48uVevHwUSmz8ze2MsLJ6/vLxdEmGi7uXa9
         XAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=1sKl130r7giM/X8rNOkss+7p7/EQ+Ab8NCzidClFo98=;
        b=IhGUnnGYJRwOy0ech+cra1Nv7RIy5IDAz490qHDhY+JCAiGzqb1yKuc0WlHby5CHRJ
         2qcAXUXXj9C5JXYWH4vCEdERo/kV8dPZMlF4SdoPhjCaSdiFM0ZAQTSjVpTfegcV2zFH
         BpxSAfHVIfFE7UOfqf67mcV8xBqUlm+5Vuf2/gyay0mFwP5XXSjjckWFwDltyCoSwmc2
         wI2mqFcI0FHizTEtMVVp9Qvvpwh6/woDXYcmGBZdbsh0qGBXZaoyXGJDqmo18O24nhk3
         VLogd1hvrmQReudtXdPHV7U8ZX8waDCuHjtI1gKqA7Lg28lCC1CwkQeRBbU2nz+5sHP5
         tK2g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PubrYRPJ6RomHr0c5kdq9pER9BFp70I2ECMGNE85OjfnYk5LskwA
	yl8DluvaeAzQyMcU5G74+co=
X-Google-Smtp-Source: APiQypLllBOR7cZO/6+FBvsq2dGTevKQVEAcsaph3kQxtP9cvHPiu3U4FRtji5YMLTyRcgwlRnQaHw==
X-Received: by 2002:a5d:54d0:: with SMTP id x16mr3519850wrv.86.1586760874380;
        Sun, 12 Apr 2020 23:54:34 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f2cf:: with SMTP id d15ls16518690wrp.8.gmail; Sun, 12
 Apr 2020 23:54:33 -0700 (PDT)
X-Received: by 2002:adf:c506:: with SMTP id q6mr17786938wrf.142.1586760873703;
        Sun, 12 Apr 2020 23:54:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586760873; cv=none;
        d=google.com; s=arc-20160816;
        b=Qs39OC80mJwzQRIL8QNekPDeCP+YglDxUTsN1M+2nYYyfKuQH26GnAGvn0FdywLmfo
         XlZD3l5Tw176E6eBG7AcH+8DuazIzoFlofPGeWFB80UDtqkB6T0X4UnyKa8RRx8ULynu
         3pLHRVlNq73IW2pkCXRlImvktUB/JXzUr0wxF4BioRPEpEGF/ucZihLqZkY8KDgFEXRo
         IZU2htLD8CnK478/u1k/Djnx/M+/Tu2PI+aPbrjLhoAGhllUTdVzJqAGtQUvsdaejmgM
         XUZ4Nee5AjD8mee9tUxkWT0BoC1mI5eSw67AKgTloCNAeb29YqmMekfZWsT5K5PEkfyD
         IOPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=Vy0VJd9PaSJUtWQDPLoudwbAWoEYgHjINYvdLYunM/Q=;
        b=TO9ntx44VJtjRuHg0Ma9FrEpF05kAiZDaY0OObWS+/VnRtVACMNmRRyMX2TiffHZsU
         ifHGAM7QVbMiDt5Ut9mh3yB5VsF3+iFOlAkqJ7j+mSy6C27igA9mT2mgteZjvQID9hkU
         Flxp8mofn1C8BzUgF7iUMqnpqXNS+MgSUIXYzswIQYcRYyWGwkUCKUETdYREFCEXOy7J
         x3qIQvqXOE+QpmFLYVHafTmapOk9UDx6vbErJ1xfxDBhdpPcqlysvMuPCyOwUScihsfX
         jPzdt2qM0vGBhyJlpPOwQrCb4WHKFakQm22Dn+5N79mtPZZvR9bp5Kpdhwc/C8F2QAiE
         taEw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=AbAXPzKC;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id g78si553546wmg.0.2020.04.12.23.54.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Apr 2020 23:54:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([109.41.193.243]) by smtp.web.de
 (mrweb103 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0M0hfO-1j88Fr13BW-00uorU for <jailhouse-dev@googlegroups.com>; Mon, 13 Apr
 2020 08:54:33 +0200
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 01/13] linux-jailhouse-rpi: Prepare for new bootloader firmware
Date: Mon, 13 Apr 2020 08:53:43 +0200
Message-Id: <a4bd1bf241f142b6cc0e3d8ec92b3b3aa885d755.1586760835.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1586760835.git.jan.kiszka@web.de>
References: <cover.1586760835.git.jan.kiszka@web.de>
In-Reply-To: <cover.1586760835.git.jan.kiszka@web.de>
References: <cover.1586760835.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:MS6hhtMMmNLC7XxAfxsDKQb9BwU8DhC7ERf3lUoGFnCm/H58R2K
 m2yK5pMtiv0NkecgenDsgBffi/PoSEwVUYRuVKflGiav1fOVrcEXZw2sAlBf/4nvK7AupgW
 qC+gIMQuQvVWHJDUdDbl0YLMbhpGay5WBgXX/ljiXGqbwKsAhpXxqqUF442oQx4ECG5suyt
 WOUsxWttPSECyHY8tiZng==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:z5m1A7VbOAM=:8cgO7mR3hjuwDFZfsyyQPz
 DSd1/Z75AZ/mnzTaQlxyAbblUIyGWyoTWg04nnYZf1M9kmNy8wjMO47OI8YRa2BFbHp5Xyx7f
 gIflqSceOz5Jdd/uTEwZSy0LrgxMya6YOdrBuIGp58AU6KFluMsf4jBz8mnrR+ZekHiPaAPbE
 BYtdSbf3gAsbmdU2TIkFjpKDbfApGiZ8BanOC6prqYYDZaRaZyl3o3tdj9cbs32mzBv4/sd+C
 Szpkwr1FQUqMjisX1E7WkAKoIIs/Xzfq58H4BYRUIVz5rAWzcEmvWvIEC+LnP7T8ATfBrXNXF
 wvxh3FEgTBEekTgeiQ8fDQnp08eel1bUB75AC8vCzJ1opbNzhm/TabUHo4fcxh1NVqOi9TSjd
 H3lmWqriJk1jzUq2cFKTeK76k/rU97ONWLifda9YJmBurabe2iBB+FZ2j601eQkfRJZKgypUx
 LrvXDJ8wlO3AlGv6qBOAoKlCOevdqegGOqFETd14B7wMpOGBFEuheVI7DwDcYi3f3SCAZAkAg
 GnTGGNd4huejf4osVTZK1l/RDJrj6vdJJkNnlW+d7SnuVFHHitdyJzQAI2R586GCBmvCBuKDg
 ZV/FgE9cvcPS/82/eZYsEMp+gQ3XgdtS2XPRMW7L8tFt9AAqPKyBOhc26x0OnOYR5X1ySlJbM
 2f0DMIKWCpR4ZiHyag/4la3ilZeFhnza2B/LbqayiOi7x3OEVMhMtm9xFRoZBjQLrtA+N2yCW
 DjJqVNhysg2KuuhPFanf1Nq5uEEKl+5ol0z/wxo5TsQDkr2Jzgy96+wNvszEDUEWe2CRajpum
 gRpH10JyKfx952vvTald8EJvSbTY8rR6Oeqpn6ssVySmMCT2laathC/1koJBUdZUioy/sbZuW
 +MYgyMJTRCvXnCJ7Q4yI7DmenTYzc/XqdTp3FF9jmORwP1YCcskqKRuaP6OE62R8H2QbVB4CI
 N91OtTDjX0COuaTb3ExK70eUboUc+NlRyFeKym/P8S9T5GXyTiOV5ovf/MbK+wGarbsrgG8cz
 izgoJc1juu0FMZ9KSGFjecJzTQXBxSqITm3O6r/jNF0kY/MQS318IMsfO76Q9aiWXsp1G5ZOa
 U7MQpsE+7QhDcL2G5MdhIePff77iEvX1Jq34RV2uO4Q1jiytGwnP5KcSgKN6Cn4PpO2bpyEle
 kFVVVL4Ef3iry8VKz5bos3QeMP8avJ+XxEXG5h93J0KQVaa7Vqc1APj1KcA9vWbWixb3QLp2D
 hEPjqrhTok8FpgZ1i
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=AbAXPzKC;       spf=pass
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

We will need this regulator driver built into the kernel in order to get
the SD card interface up once the newer bootloader firmware is used.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-kernel/linux/files/rpi4_defconfig_5.4 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/files/rpi4_defconfig_5.4 b/recipes-kernel/linux/files/rpi4_defconfig_5.4
index a3c488d..1b06ab1 100644
--- a/recipes-kernel/linux/files/rpi4_defconfig_5.4
+++ b/recipes-kernel/linux/files/rpi4_defconfig_5.4
@@ -725,7 +725,7 @@ CONFIG_MFD_ARIZONA_I2C=m
 CONFIG_MFD_ARIZONA_SPI=m
 CONFIG_MFD_WM5102=y
 CONFIG_REGULATOR=y
-CONFIG_REGULATOR_FIXED_VOLTAGE=m
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_ARIZONA_LDO1=m
 CONFIG_REGULATOR_ARIZONA_MICSUPP=m
 CONFIG_REGULATOR_GPIO=y
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a4bd1bf241f142b6cc0e3d8ec92b3b3aa885d755.1586760835.git.jan.kiszka%40web.de.
