Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBUW5YLTAKGQEG2K42II@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD85155E4
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 00:01:55 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id l26sf790284lfk.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 May 2019 15:01:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557180115; cv=pass;
        d=google.com; s=arc-20160816;
        b=a6TSZa3iLFIlf3jaO1xc+mSfVXRJHT/7HLwLUYZw2/vts3LrU0AWSC+UGaOYnRO/pb
         WBEPaPvG8LY/3KhQqKwQTxgM2c7FBg9AhbaxZ4xNLWd5FeW9ULn2+amU9hbMwvDPp92l
         wQRwKX9+nK/VHlstUytIZSnL91oWznYd20ePsn9oG7Lx3bSFMcAF/GhnNJyUQEgqyLnU
         d6TlfCksy3VV3qrsHiGxRScK5inkEEVYtNQeUtGFpRCSAlyXamzomlZtQ2Ei3wjK+Mw1
         f9Can8k8wuV/U2k3r9muNnUjGw5PLaG5SZ3YAHSUrLT4p6xOckyhPaX0HzK+ID7KPUjF
         8BSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=oBR7OH6trNjckGpurMyuofHdop9U3238bGMs/8jOuiM=;
        b=kJ/KJtyOjIA7TGQYllQ39/m2BThDmdaJ6XfKXG/UEinHQVfrBgxhGPM5Qv9xiWmek0
         iD/WTtG3PrdhPY+D1DgFYKrJPm6ZjOx9YBZog5fKRNtw08w9WafgA4qNnYYf0R93sojy
         96eF2GAxd/r7Y9mmC/+TZvO8JXmN2R4vC4NhI40zlJjz+hxnE2RyPIdK5Fjy7Sin6aMC
         ERgSCRj+PA72497v7yeozmsFuccDEgPWQFsF/0fgM4kbxunjao1ohpthYXYcC42JbH1R
         FkMBJw/bJ8D/fdg2VP47cdj0+7ag3meBbn0+HDvOWNjSg8pUoDudGAkwv2OYnifkeScS
         N/gQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=oBR7OH6trNjckGpurMyuofHdop9U3238bGMs/8jOuiM=;
        b=QD/D3vMdPaQlQsFHwHtgJvC6QcF1yQRhHwAzZFmD10FbR+0xWQhOeZpeQI0eHtmJIc
         75+m2Vle//wesYbh6KQ1kz5aAlK8ME110ZeM7OXKDr14DfdNNSv/OzQZ19GXrQi6a6sZ
         1bIzw9/zBDf/B8G8Ta8NCrnOXqMT6aZly5Tmi+CQ5SvRnEmlAKODA12MZoaiTIjjPHxq
         Hkoq1a8UA8rPjgdpWhvBKPNv3sHtj1JUB84vOpGKnDU30jIAbq9w0/O7EXER7FvfW3Vb
         RoFfZHyY/7ghHAuTiPjs+fIV6UDv2TkTR6nreFJNTkp1obp2CEz8QtvFbo1xKBI2dmsm
         dwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=oBR7OH6trNjckGpurMyuofHdop9U3238bGMs/8jOuiM=;
        b=gFIWAO+g3og8n26swPkhfWM1phRUr/ts0EXI9I7Wp18tgNNdXgaP/Knq3YPWa7X5Nj
         VJ5lgIiwHkcNcHNxrXYd9/3eGJiicn2TcLOnrzJwJmtpEcsxcmii6A2W/1h5OtC7XoT4
         7GWButspk65Zkb0lXrMmK34srYaiKBdt9SPmclHQqwPwytphVd+BLyXoA0AjjhO+3nom
         Nvy+aisYZrFCP3GPlMDB9b3PEGbiwUIAIp2ntm0M1qkHG8ag/DJyxTppyLWy4pYVPpU6
         QwOI7V4TysTOyzcANcRHKI15yQQlmBtwyJPk/SA8CWfmaYISBRsN1cxcn7TY9ZmDhnz8
         TG8g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXAvJ9GgnheIzu64ujqNlGOng0NjrDN6VawkDXEig7bLvjax9JR
	isclEh1VRKvG5ADFQw6ldx0=
