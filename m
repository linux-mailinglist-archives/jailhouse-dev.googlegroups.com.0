Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBZ4DUPTAKGQEA2LG3RY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F6B101FF
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Apr 2019 23:45:12 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id m3sf2711568lji.10
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Apr 2019 14:45:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556660712; cv=pass;
        d=google.com; s=arc-20160816;
        b=GQS+P91sQIETDgPu7/Nb9nBtKpAf5vLmhleEYgj3dYwgEYUZN80fNMLpy8vl5jF1Qn
         je+BDp7Lg+J6en93+/6yDcE/dO3BF8W45URhsaHqq1hrPUg6JMJIkQyobg88sMEhg+a8
         Nq/RKYwYInWGOYqnZR7l9PeUYXg5YdXtAYmmsI12IRRCnjhQhwbUbagyomIQQTFfEI4D
         bNv3fIDDjJHn12G+b3tjdUBn8QmbKX7SB4JFVKuBP9VVQE6u2lviUMp6zapltyBIeLiO
         x9c1cOxv2ppqdJBLaPYlr97CeWkF4RHrfn69Ji9zwo4TmKJ9a82V2Jvu4/hhPmthgyR7
         EF0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=bmiRGQD21dlTgqdhpOVqXe1U+cnI0Mmigcu2sbWcxmA=;
        b=c/z9xR0hnVhXj8Hdmo3EZKdn7Fb7K+n7PRK840wXuuuyqyJa3nnCocwiNIiYu1IUFZ
         sne+NEFmx5XAiRzvC8wWYPIEbFX+653K2bwelhpNhH03zxoosvO9WiVSloR96KhIqrSq
         artF15SHdHx0oAOY/BSmrM22miVeCQO3ETzIhk0hRnpeu8oVkmoB6UhygSz357wR3cbo
         jhi1H0BoMlzF5vT3qT0pVXmqn8qMvVa1TFEAsfkz6w7rqJ35doN9gClaszU3wdhg4DIm
         hiSSKlF4YzupQbBLP3D4UPrL4uNg3+nbX8qGdvm3YL0VbBqJGD3vR2zwj7yAOREecW2B
         yUrA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bmiRGQD21dlTgqdhpOVqXe1U+cnI0Mmigcu2sbWcxmA=;
        b=Mrf1TsrCU9spIMouLFRQhkg3QDMtfvJNhti1g3KB2+M0UKT4ZDraO1iVEl8ydrQKKB
         pEx+uQBCU1U4o61cBLHzQt8ZRHbM7GBONUR1dAvJKGdRSVNG8ijTdIZ1qYLRPgvyO9Gm
         BMKPfCIPjl3UKrVGnfHTh/FZtchEmXyehaOqBacCj643jyFcQ6z0g0iTh3LZbATzScTG
         PYTj7uPGysjtLpjt0+LzjwY5OQj2hnTkSWLnYjiCgXAXxbZmcvTWkXoWHQoBKd2CYdYG
         ZWgh5QlxRt2mluR1krY2aaizSbjdgqS5ykS0sBwFnhm4F2cc3Sn/kI16G3YUt62PtE+2
         d9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bmiRGQD21dlTgqdhpOVqXe1U+cnI0Mmigcu2sbWcxmA=;
        b=s4s7TH/egUHP855D5l3/W0rnY5KOE3rbvfojvH1O9hIu7IyUqer+w6uHbGYVN/H6cD
         smbbdjoxXyUzvHuaCRPTC+SGitNnW2lUV2j0Re4YazC7kTySuU3XX/LelE+owCmGTvtw
         OymhyKxXHjZH0lhxOEfeczw1nRSoQ9clnkUv3KTVXquqR1bTHOq0bxwwXLVXxF1wqa0p
         +u/cF53ZXGeZgLSm8R7os5I12ofa25GWHDjnMjpM33fMpgnIVh2ZgKmeIKKONN16N5XT
         avdbHsR2HtMah1Z3o1uTpTBr7W4g+gBw1QBwfmbZB3EZyz40Fr/pxndgING7jWQn34Lo
         FCLA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXbuRDlLo+zB2eL84SHLle1khmtWzj8Y5TWdRpItPrm9avc1uFD
	dGZq1Zrw/z0W1aG4rjXRw88=
X-Google-Smtp-Source: APXvYqyAswdo4FhjU10IpLhh6kT1P7jYXgsZ5rMnpvVGzCsMG+rHvp9fhHC2cWN/76KMEBeXQi8SYw==
X-Received: by 2002:a2e:22c4:: with SMTP id i187mr36724556lji.94.1556660711878;
        Tue, 30 Apr 2019 14:45:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3612:: with SMTP id d18ls3748404lja.8.gmail; Tue, 30 Apr
 2019 14:45:11 -0700 (PDT)
