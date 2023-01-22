Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAE5W2PAMGQE6MM3TEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5266771E4
	for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 20:29:06 +0100 (CET)
Received: by mail-lf1-x13f.google.com with SMTP id x12-20020a056512130c00b004cc7af49b05sf4082049lfu.10
        for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 11:29:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1674415746; cv=pass;
        d=google.com; s=arc-20160816;
        b=oph+sohIQvb+PUCfY6u8zgGjmzmKPWcG4gA0JYTmCtXhVgirjnP/wgsvzl1F+qoZ88
         pvjhIsaft9R+akrnl+3vQc53i/usRW7IGlHZQ30ZK2dn6yEVK4lXXvuXyG925usTUvnh
         iA23rJgCELCs1HS5zLgV1ponmq0oRI2HzCrn8GYS7y9MoX2ANSpcz83hILywo5mogck7
         3N+g+HtMSWFAqIgTBhPNiOyyTvtd5cWUh5MXTrG21dmPsiMhnLVdsezpGs7+aSi72KIC
         SZr3Eo5Kd2ZVdOxCdG7kY2WjNA6m7sJ+hgj7AUcHE+KmgG4TQxmBwJoWYCncOI5J8GFF
         /x1A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:feedback-id:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:sender:dkim-signature;
        bh=QZZIFCP8MoRVm4h5wF29+YdmzCBodVFYYBPcK891mpc=;
        b=EJwn8NP9K2Zc3lFgFSjvq86DSr6aeuOfLBZeWQ9IWwoMI2JRIPGgCn4ZtaE/8Si1kj
         3GZovgyJFWlj4a+JjVnkfR7bnyQ4q67OiROY1XJAfCv9j4i+3o6wjFqK7dMzqRcGADE1
         /Wd4LlaMS7ToUqV5sYpIy55XjRkFfNfReTMpsxB0cpUunU1fnLXlHccxMDdssgPGprEL
         qNUyGoY9LVT+5SlTmF381+OuCyxjLrMuLxO1qcgtpzNRk0lX/OnZkvPo478a/3adilHR
         /4l5HU7eWCFEassGnek5ADPR2b7w3Ww7Xgsr8TnTEbOdJc/DkDcWSMnPrD3B7J6ZedN4
         IpfA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=elfrn6cP;
       spf=pass (google.com: domain of fm-294854-20230122192903d8c5744af2d88a753e-7ezyvk@rts-flowmailer.siemens.com designates 185.136.65.226 as permitted sender) smtp.mailfrom=fm-294854-20230122192903d8c5744af2d88a753e-7ezyvk@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:feedback-id:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZZIFCP8MoRVm4h5wF29+YdmzCBodVFYYBPcK891mpc=;
        b=UVJ8mkxcMBvQnofJvBDk7Ytteb6jo2zEgrkPx1SCMmxP8PeuVHIXYxnDkoT9vxFM80
         uxwMuGAa2072LqGYwZDgd7dOE2YxHUybrOddT0yWqNUkB0oWpS+bS+ZMDGz2pBe07/76
         3aZjwPG8iYjPW8m8TgZJHfaSGwGx+f3vKutSgpNjgRk63D1patuYYE2jc66iNoKhuT86
         wfwtzLpixaXO7aE5bhhUJtr3FrmIEuvg3ZoVJBGmtMs8rSVlGJypO2lOxMHd4WHQYdXX
         xri28SivPYtU4gxj4wOUCnJZECd9BsWVZKITK893W12pEXw2Zn4FbE1TrezZAyopAxyF
         1p+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:feedback-id
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZZIFCP8MoRVm4h5wF29+YdmzCBodVFYYBPcK891mpc=;
        b=rOiiR4v7ldXXBG12FWQMbabI/w5pDPAJNlXi2Rl2V9tR00wAOVKnRyMym7UThnOAuU
         ozk7frILOnzsyCcs1orpHmKjBeMsLzxc0NKPkOkeFdVBrlagHZ8Yix5XapRXsn16JmBZ
         eFXBOZxPnLvNbVDXbZqp65TFeKvcxKJaEjdyHMiRdvfVi367CisPN71OeXV8W7I27tBX
         GpQPUTHRh1H1LwWMUdGeZlX7YfzRnw39h+5XLxTEbNhOSz05RDfapUdpG19rDO+VDTpE
         ol5sJN5NK+qIPfei+TZjXSo0kVcvn6Cp+/7vllxV5d5pLh/EBLbPvt22SCntHNXEVpZ2
         knpg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kp+LQ3JjhtqMiPfFJ5EAh5VHAyNhfVRgXSzojaRm0TvImtL+G23
	nbeoEHyfSEhL5JgrLbSK+s4=
