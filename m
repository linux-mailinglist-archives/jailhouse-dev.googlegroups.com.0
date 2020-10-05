Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKPD5L5QKGQE3VMKKNQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x638.google.com (mail-ej1-x638.google.com [IPv6:2a00:1450:4864:20::638])
	by mail.lfdr.de (Postfix) with ESMTPS id 92493283023
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Oct 2020 07:39:54 +0200 (CEST)
Received: by mail-ej1-x638.google.com with SMTP id b17sf2884888ejb.20
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 22:39:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601876394; cv=pass;
        d=google.com; s=arc-20160816;
        b=u0WlciIomlenMo5A/ooA9556BsNxXs2BYnVPaTQpfzgl3JLAexdPQ7JW8zQGVed/xy
         5mZcSy64oxh5TbUpYWmZ1DpMtlDy+LN0kwXM+32fR9JvNrQgS/dmGqeEtCBFQdCqLBN9
         qV51yS3EBpLRPhkf1uCIx/NX0R9+I/bzlhEf40H6um1PO8eusdZ3C8QWQzhfwRxtCpg4
         jfCsjCVqVq/2w/ssNmb0tW7sNii3WDNFxgKwXZLYpjU3FhXDygm03HPXBRbyCRbAZL4R
         Q4uvBYbjtm/mZttLrBic/G5Ycarw0m0j5DNoJuoUez1OJSsxta+6PUoja0Za8n0m4XnE
         AO+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=xM9PjWQFTESPVTLR4qPnUafg8OILiuJVLUtctz2bEts=;
        b=tr0B5EZx1Q6eEN/7YqFhOGvGsmUt3ZpjB53eOpnJkrD5NCbhuqaw75V9JqPI1y9QF2
         vdnEInfPl2WwZ8IpA6wqrftch+LNfhu4/u7LLu0JgNBApX0duPgStAUHea8zyp6aqYO0
         cuus67lTY2ZdU+MojWTBp7vvSswTCUPydax26loz1DKSvOS+0hDboHc4TYAiM18OCIF/
         i5iGTYqwwFe8LgxOSOJ5NrNM38WPG9jOPYSX+jf8UG0f8ZX++LRd5hQ8dD7QGbXb66ap
         /oUfASr5GXj3uOvOE5Xz/IZIZVmUSlJNYQYIGJXPXdGzCrF0m6WPVgQPgoZeffmQJr7Q
         n3qA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xM9PjWQFTESPVTLR4qPnUafg8OILiuJVLUtctz2bEts=;
        b=LVkaC5F3j+DX2ttaFdNkvrNMCq4QPieHas7PEaZqF11PtnS3bu/xtmB+YWYDUTbX5l
         Q2ph2UJN7to4meL5gCelfccv5D1n3CDaKL8NU78LFSDtnBzNNfprhxPdYbx+sWWwuh9f
         hDZGaA3GCiATw1KN+INQUNcPPFcz/HsCbxdi/zDpIlOq8pm4jiNkFsKaeNbmxfmFaGYO
         WQAhUEWYhDQpqUzbpQxELCbePRNEg9N2f/NkBuEIQs9ZrM58pscmlaj2j/tb2sQgIYds
         U1nIkhs13ZbuknQAuVE7QoLpKL3POMNw85ydJMv7ScgmPfchYyDzfDil2K1Kpa7Fu0Zh
         ZzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xM9PjWQFTESPVTLR4qPnUafg8OILiuJVLUtctz2bEts=;
        b=b7SAAOUCJDPQv2p7iZt6D+mO7R2lv+kYKzT9FN2U1YKk5GVF3NTCTnr7Q7TwGD5yGT
         /NkW12yvfL0PCHYwIAASz7i04Uw3m0q4Xndv9l8y183Q5wic/nZGU21le2ac76oFB3EQ
         zxIPYWVIZjbiynK0BzXnAXeY1pctL+fJbNHHAoDIF8vm9rTT6UwBYtoiZUZ3QYlTBlic
         3K32GlDtdKt86FQsv5nQbcqsP37OHaFpQLT+hueQi82gI9E8fpvEG0AkT+lvtMh+fJ0c
         kiD0FtzeZxhC+22imwePikPBYix7OcNb+gEABjT7/4R52ZpaZbPDIrEt0SXsYVEuGj1U
         lbQg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533ANnxA315YRN2zYdcMsjfIGnYO3eb4/4Q7TBpQTTSR5biZm2An
	5a0hHElriq06BBQM8iPq2qs=
X-Google-Smtp-Source: ABdhPJz1hFxtIcBlnvQeUrv+bj2mEzBlg5i6nviAbMU+j0ANrCvVHumEcMFZEjPJEd2Tp7Kig02GLQ==
X-Received: by 2002:a17:906:7d0d:: with SMTP id u13mr14461327ejo.448.1601876394368;
        Sun, 04 Oct 2020 22:39:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:160e:: with SMTP id f14ls3074586edv.2.gmail; Sun,
 04 Oct 2020 22:39:53 -0700 (PDT)
