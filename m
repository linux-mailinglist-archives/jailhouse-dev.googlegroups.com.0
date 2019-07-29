Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBNMH7PUQKGQEH3RXE3I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 052617890B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jul 2019 12:00:22 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id e14sf13244587ljj.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jul 2019 03:00:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564394421; cv=pass;
        d=google.com; s=arc-20160816;
        b=p6nP+uiXKl+M+aGNkDABfLihX2A4M4nDckON5IHwuwXf8ull2wz4zu4Pej2QUBIZLO
         AHBfd1H0ZaFadQxUXiA8PagITb6DRizJFkJTjF6LCqrU0wpUXRu0U6qd94NBXu8RZawt
         qgiyTTprG7Wt0e7NwPDe7VSNutRzUVi3gU9tvwKdCMDcxqS9UNYyGhqphKxBssIGj+MB
         6wi1/2TqwWRV/LQoZZNlt4K73Isxtw782EphdraqXHMoJR3enc0Zc9RS4svBL9J+642c
         k27VOBm1qiWV1kw/gDu4W3pZr1/vrqiX32Dngmm7/WeTQN8qZdXeeQIT9+AIDE8M/RR0
         eTJg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=picAcFRZ25L4dKpTnn0DA+3RImo4uWtJzB/et0V9Ayc=;
        b=ZObP2fnTbOkRyydjOrfLXHaM9TRbFN8+kIcAlu18BSs8UJglUgsMLQIkIBaQWwYQ7a
         LvsTJ6XquiV3J0sK7VRkLRRelq+hDw82rEsSBP9RCITzKB5advqmUF3KX/hPTbGQI/WS
         e6iodPsRH277deaTmMzUJErCGT7YHyBzAJFnnhF8BeR03U5oOc2ygEYVPFEQamlvEOIr
         2CArU45MDoGchuLupn73Jax0RnALtSwP2swgxf4TqBl5MixYvaoErtmR3zwkpSZ0mxol
         S502uBSXwHwqln7j+esR6q+9Gfj3T3MCxFnEGfpLX/Ja2HUduto7PLRauyGxBlM9sP/d
         hFeQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=picAcFRZ25L4dKpTnn0DA+3RImo4uWtJzB/et0V9Ayc=;
        b=UXmBB1Bi+DsTrG+cDnXq3fcNfFII/v6TDVyJBxr+gvhM+J++J9Wso5lMvvH4WFiBxU
         kWg+4IcutZeS99lyNsaiejc1RhL5cSD+r9uL3YUKpVTn47PlzWT9Eueki1I2OEXJafpE
         Zattlv/sATEFPqsSgtXJpDcUhg4mbf1JmrFWu3RB93fCPqS5bNEjU2fUklspCcrCyqn0
         MPsT9SADoLOpuzMAlF3q/yJ6mbe7m+YDdX+R4JhH9UOvv5l6G+SBkURs5UGEZq575mWB
         cCTd3EVn9tdr4/6yR4z5oNRMFxDR0jdRMbTFVv8/RzunZ4tpfqU50P1QvWhA/q4/eqGm
         iMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=picAcFRZ25L4dKpTnn0DA+3RImo4uWtJzB/et0V9Ayc=;
        b=CLWee5gyqyig0rpTNEBFWPTFpxiU0KHxxMwjUayZ2TAeZ/zbz7EwxobgqJmPE8w1iJ
         oT9WNI1z34cjxXFnsKUeKkWGTGcxIxAaapyv7AA/qoPGSFs9KRRmU0aD60WbjQkvsjU/
         1TpUQE18sAWlDeVmaEGvzpoUbZTlsK1qawFokvozqlypuvXKLSAM0cdDdF7B6Ux5lY1q
         iyTR1YfEbR4zPij+nbF9u2qQMUqTngQsGWqQV10a3N/ckQ5QNf+tL7VP4XK0e+JQ72zG
         /ghoqRFQjxT9Lu+7fV2qwcTXQBn0jX4xbrkmOwhpOgu9jFmKur7PT3LxhwB0RrSiWkgI
         0rbA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUnvb1VjrfuCDFsI0G4eo0ETvsJuVtsaH1BotjxC74dVyLS8VdP
	lsTBAyvKAtSs1R2D9FDwUMM=
X-Google-Smtp-Source: APXvYqzXZkAzg9ov+F7Gxe4FfGp05qovjDOMGj1pil6ZA9IumRMUSHIXEr/CamhAxUYtz2Avlm9cvQ==
X-Received: by 2002:ac2:47fa:: with SMTP id b26mr36027845lfp.82.1564394421542;
        Mon, 29 Jul 2019 03:00:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:43ca:: with SMTP id u10ls4929570lfl.3.gmail; Mon, 29 Jul
 2019 03:00:20 -0700 (PDT)
