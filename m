Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBYUGRGPQMGQEWKW3CTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EC768D67F
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:12 +0100 (CET)
Received: by mail-lj1-x238.google.com with SMTP id o2-20020a2ebd82000000b0029051ecb8d2sf3561054ljq.20
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:11 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772771; cv=pass;
        d=google.com; s=arc-20160816;
        b=o91Kwug1UFasyQmhkYZqWC+yDvyyq2lXEcXWrQND+NzbzXsYtkGAlKFY8cgtxUUq0e
         HAcbfh/y2yXD7kBEYHCb6gyJnClDusGXZ8cTeT/zIAQdNuTZFocAA1ZUeiUZILEE5ws7
         lv5W7lD0pFm/TrKn36c01WG5bPFvfKt6c5ERdSHaWDAJhJnR5LvFL76WP8YQVsNX6OFY
         oMFjyaGdcsYMFAF1nZL8sDPooGT6BoJTwmr0bsyU3JQemK//HObEDnrYYMrD7qz4bCXw
         RBVUdnvOICQy3LMpZcoO+OuSa7p0vwWahS8b3XjzqE9Mq4TctzThuh14DoENqGssdjMt
         lNwQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=HwUVg6UNenrDx5Uw263Qg5EXl4VCDQFRxnXg8n2/xJk=;
        b=Sw9Az/catjMobdrfaQg83mtv6PnnPn1n9sj4vX9rATRKn3oyMdHoi+LdyojN0b6kYt
         JpAba1q3N3oNDfb+ZzhcdnRQ7w3niwN9dBJWma5rp9S4KL0U98PFD9nlMKdfGJe3PM84
         1jQAphkJnex+TRUqPLaDp8BPMHEfEp+pHyyzXdapMoedFhlVTxpHszladBSeFIdeb4bU
         yoVFG47h+zAUgkchayUV3NU8NFyW04H76qWbZtwqI1ub8iRbINd0LPV3YZquBB1UqKdH
         71+YX3wykecfgtlLehjCs+9FjbeNy/nUJbUkKfJ2pglW0Obpx2v1ZNQGxGuuW+T8FhfI
         Gxiw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HwUVg6UNenrDx5Uw263Qg5EXl4VCDQFRxnXg8n2/xJk=;
        b=sgcWD1S+Zgl5+O5zP3ZXBJb5WWu/BM3E6FJD9NxIcBnRBOtH/sfss3QD8ORxkRfoIK
         fXoeiX81RQMrLC78CpW7B/COvPRw5xV2mMZ9LAqRRvBx5OAfGEBWsLglt/l6ptyQoUEp
         BFlI6jtA4awL3fHPkTnnnIcD16v/oM25fNaoVAx6RUiJXRikj3mpYxZ8Uv4O2vh6b3gb
         1iBvEX5lZ6eNwYJHjpuVKQb9CaKQjeQCs7bzVHpgU8RTE3u32+keCYABqxUo5KVoOTHw
         3QXIOSU983tzXP/VJYljUZgQVSHS4WGh5wdxqmMqT6ULiQjVXKkT/iBLVju7Y5wfylVK
         i/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HwUVg6UNenrDx5Uw263Qg5EXl4VCDQFRxnXg8n2/xJk=;
        b=pdPe4f1mUot7tWuEfWsWdGYWnu1h2c1jRI/8ybjRHw8cRhb9FbDZow1nkm27xJs4H1
         +TBiIOeyzs17LOM5gZxCAR32H7RzqQ+r4aZD6CwLhEY4EKIj6PG+Z7EwWO47/OfFA5Kb
         09CCyf/Xn5+6N95AHzCMTl7Q6OKv/zxCPiXlZROKalIOYwzd/giuiD8LWuMW39r76HEd
         8imsdLkDUoHSnaeUJBdaOqtndWRZ+/tzsqoHCVcYt3OstcjBVBu8uNQmx+hho5baGQiC
         3XiZaZZA0bn/Zy0eFnvU/kURxwwO4eO2J65vfoNzpDr2Rk42N/mcuu6saOV/Gzn4FgC6
         ZTrw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKVER2rLlJ+dmG8Y+VZZ/wk/11LrO9T4XaRbZR3tXdBuXIKYmrls
	EKsNUeE860bdt4Kh60fErck=
X-Google-Smtp-Source: AK7set8zY9KdZXwdEMqGYh5e+CUwjAd2C4D3z4YVyi/+hcV0w+zWCia/jTVkQaMH3HsTC2fZcxNm+w==
X-Received: by 2002:a19:ac46:0:b0:4b5:6a20:ca94 with SMTP id r6-20020a19ac46000000b004b56a20ca94mr388109lfc.135.1675772771453;
        Tue, 07 Feb 2023 04:26:11 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:4006:b0:4cf:ff9f:bbfd with SMTP id
 br6-20020a056512400600b004cfff9fbbfdls72271lfb.1.-pod-prod-gmail; Tue, 07 Feb
 2023 04:26:09 -0800 (PST)
