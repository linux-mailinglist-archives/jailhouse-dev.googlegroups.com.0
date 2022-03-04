Return-Path: <jailhouse-dev+bncBDOPPN7U7ANRBB7NQWIQMGQE6VF7ZVY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x639.google.com (mail-ej1-x639.google.com [IPv6:2a00:1450:4864:20::639])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7B14CCBA2
	for <lists+jailhouse-dev@lfdr.de>; Fri,  4 Mar 2022 03:16:40 +0100 (CET)
Received: by mail-ej1-x639.google.com with SMTP id m4-20020a170906160400b006be3f85906esf3702483ejd.23
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Mar 2022 18:16:40 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1646360200; cv=pass;
        d=google.com; s=arc-20160816;
        b=HUDAKiHjxdduWaXmFOnwDF9Lo/rZXoXmhPNRno4+Z7BPfnJKxQnr2P1ZQx28+GzIcI
         McZ6WB29LEOXJYYBlAeNT6H7ufHCrT4SF62syzuZbsp9/XPGdvSyc7eLnIFFMdRx8Byw
         20w9f2n77bpufolFWU70MbCDdXdBOd46VusnL+fkYRt3IrOJj7vPxGpOCd0EbSy+ZVZk
         BCH+G7ETnYr+tX+c8w2pP7z0cFMKlqZdCholXE4jF9zey36Yaa8AcESwPpMLsSFofXYk
         63nBtfzlsxf02v8Wi4o92+SlczVmu8FyHYYAbxmjE/zDtf1coE32IXThpPNe7JvlR0tO
         0p4w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=8TKl71bWTry/YWgVnj28BY3loK9rsAw+WMnbwwr3pTw=;
        b=CBoRpCqQsJ9MQaTQWK2bnwuobbowXgY566Hz4AqMk1V79+loz2ORpEGYcHYSabaFwP
         eC57PlCBiS8DZn18v61fCb8GmPP0C7vFyx33oAMhS3OR8OisciPxN+1aQIzgH6IAUV8O
         fxMdWhBTp+eFdPMB/WmWN6gb9GHveVJcB/tBVRxE2SIfYS+LFkC0zzaWo9wu9Sjtvs4M
         KXTRmxWhIstQabEtVXConl0GPJMiMq9lmkpewIBmOUUKElU22VRRcIz5SLgx5Joxii8r
         CtUaa0KmM2FGv4TaAaR6K5HNeLl23pada9eXeGjgwQrz1+Je0ga1MOIvA2p0uQyrvi5v
         OGxw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=kWz3rtmX;
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=8TKl71bWTry/YWgVnj28BY3loK9rsAw+WMnbwwr3pTw=;
        b=DJgqkJhsGgOHCJZz41x0U8pmQD32wtaUyUtDZQWGbV4bjQGhI/RNBwKGWfhb0Z4ls2
         XR/CCAd2yS62JD6lWu4up+CsiiZL07T6aYiAqeLBXo+EemAGx5XdBP37JiD+k3Fz0HLJ
         04erq8aZseHAxuxwhpIDYocK/vIyJm/kSph3O2Q/ViwVyuthAH/MPQ6WwDFrVmWDTZlQ
         wieqnxjkgX8CV/rygiB92PdtrxLdeTwfri1whCrRduWW1tLyX10G546nxMm6HPrVx4fi
         R3ILXArKdRNpENdDoTWbCbto/X0DIoQLAuEXY8E/SN2/z+xwJziyZTL2KFaNLSoQtWX2
         DfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8TKl71bWTry/YWgVnj28BY3loK9rsAw+WMnbwwr3pTw=;
        b=CPWQj52sdmgJcZZPSsDF/n6t3jip0gS52XJky9VRcahv4Yuod3LqaW/MBmsJuviK3x
         hlRd7W7ObrPHlf8zB1uVkfYxFN5W9dX00+xNO5LI2M/OIT/nUI/jG4BNTjQbJdVlR8Gk
         80skSG/JGzkHD046rGI9qxGTAdhxTtHHBuE0clB3pGMAIrpkDmpgcfuAmH8J+zdwjhoa
         e5QaNKuTYr6wOD55CV2GZPnsRazgC0CG85kkPB+LMFRQd1lIrfc3nCiVfNsOW/Byt2bA
         mDWQEHVniRoWy0uIJyDWXYF4IUGvUJx3q4jb44pFGMiADhr8t+QJYpOpmDVLt7ApfXoM
         lPLA==
X-Gm-Message-State: AOAM533rMxjo1328iBXSxVDSfKWgNA6CQ0MT6U7UEl/pm3qxgJsgOAxk
	KeWJ9IHNQ12fMG9eMzRl69I=
