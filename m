Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBAHCYLTAKGQES76I2KI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4CC155ED
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 00:11:13 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id y67sf1851607wmy.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 May 2019 15:11:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557180672; cv=pass;
        d=google.com; s=arc-20160816;
        b=DgURqCNbPyG3LiHepVtX122CHT37EF1r1KYVGi1QLrqdCWMJMQI9p/SRHTVd9qL/aZ
         YlEk6jzN0dWTXkErh2/kID3muYag8oISJBs42r8Aqz23MH6BqIZ8TRUJUmdGYWwhwmWN
         YciEakAWjE97tzdK0nfPEXFS2zKLAsowaxaCS9p8W8V7wmcUUyONBYQ3U6i+OGy/p/RQ
         uLvh2ccR8zdlqYNZGB3f3gCnTqGIqvOhVJca58Dr7sZSqHy3IpUeRwGi9kdQMCOUK4VM
         5RNlqdOE+sTJJOJaTP//mKldGUB5/IuL/3nGICptsVQnO2wNYS6yQ51RfV6bI9wGd+bQ
         hKKg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=R/bYQpNBP6JYyP7NeptT91GVE4y6q0S7dyYsB4AiIzo=;
        b=fE4EbFOc+5Q3nVLGLp7dlL/NB29X9bAE5w06zmlIZBz8GhLDF+UiU9GkrpqsAEuRux
         3fctksf+DvPEyVOoAbPYYT+gBsgkqXJIZyVNloOu5RX1tg23zcsi4hu9YPTYxt6Se37u
         ISqqq5XrcHa4hHN/ISN0Do4lfYcCzL1ZAZTwpyHTV9sW1aRSKQ9PQaieB3rWLyO7Lgop
         kVatRdbBRHtJEUD8rhXWwY5DBrfOkweHarpsnqYG7smbIX05DIpA0a12TB+ckI+nc5xZ
         CLaiKu18naTr1NM37eNYD7eo6xwxlm5D5rCvP/1THnsWUVJK3Bl+/2ACZSw5grvQgXyn
         legw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=R/bYQpNBP6JYyP7NeptT91GVE4y6q0S7dyYsB4AiIzo=;
        b=aNS33VQcmbPDURoaBl2EWsY1gX0yKz8fiPQ0QCxAu9I2PNhw6W/+2uGda/mEx4NlL+
         /s7n4NjLJj9+jNXNd79GmJChpwrmGltl/newRTt+em3n1YcUenOY9P7WneFJWEXuOqIe
         nCr7vpd0xwOaDESvgKtIw3zjjleuIxFGq4Q40PAyrVLpHBvSezxWvwteLNFG0x2+U+d2
         31VSQxq/new7YNhlbcFT237fAzGZo2dSC7v33FgIYr4bcvTNbrBduzu5sHIPp/LsCldO
         YfyvLNWHNKHZi3n/I9VPioCV7PYDn4l2ybXB2RaykgoTzVnn/Krx4MMHmVHUIullQ0Nl
         OyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=R/bYQpNBP6JYyP7NeptT91GVE4y6q0S7dyYsB4AiIzo=;
        b=tvKcwjeGAxXgeaY7TZJ6j+UCSdFlTORIM2azC01l0xQi6UTDsSSQ/oHQw58YdtFPvK
         x5/opxq935OB2Jdbwzayen/2hAdXMx9lDdLrfscWV4CF/FWFIHaTAbfGHdDB4vXDCs7S
         +gjIRBNN51irmc+MU+TaQwWRjPHFTi3Lg0ZrKP3n+RRceJnHDRCUZ1DPaFtXk5zCSEoa
         HqzU6gJBf+5wZlyfsLANwq5ISPwe6mhGjnf+xe3yk4B4+fsMZbg8coP0jy/XBO2tqmwi
         5Khh9r69tLpWDo4/8IC/eEXO/4tIpaDrmqwdHq5teVAoFrODwVUDdY3ZY8wYUdnjVj7o
         I3Ug==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVf2grLju8j4qvh/46x/JipODgFSOprU3f8FzWH3qAizoPwGQhE
	Ds+AVbuafqkxEs6FJhRP1G4=
X-Google-Smtp-Source: APXvYqzAUf8W5Tc4pP/uLw6LQCTSVYKRAZvoVjdceZ5pQec4489QsvsvV6vR+mp+tU9L3toGySh1Uw==
X-Received: by 2002:a7b:c649:: with SMTP id q9mr17365683wmk.2.1557180672808;
        Mon, 06 May 2019 15:11:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f80f:: with SMTP id s15ls1203568wrp.8.gmail; Mon, 06 May
 2019 15:11:12 -0700 (PDT)
X-Received: by 2002:adf:cd0d:: with SMTP id w13mr3889204wrm.38.1557180672267;
        Mon, 06 May 2019 15:11:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557180672; cv=none;
        d=google.com; s=arc-20160816;
        b=KS5sWUiZoOk01CiYiav3xEChcv/LOiDsT8dWIdub+FYtOXa6k1QFfbHkRJ8+wWKZV+
         haXLjvknYd2B6UKNe7ivF5m9mML9VW8cvVLOYGnE+9rADJmKl22dETlec3o7GfXWoYl2
         lw1a64zLXxdhF3p0OWYWXB14dDfManW2OHjVhD3l0O/la7Nqc46BdR3AFu/mu17iSUbG
         enG4e1kUtvYl5drBoPqeP8k/4pwF1SccGu+RXsesF5KEysOqzRqCo5rZm+ZOrtKX2lrq
         a18f8VZmmu96dFmezErpLgClDBEQKLqGESPN5mzuFUvyBRsh28KOj93sLK8Qm78vEaDI
         ciHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=J73NdW9XSLS9VjfURv4rkW93tiP+inYX49CidvIXqDE=;
        b=1A48xhoYzBbERfBXWV/Smz7h9iPdQa29Wose4mkoW2MlxlMgUwlal8qljfqGRDKq5L
         Q5pHJssiDQ30VicPQHFmHfkk4dGWUoJ0I0PrcGm8TK5vFo+gI3s5VXMrmOKwihCHTuSD
         aeotTU8DAC+9XRAO4jKi81Gv+JFQTKjkBBE4Dd1Z+v/s5zy23bUhcR4of6AY1yiHJ10a
         ao/lOochsGW4nb69MS41SfzfNWHhIox0ZL/Fmxgwurn1jV9DY2uQD0DarZ6NO0ouW8eL
         zl2GZPVWN0avMZeciJoe7jiCOwk9QwULw1cV0EiM61NN5b+cj4U+dMjAOMnxiZx1N8/m
         TZEw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id n21si973736wmh.4.2019.05.06.15.11.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 15:11:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 44ycQ75msPzyBH;
	Tue,  7 May 2019 00:11:11 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v2 2/7] pci, config: add more magic extended caps constants
Date: Tue,  7 May 2019 00:11:05 +0200
Message-Id: <20190506221110.19495-3-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190506221110.19495-1-ralf.ramsauer@oth-regensburg.de>
References: <20190506221110.19495-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.5.6.220017, AntiVirus-Engine: 5.60.0, AntiVirus-Data: 2019.5.6.5600003
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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
index 488e43f6..e1376cd7 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -192,7 +192,35 @@ struct jailhouse_pci_device {
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