X-Google-Smtp-Source: AMrXdXuKwGksx70mS0gcWbx9+FiJOutHoXkai7wquY8EKJrL7a1qQfoWHZ/u0SH/+eBOosCDyT/1Wg==
X-Received: by 2002:a2e:b94a:0:b0:277:e8e:8d90 with SMTP id 10-20020a2eb94a000000b002770e8e8d90mr1731349ljs.243.1674415745657;
        Sun, 22 Jan 2023 11:29:05 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:214f:b0:4c8:8384:83f3 with SMTP id
 s15-20020a056512214f00b004c8838483f3ls3202380lfr.3.-pod-prod-gmail; Sun, 22
 Jan 2023 11:29:03 -0800 (PST)
X-Received: by 2002:a05:6512:3e0b:b0:4d5:6e32:8557 with SMTP id i11-20020a0565123e0b00b004d56e328557mr7063383lfv.30.1674415743821;
        Sun, 22 Jan 2023 11:29:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674415743; cv=none;
        d=google.com; s=arc-20160816;
        b=jXQ+BLk0L40/L9nQVGvgDwfKC+3smVRwZRk4QYUxIqzhAOPt+r19EYTlTncaFnTSE5
         ozKUboX8pAsq2KKF5lX14MVHb+Cr0ONnm2kmSbvVwRyLYbqyF2epGcI9wDGQ8/38afeT
         rhZvWHk2w18oJHIoLkqVPh9K4nBvQpLZ3rGQ4qODTl2MIgvQYR14U76TEsi4b2Txpjdq
         vteT7P4D6vxCIlfUQIlVhMzdlZwi5fWazsp9kVzt8X/cWOCXi81kOQjsM4nDAmrESun5
         l5rhtopviDdNYB6EQZIxNmVXMOe2b1buTGszGLkUcaPrxqd3z80msjWbZwk12WjGwXXj
         HCyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=feedback-id:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=ymMb7HEnMdMdTyLAYT1yZrC3KbxJX5+jyNJ63AI8bOI=;
        b=lMu8xPqoJ2e1R5izqXrVZa2hZ1CfDpNcFCK5v+/vu//9m5+c7qmBOxXVC0ElXO2alx
         dvqcaRHV3MDH57orFgkyWcxWH7PvepIG57f4X5ANgzY5zKN3gCcFhy5TtxNdE1oBFeoV
         niZYj64sQ76cQ1IojemFNXvMC90OMTt601ZDy/6xBflnBHSK2y65F9PMm+dL45UR6PMN
         QEjYXQyxlhgqBdeaBfNLeRJjg87t8207onuaC3rLJxZ69/guJYW55rcx1D1YKvfoH072
         a+wyNRho4TltfqnbysmMWTCN55/X4Zpziwo9yyPMv+yhQs26hU1ANhrGBqBoIf9jtBpb
         0D3A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=elfrn6cP;
       spf=pass (google.com: domain of fm-294854-20230122192903d8c5744af2d88a753e-7ezyvk@rts-flowmailer.siemens.com designates 185.136.65.226 as permitted sender) smtp.mailfrom=fm-294854-20230122192903d8c5744af2d88a753e-7ezyvk@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net. [185.136.65.226])
        by gmr-mx.google.com with ESMTPS id z18-20020a2eb532000000b002865233e8b5si1153880ljm.5.2023.01.22.11.29.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Jan 2023 11:29:03 -0800 (PST)
