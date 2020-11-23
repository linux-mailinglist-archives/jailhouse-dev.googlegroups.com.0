Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBX576D6QKGQEDHPEECY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id C858E2C16BE
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 21:47:27 +0100 (CET)
Received: by mail-lf1-x13b.google.com with SMTP id 190sf1818298lff.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 12:47:27 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606164447; cv=pass;
        d=google.com; s=arc-20160816;
        b=qeKxqm+4GZ7N8gUc7xgqOy8lhdAa1REILmEd6h0Em3QmD63Va5xXzB1buK3gtSDUyW
         qAympyxv8hpGvssZiNoEXLDJ5AeMe4uwlBA8ws9tUb24/x5A5fG883fXPph2EW+inPrd
         qNa26n9Kw94bZzgZ18U9RLxUpSdgny/OoKL8t6Ur/Xb/9nNSioezJLauCi94YxSHLAsK
         BpfGt60Xdy24XTY71qgkyW42bL6d1ckCybaD4YmGIra++h+xPu2uyIu8CWG0VVPn23/R
         meHcFognt2059GO6KdCZrXxnLPicbulAbTJVVDsuhF5faVrI8I4b7zLrZX3bpG04KANF
         AUOg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=hoJXWDarKRc4Zd/5ZYNGSRA7PRWuuUNizXSrPTuNZYo=;
        b=nYT6sPNU3Vz7cGIN9IKP93y31o6n89voNENjrgLBtF8gWzMDNfAT7gSU8JhVjs3nAT
         AXU8y1n/I4pEdlJF7nIZ7WvKn16FOcJAvo6JTV46aejs6NGG46xSo7wI5I7WDZrmDso4
         w9zRJOH5+/+EUXzGnHri8e1H3ayC/jfpKhyKxpLVw2HDY9xxg8hr77rYWGw9ZFXrEi7J
         5WYbp3LhAeALyQ7R2hP2ozhhC6ZdQVh8izwoUahIt4tc/Oza6bF1St3eLGTn/qXbt1hS
         dPZbKeT6+GL09GMOGdGVDOYP/LAohbFSSN4Sm+sird1E4/2GlpxoulQGvJB+5qX5m6Qh
         vJ4Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=WzYtGqEs;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hoJXWDarKRc4Zd/5ZYNGSRA7PRWuuUNizXSrPTuNZYo=;
        b=iHMFlkBhq0XjajBt7Y1Ib9dFcAFvt5o6wsyYsTl2YIH++NswvsqKAMeRGjUYCYWmmw
         73+E4SOC2xSQS1vJzHe3OoXL+6GtpS1lIRJV0y2Jth3fopGG+puQa/ng3QlTK//BMsh/
         aCT81ZrnUVug6/lBVWNyTHhO4UFNhY5+i+DHRf3biKbM3U3oDRP924AI7Iq1qdDba4p1
         bJg9blvhFuZ9+wXmBXivgIXSRxYKRD+yQPXqV1vJWWwMgKi563ACRPehbsp0W58Bv4cB
         KRgeA6ZsPu2p7g9tz0AHu5+C8lusvx91I4jWocVHgkiO6r3eNewwJTmu4zV2eGUVLVnc
         ZQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hoJXWDarKRc4Zd/5ZYNGSRA7PRWuuUNizXSrPTuNZYo=;
        b=KsR+BLOJqMg9Gh+4OHkvT97W8+InrmWR9rfysRtAKSrwxyq3i7imCZek0ij1LMxLLB
         mVRCZV0x2pVYG7giKWg6bRUphuYGMBdnUh1fl8RFT88SK47QGY713yOTuN01zLBY5+jK
         UjTVA+m3PFhf/4y6ckUAX9+H5pgfjKw7h3m3mDNnAw7OWI5wdpp/xofwBkvewiJcpuEE
         E0qfV0dXHsPzvZCLhUAUWKN2TjbG4yJZpMOPm6s953QhGaeEAuBtjCQBMw6y2G3UaAf+
         uUxBmlcVLeSKMVENi6GHMlfo1sgLZeUk5G/bb2XqAEE2kZLNZ0eyduIUw2jL5/B0o9iH
         j45w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5304hV1FX7M98lDuLDSXisYHtF03DDsrPz98HR58AOMh/Mbg1bAa
	10BuxpKNhank9VHE9HrQq1Y=
X-Google-Smtp-Source: ABdhPJyfu/gaz2sX7DJcLY+x0weyz1v07nsG6RQHssOaZ7sUdgGICfY93P5R9dKFXj8PqrUvU3nDFg==
X-Received: by 2002:ac2:44c8:: with SMTP id d8mr383810lfm.471.1606164447389;
        Mon, 23 Nov 2020 12:47:27 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9848:: with SMTP id e8ls2380815ljj.4.gmail; Mon, 23 Nov
 2020 12:47:26 -0800 (PST)