X-Received: by 2002:ac2:563c:: with SMTP id b28mr37978198lff.93.1564394420748;
        Mon, 29 Jul 2019 03:00:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564394420; cv=none;
        d=google.com; s=arc-20160816;
        b=XOhti5jvB8dsLuLEXR6zHeWORM9oHa9MC4cGMoCIAZ9CZTix4tFpyisJ7091XLrdEA
         povU0F1ieq3yHtC2iorLcw3VmzmMiJJ2nN9T9MAh03LwGbirFPmbOQygAnrBNu+R42Rg
         10i8ehnGLita5d3DdVPFMA50pJnMIR58z6k0JgnADBo4QNTyyCAJUSvH8XAtVo8ZgzVv
         UuTBGCzdeR1MA0Tp0AnEaSWgIZSSYnTUU7Pm5OTuFTFZzYyDYLH6ej7RdyORZkfk5IKB
         N/7woLVmAmJxvgKRKAoh6pt/qUP6dgcWyXfJPgkdYhnu+lt3AmkRK+/w0GY0SqBrqN7w
         77TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=IDpCP6ip4tcPJF6TZefecaMGC1oesevdR68+EyYts2Q=;
        b=AyfBY/0K6BVB45lTr5DXqNBsnFQyDyXIAaqBUe2GM8kROExkNlRzYeXOuiu/9ohbzC
         xGQIysvqwQ75gfi/O9IZozc3WzMEBu20XFhwZaKj5pmn6fc6L4R7dyoLLQYwy47kWf/A
         oh6scX79+jmaV2tA4Gk8Bct1Jx9R5Gf3oa16k+oS7aOfX58vTNT6GhP88V2K4S+wMHXs
         Fpv3TBFr+3t17RUK/VLllmuBJ+wsdbgr529nJ3jDfIODdyMNXPOMKrW62ZkK/t8Fqd16
         a821f2AuLRl5L+kmr7UP4hhCMrrFMmw5PRUWhk1UDCEWd9Gd2jMZs1SB5HbeYDh7N0uM
         x/TA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id q11si3000394ljg.2.2019.07.29.03.00.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 03:00:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45xwD370npzyBH;
	Mon, 29 Jul 2019 12:00:19 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 4/4] tools: jailhouse-cell-linux: fill the flags
Date: Mon, 29 Jul 2019 12:00:18 +0200
Message-Id: <20190729100018.19411-5-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729100018.19411-1-ralf.ramsauer@oth-regensburg.de>
References: <20190729100018.19411-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.7.29.95416, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.7.16.5630000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1700_1799 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

We now have some space for additional flags. We use them to tell Linux
which platform UARTs are available. Linux can use these information to
setup only UARTs that are passed through.

Note that the PIO_RANGEs for UARTs have to be one consecutive
PIO_REGION, e.g. PIO_REGION(0x3f8, 8). Split regions, such as
{ PIO_REGION(0x3f8,4), PIO_REGION(0x3fc, 4) } won't be detected.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 tools/jailhouse-cell-linux | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
index fa80e3b4..7b226ca7 100755
--- a/tools/jailhouse-cell-linux
+++ b/tools/jailhouse-cell-linux
@@ -780,16 +780,22 @@ def x86_gen_setup_data(config):
     SETUP_DATA_COMPAT_VERSION = 1
     standard_ioapic = 0
     setup_data_hdr_struct = '8xII'
-    setup_data_struct = ('HH12x8xB%ux4x' % MAX_CPUS)
+    setup_data_struct = ('HH12x8xB%uxI' % MAX_CPUS)
 
     for irqchip in config.irqchips:
         if irqchip.is_standard():
             standard_ioapic = 1
 
+    flags = 0
+    platform_uarts = [0x3f8, 0x2f8, 0x3e8, 0x2e8]
+    for pio_region in config.pio_regions:
+        if pio_region.base in platform_uarts and pio_region.length == 8:
+            flags |= (1 << platform_uarts.index(pio_region.base))
+
     return struct.pack(setup_data_hdr_struct, SETUP_TYPE_JAILHOUSE,
                        struct.calcsize(setup_data_struct)) + \
            struct.pack(setup_data_struct, SETUP_DATA_VERSION,
-                       SETUP_DATA_COMPAT_VERSION, standard_ioapic)
+                       SETUP_DATA_COMPAT_VERSION, standard_ioapic, flags)
 
 
 # pretend to be part of the jailhouse tool
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190729100018.19411-5-ralf.ramsauer%40oth-regensburg.de.
