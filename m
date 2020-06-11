Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBCGTRD3QKGQE2HHUQKI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x63e.google.com (mail-pl1-x63e.google.com [IPv6:2607:f8b0:4864:20::63e])
	by mail.lfdr.de (Postfix) with ESMTPS id A82831F6854
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jun 2020 14:54:33 +0200 (CEST)
Received: by mail-pl1-x63e.google.com with SMTP id s7sf3724740plp.13
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jun 2020 05:54:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591880072; cv=pass;
        d=google.com; s=arc-20160816;
        b=Sn7isoMREbkz9aSjKXoq3W3+BQic0rZH0fI5s/I+BvZS7Y3JcdziAUHGlpBL0wdj9w
         BKd8LqMGLIEs29h92B6/ydoG0kaO9DrzYzOdMxFGQvBrL/60Yko1ACVznf+YYq9tQ4/4
         MHDuBeONi4+PEob4H2IJRVpXRQDFlh7ZqFfMW+eieAV+5Ryu8icGoL0OWb7bd2ahKl9K
         l2/SzaBpp59uCGqVSpbjflXn3R1InDJRTF9w/dJCPgePSi+MvzedBwGM+FzQa0c7I/1e
         XwRyj4fL/k9s6niYDWi+A9X2Ny/BTqJwRtI+F43OJvoV1olS+pWwFQf5nvEHdl+haYtN
         Jr1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=RxuZX5GviUEx3GV3dLcngyAODHt/krj8ZuZZNqtyyOY=;
        b=CKaAfmnARpNAQXiU87MC+pGxpyrKAL/sWX8LOvdY+sRqQJsBfL3rgCRnfCY6tB/CCe
         ESwlaa2u/hYYJjzyPqv/y8PrKUKVtUONIPRIL1jS9VsaeW0dvavlf7HeJU0SBJrOWpw8
         rwCXzuyHH5fXmYbfG9cTOvkRM2f/Du9wRn1Sfi8N+F8D6UV998Pw5M4LrElOy9HPEwYj
         3EpZdPmcHbuhHRHoRZs3JiIQlCu1pDIi+C6q1hsTVOlit+v1/Uqa9fPmAfQpCqnDHZXx
         yKSkvJabqSLCqSVN3rSw7fmIRc/NVWdzC3dsPNV2XIHC3GGYDnVezDDcf1vz6reM6OYX
         3smw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=aPFpdRuN;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=RxuZX5GviUEx3GV3dLcngyAODHt/krj8ZuZZNqtyyOY=;
        b=SulbOW9TKckxRbOYyPtRnxvlRLjpG4xJIBOzgkprnhzq9kAt85q8Lww/RqdwzFTpJn
         v5vTktxzMwhT5TyVM1rQK31o+NZMBflO946QktHxcMXMI+fH0Ipgav7nbPAPltC3JH8t
         Lkbkf2ZNJVt5NkQ8Yq/TUi2udCvT/xc0l5T9Ax8Zh9SsqlVE850Kl4hqlrV8e8a8tFny
         Ttmf4V4CKO3QLKb+ClS2j6RyjZhBmDS56Udfqefi+Zgeull7F1ihu2+DJJeovHAt/ngB
         j1xJM8LBY1B/Z7MQamcm5yrSDoz6RO8WNr0siHLKHHH2Eh9P8RC5NW6y5KPWhra8tOog
         Pz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RxuZX5GviUEx3GV3dLcngyAODHt/krj8ZuZZNqtyyOY=;
        b=KEo+URfMrtIHqBjtB5ilYWILpngGzCa2Xl8PWr42pAmGlXF6tqW1RFzfU1YmlrpH4G
         hGiIVUC8MrP+5j66dH1KEYgkghImGRK++8kxGqf8R8mLXBTZncV3YPCwiEcpl/UKVrJD
         5Hqv4s/VC5vLPSFQeXPZrJLu0RZI2tf1IOh0kaun3M/Nh+0IIIXwGUN7du19FHykQDHu
         F5d3JCq0m3E3vvjiyFEteP7G2jcnGlsT4FdnNbyeEhGWKKs9O8r/w54nK8r1hIeEHFVM
         TU1USlO+mD3DenFU+oVHu2Hk+CToRgOQe0fNkYsWS5IGombOmNdfXNbZEsmxU4LWqCar
         uTvA==
