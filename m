Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBK7GXKAAMGQEF6Z7I5Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB02302496
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 13:01:48 +0100 (CET)
Received: by mail-lj1-x23a.google.com with SMTP id k7sf14795ljj.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 04:01:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611576107; cv=pass;
        d=google.com; s=arc-20160816;
        b=FOHCV0p7OLPzczaiNNhy8e8vfSpANy1/GVgvuByGz2KA8y6e8Dbm0HIT68dVLsJaZa
         /BrXpS2SiA4Ww2FVA50e7i7+yJ1IPGOPvsHJ8ufcDpHJHdNKoOXZK1mlfwS3lbq7wHli
         AVZw9qBJP3jLIkGTnSh+bdaUJLBuJpdTGj5PY+D7wBHnQkmnKjtmLYyjiR8HUJnbVhUS
         OOMxje3kk22dBZTr8uLVmOCFrEOgkStdrZlxqnVpJb3bgRAe5o7C6tqstB8m5E+3wdCx
         ZNiDAOqnEfZ2rOXHPzHP8FvreFppFBpfRMBqZIvf8lYqEDDJSxLbAPqeJb+Ww1uPEPSM
         LOng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=dC/tNvd5TC+Pywoy1C1/Rjdgtw9yg4X4B2DibD3db6U=;
        b=u8KzIxZ+xg6Exkgx5yDz13tI1yRHnv9PZs91Bg9/zWORLzmtfXxuEPPjep65SRHDU0
         oehXDO5NA9h6oUvJZnM044qVPwm4sVObDlUIhFwNGTE/RcB8ST7NiYG/DOVeqz1ASvjb
         frtjMmWn5jnZeN9r6nvq+Px0jN2GBoSSJl1M2CZ7xBjjfZmoSpzV4kODRqO47ofiwhhi
         ooFxSQJFPfKD7lXqlXjLKCXaipD/KGAjk5VxFOmJ2pGc612tea1VRmeolxG0OVsCoM1N
         rxE8DCucPZ+NFXBeevg7eltoliIpp4KhXQ1i5+JLsi23pH7yl+418Si7wJxegvbd8oeh
         WhGA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=hkNOWWve;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dC/tNvd5TC+Pywoy1C1/Rjdgtw9yg4X4B2DibD3db6U=;
        b=NBTGneRpfvIwu44P8XL3V3eKyU5MLdEViYMHZtUK2KdmYbryCvo5dRJ3jY8ZY+pLBQ
         rD8fv/EHyKogOL5TtezR0cbMrLuHczouEeA83+YiKJDagyN89Gf1zWXa1InA3I2u/t7K
         0sizwqJFXLYcjX678Of81WUFqb5O/WwprnlzJovf9+RZHoXhhzOCx2/1IChsCjbkc6V1
         JOHVfBuldslZLUIKE670qZa3VxraHG/CJH915qpzDCEJrA6LDSZJJzfrWFGq9sd1Oi6s
         GjRxaZFtqKL4bOTD5wFpZV6OsweNi1KwBe4britHEus5+Ls7hc5ZbRfYeqOyonZFAcIP
         0AJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dC/tNvd5TC+Pywoy1C1/Rjdgtw9yg4X4B2DibD3db6U=;
        b=Rgm8IoJRgoXE01gA4iy3+W8DSG06QNADMJd2yekWmRpi5KdmjVgi0grUFf8m9oJ5BE
         6bCcBGmlC7Ry9CiFMjvHKDRgpi6nNwsq2YxlS7LMuUelXzbOT9DBu87TX+upUugO9RYF
         ZTQfmv/+hOiPS6RKKb7IxRWgfV1fS9ef0F5LH4E04nz5hfBQv0IWtpR5EDrfgslFaDb+
         i8F5TAK+qp98z4C85oRaN2cGKNdkW8q2xTWbauZnuTu2Rtfm97d3OFxb+oSwCy4gkXtX
         Y+InfuLq2VyoDtmwkKNUQ8RkCC6SMDrFj9Ic1cF/8VhrviybPs9BoAlhFlIa6zVP18Ci
         k0rQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531ZIhWDEi8guEXYFr/qw51AMJazp7y8CJ0A6ZIuYu80osuJzLvI
	0H6+16sWOFysvk3NM1uA0c8=
