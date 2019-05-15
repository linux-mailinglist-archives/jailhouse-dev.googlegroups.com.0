Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBZGH57TAKGQEUPMK62Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 398B91EB94
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 May 2019 12:03:17 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id s3sf914368wrn.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 May 2019 03:03:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557914597; cv=pass;
        d=google.com; s=arc-20160816;
        b=pyVtEetyReS0tfi7exRlfxN6sJMLMvVXgruS3CCTN/dh+ZJaOZnet3EE/t0da1x1Le
         9gktW5lEFzoAZ1civfYNe/b4uftI/6r6Xf81xC+mGBE4WI5QWVYrr5c7BNKTHhkUoy6D
         OcazFekdKLVuc8Hca/N3cEbTUnOsfCXhC/felgrlSfU5SIsjVY7YqQvPZ0Jbomk10Ew7
         jH11Mw6uFJqEcq1IqusuBKyjQc0R+BsHvNHQXY8YLUDbkKnV2NeGFWc9wWhMNaxy7iKh
         rvhiyrZR5fuPq5IWGeimaGJHSn0Lr9IwCdhGjUad/wjysxA9pPm9+FN1r9R+z0CXHXzD
         ZBSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=kCz/aFqfD5oWQLo8XM9AYfK0y4IA0Js0rLdhbs+Y9iQ=;
        b=EpDw3k9ZIfjcufN8Hm9cppqjNPVtsUo/BlCtMprO8vmIR245yEVQsHCzd4OBkBbGbx
         J1y8WOgllD5erArQ5ojgvym/N0iSEtzq2mi7jytyDNihVbsyoMAAVAF0dotqj1Og9hNP
         6D6rosnv9Ns05+8ajILUfdhpEiJDFLQgVljt+TU3/reV4fmQ+ev2+Bg850bn1ukrENSJ
         ojwJ7+cvsC/Coj/dwwH/BMahrJ4JPV0CfNoWTQ6qjB/EjR1WiaxaiF+OBV1cDteWZr9E
         6Kd1kYLAGqWqrgqxTT6lkXjbLsKHUiivKfpKguvRqKV++tDSCPdQDuhb7TlvxCNCdLVG
         KPSQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=qd7HvgaC;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kCz/aFqfD5oWQLo8XM9AYfK0y4IA0Js0rLdhbs+Y9iQ=;
        b=PqkgeTNpPa8XeGpuGtq5IoiY/EWQhTQaxoX3xWmrZo0A9/brg3tYrRzEy9wEmvyTBn
         4J0kXVjvOoUhpTcIrPyP7qwJyR+yx4Bf7N6PrpXpqZCk6z6qOtJfhM6JADY0qiW2a0E/
         HowTYmRPtY7GhCoxForFZiHwnXhfqss9NQ0cXV20hE6ADb2zs/XphC0XPyr8a9zUOXYv
         7usCiJF173QH/P9oGQgkMcTliz7sswvzecljdn6Ze8MK0T5fmlUdciZhCC6/ZyNhlT/p
         mSTS14Z8AO48tsTl7ieFK4v7IogO9cGdRE2X97rp1TyaAiNewLEAJ6iXVwy1UDaiyNyo
         c+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=kCz/aFqfD5oWQLo8XM9AYfK0y4IA0Js0rLdhbs+Y9iQ=;
        b=ZslRJjcnJXBTg1W9mXjJad9Z4ESAAEEg5yaKfT2FVcgTyXCKqM19NxfRjNSnCH3hSH
         +z9s7T5F7M3yGGnQfbBlJjfoRcEbgIgjQnL8Vwj5bJ3W/qmpDnK9RrMMT8WZrdEaNTmT
         nCMwWA8zW1IiWESSgusRhbrw8itAwV8yUCP9c3RT5N+AFLGMHcfds3TKsW6W4klrqN/O
         7CuqYGLW1B6Wx43XWysc3r1Ot+r4ctDeAXnyLlfuiK1oq+jc5eNLLJnNUBoCaZaPcMRQ
         wbSAK/nKKwV2xmaoxQNuja6KLYfYRu/no9jIW7gl/5F/PEzknTKoS1DJ+Z+Iyn88sbSh
         0wJw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUzXFK6B5dnB7cOmz1x9kstZ2ecEz5smQvT7PRepNELYNxoAGg4
	joU1AtgL6v9paqpxG6iloz8=
X-Google-Smtp-Source: APXvYqxr9E0JoY0s1mv/A6ZyvcvhojqaEAOAijMafHZyDKnw4m72f84uUuUNeaKdAQJZo+iQQ3hNhA==
X-Received: by 2002:a7b:cf1a:: with SMTP id l26mr9693916wmg.18.1557914596956;
        Wed, 15 May 2019 03:03:16 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:544d:: with SMTP id w13ls468733wrv.16.gmail; Wed, 15 May
 2019 03:03:16 -0700 (PDT)
