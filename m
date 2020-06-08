Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBCNJ7D3AKGQEVK7ICIQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf38.google.com (mail-qv1-xf38.google.com [IPv6:2607:f8b0:4864:20::f38])
	by mail.lfdr.de (Postfix) with ESMTPS id 330F51F16C7
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jun 2020 12:35:55 +0200 (CEST)
Received: by mail-qv1-xf38.google.com with SMTP id a8sf13592908qvt.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jun 2020 03:35:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591612554; cv=pass;
        d=google.com; s=arc-20160816;
        b=QmaRsajjUcv9WMfFWCumNkoMPjZ11WW9kVkWXpOn0LbeHNBQiEXaveB7QLN9SHYVLf
         gZEbReneDAY2PH59s7r8koUIRXnBx2yHALmOEJsAkxupLjUrlaWkU+whgOVeFOjLNdwS
         H38XynWw4YzpO2GQLc+XjaIOwkfnt2TS07CvYJ5CalDpTyo4HsndiuYPQgcPyYL6Cp3r
         dDevSZdZ2ZjmMyUpxGoIu3d+cXOP1ySj0iufjmfmfrlthYBmYkafjKmZGApG3qDFwdU4
         hsZQMfmpc0lrOrM0lMckw4PTjLYRN3/2BmqST3baB6i0s63lZQFp55O/J9gWUL1EYt05
         BVFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=MwUGXcZIujHL09HFRmKLy0qUgGC/SJc3xg5wCYZlmDw=;
        b=fEYWCsfPGlSI6aerTAHAWJ86zaAWMmkPhEbtHEDKjTfRS0NnimtwbEz5CC6ScaWwAE
         TUNqP67bU0GmBjKAtKyB6cc4fATwvJ4XIa/txVd2rf+DMYQBTK16PcKsx8eGLPtdQvGo
         NNL8UyXbdDiLDH+35kHQrzMMozyf1qJeS4BEvJbGC3+B4rCZDHnZWdQNDVL6JlF9nHHI
         +JCjW6qwSXtpJYe0pVGmNMXZNQwjIxwGmCyU48D9rCt7IbdqsXLUlM53RywIIbNnx0Rp
         KIph19ngpHjQ6TskytLog/RzDHKotUYwSHI9KOnH06w+Tn0TjpMYGFTW1/Wjrbi5RZ6g
         rGOQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=M8NgXjVx;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=MwUGXcZIujHL09HFRmKLy0qUgGC/SJc3xg5wCYZlmDw=;
        b=hRQrfRy6xBxjiRABzmAKn/erNy2aWt+ps20QH7/rovp5n+DhoFSpTG+ZWbCJfWjfCR
         qmCGzgQJb6kshZcjQYttbL7Ha6IkBW2ttYxsJdfDA8118biVvskGqMHnFKUN8mVIhar8
         syo5Ldt9a4Og3eBYJrF3CAumIBjaRHfo3K/jDYUCtKYvIZ0ht3seJ9KLGiHN3tMODq1c
         /yvkYsa5McYTvN8Hzb9nVWPeYIxlKl/4AqwEHqaU0Xx23N1UdyFAaVRY0Nsr014huxob
         KaDoapnHoVXc8MteoPruNiHLXzobUYibVy/E0y+5CR9tKo06xLZkmUDHbMkN1iiMXf6u
         kUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MwUGXcZIujHL09HFRmKLy0qUgGC/SJc3xg5wCYZlmDw=;
        b=DVkb27SvPOOf9Rjk4yDAOOTjxyfuMwHhVCfkJL2S8ZDK4gxXjoP/1Wu8W/I4NxkOq1
         f6s5ZNkK1k9msVXJNRvrkwyzQ5hQMC4BGOFJ2zSm7ULnIRNH3iIMvpXCThqeIWAxxryi
         xyYGz0+T106xmPgOmoIMu5OxlLnBBibouC702I0fJ5d3Ftjqn+RAnNmDCEBI71p1kWA1
         eK7tCR9t/mETJVBhQonty2Pbk3vDEBsQQ10NqlZGaXaPJ41aaOxU/M/KQFiK+CAZEMtU
         FTZAc3ZLXSm4iy7SeYSbZlKOdzZgKPpfooGtc6qjSPP9eIWZ+MzlZwkvHAWEoQJBhAVG
         Twgg==
X-Gm-Message-State: AOAM531J6bFQzEzjr+Qn9TxT1nyOOFhHVdFXVQQK9hHVtUwJGsbJoqeJ
	55nOZpviq+LYlu8hl+YK6tE=