X-Gm-Message-State: AOAM531U10EeEmHxn84goLzZkczTzMjaWbiVZpNuzq7I09V5RfmAIsiK
	FKEzT27ahdNIBHYIkcft5wQ=
X-Google-Smtp-Source: ABdhPJwjceYYq8NPtY62VBrDlYUmCyE8OK2MHaHE18mQ8EVQSCAL0bnSOVDGlZJt0A6icUBKhkXWwQ==
X-Received: by 2002:a17:902:d201:: with SMTP id t1mr7114689ply.327.1591880072397;
        Thu, 11 Jun 2020 05:54:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90b:384c:: with SMTP id nl12ls989995pjb.2.canary-gmail;
 Thu, 11 Jun 2020 05:54:31 -0700 (PDT)
X-Received: by 2002:a17:90a:7bc3:: with SMTP id d3mr7682701pjl.98.1591880071872;
        Thu, 11 Jun 2020 05:54:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591880071; cv=none;
        d=google.com; s=arc-20160816;
        b=NbHxdRKwsQLjgo4N4LNltjeu7FgcwZYNgr0yKjVQA1exoEhbNQA4Jh7ZK8wgqpOx7r
         +ZpCQoyIxRHe7gRKjii1Qrupej3r23yzDbTsp27rIfm6scxqrNVFpaNvh2NR37KBsEsh
         Hol3l9mkDaw+pJS4KWsJmE5lHB5XnGoDQpFmoTRrx+lCzpjjtLavbMT57TxMf7236D1k
         wp/7sguaPqcfqxh3TW/qxXDyF57hRHoPKZMArhMvlYT8WMNPPtOnPQti7dlTp+NLaX5S
         HAFBjX0UwTZsoRh3IzFRo4XNTm6JAqM9Tq6jtm4vyE2y49OwYxXs92wfy6SFNrSs6MBt
         ifLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1RFAD6lx89bah71CZ4hl0FJTxkwccvgkDj7Pbmc5jlI=;
        b=aMh/7VVZ1lE0bDCGHKkQdqRo79hsmvklZLt/wqCQ6u1zB7i3yGw4gqJ97Wyeu94Yy2
         TKPdROawdgwO4qLR8d6+rza5vTzyHe8TpZRFCd8jVxCZx/LUvmjY8tCcNpzSk/i2NRT3
         hSPg+dGfMT3sqmzu1Gyf+60L2e5BGzmPnVrllOUUUagF/CM1eOni1u463uFKxdw4CvFK
         Tzv0M0ZRiMhqGiEWDUronJvHOkuseJhYyoGtkolXjvRwFyAwz4vpP5Pypat/mq1za9rZ
         Ci84wS1WNCx0fDLzUxTd5utVWZKp4tCtzZIlP9wBsvWJ6rqKLq+WJx3X3NmRfGsUexgE
         6Q1g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=aPFpdRuN;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id v185si178329pfv.2.2020.06.11.05.54.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jun 2020 05:54:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05BCsV7Z079769;
	Thu, 11 Jun 2020 07:54:31 -0500
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05BCsVHI104558
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 11 Jun 2020 07:54:31 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 11
 Jun 2020 07:54:30 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 11 Jun 2020 07:54:30 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05BCsN2g062138;
	Thu, 11 Jun 2020 07:54:29 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v3 3/9] configs: dts: inmate-k3-j721e: Increase range for PCIe aperture
Date: Thu, 11 Jun 2020 18:24:17 +0530
Message-ID: <20200611125423.16770-4-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200611125423.16770-1-nikhil.nd@ti.com>
References: <20200611125423.16770-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=aPFpdRuN;       spf=pass
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200611125423.16770-4-nikhil.nd%40ti.com.
