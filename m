Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAM5W2PAMGQE4HZH37Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1676771DC
	for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 20:29:05 +0100 (CET)
Received: by mail-ed1-x53a.google.com with SMTP id l17-20020a056402255100b00472d2ff0e59sf7003508edb.19
        for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 11:29:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1674415745; cv=pass;
        d=google.com; s=arc-20160816;
        b=LnR2dcrVHk/f3eUwnXOpaM9P6+pb8CnUUT758K2WFjRHVDNFcYf0gGpgxkokvQHqOz
         j8N9rJNfFK0DD09t9K65NL0ig/GmMTkcG0Vw2+6z5IMCIC3ZyblP5WY6BTq/7unNE2tG
         UzFZNLsNuEZQJEVHuvM7oBCTuDqxHTJsx8xNYPqUx9yVSpiFROAq/3iqrYWpx3/oovaT
         isI1/IIJrolVU1jzVMryFgOLtSuHuRuOn+279AmyhKysGWv+MUXocpGBb0oNfoFRWxQH
         hQlm/mvVIkl+O2VxJBacpu5M3mwQA6168AKL4quci8hZ0xP5XSjEwuxggG8hnFY4ig+F
         hKVw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:feedback-id:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:sender:dkim-signature;
        bh=SJu5g47KsjmtxX5f7XcHc23oU+KQSD9kvvDWN5HLVac=;
        b=Bi4eSHWM3ntVDg4Sul8G5h/7CLGxqfh1bdOr2iE11l1IMHPUR41DXGNCBwS3iXsJ9a
         qd1oGQZoUP3CbMZXyMISWe3dX64lZ3illbMQSQRxLL5JGgd7ucF5ze1jflxaxQUPSmsm
         8p3tQ+EFLccSUzKZBFn+MRzzUExe9GokYsHWbmTrjFYD+c7dmPNvEdNvULGecXqpppre
         N38TxcF3r65CVGaphTbJT7ewSPQB+g+3LuGmJukelucmOOjHNRNMPDq0FWDy/y1nlIf3
         HLh38dH9yI/wTuSjX+w2mnMNuXDNN6gXMLVTEtos8Lk5WfLqqHJo3g9XKzJ2iXc2S12z
         NeYA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=jckBwaLz;
       spf=pass (google.com: domain of fm-294854-202301221929038973c9a9594e5b8085-bnras7@rts-flowmailer.siemens.com designates 185.136.65.226 as permitted sender) smtp.mailfrom=fm-294854-202301221929038973c9a9594e5b8085-BnRas7@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:feedback-id:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJu5g47KsjmtxX5f7XcHc23oU+KQSD9kvvDWN5HLVac=;
        b=Fqj2oZ9Hp3AxTQrZipR26wSOLoUdPsZQOBtYo78C3qbVfjs91olXq7oqCk59Tb9K0R
         MxlciIkQYya9ZjjZsqFrZ3yiWoWZBrbOC6eLkJApHIpj0Tc1QCl7vXcxuFyq8LutngPP
         qPrr1mzEV2aMvxTfKl3E02toB9dMRlnWvFYsEA9cmNw0FryXnPGT556yWiN6qkgSceUM
         rs/WwkJPalXTElkF+tqNPgjwfz/RHAp6TfLDBD8yHcNVzoqjSn6MKrDSUED6u8XVcAop
         /xBcb5+7cGWer9+hYe30SzmTftmf0Ge99BdvWQ/0CW/m/SInshfiWq6idPpQrvywY+DV
         nw1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:feedback-id
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SJu5g47KsjmtxX5f7XcHc23oU+KQSD9kvvDWN5HLVac=;
        b=iMYS1R/3bxYzlfxXEee6+PJPX6TR1C2Cge2NH6glGui3ofK4gmagkPRneeU2M9X3IW
         6aHHY1YxnZRrITL5Tl4KT5V1LlBNPy5QohEM5q8HlBuJQjBAXlsNELaGKTCwlAhzLWcu
         dP9eAGuKm4yTZBG2GLPjZq5njGVFG9eGwh1nERYY+ymriU4kfuc25HueRKbbM8LaiPis
         NPaVfoNL9W7bh3jQtPr84YoMT7+d1p4wtb/FbyZOIsJ1X0IAZox+tPPSjROpV0RXmXW8
         OQoHgw5BS2Z1uizJ4yJfZwvH5zgU8VLLs+F0TrqtSXBMKDlPyjHw7hKu1nVgyD+4ixru
         MBgw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kq5fa3Oy0Tsy+vJFE8VHKeJwkBjnis1VS4lhbC4g/9kH8R2sIpN
	tGZayEkzbfTLOuxqpjF/M+I=
