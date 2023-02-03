Return-Path: <jailhouse-dev+bncBC4ILIEFEIINNYPVTYDBUBEJCX6V2@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x239.google.com (mail-oi1-x239.google.com [IPv6:2607:f8b0:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C42468A3A8
	for <lists+jailhouse-dev@lfdr.de>; Fri,  3 Feb 2023 21:38:48 +0100 (CET)
Received: by mail-oi1-x239.google.com with SMTP id o206-20020acad7d7000000b00375c9d6b919sf980007oig.4
        for <lists+jailhouse-dev@lfdr.de>; Fri, 03 Feb 2023 12:38:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675456727; cv=pass;
        d=google.com; s=arc-20160816;
        b=xSDRwnSd3ixA16C3P4YXL5BJI1JTh55HjHi8L+rEebaLX7Bt+IsyfcZKqLVYwH9UdS
         aoGN9FWK9YOHpRZV4iyXOnn0qlVtAbDFQW7LJwbePBjJ4VRUoQC1El7YfYI8j17Z7FzR
         nRsPlWpm8IEJrCHvRhDYLDwAaYTG0td0DqLv13GZ0AApvKIMUa+MrUyTQljWUO76Le3P
         NZEQKVC6YACVCAqnGhCzpk1nv6GPmdr7ivM5J6rLU1TgY8E2997VlXTMJOPm8EChFily
         98viztEdPB8t0YaRvb5629bIHyrcvz3Ql5tq93CrBLBw562wV+cmXv0nbVg5JgNePzqv
         04AQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=PhNKsyHZCQeh2ITW2o5A98K6TeE+/IkzyFW+hd822PY=;
        b=ylFg4ncByo51oxHTxH0fEEL/001DJrPzN0CnPcOWR/SGfIbMPEbx64cPW00PNktEAA
         dk9WdjWIc/5VZHkkkyZzCr42c5+hZSWXnmD98RRIBJZiw8NqqtIccAMPA45KkQmo2sOx
         pNNBP1CI1A3ArHgTX2FuXhpADg5wxT1O09qAOi/+sTHSKx4PLekHqbePGsCf9nWIYs0t
         k2T+bnHyhasIITvMFfN2NsO32+C9KrYmmOzzqpQe9uY6Jjf9H80LlQ4Z1be8QRWgABI7
         u2jEq4LZ7xc3dJUXo2tmACrAzsixNsBgE/eJ0vPYyUnTmgWs7b2pOoKPnPN7XBYuu+U7
         fYAQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@foundries.io header.s=google header.b=YOOZv6G4;
       spf=pass (google.com: domain of ricardo@foundries.io designates 2001:4860:4864:20::33 as permitted sender) smtp.mailfrom=ricardo@foundries.io
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PhNKsyHZCQeh2ITW2o5A98K6TeE+/IkzyFW+hd822PY=;
        b=qMANrAsX860oAPfEsY3R+x/wYtgUBTMZ64DJoZyyv1bH6qgLOQ5ox8lkV6znEfEuk4
         GciVCEEfp7wNH95v09LmdAkTzleI+kcPndHdwfeudH81a39U9g1bLr135ydqSK//yHh0
         ONpAuK2nNBIoGRKu5YwxkmzuCBEaofL8peesma05ROagYUxZ3jaeX078X/sPnZSJV6B9
         UX6Qom0a0tz2a7iUK40YwlDuHohn2/PpzrJvAkEIRANxbsz2tuKQpfd3T5bJqjgTdN/U
         P+gMUpWZLYSK4SybwtqaaXVbyZ1nrOPWxWBlqTu3tjIMMb0w1s4qPYK6rHmDYJP72xpw
         ms8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PhNKsyHZCQeh2ITW2o5A98K6TeE+/IkzyFW+hd822PY=;
        b=wYo7mVdt2TnQBI17VyfQcMil3oR27RkE+TCd3nta0/uQNIwF+22/BTAP92VXd0QLKl
         r0bPcBdUo389FSv7Chk8+VtCwnNMFjxXErRUTFFq4dlRJV3xSCAP8fAySpklZ0D8t2x2
         m13ALPn/4wg97N80vFGQlQdvKnmuWOKtE47ZQWS2XSFQQgaiX5yBrWk+9TaYB5UkT5Kt
         odTnYHGPnCAMs1WSOCP1uPtsQqVlFjOuZWqJIaiYna3SwrjxZEqFZrott1I1+SWWNBem
         He0biCFTZHvpMTaNWC/mdC9VNxZN45g/j6tq12z/gXklQR8FP54bZfPFWjyqf/w3QE3C
         RdQA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKXsPFl9teM0ne3hzlOFqT5ioLw1MyJggv4vvG9vi2GxJvLVM7Ly
	0i0DpxQZXWARtSc0ohVlGCU=
X-Google-Smtp-Source: AK7set846xPxjPOp6b9otGa6KW6kWVRmmj05BpzUdJ5JsGjcOfcA5VWVRKTu7HMjUvfAa4KD0IB4QQ==
X-Received: by 2002:a05:6870:f284:b0:15f:cec7:932b with SMTP id u4-20020a056870f28400b0015fcec7932bmr736557oap.29.1675456727183;
        Fri, 03 Feb 2023 12:38:47 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a54:4389:0:b0:37a:fb5a:bdce with SMTP id u9-20020a544389000000b0037afb5abdcels7102oiv.3.-pod-prod-gmail;
 Fri, 03 Feb 2023 12:38:46 -0800 (PST)
X-Received: by 2002:a05:6808:15a0:b0:359:c6f0:5086 with SMTP id t32-20020a05680815a000b00359c6f05086mr2948124oiw.56.1675456726522;
        Fri, 03 Feb 2023 12:38:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675456726; cv=none;
        d=google.com; s=arc-20160816;
        b=RQ6JJlhgkL4OZelf1weczRl8GiOChyIjJr7X5qYuIGM1YpyhjzbM0heF/IOl3nxJjk
         hpYHjhyxenX6/kHp25UAD52W3QyZbbZgu8/tQFrQSioWhHsn7VRk3VqFLENXnXEAiFp3
         Mez2zw0+JYYlOkxzChNuUNoRpAuo7Znlojs+9nVSla1QuVkUv5AD7fKn2cV96zkG5KmP
         0K34w7q2dd/D3QOMuBQmVcMgtVhqNnCbN3FfVeIEVAsoIuokxJ/0ZusP1qU+Gv8h90BA
         Agb5RxXZB7X0SqZUklriI8EpFeSy4gsLImaCfO7hL8fuPlpzTGchWetgVoB7LeijOfut
         U8zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=E8+sc5/JFfNUj7MohlXrbhWA3ZX7q0RAWK8GYiXFBWQ=;
        b=K2AJv8e4jbj1Kxr0PoDv5XsHVBoXZ501OYZe48VCGqWSOiZgemS+pKk5cd6mfnyTXo
         61Bq/S+AfyU1Jn7YSMJVi1FnReF4ijuHg2uWWc0M3v0k2WweutDphCDh9OtAeKXNkmAP
         L4OcGnJJo0F0oRmj+NjMnLugTVw6SeIdXQ2f9sDSMAxF0fn3w2vaDX91labfRJg21KlU
         L424/HLz6WVLMkiP98/vGe9ReNNajLnwRLil/8peUCdHRRONGWrvt243HkcObKQbtXFX
         czPO3e1//wdocVlz7FOCu3I5yGYRZSd5ez9bDixS82QBMgFgMAalEqivY5ZdNV/Py2JN
         WOZA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@foundries.io header.s=google header.b=YOOZv6G4;
       spf=pass (google.com: domain of ricardo@foundries.io designates 2001:4860:4864:20::33 as permitted sender) smtp.mailfrom=ricardo@foundries.io
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com. [2001:4860:4864:20::33])
        by gmr-mx.google.com with ESMTPS id bd25-20020a056808221900b00378599bee7dsi466724oib.2.2023.02.03.12.38.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 12:38:46 -0800 (PST)
Received-SPF: pass (google.com: domain of ricardo@foundries.io designates 2001:4860:4864:20::33 as permitted sender) client-ip=2001:4860:4864:20::33;
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-1636eae256cso8135990fac.0
        for <jailhouse-dev@googlegroups.com>; Fri, 03 Feb 2023 12:38:46 -0800 (PST)
X-Received: by 2002:a05:6870:c69d:b0:163:48b1:c16c with SMTP id cv29-20020a056870c69d00b0016348b1c16cmr3114191oab.18.1675456725241;
        Fri, 03 Feb 2023 12:38:45 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:badc:845d:dfac:d1f8:a7d2:47ed])
        by smtp.gmail.com with ESMTPSA id k7-20020a056870350700b001631914e41asm1197748oah.33.2023.02.03.12.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 12:38:44 -0800 (PST)
