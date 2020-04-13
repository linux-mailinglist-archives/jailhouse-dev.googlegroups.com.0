Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBLEZ2D2AKGQEDSIJDAQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEB21A6343
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Apr 2020 08:54:36 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id 14sf2465302wmo.9
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 Apr 2020 23:54:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1586760876; cv=pass;
        d=google.com; s=arc-20160816;
        b=DjkVYySNa3r1vaDZzDaNI3CqBMuh9Z4sqr5LvkEDPTg+W6eLpLWPNybGyQmA1DjLF9
         NY5hcML/Ozxvg2wAeXi9w3OAdIHqN73OdvzXZxO4wvzl0Q4HKJjaPgbfdlNNgRzuII2a
         QcQsYKopjzo7Ir3m+lZYDpEWsBbUsfHryPWbxb3LnaHLWJp+pbu8Ce8e5cq1f7RJKTj0
         2mzuR6FC3cO3ZYmRuLg7Abh8Wag0GNgMVctiYn17E4hCiSx1qVdviE0bmDKtuUJ21tRR
         DsCLpkkScg8GGQkMsLC1f0KcVv7QUauXG9Z8KckDnr1AVZoDFcmAgc9JRktAmy9xYuCZ
         q6fw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=aXM0nafd1W9ycZ41TLfNdaSac1KOciIjw10oXUgFP78=;
        b=VV+yK8Yq7NynO7yO44/m7wjr4SsTcpLDQi2nOrE333ZSFZSB3/gM8YTzqmPkLoh2qT
         gnGQESiJ/AXg48dINBcOkYd2VeZBobm7a1+7uoDbKGsQ7XsBexT8fBiOjF0WRy1br+em
         dDPgyim2Ffxzl4rMA0Gw5xa4a5GD72a6yuBGhwJ6eC2YVu8YyKtpkzmb2sLY7LXmWurW
         YD6AScvaasD5CnfKY1fbQMt78K2niCo6M8jLlmKYSVdOTWFGgaM/V6J2rGzzJDXPa1TH
         sOcYXpD2tYZdzk9OUxz40NubXoQxFFsYFWLmJTHTXV5agw4g+gmaaWP18vphj7GbfZxP
         rFmg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=R+lQhi1g;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=aXM0nafd1W9ycZ41TLfNdaSac1KOciIjw10oXUgFP78=;
        b=M/eTz8sOqEJ6ESzuNjIo4CDgcrviFihZY/bOhP/hpvpN3ko1f5NGs8ixHSbpHHqsAL
         +IlhW/DI6Ahp8wtC/2pfu12rBakZ4B4yB6wqkcoxJqFjXB29Z1O0ucRbMfdNQk0zyPmG
         s3A8gsl88e9zuXV466FTIFkSUeZZ6aI466epTQF5iYAbOPdqumKIbWsr2POgscoiUSfD
         /UHQnreYl6gORphoUgK/sOWi/2JKcIxL2xfyf2QkJcXBxfg0M8wtVe6IVaj2pthbc1eV
         mMfSWHBx3EeyGE6E3qddOVcq7lQl4nm3yMbPLX6PBM3oWajkanBTr6N1NqkpLpW0UIBB
         A7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=aXM0nafd1W9ycZ41TLfNdaSac1KOciIjw10oXUgFP78=;
        b=WBvVHxihP7Al4gtXeWrolbh+GfkVgMeCUyfgm+WRxH/ma1+TirrcqzY5gBdDSzySId
         /HoWJsQuN77smqH9yIljMArk3ksA5UmhKQHPtPvZkbboWmuvKWO4qiJo5L0wbBBO3aSk
         AR4t5rrjYc6N06F53ucmcjDSxH6qWAvhHQydxFXTdUMAZzCdshuBPXiCICiwW4+okEJG
         rZS/hxDfDWBf8Uy3Bv92IhfTG77LiPRRLQX1kecSoEWdA3Xtl3F6ZiEXb/r7qmitxFkS
         XM5pXHb43nZY0Jwlc26nBuqn4aem8OW71P7k1vLx6Oiyc0nr/wO64SW+x/EBtYo3C151
         CHLg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuZiLt5wl8T5RowFd1rx0W0Cgii8V0g7pjICmmo+xAJ3+2yXr854
	G6B9s9g5kXJmzTeRNr1Rnd4=
X-Google-Smtp-Source: APiQypL90hRVPGyPHOBj7VJW1pum/SA7UPg6yW26iE3+nczphYMpgpb14mhbplVncmnqI6JXUDGpyw==
X-Received: by 2002:a1c:5f56:: with SMTP id t83mr16546644wmb.61.1586760876587;
        Sun, 12 Apr 2020 23:54:36 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ec10:: with SMTP id x16ls16824033wrn.10.gmail; Sun, 12
 Apr 2020 23:54:36 -0700 (PDT)
