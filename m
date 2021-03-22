Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBV7H4OBAMGQEPBOO5CA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C8034502C
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 20:45:27 +0100 (CET)
Received: by mail-wr1-x437.google.com with SMTP id o11sf10607000wrc.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 12:45:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616442327; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZUDvN/In4Jf246i2PuiMuU1Vvb7jXXuFASV5KijFIG+EKTS077bUEMI/9DycaI9Xkl
         YjzlNz8eJDinA6YbXpOklpUkPBcJZAslOxi/mar4Xl1yqYgttr5B7EL7Cpj6/rpxIU+v
         XBjtf6jVA/qMB1Dmitf7dRewQqqf0XfczBAatsB8+V91cz3xtZvuWsDeNgCslgNy0Ljk
         NjfN9qVeiQACH89y2io5K8HVkx+LgZrXz9n7tc9mVaRlUGsuWT2e49VbEK9VxO5bpLr4
         9/6D88lWblmNGwLtoe+3e6/Q3sKe8nA7Dba/gdpVUDXM7MPhkn+f12bxIY9w0vvTUZ5k
         u61g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=+Ren0EUSMmP+T0Jz/vHzhU3n6ty9W48rukYZLxV7MAE=;
        b=ZFaWMwRJ7RRi8OIpQ4SWJohpEujW3NchEcN3nyr2Umd4jZFf6b7PTU7210gIPfHXce
         cxA31otuK4rlaq/L+c4uG+I8oqkdmHMn8bF8oKFVV45AfImNXr/N+a0YiJoznjHq8lN3
         55NDDteuut0NJN+fTuD84kXXhLdKRuaf+GnZJqWct33uHBz1IFQJwBEmWG4lzWZWvXI1
         v2jh/rdZ9d8U5HjoY5GMZ6kYGTUXAc8BQ19aUYzVNk5aNUWP6xliq8njItpH5AaYaroa
         YtyyqTAUrcs0S2O2AOe1c+Es8w73fr2bkoVvEh0p7d8i08tON3ACS3IV8FqPQSOPe7PR
         kbiA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="J/H0vCDf";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+Ren0EUSMmP+T0Jz/vHzhU3n6ty9W48rukYZLxV7MAE=;
        b=pkvoWPPDRuYfSbgm9Hl6BBt4QIoeZt8V7nYzNZO1zAz4QQCoQn7ZkCCgh8i0IR3Kke
         X0qSOBXVE2JS1oulPaFzzg4cX8bmT/KbilZXOI3BAiC0mfFnPBiIIOLPnMPBYA9cFpAK
         smkLgD8EGr/y6onoP1EwQetrGmx+EEoW9G56eqWUNPrRKjmGV5HFmKCnAOrQo+YXfHKV
         iRInssicLvo+jdb+gJKKaQ9IpJW2PN1RY7vN0cLGqYfyEIDLhRkdyblx0kKRdWTgijxB
         wLA09KZ5Jur+Nc0UjV6lh9MtbAWv6vrSVaI/3JTf1buJSSkJW9V5t1XWXpiM9g96YwIJ
         QiLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+Ren0EUSMmP+T0Jz/vHzhU3n6ty9W48rukYZLxV7MAE=;
        b=eqXBnC8oPuPDsGudNdE3t8cMvaJmmKmxG9+ZYSzQvBkcm1nnehntAjg6xFdgrlYO6Z
         +wJ2z3T6nmztW7/bQm11hwRU6FJsdtOEWDeILkjEJy5Ne9SRxe58lJXlzVlEBwW6gTZD
         iwFBbShDXJ6t+2RAJlkCCSOIbf92FFwnjPwAbKs9z4xWwuIuUauLQN2BxI7LgERdBfFs
         CmywAWlLOJqDNK6BOi0xFBZs6vQZ4EqOUz0P81Y9HrqnsQ3zR9U8px/FJO1ZXjTVFe+W
         UKJEBh4ElL4hnzt4aOgiBPgi0ekiigF86X8Prx2skxV8Q6hIUmotXvDHRtlwBffRLRJT
         GCiA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533AEPiDgr7NLLa7Q+lQ7JSK4yLsG6PUNM03Qv0JxmKi8qRI+vZ2
	OXvpThEQYBuDrgdN2pt5G1o=
X-Google-Smtp-Source: ABdhPJzatVzKSMH2OaP6PRzKZgbZsjIgZdFhaaUGaivXzOJDhf+vdddzYHlaFwry92Kc9hvOaugYAQ==
X-Received: by 2002:adf:e809:: with SMTP id o9mr234215wrm.110.1616442327660;
        Mon, 22 Mar 2021 12:45:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c763:: with SMTP id x3ls185640wmk.1.canary-gmail; Mon,
 22 Mar 2021 12:45:26 -0700 (PDT)