X-Google-Smtp-Source: AMrXdXvRFdLnjSUtG3iocvGHEuPxFLgvIaLJNpLWr32NVc2Hy12JbPQIBHjHfmybLcO+MPn7oKMbTg==
X-Received: by 2002:a17:906:9612:b0:86e:18b4:83c4 with SMTP id s18-20020a170906961200b0086e18b483c4mr1748896ejx.231.1674415745408;
        Sun, 22 Jan 2023 11:29:05 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:270a:b0:49e:5b8c:71c4 with SMTP id
 y10-20020a056402270a00b0049e5b8c71c4ls8189903edd.3.-pod-prod-gmail; Sun, 22
 Jan 2023 11:29:04 -0800 (PST)
X-Received: by 2002:aa7:d653:0:b0:49e:2109:6f52 with SMTP id v19-20020aa7d653000000b0049e21096f52mr23717622edr.19.1674415743932;
        Sun, 22 Jan 2023 11:29:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674415743; cv=none;
        d=google.com; s=arc-20160816;
        b=gvuSEQBuDzgiFRgVtzxuQ1FDOrJ6hJaRxhLsOEWv42FCroLceuk2eOquyoF6Sh7lhZ
         h/miI+MfyPFjiYBIvXdUT4HAYR9uMqBQczLaMJMiytkwVr4H8eomb1DkibXc/L8PZ9QH
         c5wbOlsOBB63eeb5+rx89xakf1deCYOaemedqRGYDSy5l9qzN+0lwVhtTwLMGMZJ92sK
         UVfiHWa9z8XNJOzLQUqNDnnmYhknOVbRxpX72b1BAocnK1n41k+d+5Qb+2assK1y1Ihx
         Ley07K6/3g3esIrclo9705tOKSs2AizjqaxaG6nj/b0NJVZOD+RehY8vLS5Q7khWMoZ9
         UsBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=feedback-id:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=115iwXU2CllL3GheDZqwOHsh3ogYSgeEmf5zyogvxxM=;
        b=dTYNl2V8MwnwtRPVuSUML537Uw+YiRt6MnMTemuG6u3PPr09G71uDXgHYNksV7QYQu
         Ir+SWSuilu2x630aWowRonRrOR4tdsW+E1XaYNMfYRm+Do8V/dhT0ZtJIuvhllBmxmWu
         Kh1O6YQ9TafIJMtrvClyhfDFagpDuHkUXEoWJEC+jyVw031PSV49vz8sJADBtqN6+2DQ
         oOxQvoyFhWd3GGhApXQjg4kPaKc0FdeIc1xTPSkkHRH2pXViPn2rjlwZ7vd2CTtgXkic
         bOLxiQpxcSz/S4IAQNZa5/Baze3YZ0txNzvcQCaZNVA2glwRGcdxKRdq46aBdMtMEptJ
         Y3vQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=jckBwaLz;
       spf=pass (google.com: domain of fm-294854-202301221929038973c9a9594e5b8085-bnras7@rts-flowmailer.siemens.com designates 185.136.65.226 as permitted sender) smtp.mailfrom=fm-294854-202301221929038973c9a9594e5b8085-BnRas7@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net. [185.136.65.226])
        by gmr-mx.google.com with ESMTPS id k20-20020a05640212d400b0047014e8771fsi2007424edx.3.2023.01.22.11.29.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Jan 2023 11:29:03 -0800 (PST)