X-Received: by 2002:a5d:494a:: with SMTP id r10mr18607749wrs.302.1586760876045;
        Sun, 12 Apr 2020 23:54:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586760876; cv=none;
        d=google.com; s=arc-20160816;
        b=jQxp58ELps+SeKpiwyZe3SYfN4DhTpV9dSS+/+KAja05A8PA6GkTj0jLHF6RFpQSea
         t7XthboBlRGTfchpbWVbptnTkLmc0uFz1im7KRc8d4xvcWJqeK5bx8Iwle9mxjBIFQTu
         s1ESt4fPPF2sRHcWAw6zDwLShbOna8l86uvgPeroAR5+nFqEzVOdBv87uRgKXmd9lO65
         HNADdlual39BdP0N0Hxnzl4A2/20eo1AJS/0pbL1gEUMAJEzLyzhI5zgogY93TjBgOYv
         dvpJlj4HRYZRcFM2S60KwoK79mEotQ8w6gGLjUeATjN71ZEZcO5J74dLvziqwbV+aKsx
         c8Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=txel/XAgUSYTx6u+pUN0sFfO+u7fXuAf4UbUXkFnOX4=;
        b=qVjGCLP5FTwhwYmL7wAllHCIGzVNvYlWTuNiY0MMGg3uh7qyB8GXZP/GBVCJsHijTD
         wt4vmhg9TYYYw3lDbkSPIQ0YSlhssDGg4q47HqvnEGl6kROIvL2Rk7SFhwJoW7DcAzgT
         QK2s6tg3889QEwNU+MDPtXkQLn4iRINgp8ZF9/i4K2GkVgMoqkya2W7EGyzAtX6T1r6x
         8LESK+fDmv+U/3OUH2AUlZ6iSRd8sgkaIOFbRkrehiDcFsQ8G8Ah/i8Rj9Z9l/shiftQ
         hCxupraT7ec112E5ADAZ15KAYCeVJmWeyyGwlfR5s9AlT3rZOmrWy4VrShTX5txcWGYW
         X7Qw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=R+lQhi1g;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id g70si686852wmg.1.2020.04.12.23.54.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Apr 2020 23:54:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([109.41.193.243]) by smtp.web.de
 (mrweb103 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0MTy9d-1jofCU27kn-00QghH for <jailhouse-dev@googlegroups.com>; Mon, 13 Apr
 2020 08:54:35 +0200
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 11/13] Hook up SIMATIC IPC127E support
Date: Mon, 13 Apr 2020 08:53:53 +0200
Message-Id: <69e146367e07d0db71a6f2c75ba66d01991a49c3.1586760835.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1586760835.git.jan.kiszka@web.de>
References: <cover.1586760835.git.jan.kiszka@web.de>
In-Reply-To: <cover.1586760835.git.jan.kiszka@web.de>
References: <cover.1586760835.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:qS8hG9Id4Fp5TGVGLw4t4uqlfLpCTlRsbbcfiNWIdnpqus9rjPQ
 2XyjlD7qt6diGzT2OXMiMNs1DlTHAEiq/Nw3uqhU5HjwoXU7P4zXD30J6Cf2HOwn0c7DiLg
 wzrgUNWvreVREsVJStLlk/vUqAUGjS1r5WZw5gOaqTPcec8PF/py9aXVZhd/k5bYOtxYAL+
 DDlzgzHgSnTIU7VZ61v9Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:W+pK7VN3BpM=:Zwe6HOg8pmzA1X0jJ6a8mP
 BJQGRqPo1W70EjYw9YlGdaZMmwM6H3NAkT9LjHvKYOz9+fYEHDcoVIEFVGU0KO5VVq81zgaBF
 d6JPEfhi2op55AXr+oMJPwSgzn19cykbmxFlGdw0RhRj05k8RsDm1x3116YWz5htDc4G3GG9C
 Oz2uHNkMeZ73V6HSELvwCCReo0aEVsso931H6SOXpda0m25VDSN6/K6aj1HggoATn3gszvr8u
 swaWiyagQnvkLGyRsY9xeMd3N5lfa6kT2m6cBK58dZiAsZIOdFNweuRGkz6dlf07y2FGGBWfE
 j8pGBTSfKCn3uc/MG9/qsWSr1fBVwizUz27SBMqx7mDUNb7LEVhpPy3uVLJw5Bt+3AVrC92/k
 l848LNFI6fKiZBcd2Yg9CmE7lr9I+Y2fuLwUOz5z2Y55ceHXsebQIeWB7CphyWqAzfTqRSOKP
 XbqSGruNjecDDHJfYnWGwKUhS0ph6zqAnd4kzIvowZgpo+EKBBMnyD8kyzL2ZvICIs7mwfi0T
 S8ydre+T8jQu2TJy/2o/8mkJMexsPkGNUrHtm4Nt50l60lShHYthDPbGsGTsnVZzFEQBtx3WH
 si1oGjXB4t4sbm5SudLdua43UK7/y2DE0C/6Mw/DSILCu1CIRJE03oyO+zG+4AQ1v2b7Izbip
 FyPG2ecfDPT3zSan42oEnJw/3F/ZoNeDyEB5pqmy83EeEAwK27R/Zg+gFaXfwTN9iFPIZtCBU
 0MOdPiMe2+wvCoJIZxgF+xtyH2Cf17opf47YzcwP6VKeqroMtbU9phWdmJ56lt3TbAl3fkt7o
 E+Hom8YoOGgEbQmRsTCXaEVOU9f7TuAPUmr1jOj3HtDbK/8/82YvanWd+0xPHgMLBkWPgz3St
 /X2qtqEWmHFQf1fFFCYi+rLTxpKffS79OO1Gm9lxT/c0ESkC+ogvCYPlwahoOtvzFUfPzwrkX
 dKHH4BBn62eXmN5UVDySMRM2mK5qKWokk1xcDC72owch2H1xBOOaO/FlTcXw3JQJM4X5hVLED
 qFJ6AYqsar4QiezUY3jsnKWcCSnq1ZjvM+NaZVXhcMR2CJVeky2trGjxnwMvFDEkcZtkMbpWc
 Gh4nD9o0OTJ6vN1T52Dsiu4MN0S92JfFkrellMghwc3AqLNaQZEEpTVDOz6Ol9Rdf9dkXKP+6
 MeG4WcY47zvTfmiFIAGteCy+p5BOo+PT8hXAg/GmKgr9lWA3+tB7dM59ohiT8nMlLtN8pbhQq
 bWTfpvsKg25l4cWVq
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=R+lQhi1g;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

