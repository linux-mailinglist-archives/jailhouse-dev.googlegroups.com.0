Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBZFXXH3AKGQEDNR3FWY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x439.google.com (mail-pf1-x439.google.com [IPv6:2607:f8b0:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA721E41FB
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 14:24:06 +0200 (CEST)
Received: by mail-pf1-x439.google.com with SMTP id 194sf19426360pfb.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 05:24:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590582245; cv=pass;
        d=google.com; s=arc-20160816;
        b=Tq3H5PUaNTWSutd0+MVpKT4ZauxdNiB1TstMeyHuxOBpemrwdob8Aik/LbKUyq6K8i
         Pa088R7a2iIbV1qvmVc3z93T9Eixeu3FaJ4b9nKh7wqVqyhGldKsPD9jQdQgplAx2Oda
         0ljenqnnin2Wv/XTVrwGL9J9MrpIUwDkE6VLS5IP4O5BTBUhu2tmg/8SK/Q7VMJPfNfm
         vteVMTC468kUJrWevZRkcf791s91NJqGiAwNQ945d3XJDIStVjqKUkcj/cbFc2uWf1AC
         eOkMEfqXaLXumoE9XH+5071WPYIEqsgrP0qAUmlY7WB6R243x7yi1yWuCiW40WvsxuJJ
         4fNg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=/mGY3Uo2VAImUz70MSPRw7PzkJkeDe9wAvXCL9dOGDk=;
        b=Y6nJ0dp9I8WqdTWWi5s1krGjWzMeexf4Bgxmd4oqiMOKka30H01i/OSFYkrmzH/jCH
         qJB1JJP5GGU6nqu4twOuadkERnRTdD54FXYYXR50SZcc3grtsF+UpjpEoeeMr6VI9Ak2
         7m+dgcwdYGxm5UOsav97hi6eGh4MA8z8kGyjezSl+RRap2wExvBjW0KoBLFGQbm73z+g
         FyuV/11ChtXhhNVv8h7r6A+4b2dX8I7Mdw1vSPxuI//+zWMU9FcZR0kPCng9oZz1UgvC
         HHnVOc8PWtQ11ZAHAjnaUR9fhTU1uR81eM8EM76Qd6Eo6bNAKR1kMbzd+b0//mbiexTU
         rAtA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bceLkILK;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=/mGY3Uo2VAImUz70MSPRw7PzkJkeDe9wAvXCL9dOGDk=;
        b=T1pQwVGfD5Kldk766U1mPfGtAOSJk/XGrsb4ZGdKviY0ja+oD6V6BfUIDk32M/g3zx
         6dtrqch0wZlf64E8mvtLIEm+Unqq4Neu3BuHFu5J2JgGDTfBV/OTgGxDZgKzOQfOr+es
         ic/Q6h4G/n26p5tFmioIyaSCj0rdmzC7Bx9z+jzryODqpnof9MzO6xsGMjD/LrVtDf9V
         bUjK4AzULBeJHI/lzUPVzfBMeKH9/KFPvHApGgItEMglgbpb0QQc3UzPZCmL1C12Dflj
         yD/nFotXnZQdMdbzRe8w1VnHDqjsIspGoYlPSHqFaJUaN0+nVqOXvzDdBL4QGBh4zBFC
         HekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/mGY3Uo2VAImUz70MSPRw7PzkJkeDe9wAvXCL9dOGDk=;
        b=cB4CzAlxAT6NIsiC+MTreIiMVWoAUdkNs2Ydpvv7SmJQgBwpKfZVaw2Sz9cpICCqnh
         YiWiZzUwBCluXyw2xIurpvAoXg8W4GaCTMHVAzFo84W7NtvbsfGqSXvAnCa6RFzS9PCV
         e+tjYAQ6LknlbKsoHAuWPuHSk+jza6TCObHGXbU1kap39eUk96lkYkBNVc64hthsQGjt
         0oYJseLGk3W+atw6gVAgBNO7RSgfD5e7xzrR0z5kuThS73ATMC80ma6N32hLn+dAZBdK
         F1OZkkJGzpjUVCH+geoE2wfLVVhtBlROjlcaD8vFgJuk9Z59hF6605JmKFBcTMy0BB8N
         hk9w==
X-Gm-Message-State: AOAM532CBh56gvCTcvrG1+LUzORHDzd8mBw0FpjZzpcAufFFMMRFxViU
	oBI2LCl9kTJHmbLjxI9HpfA=
X-Google-Smtp-Source: ABdhPJy9knRq/sERUn+zCoBZJKpozxtvAxIRvQOHNMi7Sem49VT5Pe9LGtHQQB7PI7vU0T0L8m4+fQ==
X-Received: by 2002:a62:5209:: with SMTP id g9mr3807323pfb.287.1590582245078;
        Wed, 27 May 2020 05:24:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90b:191:: with SMTP id t17ls75142pjs.1.experimental-gmail;
 Wed, 27 May 2020 05:24:04 -0700 (PDT)
X-Received: by 2002:a17:90b:693:: with SMTP id m19mr4855345pjz.125.1590582244348;
        Wed, 27 May 2020 05:24:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590582244; cv=none;
        d=google.com; s=arc-20160816;
        b=Nqo7c4MBmovdn1mBIBcbP+JRH+w91HnH/63Ee9roEN+6BlzQtW0M4kJwJsNLt7du96
         kAB0zkl726ZetRzBrRZZ+UKGNA5m/24CDfE87jQYowmnoXgN5dc/IUQhBNfxG6gtdlSq
         e8XnQbRvahXUNTWh8QZtC2GxDPr41jf1E3IeiToII9RDUTakXhPGvkZij1uYDW0GBrxs
         iu1HpCOM18ajQvWS0vW6qYjJstDtKCvc1/9/VUqOE666wVGqtiYowG1K16sFoeJsQuLV
         uwl8v17umEivJCrcIcdP/zrUvhH7X0ncybsJPlA0rOVn+2N+vg1XcrhHxFuTZ3EPXzsz
         jX9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1TsHInvso9MpMvpN1+A6+e9O/WkNrgVaw1QMcgt0Fsw=;
        b=alGdQe1rePuOfagFCKXpGCmGwiW7v6ilghFLNNoe8U9rUDIZgZDRidf1gQDBYCgw61
         y+Da46UVpO4SV42dBggBd7YMspKKANAyA83wkj9+xDcLVoE0mj9CKzVhW/FlSC29FBWv
         7h47yRzb+VkpOyec/++FtR8FWubsBFl75SViqr4TaVCwv54iZCuLKMA7C68nJdPK4fqz
         Cx23pF/FrZRjAbx1tY8FsuxmCks3DynAhVkHRpGSKNvYaO2QbR1V36AwU5Sv9b2NNnwF
         wZCL6lgzXXyviRu6Fk82xU3bhWdlzX4zailBjMDm2U7YOCuFCJYDi71ub7BL3i/NC3p8
         Pj1g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bceLkILK;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id q12si259454pfu.4.2020.05.27.05.24.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 05:24:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04RCO3uE122647;
	Wed, 27 May 2020 07:24:03 -0500
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04RCO3j8063279;
	Wed, 27 May 2020 07:24:03 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 27
 May 2020 07:24:02 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 27 May 2020 07:24:03 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04RCNxM1076356;
	Wed, 27 May 2020 07:24:01 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v1 1/5] configs: dts: k3-j721e-evm: Add pinmux for main_uart1
Date: Wed, 27 May 2020 17:53:54 +0530
Message-ID: <20200527122358.14723-2-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200527122358.14723-1-nikhil.nd@ti.com>
References: <20200527122358.14723-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=bceLkILK;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200527122358.14723-2-nikhil.nd%40ti.com.
