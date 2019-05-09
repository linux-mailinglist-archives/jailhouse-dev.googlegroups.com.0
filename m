Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBUVV2HTAKGQE3XNY5UQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3D818E79
	for <lists+jailhouse-dev@lfdr.de>; Thu,  9 May 2019 18:52:35 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id s21sf1955252edd.10
        for <lists+jailhouse-dev@lfdr.de>; Thu, 09 May 2019 09:52:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557420754; cv=pass;
        d=google.com; s=arc-20160816;
        b=BhfhTDBAu0YFdhdPUCo7kDGcw2gSmw3S6J1TTLunPUoxigm70RrdKUwDIlO8bnL0T2
         acaWNqnodQkKKLowYqH8DH6KoownV30lCgjrjIwCTauSVvK04GDfTFcVCoFiYVSgKnHb
         FUSTq7+QeFvl7ryA6BNnWCXcrMa+yhanWr1uZI+sGJn4WStZwft0z2EuzF7L9IXnAONQ
         JZn49D3u29xVFNx4xbhViNFb3msgSMA8TIgXYFDfGrcJkFuBFfyQvR/itFNXsYDhje8p
         LDtfJJcXHpY4VRGv9ZdRx9QYvaBP3iL8ZQsbVajE8j1WV8th5fRHoVnI1rJuKLpqbnNd
         EK1g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=L2t0cubYeg4ZhmtekOvhAOFnCjS+pNCmr87+mFxmqI4=;
        b=x9oZn6m0FzwLwrS2djZYAUDzdgUbyobjlO0iRjuuykrfHEv+qFj1k+ISzu9Bc2esLZ
         SGq2VisDIhBABBHiQRxRCLK7f6mQGb9z6oMMTFVYqYix2ro6PtcEvDWs8PCjJ/7IC4uY
         8FVwoUbCGwIGi7uF6VEkkdC19G87oZWQ+Q+kuqGkzzuOx/V8QtgaM2pcVKWfM0XA4TN/
         sHzteezS+FvoMWeYnr3HBTy3m/x1zydRgDNtAG9tW8dEMdIouRlXkCxzBretRLSJqhZo
         QdZMtkAVATh2wb8tMKriptjPSaklZqSezgSpS105MIV/LXHgDdqnGFPSRLMg600hReNa
         4Ozg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=L2t0cubYeg4ZhmtekOvhAOFnCjS+pNCmr87+mFxmqI4=;
        b=s6FImYyAJ7AAIv3PWgJpYz4DxmwuJlJTtxJAQeOhzyAVu/s7OedrAlpv2m26SZhRv+
         GpF2rWs/2jEhjeqnUsJvyrvjIKeiNPR+o/AaTsfaBzGmt/kpxVwkc12CvnWWnCEyCzPF
         r7MMitW7tdURMXqif2DqqgBqSKSU5hznupUN2oTroh2ckTt6RCXWcxr8tZPfYAR8fN/Y
         UtL8N1fDLgt3oGngV2bMLwa8PBCbejDELgo0OEkeiufMe+fNq+qBeCxh/Lj8N3KnjNaA
         YdpX6VqRwHyuQNR8tbh9KaoZDee9F0ZqktJrV2LYEHI5zVLtIA8eRI80hev7DbEpKEPv
         YkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=L2t0cubYeg4ZhmtekOvhAOFnCjS+pNCmr87+mFxmqI4=;
        b=FJ5xM+pcxc4IvBEG5OLoQ6ThBsCgjgope356D/jIjTutbIAOGQxJo0GGxvhQ6KcSg4
         KDfZL3THs1Mu9LcBSPLcAxge4I5oZ6u3IiUq0kpZhgT97Ym4Juxheq27EWCutmXu3Cww
         qGwl13UiFpsTmvJ4gFTAPGma23VWJ6951Mnp6DRi9MwrbP7Vc2tGaJkD8O60aI3vZprR
         zVfKI2BR/8KaCSmgBmcONsHBspZXfRtjqAeAGQqc65sDLOrwsXFM6aAMHlmNdYPbPB4E
         x/+Ay7riBsaFBSvlLyzQEj2wckt9hLuOot20T99JmmA+FlFI6T8chwOr7f3nCteTWjol
         s1IQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWrQsjXQ3unj1WUwu99sJh3tov3U61qJbxWx5iz0wgj+OXClcGg
	31WA6zIL9eVjNKeyeSvn8jg=