X-Google-Smtp-Source: ABdhPJxCWILfuYGkrU4j4WTA0a+IorLYvFDQ3BEIIPG3pFfDGv2rwAxvaUXjQkOtXWQ/tu2jRkk+QA==
X-Received: by 2002:aed:30cf:: with SMTP id 73mr4674900qtf.81.1591612554031;
        Mon, 08 Jun 2020 03:35:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:78d:: with SMTP id 135ls7510279qkh.8.gmail; Mon, 08 Jun
 2020 03:35:53 -0700 (PDT)
X-Received: by 2002:a37:a147:: with SMTP id k68mr21524184qke.62.1591612553483;
        Mon, 08 Jun 2020 03:35:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591612553; cv=none;
        d=google.com; s=arc-20160816;
        b=qAAseixVQigXlN72oEvLH0AIHZpG/iww22Oj3/O12ieMWPe9SS94g2rNErfPXjewAi
         C2X5NxEl138AMTQj8ooMbMK5xDtp3B22CglOjyx8KCy+9F2eTXz7ZOb+gXLuxRweiCs4
         7axAl70YdjjFIZsOgH0LQU8g3ymx7WVjE/jA84C9dU+S1R2LO8NnIy5HXH0ODl8d+C+E
         7frcRgYqvXj9DVetNRo07vaqFvey0XRjFQdQo2X9sLzrve6F7NwwZ+r88MjhVkMCQNyQ
         1M27j6V75lopNRi4tXVjDQq/OjVzlAhGiiFkNd8r5ICEVbJnTVDgntuetAEDiBrznKnh
         1H7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1TsHInvso9MpMvpN1+A6+e9O/WkNrgVaw1QMcgt0Fsw=;
        b=WQ+Uvm5U80LMAI+Tzzig7u8fJVWdJ9OMZmPs1cubgaW2/OjbvIlWMbvuleimhpbQ0A
         zQhYfK7lZPSKqE67n8WZobr0+SnSRa7M+doZ07FqG3/6SyTmLfF7UVjZeBkH4owIGNSF
         HUyVh2rVJ8gbgsVex9pT7cApZJvqgeTJChEHDTj36dL7GnekOUfI1FsKfnabmcfHk8wx
         hYz9COA42aJAWCYiELy859ts/zUm+iGaUomoKiBjwYsffWlm4W4A1fFnChBN58l0xMhc
         OuFnFqEBYMqk+gEsnltUqDowRkS3tuxvayaibvHg6gUO5JJD4iPiDevNJWGuAglPz+Ts
         PZIQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=M8NgXjVx;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id y21si470362qka.2.2020.06.08.03.35.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jun 2020 03:35:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 058AZqhx124381;
	Mon, 8 Jun 2020 05:35:52 -0500
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 058AZqnM130112
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jun 2020 05:35:52 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Jun
 2020 05:35:52 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Jun 2020 05:35:52 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 058AZnoS122340;
	Mon, 8 Jun 2020 05:35:51 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v2 1/3] configs: dts: inmate-k3-j721e-evm: Add pinmux for main_uart1
Date: Mon, 8 Jun 2020 16:05:46 +0530
Message-ID: <20200608103548.9040-2-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608103548.9040-1-nikhil.nd@ti.com>
References: <20200608103548.9040-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=M8NgXjVx;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: <nikhil.nd@ti.com>
Reply-To: <nikhil.nd@ti.com>
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

From: Nikhil Devshatwar <nikhil.nd@ti.com>

Add a pinmux DT node for main_uart1.
Describe the pinctrl default state for main_uart1 node.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 configs/arm64/dts/inmate-k3-j721e-evm.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/configs/arm64/dts/inmate-k3-j721e-evm.dts b/configs/arm64/dts/inmate-k3-j721e-evm.dts
index 30c940f0..e2348590 100644
--- a/configs/arm64/dts/inmate-k3-j721e-evm.dts
+++ b/configs/arm64/dts/inmate-k3-j721e-evm.dts
@@ -414,6 +414,13 @@
 };
 
 &main_pmx0 {
+	main_uart1_pins_default: main_uart1_pins_default {
+		pinctrl-single,pins = <
+			J721E_IOPAD(0x1f8, PIN_INPUT, 0) /* (AA4) UART1_RXD */
+			J721E_IOPAD(0x1fc, PIN_OUTPUT, 0) /* (AB4) UART1_TXD */
+		>;
+	};
+
 	sw10_button_pins_default: sw10_button_pins_default {
 		pinctrl-single,pins = <
 			/* PADCONFIG[5:4] = GPIO group select = 1 */
@@ -428,6 +435,11 @@
 	};
 };
 
+&main_uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_uart1_pins_default>;
+};
+
 &main_sdhci0 {
 	/* eMMC */
 	non-removable;
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200608103548.9040-2-nikhil.nd%40ti.com.
