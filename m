Return-Path: <jailhouse-dev+bncBDOPPN7U7ANRBBHNQWIQMGQEKUDVF4I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC5B4CCBA1
	for <lists+jailhouse-dev@lfdr.de>; Fri,  4 Mar 2022 03:16:37 +0100 (CET)
Received: by mail-wr1-x440.google.com with SMTP id p9-20020adf9589000000b001e333885ac1sf2753094wrp.10
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Mar 2022 18:16:37 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1646360197; cv=pass;
        d=google.com; s=arc-20160816;
        b=ciKtdVmk/9p7Jdcv7Suki9vXrxoVGhyc2j1ucPR+flk/tH6skp26cpas7U4TccoipW
         /dpv7vHFz8+H6AmdWRFLyDpLaXA0ccdpuoLOqi/338PbWXBDa4ZN8/vx+dgp3Bqb/lla
         7pr8WZ2hHbuEmr0lk9jJcYOIepMnTomSa96O+jAlKVX+Cv0s+x3t60+JGr5hhbQDE81E
         WC/HoMQDX5900qS09a5Sa6bDk5ny+Fk1Bs6cr7T0ojpMHctVcLhmXieLTRQA+Lp8d/lL
         rs5qgJNIYqwUxeZuUceKWkYjkxN2OHpNxgOq1u908V5HvINwFl0VEJoyOSYjABjKZ6fl
         Sm3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=CTayq4RTG8CNCXMa1j/Ns2dT16iHlSabUyBF86SyzRM=;
        b=mhov2HRt6LvVKQom3hyj94u7xSVr7NdrtXZrcGRNO2Mhd4MgaaTJHeqXnG0CeE5Bo+
         3Z6YJf6qnyIuXFlgSpWYzbQhozGxytDGwtHpuoE94sNmPcgtrQq8aoaSFRWRIeFXuZul
         MlGoNBd6Xp4x8jel7hJhGVAWw1R+UcDjA4OCyphf/iTkgj41KlG4cYUJlK+9vS1rSGZR
         pXBKJSsfPDIlLbTFep08ZSZmvJfrknSji+UmKFpKXaaLmbIHxIV1HQN+++3dUtungINs
         y3SfGWXy4G88O8AD4hT4GF45NeSxCwWqYoLkwE/zRWa146wrEkiL7zcTSWSXZlYYVdjx
         TAtA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CiFW3gcd;
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=CTayq4RTG8CNCXMa1j/Ns2dT16iHlSabUyBF86SyzRM=;
        b=ID4bbBv105Vr2Zf0N5xjMVVfB8i/ENMSEjHzg9sIxHilIPH03+e/md4bKw99vSP+Ib
         JYq6EpNAB/M0aVuGuO5nQ1OKeoCIOIKF1xQPkDTeQXOdNABsdHJgxXrNN2MW3P+qG6Fw
         XzVN7ZDDSIz7jbS3ngfuSiYbtE/XCoiCTMBlKmkn1ApPnilOojv5Tcu/p1q4+NWjlHaP
         9vJZ+w+NhfdSlxRP/KPbTnRfD+Pbw6b0Jggb23hLI5Amw3GpbYyCT9B2+cYxlVEHLfOf
         mmSa3ctE/2lMIXU4x9OFz63zutZXdL596T6ydTUc2NtFP6CdBvFapzveC9q6Gk9AK2sG
         EUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CTayq4RTG8CNCXMa1j/Ns2dT16iHlSabUyBF86SyzRM=;
        b=rA6Sea56S+9OjiD9RHSvd5b34JP+M2hzvUWu3Jwbl3HCc9jznanOokc1q1JCSynoSI
         ZlmteH34Gv3iE6dXzhH2IGw0d6aJmSpUIf66oH3w9d5WYWoLQz1HmuVjDXVhL+r07A1U
         7IZvxvZz2C/Vr7gB1ksTjwBfj/fWReKlEgCXG+9HF+2+43AjuguV43gGquuh5+y/jJXk
         ComXRLrwTUJ1oF6H/+Y3BKjOj/w4LKAYZIsWd34C+YGfVjzUzlFoqyiV62NKPU2pQZel
         8FDxxZNO8kc7vs0jQoExDQzbWl+YmivhLndknYYx7IukerB+C3UfctL5hzmMW55o/VeZ
         7mwg==