X-Google-Smtp-Source: ABdhPJw3ZdAwbS91413BRZM7dbenx8qkvdhHMu/bMkK6suQXwSa3/pVaZ3uDplOxoiwROkSTnRRt6Q==
X-Received: by 2002:a05:6402:2546:b0:412:d0eb:2a4a with SMTP id l6-20020a056402254600b00412d0eb2a4amr37755326edb.306.1646360200225;
        Thu, 03 Mar 2022 18:16:40 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:7e0e:b0:6d7:d34:3fc6 with SMTP id
 e14-20020a1709067e0e00b006d70d343fc6ls2346457ejr.3.gmail; Thu, 03 Mar 2022
 18:16:39 -0800 (PST)
X-Received: by 2002:a17:907:97cc:b0:6da:a8fb:d1db with SMTP id js12-20020a17090797cc00b006daa8fbd1dbmr2428115ejc.267.1646360199091;
        Thu, 03 Mar 2022 18:16:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646360199; cv=none;
        d=google.com; s=arc-20160816;
        b=JHhUlgdf79F9NFnuMT6GGQ6rVOEMi8dUqDgusHkHyDLlyWCRV/1tQ+SNzzDBLLYYv5
         OOcfXYV1q+oT+OJ88yM7awiaIjhy6knPMEUQodQiahgoUYX5THh94PN6EkV+5HsneU2X
         ngT2OZo4JYsIjhb+kdO7LWAuWxFyPWD6CEPhZsi/UsTUtzQx2BkPTvku/2lptg3a6lBK
         3ob+WL9ZDbDk/v+fPmlm6n/DuGXsrRomQiRu6LdSMks1wq/QQZRMwjeUDz2/KdOl4vVW
         dH/KUYoqdttZk/u5+A6/T/ni41JS9UNrOOtvyHHkPXGqHSK4q1CKAU/Buc5/WFJxr6/y
         Q0tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Y128Etsb9NBUQw7yL5bgj7r+ArceUZDyxDRh4KBhr34=;
        b=kOF6xwcD3uM/gdsi63FmUUCgL1rRx9kr02K4Y3sZuv74eZei5vcUVb7QDZ4KfIzke0
         8VJeQWVdOFS/repOEDbrzd/TAgq3/YfQ1NA4p4RSmMs7B8M6unFQM0KVOtcOrrS0yZq3
         IKcQS4z+pFOtIiJkRvJgVO2VLQ1wVLx+5KYx2oXrNLvDJT7wPchqIGMeKQEfSS904gZJ
         n3TWmOhVr0vWi01SfdEYTqP4RMC9eizuyhjysbOsS6P362uMGpQsBhKy1pal/ZMZMW/s
         c2krJ6orZIrYCyQxs9AHM09OyubIl1lktNGbxUBEcLxDZDKKNtZgCVnteHcORH/REqr2
         wEaw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=kWz3rtmX;
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id s7-20020a05640217c700b00415edbdf697si98756edy.5.2022.03.03.18.16.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Mar 2022 18:16:39 -0800 (PST)
Received-SPF: pass (google.com: domain of mranostay@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2242GbSK016299
	for <jailhouse-dev@googlegroups.com>; Thu, 3 Mar 2022 20:16:37 -0600
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2242Gbsc105479
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <jailhouse-dev@googlegroups.com>; Thu, 3 Mar 2022 20:16:37 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 3
 Mar 2022 20:16:37 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 3 Mar 2022 20:16:37 -0600
Received: from ubuntu.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2242GOii018363;
	Thu, 3 Mar 2022 20:16:35 -0600
From: "'Matt Ranostay' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: Matt Ranostay <mranostay@ti.com>
Subject: [PATCH 3/4] configs: arm64: increase PCI memory window for k3-am654-idk inmate
Date: Thu, 3 Mar 2022 18:16:14 -0800
Message-ID: <20220304021615.2862-4-mranostay@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304021615.2862-1-mranostay@ti.com>
References: <20220304021615.2862-1-mranostay@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: mranostay@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=kWz3rtmX;       spf=pass
 (google.com: domain of mranostay@ti.com designates 198.47.19.141 as permitted
 sender) smtp.mailfrom=mranostay@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Matt Ranostay <mranostay@ti.com>
Reply-To: Matt Ranostay <mranostay@ti.com>
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

Increase PCI memory window by 64 KiB to allow for more IVSHMEM
device allocations for k3-am654-idk-linux-demo inmate.

Signed-off-by: Matt Ranostay <mranostay@ti.com>
---
 configs/arm64/dts/inmate-k3-am654-idk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/arm64/dts/inmate-k3-am654-idk.dts b/configs/arm64/dts/inmate-k3-am654-idk.dts
index a419d8d5..d65818d5 100644
--- a/configs/arm64/dts/inmate-k3-am654-idk.dts
+++ b/configs/arm64/dts/inmate-k3-am654-idk.dts
@@ -118,7 +118,7 @@
 			<0 0 0 4 &gic500 GIC_SPI 160 IRQ_TYPE_EDGE_RISING>;
 			reg = <0x0 0x76000000 0x0 0x100000>;
 			ranges =
-			<0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
+			<0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x20000>;
 		};
 
 		secure_proxy_main: mailbox@32c00000 {
-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220304021615.2862-4-mranostay%40ti.com.
