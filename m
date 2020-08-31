Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXM2W35AKGQERSEQ5VA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDBA25848E
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Sep 2020 01:53:01 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id f125sf340173wma.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 31 Aug 2020 16:53:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598917981; cv=pass;
        d=google.com; s=arc-20160816;
        b=WdOFV7Ggi6VbvcUe74L01wL+EG+ZvoxWhUYeT7IrZD7MUSa6mDmfsW4Ody4OPcuJIu
         rVhcQGWsQOJB/u3P55kcq/89w2H+llObfkEnkJP0GRgKZtTfOad2gMFvo5ya3d4CrYSG
         jnl93AliXzmCJHOlV4pkLHY+d582auENLQljccnc/e5amTSybV4i7qwbiiiK81Zg7yhW
         7YmcvVjOs1NAtLCNvTezgWxWQ1u/Pxog9WMtq7WOc0e1nV2PaORzR7XPUREr0hwS/BLD
         AvlVWqj9RZxTfG+JvNykaITt2dzoreZtc/CJ65ak9umN+YGQeo6Dv8BVysqx1eRpL/et
         EBfQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=mW/wgi+MU/9LRNPOafDir1cXfzCSP10blW+yfWkruKE=;
        b=pmEcdLk0VulNuG3ArUN7/zBfKS7No0x5MZDylGLVTwz4pQ5kUzgAIyR9UfBFHBVQ37
         L2cXYcqFDE3Zqbk05K5GMRtOTNgltxFTUwmvHErqb9Cpz+jIqmXxoO+jdrZC40bZdWyh
         IlZJu1o0F48y05m3sNBc/BRCkcXahNq2x/JjWXy+mxwYdM56PSHUfmmgK4oqkkM/Umvg
         htqK92oCD+bgWEfhK8P8p+onjenhZg7x7NKncOzpyr/U3WJVl11Q6pZBKBYuACE2o1A3
         pSwaMHmJWyQNCHwZ5+VFrGIoJM+hLzljYBZoYDCaUftjoCuHT8DVwi/karG2G+aCq4Le
         wedg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mW/wgi+MU/9LRNPOafDir1cXfzCSP10blW+yfWkruKE=;
        b=jKX0aMMlE1Kz1eJCWEbqDUzQJzCySVxQpU6hyM15BHi1YsQis1GdBCsh4fkCqDAlbS
         eOgol+whoBpgpezwY7eim/8jXD8eBB3nsE4c0n5fndbqb+BtvUwPj8NhBtSpDrUynJgq
         wSqvTN2lyP7FhD+o89FP0xn46cyg6ayVKy5DozICK7i4tmNiUPvwebUJWt/ckEsLsigt
         XpqzEgN8yrVl9efWpEFl0FqByJKb3g0Pyq95sYZxkYu75pFntR6J5qw3vGZu1Rh2tTnV
         4Bwy3pwBu3qN5dYxWohOpYS0Bu9KsBE+9F8m1Ic7sZWP+AmLJwve6tkM1Hc/+isxFe6i
         JQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mW/wgi+MU/9LRNPOafDir1cXfzCSP10blW+yfWkruKE=;
        b=cg7LWAYSO10xsO7VbcaaQP4NME/TJbhMdA2u4aCXjYqGxDfhWnD/2qpAyHwNuUoe4U
         dWFr5WDp8vRwOo99iZsv8JQAyiTv6Cc07rd3jxYCj+tjVZ8xctnYQTj/xUhk+7fzPHE0
         PJ6XaBOw65CbWHBE+SzfC7bqOv53mQBpisKxf5slO4eRX7LqD5NxEy4iJX/QEa530URr
         QSKjQJsBKbuAmH/taytxCiN1OMl0DQQdOfCGM1AmpKyWScMf2NPEsbE8Mj0aMx7265M3
         kqd4XgbB/eYaBZzg2EZreLaNTb4RhrTu8GRw/VmLW5kByGkwxG43/+Ogd8r19FmRK2Lo
         7vOA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531BnwSlS/oIl93ilidBd/LaumYmALWmPwNsE2owMAIpMrOCz3eX
	Nfw4B86sPxA+2myT/JqNm9M=
X-Google-Smtp-Source: ABdhPJz8y9IFopvfNkkeQTQHfbmKyRhDkDf9VoOaKnEDMezOlTesrQ6c5FWsb1/gKiJ0qhoO2AqlSA==
X-Received: by 2002:a1c:8003:: with SMTP id b3mr1554527wmd.121.1598917981537;
        Mon, 31 Aug 2020 16:53:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:dd0a:: with SMTP id a10ls660425wrm.2.gmail; Mon, 31 Aug
 2020 16:53:00 -0700 (PDT)