X-Gm-Message-State: AOAM532gyEpo9uELuNxrdvnbb2JyLFoAySCxaZX74O0I9OFhgfUVkexY
	tSB1X39TH9DpzhXLZ53urmQ=
X-Google-Smtp-Source: ABdhPJwjyah4RUqLfvsghigwChYJSaXGhHORQlizLNYwtwuygdpgaBYCicHFBRkl81OvUogsyDDVMQ==
X-Received: by 2002:a05:600c:3ac7:b0:381:32ff:9e90 with SMTP id d7-20020a05600c3ac700b0038132ff9e90mr5914892wms.2.1646360197494;
        Thu, 03 Mar 2022 18:16:37 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:47c6:0:b0:1ef:f983:3883 with SMTP id o6-20020a5d47c6000000b001eff9833883ls575831wrc.2.gmail;
 Thu, 03 Mar 2022 18:16:36 -0800 (PST)
X-Received: by 2002:a05:6000:2c5:b0:1f0:6657:5601 with SMTP id o5-20020a05600002c500b001f066575601mr1817402wry.629.1646360196335;
        Thu, 03 Mar 2022 18:16:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646360196; cv=none;
        d=google.com; s=arc-20160816;
        b=WR4zOgx5hAxUhl7VaQbekpVVrEEDLuZQZZm22/O0Ka1Rn7VZ7PMngNxEEHdjMfNfe8
         kxy0/NiSQi0rfKB3YX/kyhIfcc9jO7FCC6enk7p4o9Rz4mYyu43j3CtDV+XXXa9GhWeW
         G07uynz1sv5Q2WG8M+EW9bvtNor8FDgkNnh3y+38ypaO2N+jARp7B7kHeWsAapb4Ope+
         eJNW02w0xBOaAU19zsU02VfUGkl5FkOiGmmwkDfScjIS1+aQdHOozyUf4J5Cr1BIiYvw
         ZQ9/ebgz67d0C7Iq/Lv7HEQ/heYgkHDhO7HASvdLBQGlH5bXufrddMeEbQqiY8BL2y6d
         D3Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xrpwqcxEUAkprPMKa5rNXg4sY6R/0Ysm7zDbgsd9R9Y=;
        b=y1ZhA00XZcGCNr5Dudgi4K6mWOaf+pKa/f9E8HXiDme/jLpAFJ9xTwAlNZCUAq5u1E
         C8tAb5rmOXqRBdYnXzVwwyQxapNy8mbgUnkQNS//o6QxO5KUei57Z6+fmpPOidiV/NzH
         DaaodaekUVTbjoTABGqAKOQgoU5T9QPK8zWVARA2hshs2DKv8y4r9+AG7lLcRXP3MP3A
         ysarnvV4tmRtXRtKdTBmjARWKqVyp1N46b9B9ZsWPBOpmplS91PhGG+Krsenh/VBr1TY
         RbuSbqvKwsG25Y4CAF/XrPMse0O+owvgUpnjFpztqMjhK7VOYImASAxsaZ1jk2YUWdZX
         FHIA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CiFW3gcd;
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id t9-20020a5d42c9000000b001e9d3847897si201866wrr.8.2022.03.03.18.16.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Mar 2022 18:16:36 -0800 (PST)
Received-SPF: pass (google.com: domain of mranostay@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2242GYWb016288
	for <jailhouse-dev@googlegroups.com>; Thu, 3 Mar 2022 20:16:34 -0600
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2242GYBZ130730
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <jailhouse-dev@googlegroups.com>; Thu, 3 Mar 2022 20:16:34 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 3
 Mar 2022 20:16:34 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 3 Mar 2022 20:16:34 -0600
Received: from ubuntu.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2242GOih018363;
	Thu, 3 Mar 2022 20:16:32 -0600
From: "'Matt Ranostay' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: Matt Ranostay <mranostay@ti.com>
Subject: [PATCH 2/4] configs: arm64: change k3-am653-idk memory window
Date: Thu, 3 Mar 2022 18:16:13 -0800
Message-ID: <20220304021615.2862-3-mranostay@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304021615.2862-1-mranostay@ti.com>
References: <20220304021615.2862-1-mranostay@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: mranostay@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=CiFW3gcd;       spf=pass
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

Reduce available RAM by MiB to allow for additional IVSHMEM
device memory regions to be assigned.

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
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220304021615.2862-3-mranostay%40ti.com.
