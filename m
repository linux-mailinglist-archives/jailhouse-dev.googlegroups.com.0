Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBN7ZRXVQKGQEVHE4LKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 94ABD9C973
	for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Aug 2019 08:31:19 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id y23sf48232lfl.17
        for <lists+jailhouse-dev@lfdr.de>; Sun, 25 Aug 2019 23:31:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566801079; cv=pass;
        d=google.com; s=arc-20160816;
        b=ufgp1KoDq7AZHPQEVGJ0wBz81ZcaDaw/I5j3QF2xWiL37rvcXTzzafcTFtpCVBaqum
         TzaUuIfAdwwdSNomwDP17AKtK2CWuDPv8xLwOdp+vICJ+AWWXbIYTro3tW87gJIycHno
         N1AKlMq401/bkY0eFnN4qQHVg49DO4TlOLr0iPIkAx56lOhGDcDh1FyUzcJMMlDeiO2o
         GDf51tJZawbmhWGrxprAyjdAFptA2NHDvq2XwT8J/BmLAO4jMUEWTCpiGVkJrlAkPa23
         RPIR7lvUXqI97jiGuD9rxDhyuc3b5oBKvBoxafCuCAl6svRvV/BBRQzQ1Ke770IerKnc
         e6NA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=gp5J5nW3suX2ie8J/8/I3xk82Qo3nVpj9176lqWay4E=;
        b=xn9elunGMhIEUoC5Q7vyNGI0FQo3k3TBnkh4Adf8cZwxY19kPM1KQmHSzPburW6WfG
         ac09Tx0r8W0nBGNss/bitgIB0p8jpJkMVCpl81NhGFU4WG1qx7NoDoJxyiFhI1W/ME0o
         DgFhUqU2obzZMQe7cUmTjXfDGDUGCSgjNTKWasPSETp5rYpgoDlDF25GoBE+qSNDzK13
         ds8d6QwhdvHgsOeLukfsqYWZMSF24LPdyv+WzuWwVXwhTcL2K2vKnykmy4WEjLy/tz2/
         +/iHRs8PLHuWJKeCOULVb767bOwHwX2hwWh4ueiSflzPdBewpuu+RFD20AOeGy7CvCTe
         lkVg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=gp5J5nW3suX2ie8J/8/I3xk82Qo3nVpj9176lqWay4E=;
        b=ZPxTfQVxDQ4YrevFQEWibet/IVpOC2I/cf5Kii4kWg0fmwUYm2xv2laeXYBbSUoEke
         z5BG8cvI4pXOJK3OL2yH8p24aZXrkW6R1GNYfuAh2qR38bfKExN/Qc7mLlZtxytiGt9L
         9TRu3EfyBDx0SSqBsuUpwPhUVuLogQWPug0FFLhCS+ug6bNATZ3e+hoLf7fvggaKmlP6
         sMpNIyj+1O3oxRjkjUcOURa0PGMklEwZpCH6XLuXBysNWyZhzJ8r859VWd6Uzy0SrKp5
         tJuQwE51DhG9XPK/vNIvjyewQgnLT9yQFFwtHsoAfLRZDh9AmdlphXi2JxErNjj9rtC0
         oTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=gp5J5nW3suX2ie8J/8/I3xk82Qo3nVpj9176lqWay4E=;
        b=HUqUtF5S66zt7Al7MhqY0O5vGRc2ZqXSmCtd0LSRDso9Lc9N6nI96lT1J3+6jAAF8r
         2G9gcMvNElkQrXE6WcXY+hpkx8ypwtVyadnPozFl7PgN8hQR1xODwz1uxMcBQynrIrbb
         tU9uD+ZB2pJWKMSdryJZaaPlqoMPz8WRtVL/oxXBQmdx2NMwA3Lte0H1N7qkhq6PYcHX
         NZC5IXnKqCFrLmdpSzekky8nTCg8h2Hx28He4uxneguesD52+gm3vQ07sN/BhsQVDaJp
         CsHbIPiyz5W4ls3REyyq6v1qX6BWClAlvWQnjJ8pcaHNe1TsnnXUnugxWanoMUIJ3A0I
         HFqA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVtm1iVXhjX392/YnGww7HTdvSjkiJFTsdmN+3+ZgwC/KuJh+9Q
	v8q7mHSx8L6wr+TB/6i2Rms=
X-Google-Smtp-Source: APXvYqyNc0QyAg9PlGxSDkh+kdkGSOkaUiXfhtacSyJXT78t7DmmlkgYBy75ND/KVMxtCEFfuUQIcQ==
X-Received: by 2002:a05:6512:244:: with SMTP id b4mr10555245lfo.114.1566801079179;
        Sun, 25 Aug 2019 23:31:19 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9950:: with SMTP id r16ls1732670ljj.7.gmail; Sun, 25 Aug
 2019 23:31:18 -0700 (PDT)
