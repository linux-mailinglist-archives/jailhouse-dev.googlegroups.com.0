Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBZUDUPTAKGQEDHL4VJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F2810203
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Apr 2019 23:45:16 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id u19sf3062285wmj.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Apr 2019 14:45:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556660711; cv=pass;
        d=google.com; s=arc-20160816;
        b=zzEYG1S2N4+gt1nGPsPhUBrZmnboasE7afLsWJ4VS/SPzVGMv/zzudqoSxcPAE55+t
         vwCQBqHwrlieIclRzOs42i5Sx8f/pPjBf1t/cfGYZOeq1qlJLI83YZSp2FvQAFIoYKxC
         pMmCYtnzVe01/GoYvH70TbWRSmTYobrK85gMRj/NRPSugPlaHSfuFQhQB56CPzhayYFo
         npYqBSR8tzenuevNB6IfZVta4QRUU4/VOXX6FRRDZhibSbJM3n++gq3w/KKM2mS4gqM0
         xEjsuD+uaJFoFCMPccLTDJxrt05lmVvuYfm6ofb51je4ZvE+G1bbWO0WPRMxzecqtksR
         buCA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=wFJfeD0S7UPdqQuagJTtywslpHI2okPuu3W52s3pdC8=;
        b=tsHPo5gaoQ52hTTqE/nsqWiX4nl6qEFECbgmNF5nN00GAadv7K1us+jBPfVPFU6evX
         0kG8rsMcSlnjFuGukXVOmJ83aOU23tDAzQ82LbEsPAZdteUOk6tlLL24PE9eGRaqBX73
         tAX6Ydgu9gOiwFmDkaM6eihU6cZ2PH/YkvDidDCj6KJIGIV1nToZ285ql+Q2lBBXDRNr
         ElsdirsF8xO9v4kcbwybbvI4yde3fs9lrbIylDVx7TL07TTxMdRUv4UA8mcpcAXY3wPC
         VPt2jnHXqy6a2AcrCqN2CnNR1lqIvWLikQGl3VzfHKBq/oRs/C0GxF+M+pBtieVeVBHa
         WezQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wFJfeD0S7UPdqQuagJTtywslpHI2okPuu3W52s3pdC8=;
        b=loS7yYlbSQCoZ9pghqBDQ+JEOqsM66UU1e6jcDAbyqZSBJD+h6Lp5GIKUfMGMj0zSD
         qrPrjlC/Ne2bSIBqIYxlKRzBMsIfB4gCGxhc86rO15KS3Lev080FSEGZCVFh3Wc5xAB3
         HOehwsSY7pgD6d80UBEl+yIHjLCBROI6BPZKSX8/eHcL9VDI6R5wJHdl2Ucv16uD3wiw
         BakysWWru2WL0RSxNf82mYNr63QxO1nCbIieJPwIZKPPxiKGSHisgIJ3yq1kMsrYMn6F
         KDNSumPUsWGNG3Kjgg+OvIHa2+Y1v/W7bsi/y69vUW+1UJzcO6YqMvGK//IcmVdiZzg4
         Mr/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wFJfeD0S7UPdqQuagJTtywslpHI2okPuu3W52s3pdC8=;
        b=ZJ5Xe2ExDbKeeCoObq5VndvP2qscf1apb/M2gJmJGmpilaaj6qetg+K6m/CMxw0f5V
         daMOdoxz01xZX72Kcb4lbkvEoQCxU3vbYrZ5i5BWHXv2iRw0I3dY6jeYQcEVzEPvjdxQ
         3Nz2AqIzzGkTXiI4GR43UN5WOihX3Z5llSjN1xlPOR1oqaytOnRUZSBaLj71nGQI4tuE
         O5ElkIH/hyEEoz1iesh0TJZvOw0MILeFqdzxKXO5BqhrKSD0VBzzbnbz4vXmvU63KTdC
         ntLvI1Y+vT5+YpHpc34zNiedXZln1rb14+WtzlBqqqvXtqh9zzh6y1RseBXIBW0rQOOJ
         +HCg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXw4ZV5VFrLaaZ1uJDmT8VJUm37IkUHD5PWjxYUHr7OZCvd1P+F
	/ZGdujyOz7GSjXEuLgoGSc4=
