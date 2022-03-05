Return-Path: <jailhouse-dev+bncBDOPPN7U7ANRB4FGROIQMGQEFQSGSHQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ua1-x939.google.com (mail-ua1-x939.google.com [IPv6:2607:f8b0:4864:20::939])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF734CE25B
	for <lists+jailhouse-dev@lfdr.de>; Sat,  5 Mar 2022 04:05:21 +0100 (CET)
Received: by mail-ua1-x939.google.com with SMTP id c15-20020ab06ecf000000b00349ff19c489sf4938802uav.8
        for <lists+jailhouse-dev@lfdr.de>; Fri, 04 Mar 2022 19:05:21 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1646449520; cv=pass;
        d=google.com; s=arc-20160816;
        b=Wz7lUPzoQ4flfHPC82+ae6lql0PZZ6kdmSW6gn3zmu2UBbsBmZMmYJrO2LZeF+LGnb
         y52lhpdL4SvU35mRi/hclbXBgv6zSDhWpnc6RpqJN+AkAZNV/Vp1P3NqFYITvTRxagcu
         NTXKKGdLmbGFbhelD7lRvUT2+3vaZEOjA3bz/m7T4O9peJna7rSWBjwjVHZ/UBogcGkA
         AxPoCZ6U24bCnn4jmg0zaO53DaGQKT7I1LLzliTwP2/ZEg4ZDJFd24poPLtJKqpcgrXO
         r4uWqXUJFjKDp88Qcyf8zTRmsCW6teDEbdRg0nxm2Lz54xeYpk1BWC0HPhKDuAy+bCI8
         KERA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=ucUw0DxYmO3dzJZPCSGo2wPumYPeW8Q9MqqL2VM0CXQ=;
        b=AVoGQHhDuIaSKFSkEH9X4lVxyukpFbKA+tKW/amvn60RGtvKYRBNT3AY/n2ET2UQ/s
         5hEaPOLeB4iPoRp1LoLwu6C1c2EZKzGuX0cxvT8oCNCdSvBHTu4SJqPXBcYDFJVYFdrn
         nqyMDaXcaVm7FFisXbA+BLazF3OQeZ0zGsGhQtk+Bh7VoNuDTJ44YI4Gd4t/eGbJ8Wbl
         dCx03taJyDb8olAizMCT5NYt2uYerJCg8YXYk9plNVt4RQA7v8fHQh82k0dxPSOzoK+7
         KcOUL6xOeJV+hDGnUTeGqnF9WV6iY6VKsUgYR4+pkPFy9jRPRJeaY0IFObfW62UB7ucH
         Mqtg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="rhIXS/u5";
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ucUw0DxYmO3dzJZPCSGo2wPumYPeW8Q9MqqL2VM0CXQ=;
        b=UmGlZws8UKa3H2rY0htcX7TisDpUX2ZNH1Ll3eAAtEbiUsAAHpcJ3O3ft/qzSsLYNs
         WWP42DdmBMWsRFqO+oTf2zNu/IBSYzxfruuIvWywh82du30ejJTSF9BXhuvLsgEEAlW8
         RQWk3Q/ybKJwhZaRtvy84t+dn3uRGEdsJBI5UFO6zK8gQnllGF8gaGfRoLS5App60EfL
         JV0djCKhavCaJ5pRXtFkdVEWkSwcicbjZDtJ94SDCfdhZ/gNkPzxrXXhX7QIaQNk3uGn
         oDpT7C7iMGXAd9+AEM3l40fRKKD9/qUQaf3O761YaDK/SApDV4A3/GiRRUfl6RrmLnA7
         IOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ucUw0DxYmO3dzJZPCSGo2wPumYPeW8Q9MqqL2VM0CXQ=;
        b=Qnxe3yZGEJ5CIj6rSJgHy/ZZ7WZ2sYUbjQ1WssV4ual/DEIukHWVMq8pvWWZuXIr9R
         /oVoHczET1EF84x6+hlihE6CyV7o+OR9icrFOsrnIDPrWnMzUoQeetE4Z6fY4/RFLpqv
         fGn/T+Xx4O95/w3hG6OD+nQqHo7Fbnk5ayG5VP6JqiX/ztcWb8mn7cyH53DdluzpIwCx
         RcoebbtQbYCzR6QPfvdjHkVFOVzrou82gtNuzZz1QSt9ouB2l9I4/Lp52LYZ3sCV3VKT
         MUN2+72wSt7oGywN5IQQG1hQmczMN3rDfB7lT683SeWCVfZjJ+NBFmhuM8esZfiGnQFy
         IFmA==
X-Gm-Message-State: AOAM530f6YaAOx/pvVDcU6m9iilrhJpcGFVzPF/6z7SnPTc1DXia1aFZ
	Ipg6SYVAWrnHnDMN3dC99ow=
