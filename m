Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNXG575QKGQEFNHV7NA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C0E2844E5
	for <lists+jailhouse-dev@lfdr.de>; Tue,  6 Oct 2020 06:31:51 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id 76sf1326005ljf.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 21:31:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601958711; cv=pass;
        d=google.com; s=arc-20160816;
        b=Rud0JdbfLa5pJ7mKKP1lJUMQBJ5G5ME6sAHmjTvGVGGt5pnE+coTpjIrLb2/Ve96NJ
         cHd90bnX2qmZ4mDoZQcgSJ0+IlLdCj7aX494aXAgzkM6LRlqXdty5TH3wuv2nqGQhWsB
         TtHfhol74DX5ZKiGO0SA0srNdzcpWu5P392BNrgVzNATmdIE3Nn9FsbTTLcczjnogH6q
         LTL7W4LA1JgDdiGewMIf0tUjkYsnbK9QMEc7y147ByU/6fkrUf/Iii1kmIB6VpTGLttZ
         C2Qg5jtgY8QKIZmiXe+SefvISyYN6Zf0Iw1FypkScyAXUyMLbhgfeJqQTOxGPfwSAG5g
         3X5Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=JyBMh0oXw1Uus8lIKXBLvkZ2TD+KAeDX2huTTsGZbds=;
        b=1FWqTjdKq+nyZZGbC1GkbyzQHalFVaHvWs3dOQ0KS4eNRkB+wg1AZNLCIA8Xvj84aB
         U4EZwgPaZt0HVTsCi11YMUpMOurNcm6/tCBnyQIUtpiqgMFQauPNTO+e849GJoBmE4y8
         +7p+k+OCOpz2KaVf3hq64RB02mYFdoyH0XocxsmkSwtK16rnkyAp3QVHtLbvyzIWn9zx
         eJCDm7kbolZcYseJBXnhPuL4Kol6MbIYTaI5bpQxKn2DOU0rp/YimvlpphJozux1zvYN
         FNpXGNu4lr9e8taydLOtC6VvH9p4/oAjc5u+ejGtySaw07MdpvHrXwGCXObNeYASa0WY
         jw6g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JyBMh0oXw1Uus8lIKXBLvkZ2TD+KAeDX2huTTsGZbds=;
        b=DJmLXIn1A3cpp4ymM5NLGc6Df/KyojR3r+NtR73RU7a0IPF5VXWDmjXt/MBh93ZE+K
         Cey1i/2VHkDie5dKWiWLBnogy5rMGxibwKnOwKzsz0jfVZI6Y16s5ZmVMBhefjh+I/Ms
         EOXxbMC3Nif/4YjfJEyiimKfYxCbcn1uFaG4XtdSdorofIt7rUUoHj4YJ8bC6tWwIuCX
         F+bvq3Ghrz+dYPgI3ZWUAPVTX+wNX5OTkD0v/wOpNYViCuvZ5rMsOMhu/C3yOtxWOTPI
         W+oQkEAEAweHwORKVDAx0Yo5JsdIdZKe747TfrMKUdN4R7eFjPlA5U/e/pt07gxraBVH
         W20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JyBMh0oXw1Uus8lIKXBLvkZ2TD+KAeDX2huTTsGZbds=;
        b=DXnhSMtQzKIAvhKkGI1CV8b5tavQSSyb4SDbJokUAIKG6YCDow1raCJ5vSdlYH+AX/
         k8YHZy6YnxjGDmmv0RBrcEum3kbr0elsiHCSaYKFfOUQe7PDMCqpn5V/2UyqINcKr8s9
         0D/IEflm7Uw7lFBoGt3ZcHh9G0iZR1vG8DgirioZK3YIsKNKT3fqCqlCUrTr1xBZhkqA
         RwNuKT2Psupwq9CEtmdGZKM+A/xqKP8/RCYan91J7eWCnbiXN7eCG1rVWWs2YQt4E8Vg
         vfA0K8r0l3INTwaJGvVueXRL4u+JojYMC6O7cNmcQ8bgROad7b5j5Xr9wTrwAVEGDmgA
         4PXg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530BeL8hePmylZtOaJH9OZJUrXZJ/XuTNh2CBXc6zIVMUil/Tkw7
	i8EGRI651aZkitZhkfCcPIg=
X-Google-Smtp-Source: ABdhPJzfXWjWrTvtBTYbv8HcfOhqIJGf+fuGOs973XctPcgib2r72j6fKebc6/8noYgAPB6GPB9uSA==
X-Received: by 2002:a2e:7e0f:: with SMTP id z15mr886626ljc.117.1601958711036;
        Mon, 05 Oct 2020 21:31:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:93c7:: with SMTP id p7ls1442877ljh.11.gmail; Mon, 05 Oct
 2020 21:31:49 -0700 (PDT)
X-Received: by 2002:a05:651c:102a:: with SMTP id w10mr984946ljm.64.1601958709705;
        Mon, 05 Oct 2020 21:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601958709; cv=none;
        d=google.com; s=arc-20160816;
        b=S1BaP7GoVe9iOYNeHJVLVPNvCF31mL0q5TBNxSYWHAXqEqz2PFMG3ZD3uzq6WlWXyb
         N4DMaBaKpgd3H5qSMYATATbtcTze7JFzlfUh0xySjXLVBroqgV+aDbgoT1rlveusqtvY
         la3+UIkZCyXx6NZwyJ6olOIdcUUDbffo3qkRBy8vyoNDq3J/lSb6vN10SV6yht619miT
         2mCJTlQweIfYCtOj+untzU6ACs6pim/+7TsZxIYGDlD36CG60a8xDYx2VBMp9mR/diH6
         yrXPjHtJesDZ51u4c+Du5waBkx0luxmePApBcoT5r671ylD7VwMSNv2korY4aqW2yNSi
         KGMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=Cw8UGQhMZtE8j/vHb9LtHLKiWJ37xKKGOXUqEdoa6OY=;
        b=Urz4bUAYP8LTziqxn4GJpeOuDRIdID+1bIrulbghwETXkj198z+ZgJeN1qF68CaaY0
         ZqS56iEeKIQo/HQi3EwCigTyochINUbnGbkQ45Xzo1fh1jGIpVk/MuV74Ok2/U8QgnWN
         0okKHYFumLefqUIXlLbVKjDGTaqPRZ0RgXp6kgemwpTxsBYxGiiMtmxPT+6Kc7AW6kDM
         nycccq5dYsDZOmaoQN8ItFsz7rE7KIiRDzgZqwR30rbt8QNWOkohCB57Jc7pGE2fdvJR
         mqT7vV6Vxd5ionNfl31bGDsS0PedYxZF976xclDfx+gwwekmU0WF2AKmO++IdUDvhQQj
         KXHA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id d18si45829lfb.9.2020.10.05.21.31.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 21:31:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 0964Vm6H029747
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 6 Oct 2020 06:31:48 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.160.159])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0964VY7s008537
	for <jailhouse-dev@googlegroups.com>; Tue, 6 Oct 2020 06:31:48 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 08/19] Hook up Ultra96-v2 support
Date: Tue,  6 Oct 2020 06:31:23 +0200
Message-Id: <af2301ef6d507ebed2e98fad77b7a6b36909f699.1601958694.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601958694.git.jan.kiszka@siemens.com>
References: <cover.1601958694.git.jan.kiszka@siemens.com>
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/af2301ef6d507ebed2e98fad77b7a6b36909f699.1601958694.git.jan.kiszka%40siemens.com.
