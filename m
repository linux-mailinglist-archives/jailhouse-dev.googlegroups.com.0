Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBUVV2HTAKGQE3XNY5UQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D36818E7B
	for <lists+jailhouse-dev@lfdr.de>; Thu,  9 May 2019 18:52:35 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id b22sf637840lji.7
        for <lists+jailhouse-dev@lfdr.de>; Thu, 09 May 2019 09:52:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557420755; cv=pass;
        d=google.com; s=arc-20160816;
        b=o/1CC8xSoqo8R00hUJlVJX1XtoaEQVl21pqdVeJ5RLFOKAD3zlmUw3VXCoouTXNgyH
         zBywyE02450aUpDLapSxJ9uBXsRcdV1aLTTzX9RvWX7fus4bd/0haaRfNAgPc/G8DCuL
         9sE+nrKAKVLiHCEgsCLfNcaqeri3oYAawo21TG4cC6vzyU7SkiiIS1+r/pP59Zw+rZUx
         +T3DclFBdxROpCFKnXJgN4eGm5A1OdtVqS1ou00r/YGmDZuMFWzecKBPbXbctfinBkLx
         eVdgWKRjBrlmliaAFtMuBXl92WhdhcYNp4kNE1kMncY8qx9aofONah4XH49eEr2ds966
         oi/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=l0RtOwDdyls8QsDWHpl1J6eSDXQHNxDa6RhWpjpi7zw=;
        b=02HpBzB9o/gjE82sUtU0AEmrEWdjJmwFggD2HKFTMsqpWwjw4HF0Z0PNdTjP8c0y2l
         XSo4JrjacJWrOHwPg6vRCYFC3laMKwgTXU5xHacWVBVBvIXJy1hf/PQjeaOXkAHWx3Bn
         5Buh9Cvzt2T6/ylOE3K/SatF0Kdhyg+3NhtG/vEHj3nxrReQOr0y2zKZKtdaj3Pm+etY
         sTfCCBkx34b/S288Toj+j7nBcySE1GORT7KXGbvbRTvIT7n5UHX4kcuvvikvh/sGv08Y
         nuuNh4AEMTeR6P1ghR290IUr+0Okarb9t63F6LpQdijyADAv7P1VHQO/yYf3eqUbbjh6
         UdqA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=l0RtOwDdyls8QsDWHpl1J6eSDXQHNxDa6RhWpjpi7zw=;
        b=QugTwokXrjyGeDzFooHhYvh3eXJDQASqkN4fyz5Rv3dBmrnpmcojRLl8JaqcmM+ufi
         T8Mx8GM5D5E7vLGVPrvtHCqa/klV69bzW4SBvg0xUlZfpTC1dkpR6mfVqD8dQ62jgSVQ
         NuKVd2l7n8WYo7YrLBCGfblMIDF7sNkEIXvHjjxELlvkQZwp2fQr87og8jO5OJ1XXK7p
         Lrr4s3m4txdnNUUPKnVT69ryrtPSaGza1ZrD5u/o1zU1qB6n3sCVgB1hJBgTKhUHnm4w
         nCrv+UNDIlDHYu/7PsNjaQHXi5/cD86YCoc1fSYrTknTzj+UzC1FBGkDHLttsnv5hTQe
         HfdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=l0RtOwDdyls8QsDWHpl1J6eSDXQHNxDa6RhWpjpi7zw=;
        b=dGI9tKInkedSQxfAuSICf4G3jY3YZeF69zz8Xzt+jPiUt/2WIJ6GOxHGxCcea8e8Iy
         xMY69rvo1fuN/EyH7j+XeYuvUnMGuvKfSJWpg25q/eg44e//JKXeBjSt6qmGrOziC7nr
         cymlB3lbqU7MOuEs0isvhpTXWG1tGWmcQozReLtsHLJJrForImFhdUGM7Dc/WgHXMfHp
         afQN/apXsAopayaDhrW8QImEclFgw2NOdp5ntw87cCRt00ehlLdsQUsMLgFIOlewBiv6
         t5FsW6H2oP8q39uT3pCOzYlwTEE7Cnksxu+Zovi5T7g5C8Rap+pCoQeZuiVJ5rYa/Rj9
         +yXg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUJqy55AyOVjG8DtnD92j061giPv6QPxfg/d3U8lbwqUZhGkKr7
	zQ86EBrpdIgS+DBUDIOoyOw=