X-Received: by 2002:adf:b458:: with SMTP id v24mr26378777wrd.46.1557914596506;
        Wed, 15 May 2019 03:03:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557914596; cv=none;
        d=google.com; s=arc-20160816;
        b=ZQ2JHTx2MYYA8HJgtOYfa6vaxBZjASXIxz6AkI+IiNppqSvkk00yN8WTgQ4hpK4/tD
         G3cRFryZK2Pb0y6TB/TEbFRdSBtNQLebkfbjaak/99KbWfLcoMrfT8ciE8MvCZfUdRrM
         e3AE71EphgOC6o2USfaF4URLIkrd16ocbGptiXyqw+owX43/zLzCA9wGJNsnHMrBGHhL
         G6keZ8P1CkPFEXbylG+NhNAXpqja1Hv48UpIPtzT3g2J1ArUs2eCMu5me3fNhSSchQ8t
         wYVcPXlj04esZC1HHYcPl9xLpqTNeQGCNp5fbJry3p+Eg0JGDPmBRLTsl4MdRH9KGNsk
         /qAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=oONH9o26O/t82+UeDtyWBfy1Zvvm5douiPr3YnmMun8=;
        b=O7qls6ZX0aY+gmf3w+hFY6RgatFc2myEAoryz8071Jft1c7kqS2Wy2c7c7ftofoxYt
         Fdz3OE0I0KqJ+40hzz7MeY2NxPhkbNtaT3GyNMiFCdHcqvfB5+3YLR3m7TSdlKTLTdiw
         fL30kTXqwkWTKaCTe5viaNLGHRhw7Kboh95oesFx+IR8nP7mmRqczW1ec1Eo+fQgiBth
         PNou3HfeonrIqImjUdHeLisl17vKwoWhkMh9YvpvnC8zRpeI4Ozd3V959ILWfAUg0bT1
         yGU3Gknw+1JiqsSWl1F2MiLDrBbz+ZWj1xumpXLYmx9o06gsqlJbzH+jF64aGoBrDINh
         Cdfg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=qd7HvgaC;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id f83si126086wme.2.2019.05.15.03.03.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 03:03:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([95.157.54.22]) by smtp.web.de
 (mrweb002 [213.165.67.108]) with ESMTPSA (Nemesis) id
 0MSazE-1hJ3EO045U-00RdGq; Wed, 15 May 2019 12:03:16 +0200
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 1/5] configs: x86: Make Comm Region writable in all configs
Date: Wed, 15 May 2019 12:02:27 +0200
Message-Id: <2c86f31e947394b14aa23f1ac5b2672b1e0a8044.1557914551.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1557914551.git.jan.kiszka@web.de>
References: <cover.1557914551.git.jan.kiszka@web.de>
In-Reply-To: <cover.1557914551.git.jan.kiszka@web.de>
References: <cover.1557914551.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:K60OThjVU2VMRTFiPGgGt/d1DUarpAVTf44ETRN1gJMaVQyuVqc
 lT9cWf9A9jHodPgOyXw2phUNGPHvXoIkVFV8e8D5B/ppkayJ2mRDtXwOcKaujnQsVKkLkWU
 vu6ufSZhp+QyFlAxD7BkxBBw1zmgeFR451aGMYBEvlYqpXnwmwwSf5YfpJ/v5hnOcfgCVq+
 X5qq3wUrr9EIrkLj150iA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hLTgyc/rBIg=:UPF/IWFDgVnEE4k9kfUx71
 pj1XGM102upUCgfhNDo72i2kThn/fze8pd+4vyj9igzFJWm41eMKeyV0hfq+HxwyNzpo9UbVb
 /FLe23HEUxe/+ypFyUY1WD9aZXHry5f4nEOqTHQu4EoByRRWyX4dnFw1SMFQKMukxB7MUS/Ny
 XsKyjsytJm6uGLzSxoTxooqhNx10kytKifuHZ/B1BeCUlx3a4nOgMSWwQpVQStzXypadyMp6Y
 T5beBpGMYqGfmTfkeIqTfCd+/tmmwGeOXLqPutNRAlF/oVNpIwrGtWc5uzJPtbokAncDs6NJY
 q6bStlpvoXT19jtTQYzTddwc6LJDxTkhJcUgVwMCY+dZXiszBbM2mwC0qejVDtm45O+0RVCsl
 YfdIc4Wki+1NowtEzPAO6XVzRxVDPgZiHhXChJo0wj0dYTKqhBfOEjEzVQiqKumWN2JeXJhuj
 Je0GY3Buek0yQtoqgAtUVff7HGWZ6izcww7VIVO2mSiEgWr+GAV9Ibj8CARTW5u09CtWcBf66
 TbTVDC6yvl/lEKqKPYlOOiT3dQEMftqyFdMfrxwp2A43HOiWmcoEluBZ9+r9QV5mUHCO/+MeY
 ADEd10A6Fj914ScByYTPSxJtl5dCS0D9l2NJLaMqcQoBoZlQ/xgmyaXLGZC/D5j20jjIXswSB
 5kOzrCyygXjavRsLUrmsAaNnnuJ5RqL2RdO9f+KJGw18P2aOM6TF77ZR1W8y+PBOhuRpJ9e3i
 IVrI2NiRG2XiC5P9qAoTnTydudOzZU6+V5+LDtt+uJD+30hc1lmw9uxgXeJ6DBPIgRjDyfQq+
 Pdon/940LfEh80yX0pKINmyHUkVrTObTHi18g5By7f/RX+mSwXykpu2mQxCB62VSSEnSMkwHO
 p9keXnnYUKoNQFqEfkhlVCd6Q1Owu6cZUfkPNl2eG3xFRHB4ODOMb9yaBL8/Uf
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=qd7HvgaC;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