X-Received: by 2002:a2e:a17c:: with SMTP id u28mr494698ljl.453.1606164446346;
        Mon, 23 Nov 2020 12:47:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606164446; cv=none;
        d=google.com; s=arc-20160816;
        b=po9s/86GWVVQxq3Vs7pBgga7fKuMiOjXdWijJHkzYbi6+Hj4BYatmfXkTnTBeJ2zDn
         EIRd5eb2CNvkNgo8Lc3f/0K0Wg4HZ+hPmVCt19E/J0U3o+t8TzhalUaqOOyTA7oHddrJ
         z+JIKlJi8YjzDZZE4O/9RybHT+i6iQ7Qv8WXzHEv5Iv+ejxtcU9OkSDqf+g/SPqyos2G
         GQRq92Li33nvpO5S1PDve/WgnWhF07k0l1LcR751jMvOKFZtqL3MIl1UYL8Vc76J1da7
         oSmujDzYB8s5OVr6YYXwL13Slp4xwycBMXuBdw8gdsgs9q1PB1NiQngQw3NXpiYdWZD6
         a+1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=c3EoiKN50v8BW72bQRRfJo+yLt4UQU5GoLfLZB8uzv4=;
        b=NBplbggYRvyv9Mi5+MjQAkT/9utr96NeO76IbH4JFFbGL6syubJT4Y3vIXfFT9JmGN
         ayVPg2flkqyPaPIm0N1+jLNQWDK9trdT3QhZnKb6XPYipFcj3CDVzNn67pVjRk6FP5uC
         y0jQxTsYaa7YCCL1RKYQHd2dN40/lej3v2tNcozs35++poh7MAEXK7UbF2/8u/GMGT1I
         LPUl9kqycT0lT+awXxjwbDkwxF31WNIRN8ExGnNUKUFQkasysniNEh0wRM1WFXH340dX
         yT3ekW0tmpzPcrnyLqWfZqx9Z1KYUqUzpEhqspKFSs7z9exFBa3bqx21JzbWfaRKhCyK
         hBLw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=WzYtGqEs;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id i12si446030lfl.0.2020.11.23.12.47.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 12:47:26 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4Cfzjn5wkTzyV6;
	Mon, 23 Nov 2020 21:47:25 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.877
X-Spam-Level: 
X-Spam-Status: No, score=-2.877 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_TO_SHORT=0.001] autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id BWMfsHZ6SR1K; Mon, 23 Nov 2020 21:47:25 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4Cfzjn1CsRzyTx;
	Mon, 23 Nov 2020 21:47:25 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com,
	marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH 13/14] hypervisor: coloring: make cache autodetection debug-only
Date: Mon, 23 Nov 2020 21:46:12 +0100
Message-Id: <20201123204613.252563-14-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201123204613.252563-1-andrea.bastoni@tum.de>
References: <20201123204613.252563-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=WzYtGqEs;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/arm64/Kbuild                     |  6 +++++-
 hypervisor/arch/arm64/include/asm/cache_layout.h |  2 ++
 hypervisor/arch/arm64/include/asm/coloring.h     | 14 ++++++++++++--
 3 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/hypervisor/arch/arm64/Kbuild b/hypervisor/arch/arm64/Kbuild
index 3f5aebcd..c0705f12 100644
--- a/hypervisor/arch/arm64/Kbuild
+++ b/hypervisor/arch/arm64/Kbuild
@@ -23,4 +23,8 @@ lib-y := $(common-objs-y)
 lib-y += entry.o setup.o control.o mmio.o paging.o caches.o traps.o
 lib-y += iommu.o smmu-v3.o ti-pvu.o
 lib-y += smmu.o
-lib-y += coloring.o cache_layout.o
+lib-y += coloring.o
+
+ifdef CONFIG_DEBUG
+lib-y += cache_layout.o
+endif
diff --git a/hypervisor/arch/arm64/include/asm/cache_layout.h b/hypervisor/arch/arm64/include/asm/cache_layout.h
index 959388f5..aad4339d 100644
--- a/hypervisor/arch/arm64/include/asm/cache_layout.h
+++ b/hypervisor/arch/arm64/include/asm/cache_layout.h
@@ -13,7 +13,9 @@
  * This work is licensed under the terms of the GNU GPL, version 2.  See the
  * COPYING file in the top-level directory.
  */
+#ifdef CONFIG_DEBUG
 /** Autodetect cache(s) geometry.
  *  Return the size of a way or 0 if no cache was detected.
  */
 extern u64 arm_cache_layout_detect(void);
+#endif
diff --git a/hypervisor/arch/arm64/include/asm/coloring.h b/hypervisor/arch/arm64/include/asm/coloring.h
index b01f605e..f8bc1107 100644
--- a/hypervisor/arch/arm64/include/asm/coloring.h
+++ b/hypervisor/arch/arm64/include/asm/coloring.h
@@ -23,8 +23,12 @@
 #include <jailhouse/assert.h>
 #include <asm/cache_layout.h>
 
+#ifdef CONFIG_DEBUG
 #define col_print(fmt, ...)			\
 	printk("[COL] " fmt, ##__VA_ARGS__)
+#else
+#define col_print(fmt, ...) do { } while (0)
+#endif
 
 /** Color operations */
 #define COL_OP_CREATE	0x1
@@ -68,14 +72,20 @@ static inline void arm_color_dcache_flush_memory_region(
 static inline void arm_color_init(void)
 {
 	coloring_way_size = system_config->platform_info.color.way_size;
+#ifdef CONFIG_DEBUG
 	if (coloring_way_size == 0) {
 		coloring_way_size = arm_cache_layout_detect();
 	}
+
+	if (coloring_way_size == 0) {
+		col_print("Warning: no way size configured.\n");
+	}
+#endif
 	coloring_root_map_offset =
 		system_config->platform_info.color.root_map_offset;
 
-	col_print("Way size: 0x%llx, TMP load addr: 0x%llx\n",
-		  coloring_way_size, coloring_root_map_offset);
+	printk("Init Coloring: Way size: 0x%llx, TMP load addr: 0x%llx\n",
+	       coloring_way_size, coloring_root_map_offset);
 }
 
 /* ------------------------- COLORING API ---------------------------------- */
-- 
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201123204613.252563-14-andrea.bastoni%40tum.de.