X-Received: by 2002:a2e:309:: with SMTP id 9mr39358914ljd.114.1556660711310;
        Tue, 30 Apr 2019 14:45:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556660711; cv=none;
        d=google.com; s=arc-20160816;
        b=QY2yZax9trPkjSS696Z8nBM2LtrUXfbBJIJ2poWljyyA/LT90fFH3pM0VghaBxag1Z
         wWDuEXqsuFaKZZ1v3KaE1uq8MdAyovooqdVW03P/Kl3e9Mc2ZeHtA0eAcGPOImJqmo+E
         YwLTr3woVIHpnoHT9MvTScbPnjVZg9u2+WAyBmmR4Jgyg8SkXmlTwGOOwRVtuLmPW1ek
         WJ3en6UO4ayoAOFQhRno0NBFeFHSTpkVQBcR1/Xbb6V3lAzlATbf+ShsDjBwAg2Bq/UE
         vN0ECIlXtdXo2reDWtZP3Oym+I9ICwxNfwTj7d7nE5vHi9gpHwKA6mOg6SoXYdr0oTuB
         5poQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=eNCCgYhTZoVASZFRe/nl5rilw7WAoZOrblhEsVyeDoI=;
        b=EoSZlC4JwXaE9IktBvYI4O1k9s4fLQLI+wmrSWRK7rNlb+hNreOycW07eoLcW38Plz
         ihnJs2MI25nW4BgEtUjrI0jPnEpLnm0DNp68zJxfxCcYX7CPRppmdwEYG9tcV0D/FE95
         FKWAeyRkBVbSfeLVYczee+UZbUUAJ5FpElpPJkXlUd3/17otQakFmrk4fGliGueCk9rG
         UucmpBGPfUVSv91WS6+x/kUHIs/csHaCkYlnzyWbaxlPg0UBUL3qSNswc93jeNXRk1LR
         PXZLTpp49iiUrWQB1juYmTvbbxHLe3thVKLc1nILuhk9YCRMLkZ6eLGjuhQan0EByGW9
         PVFQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id j7si405151ljc.0.2019.04.30.14.45.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 14:45:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 44tw6t2pmdzyB7;
	Tue, 30 Apr 2019 23:45:10 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 3/5] pci, config: add more magic extended caps constants
Date: Tue, 30 Apr 2019 23:45:02 +0200
Message-Id: <20190430214504.2153-4-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190430214504.2153-1-ralf.ramsauer@oth-regensburg.de>
References: <20190430214504.2153-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.4.30.213616, AntiVirus-Engine: 5.60.0, AntiVirus-Data: 2019.4.30.5600002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_NO_WWW 0, __URI_NS '
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

We will need them later, as the config generator might generate them.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 include/jailhouse/cell-config.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index e90cd25e..56ab8948 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -196,7 +196,35 @@ struct jailhouse_pci_device {
 #define PCI_CAP_ID_AF			0x13 /* PCI Advanced Features */
 
 #define PCI_EXT_CAP_ID_ERR		0x01 /* Advanced Error Reporting */
+#define PCI_EXT_CAP_ID_VC		0x02 /* Virtual Channel Capability */
 #define PCI_EXT_CAP_ID_DSN		0x03 /* Device Serial Number */
+#define PCI_EXT_CAP_ID_PWR		0x04 /* Power Budgeting */
+#define PCI_EXT_CAP_ID_RCLD		0x05 /* Root Complex Link Declaration */
+#define PCI_EXT_CAP_ID_RCILC		0x06 /* Root Complex Internal Link Control */
+#define PCI_EXT_CAP_ID_RCEC		0x07 /* Root Complex Event Collector */
+#define PCI_EXT_CAP_ID_MFVC		0x08 /* Multi-Function VC Capability */
+#define PCI_EXT_CAP_ID_VC9		0x09 /* same as _VC */
+#define PCI_EXT_CAP_ID_RCRB		0x0A /* Root Complex RB? */
+#define PCI_EXT_CAP_ID_VNDR		0x0B /* Vendor-Specific */
+#define PCI_EXT_CAP_ID_CAC		0x0C /* Config Access - obsolete */
+#define PCI_EXT_CAP_ID_ACS		0x0D /* Access Control Services */
+#define PCI_EXT_CAP_ID_ARI		0x0E /* Alternate Routing ID */
+#define PCI_EXT_CAP_ID_ATS		0x0F /* Address Translation Services */
+#define PCI_EXT_CAP_ID_SRIOV		0x10 /* Single Root I/O Virtualization */
+#define PCI_EXT_CAP_ID_MRIOV		0x11 /* Multi Root I/O Virtualization */
+#define PCI_EXT_CAP_ID_MCAST		0x12 /* Multicast */
+#define PCI_EXT_CAP_ID_PRI		0x13 /* Page Request Interface */
+#define PCI_EXT_CAP_ID_AMD_XXX		0x14 /* Reserved for AMD */
+#define PCI_EXT_CAP_ID_REBAR		0x15 /* Resizable BAR */
+#define PCI_EXT_CAP_ID_DPA		0x16 /* Dynamic Power Allocation */
+#define PCI_EXT_CAP_ID_TPH		0x17 /* TPH Requester */
+#define PCI_EXT_CAP_ID_LTR		0x18 /* Latency Tolerance Reporting */
+#define PCI_EXT_CAP_ID_SECPCI		0x19 /* Secondary PCIe Capability */
+#define PCI_EXT_CAP_ID_PMUX		0x1A /* Protocol Multiplexing */
+#define PCI_EXT_CAP_ID_PASID		0x1B /* Process Address Space ID */
+#define PCI_EXT_CAP_ID_DPC		0x1D /* Downstream Port Containment */
+#define PCI_EXT_CAP_ID_L1SS		0x1E /* L1 PM Substates */
+#define PCI_EXT_CAP_ID_PTM		0x1F /* Precision Time Measurement */
 
 struct jailhouse_pci_capability {
 	__u16 id;
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