X-Google-Smtp-Source: APXvYqzIq6dINU8TAgyZTbgVTozCDB/ljL+LUtO4am3RnDnmADPjvWGBHBYRm9FSR++x6/PTYT6ZDQ==
X-Received: by 2002:a2e:74f:: with SMTP id i15mr14503611ljd.156.1557180114969;
        Mon, 06 May 2019 15:01:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:801a:: with SMTP id j26ls530878ljg.10.gmail; Mon, 06 May
 2019 15:01:54 -0700 (PDT)
X-Received: by 2002:a2e:9094:: with SMTP id l20mr15067825ljg.60.1557180114130;
        Mon, 06 May 2019 15:01:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557180114; cv=none;
        d=google.com; s=arc-20160816;
        b=O8vogxbqH+SEvbAOLbLR07+1XWGmsjVAUrHOVjKHmfFbi83nnUPhyT83mBYqUwLe5k
         UvCuPRHGQMl8EprxSLwrgDgV+N/DARSEm53nloZhbOaSUrPv+SYTetG3OwWNIs8veupt
         mJ8jseXPW5DkxO5J6JIbbGdjXWFZ/qV/Y6+YY8KDTCSmzBfBpueol4YD6uVpU1WQ/Fis
         jxs0rJ03JeRGGFudffUG4hufnMwiJ+GOQp+BHJBKcpRo0D6qU7Q+LqFy7f8jbIY9e/d5
         UUL4yUP4Wfjn/CsJMyAYbXVBNPL7cTSSMph9FY8u8a7kAWQM0GPRO7Ikcj7pd7BkywLh
         Sp6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=FeDCQloZlLc1ndUaBTghvWE0a/glqKYIX05GvUT2fiQ=;
        b=u7KdPmzAVWkNt5gWVBQ+vYWWHzcuiS7DYEgExJzA+SyW8sFHZT41LcxHvzlehMXHN1
         WvhgOGKGEAqHgFgz4YezYQvjkpa7ZQFv+0rHymWAgkrHAhpALe4ygYUk7RcxIwKLGvRX
         GeReUwYcHHh0siNDVOmW56v3dl2wqHLbYDqHNvQj2s0cQ19eBNcSFC5HptZGYqICG3m5
         Clr4LBB7brJkJej98DmMRK9X5Y6IJlB4jDUf1Ns5Q9uv669EZZTmKwP96kPxu1KT9Qs2
         oIRCBQsPW8NWnmBSNH7+epADJhr10nKBtmyaMmV+SOZxjjhmpCZQD6QcL2S+z37uYbTq
         4UDQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id x8si48827lfc.3.2019.05.06.15.01.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 15:01:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 44ycCN0Vv4zyB7;
	Tue,  7 May 2019 00:01:52 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH] x86: test-device: rename comm_base to mmio_base
Date: Tue,  7 May 2019 00:01:51 +0200
Message-Id: <20190506220151.19087-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.5.6.215117, AntiVirus-Engine: 5.60.0, AntiVirus-Data: 2019.5.4.5600002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1100_1199 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

the name comm_base is misleading: the adress is in fact one page inside
comm_base. Guests call this page mmio_base, so let's call it mmio_base
as well.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/x86/test-device.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hypervisor/arch/x86/test-device.c b/hypervisor/arch/x86/test-device.c
index 1ce8eda1..cf81e92c 100644
--- a/hypervisor/arch/x86/test-device.c
+++ b/hypervisor/arch/x86/test-device.c
@@ -76,14 +76,14 @@ static unsigned long testdev_get_mmio_base(struct cell *cell)
 
 static int testdev_cell_init(struct cell *cell)
 {
-	unsigned long comm_base;
+	unsigned long mmio_base;
 
 	if (cell->config->flags & JAILHOUSE_CELL_TEST_DEVICE) {
-		comm_base = testdev_get_mmio_base(cell);
-		if (comm_base == INVALID_PHYS_ADDR)
+		mmio_base = testdev_get_mmio_base(cell);
+		if (mmio_base == INVALID_PHYS_ADDR)
 			return trace_error(-EINVAL);
 
-		mmio_region_register(cell, comm_base, PAGE_SIZE,
+		mmio_region_register(cell, mmio_base, PAGE_SIZE,
 				     testdev_handle_mmio_access, NULL);
 	}
 	return 0;
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