X-Google-Smtp-Source: APXvYqwdUt0R62G5F+zM2nWUPpNdeoibwY0Rv6bd09AO3ze8I65TZBMAKG9PwmzPBn8SQtkOwH1J7g==
X-Received: by 2002:a1c:f310:: with SMTP id q16mr4806144wmq.102.1556660711088;
        Tue, 30 Apr 2019 14:45:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:6342:: with SMTP id x63ls1241460wmb.0.canary-gmail; Tue,
 30 Apr 2019 14:45:10 -0700 (PDT)
X-Received: by 2002:a1c:2dd2:: with SMTP id t201mr4822146wmt.10.1556660710589;
        Tue, 30 Apr 2019 14:45:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556660710; cv=none;
        d=google.com; s=arc-20160816;
        b=n3JnIt8LUnfDGjDi4e+Q0Rc+wl2z9hQr9a9EDSOOoE/EqdzqYSfgF9l4zkgSb+v41c
         nuyJIEgzPy7LpyYNmMX8JVv68t2QbLoGEcUCPsLVMaaMfuZ5yXoOU00aoA+CX7AVlgHY
         WDsgYQy4IRY5PwuUJ1FmGLL2ZU82eyT6yssUjW2UjpWKNGCl5R3Hs+0M2/en/hjDIFWm
         j3Fl+XIjuAj+RyWxdYcfhqCjMrBdbuOj7qFPxK3wERpE58oOgkJca0yBY+sAeRlwV+lJ
         NgUK+J47giL0KQnuhP02jZQw4oB5RM2/WFlODDqumUj0GbBhfi94bApRHgofotUkW0Fg
         BILg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=le0yPSXHx91vINUzOYlzm4MyhfA8yuxeCIVUq63Ue9E=;
        b=c3FWplcJ0y0kVGLhMRFF8rokFuWdOFnEqNfnC1wlCCPlLRQALcy+5+aBlvw41UGm34
         a15LxpHVEFsppW2oR1TUJURqG80QcmI/jrsdzDAo1AfStnwNGVR+3JBskjiuemHMWQj6
         1ExnvK1lFkwScP7iYi6QzHzlQiPXo0iZwVxkK2ncF5nRxyNFZE9i8TIc9vE0C8qbpYZ0
         9ZVCsEyJ9ofy2oy0LtbxNGwWQb6ZE6+Q3VyqG8E0NLWnfFLtZ0FMOEYs3+cn27csTwc1
         HiyLTYjMje+KUSpf1J4Mhf3OZjpViywLNvEpAzv2K0tH/riXwWzjCCzskS5GEVAPvaFl
         TK6Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id 4si133984wmd.1.2019.04.30.14.45.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 14:45:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 44tw6t0z5tzyBc;
	Tue, 30 Apr 2019 23:45:10 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 2/5] pci, configs: unmystify magic constants
Date: Tue, 30 Apr 2019 23:45:01 +0200
Message-Id: <20190430214504.2153-3-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190430214504.2153-1-ralf.ramsauer@oth-regensburg.de>
References: <20190430214504.2153-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.4.30.213616, AntiVirus-Engine: 5.60.0, AntiVirus-Data: 2019.4.30.5600002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_10000_PLUS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_NO_WWW 0, __URI_NS '
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

Some sugar for the guidance of the reader. Use speaking name instead of
hard-coded constants.

This patch was supported by:
$ git grep -l "\.id = 0x1"  | xargs sed -i 's/id = 0x1,/id = PCI_CAP_ID_PM,/'
$ git grep -l "\.id = 0x3"  | xargs sed -i 's/id = 0x3,/id = PCI_CAP_ID_VPD,/'
$ git grep -l "\.id = 0x5"  | xargs sed -i 's/id = 0x5,/id = PCI_CAP_ID_MSI,/'
$ git grep -l "\.id = 0x8"  | xargs sed -i 's/id = 0x8,/id = PCI_CAP_ID_HT,/'
$ git grep -l "\.id = 0x9"  | xargs sed -i 's/id = 0x9,/id = PCI_CAP_ID_VNDR,/'
$ git grep -l "\.id = 0xa"  | xargs sed -i 's/id = 0xa,/id = PCI_CAP_ID_DBG,/'
$ git grep -l "\.id = 0xd"  | xargs sed -i 's/id = 0xd,/id = PCI_CAP_ID_SSVID,/'
$ git grep -l "\.id = 0xf"  | xargs sed -i 's/id = 0xf,/id = PCI_CAP_ID_SECDEV,/'
$ git grep -l "\.id = 0x10" | xargs sed -i 's/id = 0x10,/id = PCI_CAP_ID_EXP,/'
$ git grep -l "\.id = 0x11" | xargs sed -i 's/id = 0x11,/id = PCI_CAP_ID_MSIX,/'
$ git grep -l "\.id = 0x12" | xargs sed -i 's/id = 0x12,/id = PCI_CAP_ID_SATA,/'
$ git grep -l "\.id = 0x13" | xargs sed -i 's/id = 0x13,/id = PCI_CAP_ID_AF,/'