Since we report startup or runtime failures this way, we need this
permission even when not actively participating in the message exchange
protocol.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/x86/e1000-demo.c     | 3 ++-
 configs/x86/ioapic-demo.c    | 3 ++-
 configs/x86/ivshmem-demo.c   | 3 ++-
 configs/x86/linux-x86-demo.c | 3 ++-
 configs/x86/pci-demo.c       | 3 ++-
 configs/x86/smp-demo.c       | 3 ++-
 configs/x86/tiny-demo.c      | 3 ++-
 7 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/configs/x86/e1000-demo.c b/configs/x86/e1000-demo.c
index 814f13ed..93bb4cfa 100644
--- a/configs/x86/e1000-demo.c
+++ b/configs/x86/e1000-demo.c
@@ -61,7 +61,8 @@ struct {
 		/* communication region */ {
 			.virt_start = 0x00100000,
 			.size = 0x00001000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_COMM_REGION,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
 		},
 		/* e1000 BAR0 */ {
 			.phys_start = 0xfebc0000,
diff --git a/configs/x86/ioapic-demo.c b/configs/x86/ioapic-demo.c
index 30e0ac98..aacbc587 100644
--- a/configs/x86/ioapic-demo.c
+++ b/configs/x86/ioapic-demo.c
@@ -58,7 +58,8 @@ struct {
 		/* communication region */ {
 			.virt_start = 0x00100000,
 			.size = 0x00001000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_COMM_REGION,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
 		},
 	},

diff --git a/configs/x86/ivshmem-demo.c b/configs/x86/ivshmem-demo.c
index b3a12a9d..6fcd76bf 100644
--- a/configs/x86/ivshmem-demo.c
+++ b/configs/x86/ivshmem-demo.c
@@ -60,7 +60,8 @@ struct {
 		/* communication region */ {
 			.virt_start = 0x00100000,
 			.size = 0x00001000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_COMM_REGION,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
 		},
 		/* IVSHMEM shared memory region */
 		{
diff --git a/configs/x86/linux-x86-demo.c b/configs/x86/linux-x86-demo.c
index cb89ec0a..80d6a589 100644
--- a/configs/x86/linux-x86-demo.c
+++ b/configs/x86/linux-x86-demo.c
@@ -65,7 +65,8 @@ struct {
 		/* communication region */ {
 			.virt_start = 0x00100000,
 			.size = 0x00001000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_COMM_REGION,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
 		},
 		/* high RAM */ {
 			.phys_start = 0x3a700000,
diff --git a/configs/x86/pci-demo.c b/configs/x86/pci-demo.c
index c7a5527a..7ed93d56 100644
--- a/configs/x86/pci-demo.c
+++ b/configs/x86/pci-demo.c
@@ -60,7 +60,8 @@ struct {
 		/* communication region */ {
 			.virt_start = 0x00100000,
 			.size = 0x00001000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_COMM_REGION,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
 		},
 		/* HDA BAR0 */ {
 			.phys_start = 0xfebd4000,
diff --git a/configs/x86/smp-demo.c b/configs/x86/smp-demo.c
index d175c618..7ba309ee 100644
--- a/configs/x86/smp-demo.c
+++ b/configs/x86/smp-demo.c
@@ -56,7 +56,8 @@ struct {
 		/* communication region */ {
 			.virt_start = 0x00100000,
 			.size = 0x00001000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_COMM_REGION,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
 		},
 	},

diff --git a/configs/x86/tiny-demo.c b/configs/x86/tiny-demo.c
index 493059ae..7150d741 100644
--- a/configs/x86/tiny-demo.c
+++ b/configs/x86/tiny-demo.c
@@ -59,7 +59,8 @@ struct {
 		/* communication region */ {
 			.virt_start = 0x00100000,
 			.size = 0x00001000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_COMM_REGION,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
 		},
 	},

--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2c86f31e947394b14aa23f1ac5b2672b1e0a8044.1557914551.git.jan.kiszka%40web.de.
For more options, visit https://groups.google.com/d/optout.
