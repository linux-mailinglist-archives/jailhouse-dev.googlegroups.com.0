Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBJVS2OKQMGQE7JXOEQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id E4324558A99
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 Jun 2022 23:20:39 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id v125-20020a1cac83000000b0039c832fbd02sf1985770wme.4
        for <lists+jailhouse-dev@lfdr.de>; Thu, 23 Jun 2022 14:20:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656019239; cv=pass;
        d=google.com; s=arc-20160816;
        b=UCmJ49iPGvjKMENMC6DZs+dcARoNudOM2ZtivEJqMEwa755+3AmDzhLkjyH27LMkI0
         nJ7G3ELtchZhrcPCvF+ZaWamX8WnWBeoUU6j5Ji7S2+r4cxvbYLuIxTAKqDJ0a+Q+9NU
         BSbl2D2u2QWJMD8E79WSUkob+0TbtTDdutMiSVVAaupjuLjiC21XI5cIjjAgAKx1sBm3
         XassmPQoZuCpVN7HO56ggYEMsXz90PAp+dU0siTBmtlxwbEmLTDSERjiWUE/4PLj8fDN
         2jANQ7c/mPAS2neNMyleR1JGgmbWq10D+t+jJc5l2SSi+SfMBrR7GzT3+9CLGGNFST3Y
         ms0Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=qnAXvGXJggxCc3epn+IVDgQ/N7RZZNz2FpPQNJ6FW2c=;
        b=vzGVewMwmBC9bWy5FleOwsZhfref0en6AHayxpb8o+NId/pkSf+W3n1fLnQyOeHwuL
         Ly/rtelWwwQ7l4zFbD3ytpGzDn8ZszfcNmo63P2tU3Gw4ZhT4spyoPPntGoj4Eb+PLNh
         Uvk1mCDBtcud+EkvGEIRP75a3Ccp0k/SCKAu2fSWNXdiUxiqmVgPJr8hRP2lZwskxHB1
         ziZoOgAIcb/DWOVPFIuTq8vK2FjRSTuqPOgRoxrQI8wCLI/lJcPZh3TpXqgCqQM28lSR
         mHcMl4WalFal+eGlJm21/0/4BNmPWWOy+fcRvV7rid8/y2p9FKy27FHo8Vl2abd87Hku
         NY5w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=jBNfICRg;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qnAXvGXJggxCc3epn+IVDgQ/N7RZZNz2FpPQNJ6FW2c=;
        b=Bj5/g2SeEYv/hEvxtfSk6OIbr0rx83CPfV6x7mMR3yskfWewxvtgIe0ePXZJNgJJC6
         YiraZOqwNcdhRa8/P0ZorwFbd7cfVhG6ChP3/lKTah1FSUwXibbWkHomQQT2GUt+9nvm
         xqcIL+C7+JY2toK5Nh//3pu43Frp0ntzNZvVtzwTl5AibK/tpj68bD1nTpSl+b8yWCP4
         5oowwHufZQ0zXJqGrWHjLkshHD1s/A18rpwzTBmt5msavA1tjuE/m+Tt2FuiI82S7fyZ
         GCKi4rJVrGtyTio3AB6Y68HaSImjK9kufy4/ETJVuQFpgB/Obbp/PymcP6zcI1Z+6K3O
         Z2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=qnAXvGXJggxCc3epn+IVDgQ/N7RZZNz2FpPQNJ6FW2c=;
        b=izhWqmkP9fj88KI7tXKY5MAyJjczjmDj7wWVg5wNBp2Arl4sXW7+4M8nA2vysS2aSA
         vis6RK3Npc/rvsClST6F1MtHe/QN/eVeeVnF5V9XsV3WMeIWF+quxYLrc9vsLKByC1G5
         7oZA7DhcUeqGGivp/k67IMCcRlsyOnS00mFg4oRW998TZEasPgnRMEbCI5cfvoqkhZsV
         yQhAPA1uIAka//gz5wX0bcJbzqT+yQJcttY86De7pmxSFJdpTpKX2st8mgDPGQl29WCz
         P0Ml9J+LAd0thxA5pYe0rA9+zub7pJvDbbaJLGCWlSMa2euVSg0OXL+LU5/uUtFzW92l
         skxA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora+x3Fc9iuhdPOvb4sNeY4nXZAwtMecEbdFHewZNdDDLpMv77q83
	FQIbWmydpNRh92ekNgB/fPw=