Received-SPF: pass (google.com: domain of fm-294854-202301221929038973c9a9594e5b8085-bnras7@rts-flowmailer.siemens.com designates 185.136.65.226 as permitted sender) client-ip=185.136.65.226;
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202301221929038973c9a9594e5b8085
        for <jailhouse-dev@googlegroups.com>;
        Sun, 22 Jan 2023 20:29:03 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 07/14] configs: arm64: Consistently move inmate demo to 2 core
Date: Sun, 22 Jan 2023 20:28:54 +0100
Message-Id: <97b48d1823b7578cdc4be370a1a56ad20df45a15.1674415741.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1674415741.git.jan.kiszka@siemens.com>
References: <cover.1674415741.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-294854:519-21489:flowmailer
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=fm1 header.b=jckBwaLz;       spf=pass
 (google.com: domain of fm-294854-202301221929038973c9a9594e5b8085-bnras7@rts-flowmailer.siemens.com
 designates 185.136.65.226 as permitted sender) smtp.mailfrom=fm-294854-202301221929038973c9a9594e5b8085-BnRas7@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Allows to run that cell aside the linux inmate.

For the k3-am625, we also have to shrink the linux demo to core 2 and 3.
The r8a774a1 had a inmate demo cpu set that was completely off.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm64/dts/inmate-k3-am625-sk.dts       | 7 -------
 configs/arm64/imx8mm-inmate-demo.c             | 2 +-
 configs/arm64/imx8mn-inmate-demo.c             | 2 +-
 configs/arm64/imx8mp-inmate-demo.c             | 2 +-
 configs/arm64/imx8mq-inmate-demo.c             | 2 +-
 configs/arm64/imx8qm-inmate-demo.c             | 2 +-
 configs/arm64/jetson-tx1-inmate-demo.c         | 2 +-
 configs/arm64/k3-am625-sk-inmate-demo.c        | 2 +-
 configs/arm64/k3-am625-sk-linux-demo.c         | 2 +-
 configs/arm64/k3-am654-inmate-demo.c           | 2 +-
 configs/arm64/miriac-sbc-ls1046a-inmate-demo.c | 2 +-
 configs/arm64/renesas-r8a774a1-inmate-demo.c   | 2 +-
 configs/arm64/zynqmp-zcu102-inmate-demo.c      | 2 +-
 13 files changed, 12 insertions(+), 19 deletions(-)

