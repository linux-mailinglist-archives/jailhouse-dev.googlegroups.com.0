Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBOFM7D3AKGQEF5ITWTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x740.google.com (mail-qk1-x740.google.com [IPv6:2607:f8b0:4864:20::740])
	by mail.lfdr.de (Postfix) with ESMTPS id 856501F16DD
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jun 2020 12:43:05 +0200 (CEST)
Received: by mail-qk1-x740.google.com with SMTP id j16sf13927215qka.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jun 2020 03:43:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591612984; cv=pass;
        d=google.com; s=arc-20160816;
        b=OPbRDDx7wzkYu1lPEf3ejKZpCwV53p/UQgxukprIRnIzR2Bi5zHE7C/BOrLqSo7H81
         leKFYor1CpVoBdZqQSE9rA9xSPRMphZccmUmkmTcEwiCSdUQhSXtLn0OaGKs3dW3q2a1
         qCo3gB6u2JNNMKAnVCVuMdisnjiWeU81gaAkRpXNMUpL+Hukp5CuMrkr8sPZirLbqycA
         7wQ///OCiu865ltQX1FNqTDnSxDiXZpar7eQRVVxjHRENDss6OcA7jFjk5sILfWTm/lo
         /GYLuPP3/VlR7KJAhjU0aw5fU9Q/5baxWFXIYBnyHpFChCt0DAR08YtL849BZLvkTSjX
         z/lw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=v0eWQTx9ELiDmVO/PhF947/3aV6h5p4n0t+QGjedfzc=;
        b=fMuW0+d563T1X+WxGDn0Jr50JQGqB0o4mKC282QU+9nmSCUjNNerppHb9v2nBfGqy2
         ddeFO9xyLwz9/8ZZA6i1iL6drtiiS5iJMzx81msVAXuvHiVOn17T3JI7/yqEszFWQfBk
         N9Kn0Lb8ruTuIy7IVw+l/E7FADC2ACPv9f9ujVDMAh9w0/tFTQ75dgNGhzN6m+jQDA8w
         jHhdkjLkO8MCGB8yU0quH7N47A3BrxMhBhp7x8XPHTWNw/2tzD1hSIzSsKGIyIuASyJi
         /buhg6h9oG3tcnmQxIsmKTLJN9TjK+kptSW+bgq/StZA8pu0qpdCP+gyMXhluCqST2Za
         wMcA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=i4BmCP51;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=v0eWQTx9ELiDmVO/PhF947/3aV6h5p4n0t+QGjedfzc=;
        b=d8o3YVeuo0SDqf4CHiGJeLAdOpUO6wXnklfHTbEgOym+3NwxyPg7wFrQWorTTrgUjJ
         e9ZroiKIbN0MCBnV0gnMDPJHGupqlssEuSz9QOtDFd6ZT4rEw8LP4bkO8b8kREl0NLTk
         jFxHyuuWRzpaGR1Sp0hNcGVvWlM8yRaVW/2PNlmJ6fTIsrK1DyAViQjpdMRc8gzXLF0s
         z6W8n/J91Dp1I+8H2wPTY32UIYdRzxFPPB21AzQpGwrsWShcPbcOuH6CaqcOYkCTLw7Q
         +eRMOuFOr3oKWEDkoaW385K2dL3IPyQttsjtFM3XkqrCjjC7NrKqTyIKUHR9dh8FYhyQ
         qiLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=v0eWQTx9ELiDmVO/PhF947/3aV6h5p4n0t+QGjedfzc=;
        b=R4fufzaDBtbUOw/M8HPpIaJHKW0WBVho1dKPrC04q8lZRMl7ug6eimciyOTMshMA6L
         ND8bmuWnVC0TMfESgfnpcpTNnnFOa4LeYLbDMSCxJZNaRVhP9JfvOQt3bTlIDLOzTUt2
         yrq+jb+bApC1TR03G6pmjDjLrEFBsbuAQVSfq9lfUmP5CI6m36Y1PcqwhdHEsvV0wmvc
         nQEwtQoAS4WGnrM8DwsewqiBQOZ1pFj7uNewus3BR2aaXehoOC+Dv6vpM73Qm/VBP9pb
         k3XXcBWsx8OacYHihlXKc7o5R+VPJli/4YmHEkKu9ZRKmaexUNcofVk5Smf9rrYgCfbc
         KU+Q==