X-Google-Smtp-Source: AGRyM1s/IBmtOnm2EZlN/USjcBV/K/tq3HOtcl/6bUH9I2kVAdB+k8lUHDX/uu9CpTm/OwfTnpUTbw==
X-Received: by 2002:a5d:588d:0:b0:218:4d0e:b89 with SMTP id n13-20020a5d588d000000b002184d0e0b89mr10163271wrf.58.1656019239278;
        Thu, 23 Jun 2022 14:20:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:1887:b0:218:5c3b:1a23 with SMTP id
 a7-20020a056000188700b002185c3b1a23ls6695592wri.0.gmail; Thu, 23 Jun 2022
 14:20:37 -0700 (PDT)
X-Received: by 2002:adf:df81:0:b0:21b:8b8e:4997 with SMTP id z1-20020adfdf81000000b0021b8b8e4997mr10180745wrl.118.1656019237707;
        Thu, 23 Jun 2022 14:20:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656019237; cv=none;
        d=google.com; s=arc-20160816;
        b=FH6i3EMq+2YajdQCG0Yuz6J+woQhbOz+niZAE3tJ1vnk8V32RICL1ZWUrDSzVrcVGk
         3KqFm+PMcQ2E0qhC1JVYgspjNmUNuwIFbw3nIFW/UOmCaW6qVkMvXOI+CxxWgkdV1TY3
         ST4HbRMf01EtDlr3/vAftEXEmN39N+8Gjw7fdT2B6wvwkWRCPAZUPXygDR9VslI6uF+r
         hiXHxEKZFVBWTgcWKXtfGq3bCxQuEJWkNI/cN7yCCPtclhNgNeesvIFmqkD/oxKtt8HN
         tWd3Xo0GX9KdhqwEo2Bs71N3ogfU95RMNAYT4/LgQXhjQwbxompTAsXhxerOn0OeB1Q/
         k9PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=q458GXxpecfITYEcUGWTHQ1nxRi4mPYZgUmjnfEbFUk=;
        b=H0Dy/4yUpK4nP3XuFzH86dYv8uCCJ6c8WNuxSJrF6aCl15mVNzVpcq6Q8wcGplr7xd
         Lf/Ip14OVklIE3reJm0P4rktYZvRw5gWpqaaKbtcZwdtghU8mpPuTdj50QFlK79bw97I
         mfpueaQ1yVQUvIa3XGGfHMF0+NKcB7ku1ysTuxPTLR+id6ZbiGKexYE1ySanLo5TQgzk
         bAM8YgjuHO6IenuKRdtldy6vON4HgUp1uapIm/JSflaAZ/UIKYr7/R2ZXEUEeisXiR5V
         x5xFUhSnJJIZssNPK+O//U71pBhB/Wyb9CD67Au3lss3JPvUqv0TJz04/MGnBWhsMBJ7
         9kpA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=jBNfICRg;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id j19-20020a5d4533000000b0021a3b824fabsi23199wra.1.2022.06.23.14.20.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Jun 2022 14:20:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S04.hs-regensburg.de (e16s04.hs-regensburg.de [IPv6:2001:638:a01:8013::94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S04", Issuer "E16S04" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4LTY7n25FPzy4t;
	Thu, 23 Jun 2022 23:20:37 +0200 (CEST)
Received: from localhost.localdomain (194.95.106.138) by
 E16S04.hs-regensburg.de (2001:638:a01:8013::94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 23 Jun 2022 23:20:36 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Stefan Huber
	<stefan.huber@oth-regensburg.de>
Subject: [PATCH] configs: arm64: qemu: move virtual PCI controller
Date: Thu, 23 Jun 2022 23:20:19 +0200
Message-ID: <20220623212019.150691-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S04.hs-regensburg.de (2001:638:a01:8013::94)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=jBNfICRg;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

With recent QEMU versions, the GICR grew:

$ cat /proc/iomem
08000000-0800ffff : GICD
080a0000-08ffffff : GICR
[...]

Hence, we can't place the virtual PCI controller at 0x08e00000 any
longer. It will collide with the GICR. Move the pci controller to an
empty spot: 0x81000000 provides enough space for the controller.

0x80000000 can't be used, as it is reserved for the commregion.

Note that pci_mmconfig_base must be within a 32-bit range at the
moment and can't be placed at a higher address.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 configs/arm64/qemu-arm64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/arm64/qemu-arm64.c b/configs/arm64/qemu-arm64.c
index bb3e079f..f4e5d378 100644
--- a/configs/arm64/qemu-arm64.c
+++ b/configs/arm64/qemu-arm64.c
@@ -40,7 +40,7 @@ struct {
 				  JAILHOUSE_CON_REGDIST_4,
 		},
 		.platform_info = {
-			.pci_mmconfig_base = 0x08e00000,
+			.pci_mmconfig_base = 0x81000000,
 			.pci_mmconfig_end_bus = 0,
 			.pci_is_virtual = 1,
 			.pci_domain = 1,
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220623212019.150691-1-ralf.ramsauer%40oth-regensburg.de.
