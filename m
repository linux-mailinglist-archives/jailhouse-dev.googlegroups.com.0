Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBXVUY7TAKGQEDWNCYHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F7F16B2C
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 21:19:59 +0200 (CEST)
Received: by mail-ed1-x538.google.com with SMTP id s21sf15174497edd.10
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 May 2019 12:19:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557256799; cv=pass;
        d=google.com; s=arc-20160816;
        b=SqaOd/UeIgDWOQ43E4CjF4FWuHqZYQPDp/o7t6Q0t6oWRRkhZEuf/1ElZnAXDh4pYA
         fbkQ6nXmtJf4CmSPCTqLsKFde0qtkZBZHqmcEzxxBOGFPx1VWQpuJFG9v3+nfpRvg6hr
         bSHCLCT5DgJBjl4auO3S1qipXmHLs/Auqi4Zk2JIIkfCyIOLwOu7cmNrNP68k3qJyii7
         Rj260//zWzQfB6NLKFTmV/Pj06PVQDKXmThRci0gvRN64MA1963emJuHn8nIL6hP1pE1
         ue3nSzNotwPhlD4VfafSSDXMelmsHI+ndQQOVidRgZq7zoRx6pMiBsMOPpTdI7g3/osy
         zBEg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=3h3iVVShh14u/wxrB1O9aLVlksuj2yrIeq7l+b1tSqM=;
        b=yGw6c7MzlwFH0P8jKaSLdfYIRHyy+nGDTnkKI0VdJg7gKWEDBZ5rIEyumvnHkuQHyT
         2WL879jsYYIqw+F+bQmVVIVCr1NiOPstfZElUziDM8K9I+wmwUeRQ5J3c1FOGooywGEp
         B8LTyEG34HTz6MKvB55rFiFlQGsLqUKEpw0P4u0acXq4SgKd7jeTMtwQM1gztzvovNxW
         aD4SjaTf1psyuCN6xNNM+861MczLIVSRKJuX06f4By0yNlWkbJe/McYZ5UFFySpan9Rf
         YXhp3ScKga5qtUPKDUPxURtAti/xbtRoiqoO5L4Jy1gEdUSwkU0eI7XnhCKuJvClY+qW
         7/NA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3h3iVVShh14u/wxrB1O9aLVlksuj2yrIeq7l+b1tSqM=;
        b=g+sarFDniXPmi+kEOuGUGhJ1OCCyFwrtNWjKSnpaNo+DypcFT2CH8bbavcH+GkL7Zr
         /g/6sSawnyhec6WfDs9gSW+0fqIoYU311RNegzUrGP7EMSQgf8MVQCJDEm6N+WXstKZx
         02HI7KE90OCcMPznioAMb+WnCmZY5Fdk2T0hgJRcUV3+tXkrlhYwC75g1NqSHMCejipU
         YkpaByaqjiSenRNNEv6HH21WC7mnomywlnidtvaCTpxtt2VAJIZ9dHhIuDx+K2G0Unbx
         PiKCdJhpSbcOqX9JPXZA4TiQ5hKb+mIrzgmUEMBTUpnm96gMo23pXe0UKSBOUvBZ3DfJ
         wy7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=3h3iVVShh14u/wxrB1O9aLVlksuj2yrIeq7l+b1tSqM=;
        b=uHIwiQgLRXKXgoebX+8UjeGbcXJZlSS4O7BvWs2WOAqXAoQjDjfsrySnVMV7Oc2/ta
         4LNhcZkIVWsfn//dqhB0sxdyjQO1+f/FQj+9kANbd+Z58sPH0wN1WLJ2VDEZNWeY6npG
         0A2kenTskrA6e7BLarBGazdSUMIZ4cyNBjDr+h+tADGioXD1ib6P0n6qPsVEuQakoDb2
         3OEpA4H4EYCiRDCnOzRVCGp11GFWrRSKc55n8PiO+iMkTpuxAfHOf175UmsOuLH1+GO6
         5LuZV6UoBcYGzeStLZKwH9553p91nCv056tvS7O8syGR9U/MRjbQhwlnhNwPv2uddMNi
         fJXQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWVghYcvSfP/u14QtNf9uGPLdywl4coXqLodSutq4re5P1WQVB/
	6iDxr+784GX7/+KajOt4TPE=
X-Google-Smtp-Source: APXvYqyVUPBZknTTz4lpx/h9kDzEKyQpa070qRG0nnOSVSo2SSe0EZE4BoEPpoSQ9tVZ1opjeTVaTQ==
X-Received: by 2002:a17:906:5c10:: with SMTP id e16mr26091435ejq.19.1557256799234;
        Tue, 07 May 2019 12:19:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:6047:: with SMTP id p7ls3682961ejj.5.gmail; Tue, 07
 May 2019 12:19:58 -0700 (PDT)