X-Received: by 2002:a05:6512:4c2:b0:4d5:72fd:5341 with SMTP id w2-20020a05651204c200b004d572fd5341mr707066lfq.31.1675772769716;
        Tue, 07 Feb 2023 04:26:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772769; cv=none;
        d=google.com; s=arc-20160816;
        b=pCUdEfQl+cHopdmD92HMVbITGT82eAGKkdZgYxnjcHqTtqh8mP46R+7WCZPpW7qQ7s
         PrSEF+QA5hC12WbuYMbcgGyXpWwE5NTIEWMjYV1Og7sL4OjjpCWrTV12eoe0kOUKBIlC
         Wf7zpnI7jbKiUBJ/T5Ef2aIwxJGBKr9q9UamekxLyZvXVekTMWOmy1QiZDr10I/1p/Jt
         fMtwZuvVaWFZpQQmAJfPhm88CjKDa3LxIqT//I8JqZiVhlSPT5KKoa2mlgsNRhk9ceXl
         lSIcy/ldoa0yPJNB/HiN1LfGy7RA5DHx62cJiy9yQf6/J7tXLtilNSR8KsyNxkpNH81i
         8xPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=O5foQgzeoRRrk0ETSGBxxuHxbfSFFjHjDHi8WA9IIKw=;
        b=Xm0Cf/Rp8bBNNiLHkjC/dl1uOfCOzWZlY2vXjsLGbOsKAi9MZUbYEdb8jPmtiKsvNw
         jwLR0JoNNpWWAZFcGmHjTbADPwEwC+Zb38NICYvYrNvsHoycFPRMcwI+c+mbxevDxBwQ
         RbRiEUpFlcDih+31urYm5hg2P9oioE5v1W1+PsfyGPKcMTL5kYm1UemZDBforHbnQYj1
         31+Ww9vNavGjt6Grq4ZWfgFPl43PvBcR269zMqGiOXzxREb12Q0fn9I8zO5OXpdI6lgi
         MGLHJlhBCAWV3SZGFQMThHGXH+oDjeWQruWkjUDA/B/v7HOu0wjutPrVNQdEKNzWjBgf
         N4Yw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id f36-20020a0565123b2400b004a222ff195esi638100lfv.11.2023.02.07.04.26.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:09 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RN6kPWzyLG;
	Tue,  7 Feb 2023 13:26:08 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 16/47] core: riscv: implement PCI support
Date: Tue,  7 Feb 2023 13:25:12 +0100
Message-Id: <20230207122543.1128638-17-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1900_1999 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __IOC_PHRASE 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __PHISH_SPEAR_SUBJ_TEAM 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0,
 __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Basically the same like on arm systems.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/pci.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/hypervisor/arch/riscv/pci.c b/hypervisor/arch/riscv/pci.c
index 067a7651..fc6ed5fa 100644
--- a/hypervisor/arch/riscv/pci.c
+++ b/hypervisor/arch/riscv/pci.c
@@ -10,7 +10,7 @@
  * the COPYING file in the top-level directory.
  */
 
-#include <jailhouse/entry.h>
+#include <jailhouse/mmio.h>
 #include <jailhouse/pci.h>
 
 u32 arch_pci_read_config(u16 bdf, u16 address, unsigned int size)
@@ -24,7 +24,7 @@ void arch_pci_write_config(u16 bdf, u16 address, u32 value, unsigned int size)
 
 int arch_pci_add_physical_device(struct cell *cell, struct pci_device *device)
 {
-	return -ENOSYS;
+	return 0;
 }
 
 void arch_pci_remove_physical_device(struct pci_device *device)
@@ -40,10 +40,27 @@ void arch_pci_set_suppress_msi(struct pci_device *device,
 int arch_pci_update_msi(struct pci_device *device,
 			const struct jailhouse_pci_capability *cap)
 {
-	return -ENOSYS;
+	const struct jailhouse_pci_device *info = device->info;
+	unsigned int n;
+
+	/*
+	 * NOTE: We don't have interrupt remapping yet. So we write the values
+	 * the cell passed without modifications. Probably not safe on all
+	 * platforms.
+	 */
+	for (n = 1; n < (info->msi_64bits ? 4 : 3); n++)
+		pci_write_config(info->bdf, cap->start + n * 4,
+				 device->msi_registers.raw[n], 4);
+
+	return 0;
 }
 
 int arch_pci_update_msix_vector(struct pci_device *device, unsigned int index)
 {
-	return -ENOSYS;
+	/* NOTE: See arch_pci_update_msi. */
+	mmio_write64_split(&device->msix_table[index].address,
+			   device->msix_vectors[index].address);
+	mmio_write32(&device->msix_table[index].data,
+		     device->msix_vectors[index].data);
+	return 0;
 }
-- 
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-17-ralf.ramsauer%40oth-regensburg.de.