X-Received: by 2002:a7b:c084:: with SMTP id r4mr90622wmh.166.1616442326759;
        Mon, 22 Mar 2021 12:45:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616442326; cv=none;
        d=google.com; s=arc-20160816;
        b=BdZ/ArK30NOed1fKJOaBzg18eSRA6QLM9qKvBxmCIWEG6rQ9K3YDREFO3JXqQIy7wi
         i2zO0cQoSLzo2cWf1zzICVMocEI7yvHQhD6L4o89OWUYIgXLYlqTyUDAv9FLypRC1+G+
         p2hQwWfZ+e/giRpk9huEHikt0nbJ6B3YnMVXZtDsObNUO9do1ZZdtdXnVMYYl+KZM1wm
         EPePbuv6eqavi6YiwyecCw+Swoyt9q5HaAOUKyxXVX2QIPPBCc9a/aRAO16ywHJLLOkp
         7Zfi2s+VSyyYZf5dyAzeuwGEKfJY8egJLmJx0vg0T2aO+umTHAiKVsSMl9x+/q3oZ6HF
         lz+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=NzajJmchAXvOlOAm/luHM/nZTW0RkXhiLlo0q0isZ3s=;
        b=fHSUOonjmXhNHx/aQGHiQhoN2vQ6ic0/1mY/ltDEJZEIDz7e7I0r63uDPinOTlaFo1
         YlqhijP5i8F6720kRKvNupgSIz2oTNeE00kxTk+/oXcZi6Mtk6fQtLR3eYn58g5utm/E
         Rd4qcYXluWRWQdyiH/1Wr1ytBql9ZO1QKaBaGVCw0Ez64qR5MlV50IfDeCsWQhVupIu+
         eWOAj/LUmnrn9l+j5ickUXxPfxaL94Q3Hi7BTagkPwYgCcpu87e6dYR2tjoa54FPgUDR
         ehzBr9suH/dvxx/5/EDh6q6OPpswybMwoBHEZyQvcUewH1Z+NoQG2RZtDPsdRIf2b9XX
         JhYQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="J/H0vCDf";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id w2si26568wmb.4.2021.03.22.12.45.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 12:45:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4F44jL45XSzyVZ;
	Mon, 22 Mar 2021 20:45:26 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
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
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id QsRiLytYWOQa; Mon, 22 Mar 2021 20:45:26 +0100 (CET)
Received: from kabal.lan (ip5f5ac6b3.dynamic.kabel-deutschland.de [95.90.198.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4F44jL06VzzyVB;
	Mon, 22 Mar 2021 20:45:25 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v2.2 2/9] include: cache-partitioning via coloring, add configuration
Date: Mon, 22 Mar 2021 20:45:00 +0100
Message-Id: <20210322194507.82643-3-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322194507.82643-1-andrea.bastoni@tum.de>
References: <20210322194507.82643-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b="J/H0vCDf";       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as
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

Add the way_size and root_map_offset configuration parameters for the
coloring-based cache-partitioning, and add a color bitmask + color-flags
to specify coloring within a jailhouse memory region.
---
 include/jailhouse/cell-config.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 6b54e34b..fcf33230 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -115,6 +115,9 @@ struct jailhouse_cell_desc {
 #define JAILHOUSE_MEM_LOADABLE		0x0040
 #define JAILHOUSE_MEM_ROOTSHARED	0x0080
 #define JAILHOUSE_MEM_NO_HUGEPAGES	0x0100
+#define JAILHOUSE_MEM_COLORED		0x0200
+/* Set internally for remap_to/unmap_from root ops */
+#define JAILHOUSE_MEM_TMP_ROOT_REMAP	0x0400
 #define JAILHOUSE_MEM_IO_UNALIGNED	0x8000
 #define JAILHOUSE_MEM_IO_WIDTH_SHIFT	16 /* uses bits 16..19 */
 #define JAILHOUSE_MEM_IO_8		(1 << JAILHOUSE_MEM_IO_WIDTH_SHIFT)
@@ -127,6 +130,15 @@ struct jailhouse_memory {
 	__u64 virt_start;
 	__u64 size;
 	__u64 flags;
+	/* only meaningful with JAILHOUSE_MEM_COLORED */
+	__u64 colors;
+} __attribute__((packed));
+
+struct jailhouse_coloring {
+	/* Size of a way to use for coloring */
+	__u64 way_size;
+	/* Temp offset in the root cell to simplify loading of colored cells */
+	__u64 root_map_offset;
 } __attribute__((packed));
 
 #define JAILHOUSE_SHMEM_NET_REGIONS(start, dev_id)			\
@@ -333,6 +345,7 @@ struct jailhouse_system {
 		__u8 pci_is_virtual;
 		__u16 pci_domain;
 		struct jailhouse_iommu iommu_units[JAILHOUSE_MAX_IOMMU_UNITS];
+		struct jailhouse_coloring color;
 		union {
 			struct {
 				__u16 pm_timer_address;
-- 
2.30.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210322194507.82643-3-andrea.bastoni%40tum.de.