From: Ricardo Salveti <ricardo@foundries.io>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com,
	dannenberg@ti.com,
	mranostay@ti.com
Subject: [PATCH 2/4] configs: arm64: k3-am625-sk: Switch inmate boot console alias to serial3
Date: Fri,  3 Feb 2023 17:38:29 -0300
Message-Id: <20230203203831.46311-3-ricardo@foundries.io>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203203831.46311-1-ricardo@foundries.io>
References: <20230203203831.46311-1-ricardo@foundries.io>
MIME-Version: 1.0
X-Original-Sender: ricardo@foundries.io
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@foundries.io header.s=google header.b=YOOZv6G4;       spf=pass
 (google.com: domain of ricardo@foundries.io designates 2001:4860:4864:20::33
 as permitted sender) smtp.mailfrom=ricardo@foundries.io
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

From: Andreas Dannenberg <dannenberg@ti.com>

Traditionally the serial3 DTS alias is used for the 2nd main-domain UART
on K3 devices so go ahead and update the alias and its usage accordingly
for better consistency.

While at it also do a minor cleanup of the UART's DTS node to use the
TISCI standard definitions as used in the corresponding Kernel DTS files.

Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 configs/arm64/dts/inmate-k3-am625-sk.dts | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/configs/arm64/dts/inmate-k3-am625-sk.dts b/configs/arm64/dts/inmate-k3-am625-sk.dts
index c1455073..8e1bebb8 100644
--- a/configs/arm64/dts/inmate-k3-am625-sk.dts
+++ b/configs/arm64/dts/inmate-k3-am625-sk.dts
@@ -1,6 +1,7 @@
 /dts-v1/;
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/soc/ti,sci_pm_domain.h>
 
 / {
 	model = "Texas Instruments AM625 Inmate Model";
@@ -10,11 +11,11 @@
 	#size-cells = <2>;
 
 	aliases {
-		serial1 = &main_uart1;
+		serial3 = &main_uart1;
 	};
 
 	chosen {
-		stdout-path = "serial1:115200n8";
+		stdout-path = "serial3:115200n8";
 	};
 
 	memory@e0000000 {
@@ -91,9 +92,9 @@
 			compatible = "ti,am64-uart", "ti,am654-uart";
 			reg = <0x00 0x02810000 0x00 0x100>;
 			interrupts = <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>;
-			power-domains = <&k3_pds 152 1>;
-			current-speed = <115200>;
-			clock-frequency = <48000000>;
+			power-domains = <&k3_pds 152 TI_SCI_PD_EXCLUSIVE>;
+			clocks = <&k3_clks 152 0>;
+			clock-names = "fclk";
 		};
 
 		pci@76000000 {
-- 
2.34.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230203203831.46311-3-ricardo%40foundries.io.