diff --git a/configs/arm64/dts/inmate-k3-am625-sk.dts b/configs/arm64/dts/inmate-k3-am625-sk.dts
index c1455073..160feb45 100644
--- a/configs/arm64/dts/inmate-k3-am625-sk.dts
+++ b/configs/arm64/dts/inmate-k3-am625-sk.dts
@@ -35,13 +35,6 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu1: cpu@1 {
-			compatible = "arm,cortex-a53";
-			reg = <0x001>;
-			device_type = "cpu";
-			enable-method = "psci";
-		};
-
 		cpu2: cpu@2 {
 			compatible = "arm,cortex-a53";
 			reg = <0x002>;
diff --git a/configs/arm64/imx8mm-inmate-demo.c b/configs/arm64/imx8mm-inmate-demo.c
index 7d2c5c18..ef4f187a 100644
--- a/configs/arm64/imx8mm-inmate-demo.c
+++ b/configs/arm64/imx8mm-inmate-demo.c
@@ -42,7 +42,7 @@ struct {
 	},
 
 	.cpus = {
-		0x8,
+		0x2,
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8mn-inmate-demo.c b/configs/arm64/imx8mn-inmate-demo.c
index 2b77c3f5..e3f04f07 100644
--- a/configs/arm64/imx8mn-inmate-demo.c
+++ b/configs/arm64/imx8mn-inmate-demo.c
@@ -43,7 +43,7 @@ struct {
 	},
 
 	.cpus = {
-		0x8,
+		0x2,
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8mp-inmate-demo.c b/configs/arm64/imx8mp-inmate-demo.c
index ecbd7bb6..e5355833 100644
--- a/configs/arm64/imx8mp-inmate-demo.c
+++ b/configs/arm64/imx8mp-inmate-demo.c
@@ -43,7 +43,7 @@ struct {
 	},
 
 	.cpus = {
-		0x8,
+		0x2,
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8mq-inmate-demo.c b/configs/arm64/imx8mq-inmate-demo.c
index b28a0dac..cbb3a01e 100644
--- a/configs/arm64/imx8mq-inmate-demo.c
+++ b/configs/arm64/imx8mq-inmate-demo.c
@@ -42,7 +42,7 @@ struct {
 	},
 
 	.cpus = {
-		0x8,
+		0x2,
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/imx8qm-inmate-demo.c b/configs/arm64/imx8qm-inmate-demo.c
index 8ab216cd..effd7b80 100644
--- a/configs/arm64/imx8qm-inmate-demo.c
+++ b/configs/arm64/imx8qm-inmate-demo.c
@@ -42,7 +42,7 @@ struct {
 	},
 
 	.cpus = {
-		0x8,
+		0x2,
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/jetson-tx1-inmate-demo.c b/configs/arm64/jetson-tx1-inmate-demo.c
index 99a704ce..8b13148d 100644
--- a/configs/arm64/jetson-tx1-inmate-demo.c
+++ b/configs/arm64/jetson-tx1-inmate-demo.c
@@ -40,7 +40,7 @@ struct {
 	},
 
 	.cpus = {
-		0x8,
+		0x2,
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/k3-am625-sk-inmate-demo.c b/configs/arm64/k3-am625-sk-inmate-demo.c
index 053de528..38d146a9 100644
--- a/configs/arm64/k3-am625-sk-inmate-demo.c
+++ b/configs/arm64/k3-am625-sk-inmate-demo.c
@@ -45,7 +45,7 @@ struct {
 	},
 
 	.cpus = {
-		0x4,
+		0x2,
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/k3-am625-sk-linux-demo.c b/configs/arm64/k3-am625-sk-linux-demo.c
index 09bece78..37b42b5e 100644
--- a/configs/arm64/k3-am625-sk-linux-demo.c
+++ b/configs/arm64/k3-am625-sk-linux-demo.c
@@ -51,7 +51,7 @@ struct {
 	},
 
 	.cpus = {
-		0xe,
+		0xc,
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/k3-am654-inmate-demo.c b/configs/arm64/k3-am654-inmate-demo.c
index 8c60648f..73e4f051 100644
--- a/configs/arm64/k3-am654-inmate-demo.c
+++ b/configs/arm64/k3-am654-inmate-demo.c
@@ -44,7 +44,7 @@ struct {
 	},
 
 	.cpus = {
-		0x4,
+		0x2,
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/miriac-sbc-ls1046a-inmate-demo.c b/configs/arm64/miriac-sbc-ls1046a-inmate-demo.c
index 1e7fd2bc..630eb589 100644
--- a/configs/arm64/miriac-sbc-ls1046a-inmate-demo.c
+++ b/configs/arm64/miriac-sbc-ls1046a-inmate-demo.c
@@ -42,7 +42,7 @@ struct {
 	},
 
 	.cpus = {
-		0x8,
+		0x2,
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/renesas-r8a774a1-inmate-demo.c b/configs/arm64/renesas-r8a774a1-inmate-demo.c
index 14c77838..f571a587 100644
--- a/configs/arm64/renesas-r8a774a1-inmate-demo.c
+++ b/configs/arm64/renesas-r8a774a1-inmate-demo.c
@@ -48,7 +48,7 @@ struct {
 	},
 
 	.cpus = {
-		0x3c,
+		0x2,
 	},
 
 	.mem_regions = {
diff --git a/configs/arm64/zynqmp-zcu102-inmate-demo.c b/configs/arm64/zynqmp-zcu102-inmate-demo.c
index c7b8a0db..9f47a402 100644
--- a/configs/arm64/zynqmp-zcu102-inmate-demo.c
+++ b/configs/arm64/zynqmp-zcu102-inmate-demo.c
@@ -42,7 +42,7 @@ struct {
 	},
 
 	.cpus = {
-		0x8,
+		0x2,
 	},
 
 	.mem_regions = {
-- 
2.35.3

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/97b48d1823b7578cdc4be370a1a56ad20df45a15.1674415741.git.jan.kiszka%40siemens.com.