Received-SPF: pass (google.com: domain of fm-294854-20230122192903d8c5744af2d88a753e-7ezyvk@rts-flowmailer.siemens.com designates 185.136.65.226 as permitted sender) client-ip=185.136.65.226;
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20230122192903d8c5744af2d88a753e
        for <jailhouse-dev@googlegroups.com>;
        Sun, 22 Jan 2023 20:29:03 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 04/14] configs: arm: dts: Silence style warnings
Date: Sun, 22 Jan 2023 20:28:51 +0100
Message-Id: <23245e32c3772efef66a7dd9716550cc25f6ae35.1674415741.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1674415741.git.jan.kiszka@siemens.com>
References: <cover.1674415741.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-294854:519-21489:flowmailer
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=fm1 header.b=elfrn6cP;       spf=pass
 (google.com: domain of fm-294854-20230122192903d8c5744af2d88a753e-7ezyvk@rts-flowmailer.siemens.com
 designates 185.136.65.226 as permitted sender) smtp.mailfrom=fm-294854-20230122192903d8c5744af2d88a753e-7ezyvk@rts-flowmailer.siemens.com;
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

Resolves "unit name should not have leading 0s".

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm/dts/inmate-bananapi.dts  | 6 +++---
 configs/arm/dts/inmate-orangepi0.dts | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/configs/arm/dts/inmate-bananapi.dts b/configs/arm/dts/inmate-bananapi.dts
index 78a29301..bd222bc7 100644
--- a/configs/arm/dts/inmate-bananapi.dts
+++ b/configs/arm/dts/inmate-bananapi.dts
@@ -69,7 +69,7 @@
 			clock-output-names = "osc24M";
 		};
 
-		apb1_gates: clk@01c2006c {
+		apb1_gates: clk@1c2006c {
 			#clock-cells = <1>;
 			compatible = "allwinner,sun7i-a20-apb1-gates-clk";
 			reg = <0x01c2006c 0x4>;
@@ -79,7 +79,7 @@
 		};
 	};
 
-	gic: interrupt-controller@01c81000 {
+	gic: interrupt-controller@1c81000 {
 		compatible = "arm,cortex-a7-gic", "arm,cortex-a15-gic";
 		reg = <0x01c81000 0x1000>,
 		      <0x01c82000 0x1000>;
@@ -87,7 +87,7 @@
 		#interrupt-cells = <3>;
 	};
 
-	uart: serial@01c29c00 {
+	uart: serial@1c29c00 {
 		compatible = "snps,dw-apb-uart";
 		reg = <0x01c29c00 0x400>;
 		interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/configs/arm/dts/inmate-orangepi0.dts b/configs/arm/dts/inmate-orangepi0.dts
index cfdb7cda..f3a18c14 100644
--- a/configs/arm/dts/inmate-orangepi0.dts
+++ b/configs/arm/dts/inmate-orangepi0.dts
@@ -76,7 +76,7 @@
 		};
 	};
 
-	gic: interrupt-controller@01c81000 {
+	gic: interrupt-controller@1c81000 {
 		compatible = "arm,cortex-a7-gic", "arm,cortex-a15-gic";
 		reg = <0x01c81000 0x1000>,
 		      <0x01c82000 0x1000>;
@@ -84,7 +84,7 @@
 		#interrupt-cells = <3>;
 	};
 
-	uart: serial@01c28000 {
+	uart: serial@1c28000 {
 		compatible = "snps,dw-apb-uart";
 		reg = <0x01c28000 0x400>;
 		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.35.3

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/23245e32c3772efef66a7dd9716550cc25f6ae35.1674415741.git.jan.kiszka%40siemens.com.