X-Received: by 2002:a2e:b1c4:: with SMTP id e4mr9606560lja.101.1566801078475;
        Sun, 25 Aug 2019 23:31:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566801078; cv=none;
        d=google.com; s=arc-20160816;
        b=DsKFIvnm5EQWZhMrBl6JyZ8PIt40jEWU/dEzkby3DUs1OXCbXuJyvG1Te7TFCSOqXB
         AZ+NQiSVyfhjnIlf4kTJ6x/waIWTmxeRshLgoe3HFGw1FiqnAe/8DY4jfmEzLDWoORAC
         T54PVqDnYO+Rxrr/xLMtOWlAJ3xX9584GmDAHnsiBhloQe08/LmyDmyf4s+gbT6ElIvt
         e9lHKveRz3vB4AqQcOfUcFopoIcQGRs89oaxplkE7uvFc6EBXDzGteZRtx9okHdQ0SuP
         AVHwUtXrg7t/83LAqJNTIW4b78wJC7uk1gAbdnvj/Uol+dfAlC7SWGfK2QxhGMsXVzuK
         AtOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=HW196JbtRGM85YQhYfAJ8Z7XT9MHuIa7ew3LFSUNK40=;
        b=iGxnCmXKmIfytgJRRihYIXkzBDjMlJoBr4Q/7J7OA/4XCaG7Qrl7PGMIEykzWe/e0L
         N7b/IbljIV1O+udPwXqHLAwwv49HVuP/973KG5B4DD4nY3oSfE81me+zvvWW/lwX9Hty
         jgaUj86vYCY9OjbHjhlVIaAVbSULbwBJrFdBysBGy/aC3oxVWaqsigYPVBwPd2DzyiLn
         x8eyPkFfCAj0mcKnvO9y6UdcG5mvHy864Zz7lQ27dYZc6CeJxmon6D1b2PMplUFEzokA
         wveGM9F/eBBFsmGdjsuypQNaMoMZonHHDVLO4ULqRfoaWP9DGc9xkL6aVEO4aKzOdh9W
         WNDQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id a9si53380lfk.5.2019.08.25.23.31.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 25 Aug 2019 23:31:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x7Q6VHLG001799
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 26 Aug 2019 08:31:17 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.35.99])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x7Q6VGMx024227
	for <jailhouse-dev@googlegroups.com>; Mon, 26 Aug 2019 08:31:17 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 2/2] linux-jailhouse: Update to 4.19.67 and 4.19.59-rt24
Date: Mon, 26 Aug 2019 08:31:16 +0200
Message-Id: <dff99b378fa55c35a551988b0f325790cd0a4b02.1566801076.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1566801076.git.jan.kiszka@siemens.com>
References: <cover.1566801076.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1566801076.git.jan.kiszka@siemens.com>
References: <cover.1566801076.git.jan.kiszka@siemens.com>
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

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 ...ailhouse-rt_4.19.50-rt22.bb => linux-jailhouse-rt_4.19.59-rt24.bb} | 4 ++--
 .../linux/{linux-jailhouse_4.19.56.bb => linux-jailhouse_4.19.67.bb}  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename recipes-kernel/linux/{linux-jailhouse-rt_4.19.50-rt22.bb => linux-jailhouse-rt_4.19.59-rt24.bb} (72%)
 rename recipes-kernel/linux/{linux-jailhouse_4.19.56.bb => linux-jailhouse_4.19.67.bb} (62%)

diff --git a/recipes-kernel/linux/linux-jailhouse-rt_4.19.50-rt22.bb b/recipes-kernel/linux/linux-jailhouse-rt_4.19.59-rt24.bb
similarity index 72%
rename from recipes-kernel/linux/linux-jailhouse-rt_4.19.50-rt22.bb
rename to recipes-kernel/linux/linux-jailhouse-rt_4.19.59-rt24.bb
index 2fbfd48..cae13ed 100644
--- a/recipes-kernel/linux/linux-jailhouse-rt_4.19.50-rt22.bb
+++ b/recipes-kernel/linux/linux-jailhouse-rt_4.19.59-rt24.bb
@@ -13,8 +13,8 @@ require recipes-kernel/linux/linux-jailhouse_4.19.inc
 
 SRC_URI += "file://preempt-rt.cfg"
 
-SRC_URI[sha256sum] = "f68559963019307950e3bbc9ee2cb6d997debca1cfa6435ed79c0bb15682ad57"
-SRCREV = "372c95a9bdd80b5bdbb2ceff2ea741193a187f1f"
+SRC_URI[sha256sum] = "02e7eb3ea8366785ae516ca3bb9cdd2d3b83672b543b8be12a4853b02f2a6279"
+SRCREV = "643fa6fcbe61f5db2120aa8757bc02faa56988cb"
 
 do_prepare_build_prepend() {
     cat ${WORKDIR}/preempt-rt.cfg >> ${WORKDIR}/${KERNEL_DEFCONFIG}
diff --git a/recipes-kernel/linux/linux-jailhouse_4.19.56.bb b/recipes-kernel/linux/linux-jailhouse_4.19.67.bb
similarity index 62%
rename from recipes-kernel/linux/linux-jailhouse_4.19.56.bb
rename to recipes-kernel/linux/linux-jailhouse_4.19.67.bb
index 99edc12..238bfd6 100644
--- a/recipes-kernel/linux/linux-jailhouse_4.19.56.bb
+++ b/recipes-kernel/linux/linux-jailhouse_4.19.67.bb
@@ -11,5 +11,5 @@
 
 require recipes-kernel/linux/linux-jailhouse_4.19.inc
 
-SRC_URI[sha256sum] = "fe74c652761e9530e5387a3f835c781e99e751174a13cc35cf5d2ca868443b06"
-SRCREV = "e64475bfe9071b9603a59c51875c5503ccc3f785"
+SRC_URI[sha256sum] = "e70f225edee1dfe90cbc7b5bfcbb8c39c0a8ab34d0be379a4be417952420a7ad"
+SRCREV = "b8f584b391bc90920008708d77d6bc880f61965e"
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/dff99b378fa55c35a551988b0f325790cd0a4b02.1566801076.git.jan.kiszka%40siemens.com.