X-Google-Smtp-Source: ABdhPJyk9OeFqULUoNMBeOGjT8H7MM9d60zkUSxieOotW3YCUY9/DbYn8LXLSJ1J4pnaSz7ql8twCg==
X-Received: by 2002:a05:6122:c47:b0:336:f909:3773 with SMTP id i7-20020a0561220c4700b00336f9093773mr571932vkr.24.1646449520816;
        Fri, 04 Mar 2022 19:05:20 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:e20e:0:b0:320:7c33:d6fc with SMTP id g14-20020a67e20e000000b003207c33d6fcls796819vsa.0.gmail;
 Fri, 04 Mar 2022 19:05:20 -0800 (PST)
X-Received: by 2002:a05:6102:c49:b0:320:7ae8:b527 with SMTP id y9-20020a0561020c4900b003207ae8b527mr623780vss.6.1646449520025;
        Fri, 04 Mar 2022 19:05:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646449520; cv=none;
        d=google.com; s=arc-20160816;
        b=BEZmUymv95WiJMvXjR8+lYZYp2DadVDfUkmZ5JU8SVNDsf6WnUaY93UMvIJ5xGmPsh
         tNHYrQdrJ+dVRkm92NziT4eTx0/i4LrjPzZ0DpX99QCIdiC4CA/tUW7+UqoR2UL3ZQt1
         ceGqSr0oojYou+Q2BVSBqoJNpu174u7AbsZBONV+bVUi97jUKEaJMwmiK+FSU2yoFHS9
         3MABDUAbJQ0CrIVK6GoKb9UDHFJvHgkIW4CCjeRq6UN0akmdAFAq6gF0NdTS4mz44lOF
         06rPTZD977rhbVAScZ4eYS4ElIWDC5hMgnhAnmZrRLhASF7UkOxVK8CN4fV8dIIlVHu3
         YI9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=P5E7bNIWG06KbuzZPcKR1+hm7858eJq2L7cuu1UklFU=;
        b=lkWd3L5VpGNnDCFEdSXRwkyCINxZnj21fHTOFZeuCvn8Mv1UDtdKMBKwYAnK1vuc5W
         DOzH3YF1yDQUAZjC8QqXA/UC8ccn/Lf5J1MmrvpMLZ7hEJGLPRRasKfvOOkQcULTNtm/
         c2piyMbn7pcJZL2KZ660LAdjuFHmO2mLSftGqoz/znsv/02wuKEDDGXN0xWatinXuQUc
         YgLaC7DZERGNUDgiHl6hqKyr8J3cSzEd+sTlfHXPGe3xuPmG3NIx3RLCsBn5VT7ehBG/
         phrPNHK7NFUuZk03PU3a2itj2dT7FdASfv6r/vyhyoiXF55ZnHT0euvQ6A6iL5wkT3JJ
         gKlw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="rhIXS/u5";
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id s80-20020a1f9053000000b00336e84b93c0si331707vkd.4.2022.03.04.19.05.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Mar 2022 19:05:19 -0800 (PST)
Received-SPF: pass (google.com: domain of mranostay@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22535Jqw071442
	for <jailhouse-dev@googlegroups.com>; Fri, 4 Mar 2022 21:05:19 -0600
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22535JJP031690
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <jailhouse-dev@googlegroups.com>; Fri, 4 Mar 2022 21:05:19 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 4
 Mar 2022 21:05:18 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 4 Mar 2022 21:05:18 -0600
Received: from ubuntu.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22535Bvn123249;
	Fri, 4 Mar 2022 21:05:16 -0600
From: "'Matt Ranostay' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: Matt Ranostay <mranostay@ti.com>
Subject: [PATCH v2 1/4] configs: arm64: change k3-am653-idk memory window
Date: Fri, 4 Mar 2022 19:04:55 -0800
Message-ID: <20220305030458.2938-2-mranostay@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220305030458.2938-1-mranostay@ti.com>
References: <20220305030458.2938-1-mranostay@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: mranostay@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b="rhIXS/u5";       spf=pass
 (google.com: domain of mranostay@ti.com designates 198.47.23.248 as permitted
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

Reduce available RAM by MiB to allow from additional IVSHMEM
device memory regions

Signed-off-by: Matt Ranostay <mranostay@ti.com>
---
 configs/arm64/k3-am654-idk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/arm64/k3-am654-idk.c b/configs/arm64/k3-am654-idk.c
index ddd770fe..0d6ae59a 100644
--- a/configs/arm64/k3-am654-idk.c
+++ b/configs/arm64/k3-am654-idk.c
@@ -77,7 +77,7 @@ struct {
 		/* RAM */ {
 			.phys_start = 0x880000000,
 			.virt_start = 0x880000000,
-			.size = 0x5fb00000,
+			.size = 0x5fa00000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-- 
2.30.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220305030458.2938-2-mranostay%40ti.com.