X-Google-Smtp-Source: APXvYqw/1iIbDHYJ87/aj1QS9qFtJrhH2kJSutOs6eOmuf/mEs03OjBS+tcw+lQC8k2KaIZ8hrZg6Q==
X-Received: by 2002:a50:b487:: with SMTP id w7mr5403915edd.45.1557420754281;
        Thu, 09 May 2019 09:52:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:904f:: with SMTP id z15ls921398edz.1.gmail; Thu, 09 May
 2019 09:52:33 -0700 (PDT)
X-Received: by 2002:aa7:c919:: with SMTP id b25mr5291146edt.274.1557420753834;
        Thu, 09 May 2019 09:52:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557420753; cv=none;
        d=google.com; s=arc-20160816;
        b=fIb2ezuOVfH6lb2IAqhjYD6efrajXjH2bivzYM8vaZm/K3Ywl6JpGuC2W07q2kp5qa
         cE1OOm8uti07mLDDPCwLN0iriid5uwEC2x2twIDib5EgcnfZEsylMxzbbor8gWodKlsD
         5kkx+SvI0jkwQP5O3nG5ZjVfBLqz1cDBBsePT5YdCn81stz/cQ0CkQnWMc95s8YyAdl9
         EUpS8bkeZpTy9DtuUpOeI+VMX8XAGZRzj76vMZJXT1DqbM7pL7vgB2GnoK+2vZIagM9m
         0/R75+wzqStoV3z+jc83zkExq+lANJn9dQx4QydUTEDlzYnMVWMELGNpWMLCQqvz918M
         nEqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=bhtmH8y/ubWMgV5dAVMI13TOX9AJGP9hMAAwQYtDYRQ=;
        b=KIrMCmF2a9BCh5mCOpZbSN/jatankXWKGVIL4swWjQyZodVjWTpUpX8LkqCzNqI/uX
         Svcuynojixs8BXo0vSNYb65RUoDuCMNGV3zNDXtLYGkNimKeNjiHYnYL9dKYjaEPpKsx
         cJFwT1Rf/7X+ZtcigHG8BfHxKM5LRbb2XhaDXdDpbNrIwwKP3UtOYi3Vx6YcExy1pP+w
         I7NpDNinlAGXWx2qpi10n3U5sH7fKjvYg1SKNI6JnKgHuRnW/fZalf/PEf2ZKght9a+m
         uO87JihvOh23TCWx4EufSs9YGMsaKet8x6KUVd5dzF7OUJLP9QpcSxFEV9QttF0iyuHq
         289Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id l30si872697edd.4.2019.05.09.09.52.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 09:52:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 450KC52CCQzyBS;
	Thu,  9 May 2019 18:52:33 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 1/6] pci, configs: unmystify magic constants
Date: Thu,  9 May 2019 18:52:26 +0200
Message-Id: <20190509165231.18572-2-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190509165231.18572-1-ralf.ramsauer@oth-regensburg.de>
References: <20190509165231.18572-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.5.9.164517, AntiVirus-Engine: 5.60.1, AntiVirus-Data: 2019.5.9.5601002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_10000_PLUS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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
 include/jailhouse/cell-config.h |  1 +
 include/jailhouse/pci_defs.h    | 53 ++++++++++++++++++++++++++++++++
 8 files changed, 125 insertions(+), 71 deletions(-)
 create mode 100644 include/jailhouse/pci_defs.h

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
index 63eb5fa5..5739f332 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -40,6 +40,7 @@
 #define _JAILHOUSE_CELL_CONFIG_H
 
 #include <jailhouse/console.h>
+#include <jailhouse/pci_defs.h>
 
 #ifndef ARRAY_SIZE
 #define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
diff --git a/include/jailhouse/pci_defs.h b/include/jailhouse/pci_defs.h
new file mode 100644
index 00000000..da88cea3
--- /dev/null
+++ b/include/jailhouse/pci_defs.h
@@ -0,0 +1,53 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) OTH Regensburg, 2019
+ *
+ * Authors:
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Alternatively, you can use or redistribute this file under the following
+ * BSD license:
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ *
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
+ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
+ * THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
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
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190509165231.18572-2-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