X-Gm-Message-State: AOAM533tmq3hx3FHgNXkh1L0OFtfTD++74U1wxlGo00eAg01/H0PPyp6
	1MNuyqh3aiCIXcb9V8m1Z9Y=
X-Google-Smtp-Source: ABdhPJyEaoPBFZ0SY9kIjp0tf0QYc+QJpfZK/H+l59Nx+SNNIOnqAo6mCpSrS/kvNqnsKRDMyYG5Sw==
X-Received: by 2002:a05:6214:1e4:: with SMTP id c4mr20445270qvu.172.1591612984558;
        Mon, 08 Jun 2020 03:43:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:658:: with SMTP id 85ls7357258qkg.4.gmail; Mon, 08 Jun
 2020 03:43:04 -0700 (PDT)
X-Received: by 2002:a05:620a:2290:: with SMTP id o16mr22267288qkh.205.1591612984150;
        Mon, 08 Jun 2020 03:43:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591612984; cv=none;
        d=google.com; s=arc-20160816;
        b=XuNNlzyfMNigcd2NhjebNE9fQKtQs7lHnESnKNDf29kJsB+eRsQfs5sOlWnYdGUFru
         XtQTGrz7jwDGIrsoi1r6Z/hulX1+bq4PS/dbPKQa79H42BdvtGtpjTQi7wD0/g6jKC9b
         ivMN5Mt7puEjclxFm9vhOZOttbPPT3pq/T5WNU1N/4fOroKbLL8Ia0qhKWx9blag6dGp
         F/mh76gmYyKypqTDY+1RziuU0aGW+7cQP3GxJdelFAqcaEkHazn051YlkymQyHRXghg4
         eTrGW4rbQ3fVsfsPzbarbIq7rlGNgN68HR8VkoKCBMV1XIV9u86QhVzjKMpIy9TgqMxq
         vbnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1RFAD6lx89bah71CZ4hl0FJTxkwccvgkDj7Pbmc5jlI=;
        b=Z3LgYzZ8E8VCjQHym+r3eKv2YJR2qcOPWepQoDn++k0REGIhDUbURz8H3b4s+osyf2
         vrDAsIcpzV2p48RsLeLHagrK2tkO6me0jgD729HUlNu2wTfefEuoIlKCCH+FCJf73VU4
         itlwU7Q+d7AsQMHHdDNh8SrxGhAJOsG5yVXtBTkYvQFedgqiM7HYcSgU7bLe/HHNG8EQ
         JMqp+Ua/UuB30FrvTCOuqfiPOWYqQg8bOe5u7db+qixSAtC5n65S0KwDHcMpRnrqiIuW
         QLtcFzz9wuwT6+UfCdL/yoozdyl73iXReoVetg5cZtoR6OPyfAmJH82/UXfS0ERKRy6/
         7z/A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=i4BmCP51;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id a72si237761qkb.0.2020.06.08.03.43.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jun 2020 03:43:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 058Ah3OB119860;
	Mon, 8 Jun 2020 05:43:03 -0500
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 058Ah2xJ046503
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jun 2020 05:43:03 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Jun
 2020 05:43:03 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Jun 2020 05:43:03 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 058Aguh4012229;
	Mon, 8 Jun 2020 05:43:02 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v2 3/9] configs: dts: inmate-k3-j721e: Increase range for PCIe aperture
Date: Mon, 8 Jun 2020 16:12:49 +0530
Message-ID: <20200608104255.18358-4-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608104255.18358-1-nikhil.nd@ti.com>
References: <20200608104255.18358-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=i4BmCP51;       spf=pass
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

Increase the aperture size in the IVSHMEM PCIe virtual
controller to with the 64k sized BARs.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 configs/arm64/dts/inmate-k3-j721e-evm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/arm64/dts/inmate-k3-j721e-evm.dts b/configs/arm64/dts/inmate-k3-j721e-evm.dts
index e2348590..ba4bbddc 100644
--- a/configs/arm64/dts/inmate-k3-j721e-evm.dts
+++ b/configs/arm64/dts/inmate-k3-j721e-evm.dts
@@ -125,7 +125,7 @@
 		<0 0 0 4 &gic500 0 0 GIC_SPI 166 IRQ_TYPE_EDGE_RISING>;
 		reg = <0x0 0x76000000 0x0 0x100000>;
 		ranges =
-		<0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
+		<0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x100000>;
 	};
 
 	cbass_main: interconnect@100000 {
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200608104255.18358-4-nikhil.nd%40ti.com.