X-Google-Smtp-Source: APXvYqzyMnQY6U6pz4+ZqVd5MLGBSGbFqnWQfJZeFKUZ5Klrl70meGJilTWPhIqgOK2h0bcmX8vabw==
X-Received: by 2002:ac2:4217:: with SMTP id y23mr3106189lfh.134.1557420755090;
        Thu, 09 May 2019 09:52:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9c54:: with SMTP id t20ls315583ljj.9.gmail; Thu, 09 May
 2019 09:52:34 -0700 (PDT)
X-Received: by 2002:a2e:9a0a:: with SMTP id o10mr2924027lji.67.1557420754576;
        Thu, 09 May 2019 09:52:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557420754; cv=none;
        d=google.com; s=arc-20160816;
        b=0vHfoMnHw/wQoHSILawQ4ONpJPNAuqObSMDgxRasspGZgAExwm8j6IkowCmw3XAilK
         1omz5yaMXa9hmUZ37dnwwY3piSgpbwIvdJ70Y12Wv9ch73zePJcfdfRCff0xtgt9qf+/
         RMHqXX3CMds7OFsGLOuhzZ9qoMyfpe1wB/OvRy3l2lj8IYfK1kRpuyalrsqnnLCs++k/
         QSDEBQF3Qtd9+jZ4OvNB6hkTjVQ4G5cY0L3az4qy/X7sRYFQuBd7bAzWzmCA/2QqHA2i
         1jX/3tdKW2YsWGkdjWKvTKrPzxf+WPMRgjFZUXZtbynVq84OYzh8YnXIssHN5749wmXq
         2qDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=kNNw+ZuTkHhkfPTYgYnU1X0wmYwnK11hiAUG3rebYWk=;
        b=HUKhiLJFFC/TDAH6OB8sIlw2aIB8YVgxViSxT1I9Kjrzmfx8NVXMVm6w54Dn3x6fEI
         zj3iQfW7hKryb/cbeAFDZ1UDmuZ+KebqANJXWCbfl6+xBrvYR8Ie+1MPpZt7xNGC2bdv
         5jS/jbZUxJAC8JFjHspQdgHyxloSLu6fgbdH4wtp7dPvX8rstv4uhebzslQw91R/Mdx7
         LJcT91BZtulVisHjfprfv+UTohvgu7u1KqtCQ2W+bxQsnDughfGuoa8m5UK1uc1A+GVa
         1qXrmfC3+zj63pQzdbGKYwCWZjYF7AUw8o6l7qDSCeeKeqJdcXM/eRVcXiDwBrhhbouN
         LRWQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id m25si596505lfl.1.2019.05.09.09.52.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 09:52:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 450KC5458XzyBY;
	Thu,  9 May 2019 18:52:33 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 2/6] pci, config: add more magic extended caps constants
Date: Thu,  9 May 2019 18:52:27 +0200
Message-Id: <20190509165231.18572-3-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190509165231.18572-1-ralf.ramsauer@oth-regensburg.de>
References: <20190509165231.18572-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.5.9.164517, AntiVirus-Engine: 5.60.1, AntiVirus-Data: 2019.5.9.5601002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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
 include/jailhouse/pci_defs.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/include/jailhouse/pci_defs.h b/include/jailhouse/pci_defs.h
index da88cea3..63c61daf 100644
--- a/include/jailhouse/pci_defs.h
+++ b/include/jailhouse/pci_defs.h
@@ -50,4 +50,32 @@
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
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190509165231.18572-3-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