Add the machine, multiconfig and wks file, extend images.list.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 conf/machine/ipc127e.conf                    | 15 +++++++++++++++
 conf/multiconfig/ipc127e-jailhouse-demo.conf | 14 ++++++++++++++
 images.list                                  |  1 +
 wic/ipc127e.wks                              | 16 ++++++++++++++++
 4 files changed, 46 insertions(+)
 create mode 100644 conf/machine/ipc127e.conf
 create mode 100644 conf/multiconfig/ipc127e-jailhouse-demo.conf
 create mode 100644 wic/ipc127e.wks

diff --git a/conf/machine/ipc127e.conf b/conf/machine/ipc127e.conf
new file mode 100644
index 0000000..55299c7
--- /dev/null
+++ b/conf/machine/ipc127e.conf
@@ -0,0 +1,15 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2020
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+DISTRO_ARCH = "amd64"
+
+IMAGE_TYPE = "wic-img"
+IMAGER_INSTALL += "${GRUB_BOOTLOADER_INSTALL}"
diff --git a/conf/multiconfig/ipc127e-jailhouse-demo.conf b/conf/multiconfig/ipc127e-jailhouse-demo.conf
new file mode 100644
index 0000000..91db206
--- /dev/null
+++ b/conf/multiconfig/ipc127e-jailhouse-demo.conf
@@ -0,0 +1,14 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2020
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+MACHINE = "ipc127e"
+
+DISTRO = "jailhouse-demo"
diff --git a/images.list b/images.list
index b794d85..003fff9 100644
--- a/images.list
+++ b/images.list
@@ -2,6 +2,7 @@ qemu-amd64	QEMU/KVM Intel-x86 virtual target
 qemu-arm64	QEMU ARM64 virtual target
 orangepi-zero	Orange Pi Zero (256 MB edition)
 nuc6cay		Intel NUC (NUC6CAY, 8 GB RAM)
+ipc127e		SIMATIC IPC127E (2 cores / 2 GB edition)
 espressobin	Marvell ESPRESSObin (1 GB edition)
 macchiatobin	Marvell MACCHIATObin
 hikey620	LeMaker HiKey (Kirin 620 SoC, 2 GB edition)
diff --git a/wic/ipc127e.wks b/wic/ipc127e.wks
new file mode 100644
index 0000000..c11f9d1
--- /dev/null
+++ b/wic/ipc127e.wks
@@ -0,0 +1,16 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2020
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+part /boot --source bootimg-efi-isar --sourceparams "loader=grub-efi" --ondisk sda --label efi --part-type EF00 --align 1024
+
+part / --source rootfs --ondisk sda --fstype ext4 --label platform --align 1024 --use-uuid
+
+bootloader --ptable gpt --timeout 3 --append "intel_iommu=off memmap=82M\$0x3a000000"
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/69e146367e07d0db71a6f2c75ba66d01991a49c3.1586760835.git.jan.kiszka%40web.de.