Extended cap ids were manually replaced.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 configs/x86/e1000-demo.c        |  2 +-
 configs/x86/f2a88xm-hd3.c       | 54 ++++++++++++++++-----------------
 configs/x86/imb-a180.c          | 52 +++++++++++++++----------------
 configs/x86/linux-x86-demo.c    | 12 ++++----
 configs/x86/pci-demo.c          |  2 +-
 configs/x86/qemu-x86.c          | 20 ++++++------
 include/jailhouse/cell-config.h | 16 ++++++++++
 7 files changed, 87 insertions(+), 71 deletions(-)

diff --git a/configs/x86/e1000-demo.c b/configs/x86/e1000-demo.c
index 09ca9eac..814f13ed 100644
--- a/configs/x86/e1000-demo.c
+++ b/configs/x86/e1000-demo.c
@@ -97,7 +97,7 @@ struct {
 
 	.pci_caps = {
 		{ /* Intel e1000 @00:19.0 */
-			.id = 0x5,
+			.id = PCI_CAP_ID_MSI,
 			.start = 0xd0,
 			.len = 14,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
diff --git a/configs/x86/f2a88xm-hd3.c b/configs/x86/f2a88xm-hd3.c
index e73cbb06..315d0e29 100644
--- a/configs/x86/f2a88xm-hd3.c
+++ b/configs/x86/f2a88xm-hd3.c
@@ -737,19 +737,19 @@ struct {
 	.pci_caps = {
 		/* PCIDevice: 00:00.2 */
 		{
-			.id = 0xf,
+			.id = PCI_CAP_ID_SECDEV,
 			.start = 0x40,
 			.len = 2,
 			.flags = 0,
 		},
 		{
-			.id = 0x5,
+			.id = PCI_CAP_ID_MSI,
 			.start = 0x54,
 			.len = 14,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x8,
+			.id = PCI_CAP_ID_HT,
 			.start = 0x64,
 			.len = 2,
 			.flags = 0,
@@ -757,56 +757,56 @@ struct {
 		/* PCIDevice: 00:01.0 */
 		/* PCIDevice: 00:01.1 */
 		{
-			.id = 0x9,
+			.id = PCI_CAP_ID_VNDR,
 			.start = 0x48,
 			.len = 2,
 			.flags = 0,
 		},
 		{
-			.id = 0x1,
+			.id = PCI_CAP_ID_PM,
 			.start = 0x50,
 			.len = 8,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x10,
+			.id = PCI_CAP_ID_EXP,
 			.start = 0x58,
 			.len = 2,
 			.flags = 0,
 		},
 		{
-			.id = 0x5,
+			.id = PCI_CAP_ID_MSI,
 			.start = 0xa0,
 			.len = 14,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		/* PCIDevice: 00:03.1 */
 		{
-			.id = 0x1,
+			.id = PCI_CAP_ID_PM,
 			.start = 0x50,
 			.len = 8,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x10,
+			.id = PCI_CAP_ID_EXP,
 			.start = 0x58,
 			.len = 2,
 			.flags = 0,
 		},
 		{
-			.id = 0x5,
+			.id = PCI_CAP_ID_MSI,
 			.start = 0xa0,
 			.len = 14,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0xd,
+			.id = PCI_CAP_ID_SSVID,
 			.start = 0xb0,
 			.len = 2,
 			.flags = 0,
 		},
 		{
-			.id = 0x8,
+			.id = PCI_CAP_ID_HT,
 			.start = 0xb8,
 			.len = 2,
 			.flags = 0,
@@ -814,38 +814,38 @@ struct {
 		/* PCIDevice: 00:10.0 */
 		/* PCIDevice: 00:10.1 */
 		{
-			.id = 0x1,
+			.id = PCI_CAP_ID_PM,
 			.start = 0x50,
 			.len = 8,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x5,
+			.id = PCI_CAP_ID_MSI,
 			.start = 0x70,
 			.len = 14,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x11,
+			.id = PCI_CAP_ID_MSIX,
 			.start = 0x90,
 			.len = 12,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x10,
+			.id = PCI_CAP_ID_EXP,
 			.start = 0xa0,
 			.len = 2,
 			.flags = 0,
 		},
 		/* PCIDevice: 00:11.0 */
 		{
-			.id = 0x5,
+			.id = PCI_CAP_ID_MSI,
 			.start = 0x50,
 			.len = 14,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x12,
+			.id = PCI_CAP_ID_SATA,
 			.start = 0x70,
 			.len = 2,
 			.flags = 0,
@@ -853,58 +853,58 @@ struct {
 		/* PCIDevice: 00:12.2 */
 		/* PCIDevice: 00:13.2 */
 		{
-			.id = 0x1,
+			.id = PCI_CAP_ID_PM,
 			.start = 0xc0,
 			.len = 8,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0xa,
+			.id = PCI_CAP_ID_DBG,
 			.start = 0xe4,
 			.len = 2,
 			.flags = 0,
 		},
 		/* PCIDevice: 00:14.2 */
 		{
-			.id = 0x1,
+			.id = PCI_CAP_ID_PM,
 			.start = 0x50,
 			.len = 8,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		/* PCIDevice: 00:18.3 */
 		{
-			.id = 0xf,
+			.id = PCI_CAP_ID_SECDEV,
 			.start = 0xf0,
 			.len = 2,
 			.flags = 0,
 		},
 		/* PCIDevice: 01:00.0 */
 		{
-			.id = 0x1,
+			.id = PCI_CAP_ID_PM,
 			.start = 0x40,
 			.len = 8,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x5,
+			.id = PCI_CAP_ID_MSI,
 			.start = 0x50,
 			.len = 14,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x10,
+			.id = PCI_CAP_ID_EXP,
 			.start = 0x70,
 			.len = 2,
 			.flags = 0,
 		},
 		{
-			.id = 0x11,
+			.id = PCI_CAP_ID_MSIX,
 			.start = 0xb0,
 			.len = 12,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x3,
+			.id = PCI_CAP_ID_VPD,
 			.start = 0xd0,
 			.len = 2,
 			.flags = 0,
diff --git a/configs/x86/imb-a180.c b/configs/x86/imb-a180.c
index 4faa0b41..e0d86e3a 100644
--- a/configs/x86/imb-a180.c
+++ b/configs/x86/imb-a180.c
@@ -613,25 +613,25 @@ struct {
 		/* PCIDevice: 00:01.0 */
 		/* PCIDevice: 00:01.1 */
 		{
-			.id = 0x9,
+			.id = PCI_CAP_ID_VNDR,
 			.start = 0x48,
 			.len = 2,
 			.flags = 0,
 		},
 		{
-			.id = 0x1,
+			.id = PCI_CAP_ID_PM,
 			.start = 0x50,
 			.len = 8,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x10,
+			.id = PCI_CAP_ID_EXP,
 			.start = 0x58,
 			.len = 2,
 			.flags = 0,
 		},
 		{
-			.id = 0x5,
+			.id = PCI_CAP_ID_MSI,
 			.start = 0xa0,
 			.len = 14,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
@@ -639,81 +639,81 @@ struct {
 		/* PCIDevice: 00:02.3 */
 		/* PCIDevice: 00:02.4 */
 		{
-			.id = 0x1,
+			.id = PCI_CAP_ID_PM,
 			.start = 0x50,
 			.len = 8,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x10,
+			.id = PCI_CAP_ID_EXP,
 			.start = 0x58,
 			.len = 2,
 			.flags = 0,
 		},
 		{
-			.id = 0x5,
+			.id = PCI_CAP_ID_MSI,
 			.start = 0xa0,
 			.len = 14,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0xd,
+			.id = PCI_CAP_ID_SSVID,
 			.start = 0xb0,
 			.len = 2,
 			.flags = 0,
 		},
 		{
-			.id = 0x8,
+			.id = PCI_CAP_ID_HT,
 			.start = 0xb8,
 			.len = 2,
 			.flags = 0,
 		},
 		/* PCIDevice: 00:10.0 */
 		{
-			.id = 0x1,
+			.id = PCI_CAP_ID_PM,
 			.start = 0x50,
 			.len = 8,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x5,
+			.id = PCI_CAP_ID_MSI,
 			.start = 0x70,
 			.len = 14,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x11,
+			.id = PCI_CAP_ID_MSIX,
 			.start = 0x90,
 			.len = 12,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x10,
+			.id = PCI_CAP_ID_EXP,
 			.start = 0xa0,
 			.len = 2,
 			.flags = 0,
 		},
 		/* PCIDevice: 00:11.0 */
 		{
-			.id = 0x1,
+			.id = PCI_CAP_ID_PM,
 			.start = 0x60,
 			.len = 8,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x12,
+			.id = PCI_CAP_ID_SATA,
 			.start = 0x70,
 			.len = 2,
 			.flags = 0,
 		},
 		{
-			.id = 0x5,
+			.id = PCI_CAP_ID_MSI,
 			.start = 0x50,
 			.len = 14,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x13,
+			.id = PCI_CAP_ID_AF,
 			.start = 0xd0,
 			.len = 2,
 			.flags = 0,
@@ -721,27 +721,27 @@ struct {
 		/* PCIDevice: 00:12.2 */
 		/* PCIDevice: 00:13.2 */
 		{
-			.id = 0x1,
+			.id = PCI_CAP_ID_PM,
 			.start = 0xc0,
 			.len = 8,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0xa,
+			.id = PCI_CAP_ID_DBG,
 			.start = 0xe4,
 			.len = 2,
 			.flags = 0,
 		},
 		/* PCIDevice: 00:14.2 */
 		{
-			.id = 0x1,
+			.id = PCI_CAP_ID_PM,
 			.start = 0x50,
 			.len = 8,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		/* PCIDevice: 00:18.3 */
 		{
-			.id = 0xf,
+			.id = PCI_CAP_ID_SECDEV,
 			.start = 0xf0,
 			.len = 2,
 			.flags = 0,
@@ -752,31 +752,31 @@ struct {
 		/* PCIDevice: 01:00.3 */
 		/* PCIDevice: 02:00.0 */
 		{
-			.id = 0x1,
+			.id = PCI_CAP_ID_PM,
 			.start = 0x40,
 			.len = 8,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x5,
+			.id = PCI_CAP_ID_MSI,
 			.start = 0x50,
 			.len = 14,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x10,
+			.id = PCI_CAP_ID_EXP,
 			.start = 0x70,
 			.len = 2,
 			.flags = 0,
 		},
 		{
-			.id = 0x11,
+			.id = PCI_CAP_ID_MSIX,
 			.start = 0xb0,
 			.len = 12,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x3,
+			.id = PCI_CAP_ID_VPD,
 			.start = 0xd0,
 			.len = 2,
 			.flags = 0,
diff --git a/configs/x86/linux-x86-demo.c b/configs/x86/linux-x86-demo.c
index c8f18701..cb89ec0a 100644
--- a/configs/x86/linux-x86-demo.c
+++ b/configs/x86/linux-x86-demo.c
@@ -178,37 +178,37 @@ struct {
 
 	.pci_caps = {
 		{ /* e1000e */
-			.id = 0x1,
+			.id = PCI_CAP_ID_PM,
 			.start = 0xc8,
 			.len = 8,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x5,
+			.id = PCI_CAP_ID_MSI,
 			.start = 0xd0,
 			.len = 14,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x10,
+			.id = PCI_CAP_ID_EXP,
 			.start = 0xe0,
 			.len = 20,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x11,
+			.id = PCI_CAP_ID_MSIX,
 			.start = 0xa0,
 			.len = 12,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x1 | JAILHOUSE_PCI_EXT_CAP,
+			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
 			.start = 0x100,
 			.len = 4,
 			.flags = 0,
 		},
 		{
-			.id = 0x3 | JAILHOUSE_PCI_EXT_CAP,
+			.id = PCI_EXT_CAP_ID_DSN | JAILHOUSE_PCI_EXT_CAP,
 			.start = 0x140,
 			.len = 4,
 			.flags = 0,
diff --git a/configs/x86/pci-demo.c b/configs/x86/pci-demo.c
index 0b8c1aad..c7a5527a 100644
--- a/configs/x86/pci-demo.c
+++ b/configs/x86/pci-demo.c
@@ -94,7 +94,7 @@ struct {
 
 	.pci_caps = {
 		{ /* Intel HDA @00:1b.0 */
-			.id = 0x5,
+			.id = PCI_CAP_ID_MSI,
 			.start = 0x60,
 			.len = 14,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
index 4d671cb2..fdfa8915 100644
--- a/configs/x86/qemu-x86.c
+++ b/configs/x86/qemu-x86.c
@@ -314,7 +314,7 @@ struct {
 
 	.pci_caps = {
 		{ /* ICH HD audio */
-			.id = 0x5,
+			.id = PCI_CAP_ID_MSI,
 			.start = 0x60,
 			.len = 14,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
@@ -325,55 +325,55 @@ struct {
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{ /* AHCI */
-			.id = 0x12,
+			.id = PCI_CAP_ID_SATA,
 			.start = 0xa8,
 			.len = 2,
 			.flags = 0,
 		},
 		{
-			.id = 0x5,
+			.id = PCI_CAP_ID_MSI,
 			.start = 0x80,
 			.len = 14,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{ /* virtio-9p-pci */
-			.id = 0x11,
+			.id = PCI_CAP_ID_MSIX,
 			.start = 0x98,
 			.len = 12,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{ /* e1000e */
-			.id = 0x1,
+			.id = PCI_CAP_ID_PM,
 			.start = 0xc8,
 			.len = 8,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x5,
+			.id = PCI_CAP_ID_MSI,
 			.start = 0xd0,
 			.len = 14,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x10,
+			.id = PCI_CAP_ID_EXP,
 			.start = 0xe0,
 			.len = 20,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x11,
+			.id = PCI_CAP_ID_MSIX,
 			.start = 0xa0,
 			.len = 12,
 			.flags = JAILHOUSE_PCICAPS_WRITE,
 		},
 		{
-			.id = 0x1 | JAILHOUSE_PCI_EXT_CAP,
+			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
 			.start = 0x100,
 			.len = 4,
 			.flags = 0,
 		},
 		{
-			.id = 0x3 | JAILHOUSE_PCI_EXT_CAP,
+			.id = PCI_EXT_CAP_ID_DSN | JAILHOUSE_PCI_EXT_CAP,
 			.start = 0x140,
 			.len = 4,
 			.flags = 0,
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 63eb5fa5..e90cd25e 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -182,6 +182,22 @@ struct jailhouse_pci_device {
 
 #define JAILHOUSE_PCICAPS_WRITE		0x0001
 
+#define PCI_CAP_ID_PM			0x01 /* Power Management */
+#define PCI_CAP_ID_VPD			0x03 /* Vital Product Data */
+#define PCI_CAP_ID_MSI			0x05 /* Message Signalled Interrupts */
+#define PCI_CAP_ID_HT			0x08 /* HyperTransport */
+#define PCI_CAP_ID_VNDR			0x09 /* Vendor-Specific */
+#define PCI_CAP_ID_DBG			0x0A /* Debug port */
+#define PCI_CAP_ID_SSVID		0x0D /* Bridge subsystem vendor/device ID */
+#define PCI_CAP_ID_SECDEV		0x0F /* Secure Device */
+#define PCI_CAP_ID_EXP			0x10 /* PCI Express */
+#define PCI_CAP_ID_MSIX			0x11 /* MSI-X */
+#define PCI_CAP_ID_SATA			0x12 /* SATA Data/Index Conf. */
+#define PCI_CAP_ID_AF			0x13 /* PCI Advanced Features */
+
+#define PCI_EXT_CAP_ID_ERR		0x01 /* Advanced Error Reporting */
+#define PCI_EXT_CAP_ID_DSN		0x03 /* Device Serial Number */
+
 struct jailhouse_pci_capability {
 	__u16 id;
 	__u16 start;
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