X-Received: by 2002:a50:cf8a:: with SMTP id h10mr15556321edk.43.1601876393139;
        Sun, 04 Oct 2020 22:39:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601876393; cv=none;
        d=google.com; s=arc-20160816;
        b=abn1Moaw1Ah2dA8p2raQytDas2aUebeUkHfACPkl0RaO49axz8mYx/mNg6urHaOSb5
         iaWk3wDUamxVL1iLCsb0HrF/yGbX7Nbwlk8cxTrfr1NivmsAD9qR1AFDS6BX0zkI50NP
         10rOg5xwUBMEbjMaMSqdRNzsZLyFLaeVO/Ad83B42Ttj2O/eWvz8jwfE/awpwsINbxxD
         AwRLdwMrcqPGhFtbuY4yhvDnXiVgOt3rKV/BAN0Ie2Bp4RUq9nktNfiBeDx1g9LKWOuJ
         MbyiiEboqTx89WiXWeq5EyyamwP9ZroSA3EMuZkkuLVtsDNfvKaOQfP1cvRB/yfrlDBQ
         N76g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=Cw8UGQhMZtE8j/vHb9LtHLKiWJ37xKKGOXUqEdoa6OY=;
        b=n46Wsr0xe0cNDhy1AA6kod0NPK5WlOoEJPEDTfBe8gU04KmiqkcI8OR66Tu8Z1NBV1
         lK5TRPWJKLYfFj8dCWmnSkkCmCt3OVKraUiNWTigfPjef2aqia9c9hFCiI5jbqGlmYiu
         BT+UWr71dVhQR0wU8yTZn9ccQRX7ISQ3Nf/XG07+wiZmvIPK4uQBI/j/d4NFIF3XCGwh
         TbEFDmwL8eOggqFgjlCHvPy7DsjloCWFxn+JFRTEdilAyLjAybZvoFrUKbeTU8GGH6hN
         I3qj3vcyapaOQzi8v+nX4KKF2rBux3SUji1uURVOehXHCvhK3xgL9zje5S3k217kYGIO
         HpZw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id g90si186026edd.1.2020.10.04.22.39.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 22:39:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 0955dqeD000948
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 5 Oct 2020 07:39:52 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.39.163])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0955dncH025569
	for <jailhouse-dev@googlegroups.com>; Mon, 5 Oct 2020 07:39:52 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 08/19] Hook up Ultra96-v2 support
Date: Mon,  5 Oct 2020 07:39:38 +0200
Message-Id: <af2301ef6d507ebed2e98fad77b7a6b36909f699.1601876389.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601876389.git.jan.kiszka@siemens.com>
References: <cover.1601876389.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

Add the machine, and multiconfig, extend images.list. The wks file is
the same as for v1.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 conf/machine/ultra96-v2.conf                    | 16 ++++++++++++++++
 conf/multiconfig/ultra96-v2-jailhouse-demo.conf | 14 ++++++++++++++
 images.list                                     |  1 +
 3 files changed, 31 insertions(+)
 create mode 100644 conf/machine/ultra96-v2.conf
 create mode 100644 conf/multiconfig/ultra96-v2-jailhouse-demo.conf

diff --git a/conf/machine/ultra96-v2.conf b/conf/machine/ultra96-v2.conf
new file mode 100644
index 0000000..dc8b703
--- /dev/null
+++ b/conf/machine/ultra96-v2.conf
@@ -0,0 +1,16 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2019-2020
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+require ultra96.inc
+
+ULTRA96_VERSION = "2"
+
+IMAGE_INSTALL += "wilc-${KERNEL_NAME}"
diff --git a/conf/multiconfig/ultra96-v2-jailhouse-demo.conf b/conf/multiconfig/ultra96-v2-jailhouse-demo.conf
new file mode 100644
index 0000000..e5441e1
--- /dev/null
+++ b/conf/multiconfig/ultra96-v2-jailhouse-demo.conf
@@ -0,0 +1,14 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2019
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+MACHINE = "ultra96-v2"
+
+DISTRO = "jailhouse-demo"
diff --git a/images.list b/images.list
index 4917813..4e52648 100644
--- a/images.list
+++ b/images.list
@@ -7,5 +7,6 @@ espressobin	Marvell ESPRESSObin (1 GB edition)
 macchiatobin	Marvell MACCHIATObin
 hikey620	LeMaker HiKey (Kirin 620 SoC, 2 GB edition)
 ultra96-v1	Avnet Ultra96 v1
+ultra96-v2	Avnet Ultra96 v2
 rpi4		Raspberry Pi 4 (1-8 GB editions)
 pine64-plus	Pine64+ (Allwinner A64, 2 GB edition)
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/af2301ef6d507ebed2e98fad77b7a6b36909f699.1601876389.git.jan.kiszka%40siemens.com.