X-Received: by 2002:adf:ab57:: with SMTP id r23mr3867856wrc.386.1598917980635;
        Mon, 31 Aug 2020 16:53:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598917980; cv=none;
        d=google.com; s=arc-20160816;
        b=cIbidMlSq0O2FpgakwM68kU6/IlMOSOmL6NMYqZ+ulDkQULwABE4P5s4C33/R3mILG
         RMkjZpaR4EruIOjNdQlBxDfnUz0h889cvquVehJldnQynvkgiv9t3NzjFCDE4kQYp898
         CwzNjvHFsGKq9tgLk3PL8Su42zJgTPLJLy2iVGAfeNVUw11orm+MdTYBBo3q7wfSYxds
         Z1HrvIIGXc/mgZgIClQuPbdlR3M/lt34rzxTXnwDRnmviwTijzkFR2IMoW7KyGMRVw1Z
         dOOxW/vkBwfp+GPaU0elHactt3HYLQxFptLpow/eWZC3ti3EYmlvwJWB56sY4U6nYW5s
         pn8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=u7nEJWv1hJZ3k6IC1kFfrg3YkDFJIobTuatXXCYk61s=;
        b=L2EkqkrxZdOFM1Gv3KiyO+ewd8wgblISliXg/nQpolL9uSgFSgAy3TvvZEEN3LR4EK
         NwANCIekY5fSNN4x6iTJo++7cIautepFF37CpgCOR5eUPGx1p8c/qeUsau1J5hGBejcs
         PwhuLLW8v3m9ymsrDar4PAWgd1OL5/bJ/0/vN42yhVPpQOKKcvYJhGqOI1vxB8eRzIl3
         na+iahT4XGT0i+KfZSSw1Bwr++CippwKffNdH1dlkWm54SrWciYLo/6reLidDHkER/Ed
         /hEeI9Y+peHlCF3v2nwVGgyUGuWd52e+OisE2mxbChv6UzvRsuw4iWA7FpYi79hKu0Ne
         1RAQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id 64si28747wmb.1.2020.08.31.16.53.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2020 16:53:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 07VNr0ax007233
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 1 Sep 2020 01:53:00 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.128.15])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07VNqorM007358
	for <jailhouse-dev@googlegroups.com>; Tue, 1 Sep 2020 01:52:59 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 6/7] rpi-firmware: Update to 1.20200819
Date: Tue,  1 Sep 2020 01:52:49 +0200
Message-Id: <55ac5e10cb785648efca5af36411d82b2c506727.1598917969.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1598917969.git.jan.kiszka@siemens.com>
References: <cover.1598917969.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

The update is needed to boot latest kernels on 2-8 GB variants which now
finally work.

This update requires to bring back linux,pci-domain that got dropped
from the latest device trees for the physical PCIe host via the
jailhouse.dtbo.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 images.list                                                | 4 ++--
 recipes-bsp/rpi-firmware/files/debian/jailhouse.dts        | 7 +++++++
 ...i-firmware_1.20200212.bb => rpi-firmware_1.20200819.bb} | 2 +-
 3 files changed, 10 insertions(+), 3 deletions(-)
 rename recipes-bsp/rpi-firmware/{rpi-firmware_1.20200212.bb => rpi-firmware_1.20200819.bb} (86%)

diff --git a/images.list b/images.list
index 003fff9..3d7e12c 100644
--- a/images.list
+++ b/images.list
@@ -7,5 +7,5 @@ espressobin	Marvell ESPRESSObin (1 GB edition)
 macchiatobin	Marvell MACCHIATObin
 hikey620	LeMaker HiKey (Kirin 620 SoC, 2 GB edition)
 ultra96		Avnet Ultra96
-rpi4		Raspberry Pi 4 (1 GB edition)
-pine64-plus	Pine64+ (Allwinner A64, 2GB edition)
+rpi4		Raspberry Pi 4 (1-8 GB editions)
+pine64-plus	Pine64+ (Allwinner A64, 2 GB edition)
diff --git a/recipes-bsp/rpi-firmware/files/debian/jailhouse.dts b/recipes-bsp/rpi-firmware/files/debian/jailhouse.dts
index 546b817..1a4f8ab 100644
--- a/recipes-bsp/rpi-firmware/files/debian/jailhouse.dts
+++ b/recipes-bsp/rpi-firmware/files/debian/jailhouse.dts
@@ -18,4 +18,11 @@
 			};
 		};
 	};
+
+	fragment@1 {
+		target = <&pcie0>;
+		__overlay__ {
+			linux,pci-domain = <0x00000000>;
+		};
+	};
 };
diff --git a/recipes-bsp/rpi-firmware/rpi-firmware_1.20200212.bb b/recipes-bsp/rpi-firmware/rpi-firmware_1.20200819.bb
similarity index 86%
rename from recipes-bsp/rpi-firmware/rpi-firmware_1.20200212.bb
rename to recipes-bsp/rpi-firmware/rpi-firmware_1.20200819.bb
index 47e40b9..67b92a5 100644
--- a/recipes-bsp/rpi-firmware/rpi-firmware_1.20200212.bb
+++ b/recipes-bsp/rpi-firmware/rpi-firmware_1.20200819.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
     https://github.com/raspberrypi/firmware/archive/${PV}.tar.gz;downloadfilename=${PN}-${PV}.tar.gz \
     file://debian \
     file://rules"
-SRC_URI[sha256sum] = "e3b0577beb62d886a45016447bdf8c2d57b794d3d71b502868b16ba82ff8fe43"
+SRC_URI[sha256sum] = "661e4c2c33ef9354da50ff2f679b697ea94d2d820166cde749692133e3461c34"
 
 S = "${WORKDIR}/firmware-${PV}"
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/55ac5e10cb785648efca5af36411d82b2c506727.1598917969.git.jan.kiszka%40siemens.com.