X-Google-Smtp-Source: ABdhPJxQKi7Y8JH6IT4eXcXv/jTCwZKQvlAExmaoX8eY3tFSRC45GgRKN4uziiH+lJSk6St0KxT3yw==
X-Received: by 2002:a19:ad42:: with SMTP id s2mr115357lfd.448.1611576107740;
        Mon, 25 Jan 2021 04:01:47 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:974c:: with SMTP id f12ls844691ljj.8.gmail; Mon, 25 Jan
 2021 04:01:46 -0800 (PST)
X-Received: by 2002:a2e:924c:: with SMTP id v12mr41410ljg.112.1611576106769;
        Mon, 25 Jan 2021 04:01:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611576106; cv=none;
        d=google.com; s=arc-20160816;
        b=ZqkNj76OsOiWxV7cCoTcQB5rkyn2BPv38mT9rvdd7vHLaUDrPoI/IgqFLeZV+T0GvQ
         P/20NoyDM27kfPvjuG8GTSuhKx6TgANomuYDrS3/WeQiaP3PVNvTMwMv2SdlAxkTKKCI
         HlIXsIE8zTcKOxHeR+dO7i8Bn0Ail3rYPwZ/3gLFJdXKKqIzMfDGTaIG1l6RBURflHDO
         XpTtFTpZVAdM7L1bxWB0WHjXmCtchFjnUiCDBxwGuyJcxnh6+RsWNKJ1/F/tcL6og/wa
         cM95AS31A/aVg3vCTYoIl0pNUE3pDPyFl8Xkou56+ImrRvUyNI3u7bp9j8R3nbaL2+IL
         LcCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=c3EoiKN50v8BW72bQRRfJo+yLt4UQU5GoLfLZB8uzv4=;
        b=hj/yUytzqN6YoHvkc4DNMwbHWDV/88m4sycbnTcFgui04kHMX7c0Uc0684tVRtPNJ8
         08yC06Jk9zMLTPmjEt77UHRFTUHSMMyyXNEae3kEv5cO+WZyIuo5zu82kKAWL6X+5cYS
         ZDQUok/hO10cTuSkcR8FZuPsJQyrRKkjvrilmlaWyphoX8QIZmMA2TRsrSXLyUrA6C02
         v/WXVLYKrfSfr2gVBTYQ6PEnnjRGE+/irrdnJIkoYCRxGbtiRrfhnh54Q6NHurdD7/ET
         AtE5wygr8F2QrOlToBvvpiucEuKV7xmh2IriEV3fdzvEmCTFvoJ6spWxthc+h2VUTqaQ
         6BKA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=hkNOWWve;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id m12si572575lfq.6.2021.01.25.04.01.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jan 2021 04:01:46 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4DPT4B18xjz1084;
	Mon, 25 Jan 2021 13:01:46 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.878
X-Spam-Level: 
X-Spam-Status: No, score=-2.878 tagged_above=-999 required=5
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
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001]
	autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id h7u5Or62L-3F; Mon, 25 Jan 2021 13:01:45 +0100 (CET)
Received: from kabal.lan (ip5f5ac6e3.dynamic.kabel-deutschland.de [95.90.198.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4DPT4872GGzyjw;
	Mon, 25 Jan 2021 13:01:44 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v1 13/23] hypervisor: coloring: make cache autodetection debug-only
Date: Mon, 25 Jan 2021 13:00:34 +0100
Message-Id: <20210125120044.56794-14-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125120044.56794-1-andrea.bastoni@tum.de>
References: <20210125120044.56794-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=hkNOWWve;       spf=pass
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210125120044.56794-14-andrea.bastoni%40tum.de.