X-Received: by 2002:a17:906:ad85:: with SMTP id la5mr5049917ejb.294.1557256798468;
        Tue, 07 May 2019 12:19:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557256798; cv=none;
        d=google.com; s=arc-20160816;
        b=PMIeXNCtQXMBrxmSSMcGCa2CXay8+4E0KXV28BpS8N/llTAB8w7tE2j+zAiuVjokWr
         7iSL2pA0tKIKYIRNSj9WHWmZZsqK6EPsQCcjSU1gQ5IJowFOi4Zis8iOPuVFA9WUpo/s
         fUeVTheHtbOx6AL1Z2JCodj5KPTMol6HJq9HW/agkdJNut/u64PzliplQkjRDxzeptSP
         g43++yBmIGDBLTqmnP5ggDRKU+++jYCNDJ+1N/A3D5pAqdVsDKfUueMEQABUGJsZe42A
         kNKt6HossgWtxENd1PCkphaZVDlHakXobIa2vS+sdfUrLm7mzaaQpThj55yjxEYiP1QM
         l0Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=hUF0drovJOD63Nc4CIuZ8UJosGIQXb//aoabyJ+P7q0=;
        b=Lb93+MmV0+AIYZHI3x6IBHUWYnUMR/MRaH/gBLOgimd0vdcrxsumJW8br3+4yKafOP
         kmKldKtiH2h/Mz+JTQllGm1ZLQc9nnqIzz+Yyqy7jTc3ntQbR3fX1iZ5HXAJrHg4Dh1M
         iZXu5Q+kC4wrRhVQbVb71yv6NCr08MpTtFrlL0S3z69+WHI1UwW3zM8e2S9yukue5N1Q
         ZgMnU5qNid2Tr2kdJx34BQ5xgyc9QeHGSq+vGzM15kaUxhQwCJbxVWisBgfnje/nPOix
         lf8fsrUv67IP8bOIhs7BamoU7gun/knxXah8wmh+GSSakzP36IipEIHYGsJ7X22N9BUi
         QWqw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id t36si613808edb.0.2019.05.07.12.19.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 12:19:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 44z8Z55mfyzy0s;
	Tue,  7 May 2019 21:19:57 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v2] Documentation: x86: test-device: document the test-device
Date: Tue,  7 May 2019 21:19:57 +0200
Message-Id: <20190507191957.6738-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.5.7.191216, AntiVirus-Engine: 5.60.1, AntiVirus-Data: 2019.5.7.5601003
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_NO_WWW 0, __URI_NS '
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

There was no documentation so far. Let's mention it in
hypervisor-configuration.md, and add some comments to the code.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 Documentation/hypervisor-configuration.md | 6 ++++++
 hypervisor/arch/x86/test-device.c         | 1 +
 inmates/tests/x86/mmio-access.c           | 8 ++++++++
 3 files changed, 15 insertions(+)

diff --git a/Documentation/hypervisor-configuration.md b/Documentation/hypervisor-configuration.md
index 3e975a00..a526d0c4 100644
--- a/Documentation/hypervisor-configuration.md
+++ b/Documentation/hypervisor-configuration.md
@@ -41,3 +41,9 @@ General configuration parameters
      * configurations.
      */
     #define CONFIG_BARE_METAL 1
+
+    /*
+     * Only available on x86. This debugging option that needs to be activated
+     * when running mmio-access tests.
+     */
+    #define CONFIG_TEST_DEVICE 1
diff --git a/hypervisor/arch/x86/test-device.c b/hypervisor/arch/x86/test-device.c
index cf81e92c..d9cee834 100644
--- a/hypervisor/arch/x86/test-device.c
+++ b/hypervisor/arch/x86/test-device.c
@@ -67,6 +67,7 @@ static unsigned long testdev_get_mmio_base(struct cell *cell)
 	const struct jailhouse_memory *mem;
 	unsigned int n;
 
+	/* The mmio test page is one page after the COMM_REGION */
 	for_each_mem_region(mem, cell->config, n)
 		if (mem->flags & JAILHOUSE_MEM_COMM_REGION)
 			return mem->virt_start + PAGE_SIZE;
diff --git a/inmates/tests/x86/mmio-access.c b/inmates/tests/x86/mmio-access.c
index 1c6a35b3..0e6a56b1 100644
--- a/inmates/tests/x86/mmio-access.c
+++ b/inmates/tests/x86/mmio-access.c
@@ -29,6 +29,14 @@ static void evaluate(u64 a, u64 b, int line)
 	}
 }
 
+/*
+ * mmio-access tests different memory access strategies that are intercepted by
+ * the hypervisor. Therefore, it maps a second page right behind the
+ * comm_region. Access to 0xff8-0xfff within that page will be intercepted by
+ * the hypervisor. The hypervisor will redirect the access to the comm_region.
+ * By reading back those values from the comm_region, we can verify that the
+ * access was successful.
+ */
 void inmate_main(void)
 {
 	volatile u64 *comm_page_reg = (void *)(COMM_REGION_BASE + 0xff8);
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190507191957.6738-1-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
