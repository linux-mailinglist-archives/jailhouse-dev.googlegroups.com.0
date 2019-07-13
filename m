Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBIF5VDUQKGQEXID5EFA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F46D67BA0
	for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2019 20:10:41 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id n26sf1000644lfl.5
        for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2019 11:10:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563041441; cv=pass;
        d=google.com; s=arc-20160816;
        b=cbc+ybw36o6ewtD+wnklsiZYJoXhG/4CxEdjwpk0TBDYjMmkCdS7f/Y7cLqQSfTcfh
         11iV7wwFEXaVz1RVnq63ekA5C+iUuK+N3ZMJX3GV7te2hQvldGTzp2d7MR0Fm2Vfwkv7
         BGsu7ZSj6gTYBfW+mAHpDj+bGi7xRo6qqk2Y5xH5nwyUdJvwx142WxezVDgkLvVyqWVO
         XISCQhcJCLFd8AdHBx67hEf6qsgLVWwOwXpXw0NO+NR4KJBLaZqylK1+5AvqpJ/D6xAi
         MZMk4dqLJ75syULMSAtVH9jyl4mc7JTUPMPI455+sqkCe1nwrOB74DfMFpRb9KbUDIvg
         f2Lg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=KCGLbisSMdB5cLhquC2ZE7WOOCQj4RRPLs2gns0mUXM=;
        b=O4z6g8qBLCJz/szWN2yxDDk1iiKQr4Nm1Kt4yG0enS6HRy81u/14PuGx1ILGmAoBFu
         NxCLqEgUKCa4t7yL3iSafwO2tuDeMYjsgtiNJCg7iFhxKSVtef0Uowhrsa5Sdyppe5Jw
         0cnUy6PBTm9VhydTg3wjfNMr36N1W3zesS4fm3CmiitWVO4SiEUaWI5CZXhOwaKco+MM
         bF2hUEoZVN3wF0KT74Ign81lKXfIgh/sapWIeZcKL3AQQRHzOPhpEleHeRB+wZ8TzQXX
         gvsc+pBcX8i6ayxKjYx4c1raPfZdTardGiEeeqJSvfDzGsu3T8xWcreP34h5h0QsY8G3
         pB+A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KCGLbisSMdB5cLhquC2ZE7WOOCQj4RRPLs2gns0mUXM=;
        b=ceTq2+8FTU4RZDZ6Senuv1bGOFGMywS5zcBWvN8imlYKxWepx/kuMcC/PhYclDaxBm
         MytFji1PzPw8cKNtcqWyim7IyyLchmKDPmTnZs5VBI/ZS8pkkG5G/QAT6KH79vvlU5ht
         q25nuq4aKQK11OOumPCfK89oPZ2eW0gxcy+3ZKwkJLPvHub680qQ5BOGWGbT9i0OaP5a
         pQRJMj565nKEnTKHW1n86cKMPAkxKfadAYwPsynWBOp40Eg5GshTxWoYGvFGYWnSaIP/
         BiZVL9GGhBItUiiFSeW/GNqbXze88sbSF+okOEK7FfpOWZWIcvqwtuy+oK1N1N9E3HI+
         xv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KCGLbisSMdB5cLhquC2ZE7WOOCQj4RRPLs2gns0mUXM=;
        b=k5LGk607onrhEppPxdQuKq8aQtXvnsxQZNjJ2nA783sfB+Wov6fb9Ml4n+R3iX0mwr
         nDj+wsVd38Wl32RoDS2t0tnR7Xddqw+GiZFACDUXTLO8KMArRGBE1VYYdBU7t92SDE2w
         7KQNUenml+U2bY91S07V6w+7PUUwEpB36BAcs4DXJeKQbkHoWf+U3tGr/zBldnAZn1xm
         nWAWXsVpvA8cUzTr7A0JM7qbyY4RTy+8mBmVtiYH/KxqkAzxa6W69e1G4BK6uQJJBG6G
         FmNZK84rhBbab+5+m1Ou5XngcEsimpmr08sN5KSbO3wKxwvMJKbB7OwEso3G+Xk0F0VZ
         VPPw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXuQvK2P53+vIKtOsj0GtnoCq77d6IBMhE8NvwR/+QlN9A3c9P3
	O2cs9m7zVFDCHy7fLHr9fRw=
X-Google-Smtp-Source: APXvYqx9NoKxwh5xKBlklQzTXHLf14LdnqawFBy+3sDG3Jta3+mHIwxaT2HC49r+pMF7hvPPZbpTRQ==
X-Received: by 2002:a2e:9e81:: with SMTP id f1mr9350801ljk.29.1563041441131;
        Sat, 13 Jul 2019 11:10:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b601:: with SMTP id r1ls1493108ljn.3.gmail; Sat, 13 Jul
 2019 11:10:40 -0700 (PDT)
X-Received: by 2002:a2e:5b5b:: with SMTP id p88mr8927495ljb.192.1563041440383;
        Sat, 13 Jul 2019 11:10:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563041440; cv=none;
        d=google.com; s=arc-20160816;
        b=iG3H8qc25+96ZBG1X1frckb5tW7gnG8QfMCESAes4vxJmOSx/0x3YSyyZ3e4IluUzG
         OVGBx8l4qr2hQJ6jcvNVYCX5yfNHeFW5ttqBS88IvKWbtVA8RU2oj9cQvNDK0qWPRhRM
         /5az9FVRWVmgKnGPLL0958Ck2ESA83FNt6m6FUFtzJRzfgWP215Nc6zxcn4wbJCFA1cm
         s8nDiEaACIzpbPA3aNwfxIEgfmL993u3P3Omv64CMEIetAhD+PM97d4uB+HDFDlaF4qC
         jTfEZoM17dqZLNI3DikIatEE69x5UdlGye41cRqfKmKgKLcMXJpXI3cA2mBz2GiXnZhB
         i+cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=NbqZKkg6gmjJ/g/yLjS09BtHrpsfHBk1BHLsmfhmArM=;
        b=la5rII9LqnfcTnbIUbH4lmCGat3cdDcijhNWYRBRB1+buuDs21dT0BQpcPBj6aw4TM
         INfNMwjbYYaJ4cbgvLrU0dK4Mw8OMi/WmBt/RfdXzZcWHyQzZPy4RQZ4UzLkf20LogM4
         lcEOSC5K7RTIM9mbG3KU5Cq6+auuRFFCgfWB6YNt3J9KdvWYNqibsoZWKjHuvOQokRZ0
         tyaGq6c+z6oMZKHNlZeA0s9TD1TvqyTsHne9A/Iyo8yL4kgb3LddeIYwcCJdyVpa6BSp
         qqEd3by3ds9+6xF19BGIDSYQmfdxLFejObpkIFVt/vlPIOCDc0/zv55weYWdvNY24zlM
         GPLQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id z18si656294lfh.1.2019.07.13.11.10.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Jul 2019 11:10:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45mHsC2RtHzy4D;
	Sat, 13 Jul 2019 20:10:39 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 02/11] x86: use definitions instead of constants
Date: Sat, 13 Jul 2019 20:10:28 +0200
Message-Id: <20190713181037.4358-3-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190713181037.4358-1-ralf.ramsauer@oth-regensburg.de>
References: <20190713181037.4358-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.7.13.180316, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.7.13.5630002
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

Those definitions are used during allocating, so let's use them during
deallocation as well.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/x86/svm.c | 4 ++--
 hypervisor/arch/x86/vmx.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hypervisor/arch/x86/svm.c b/hypervisor/arch/x86/svm.c
index f2db518d..67169e39 100644
--- a/hypervisor/arch/x86/svm.c
+++ b/hypervisor/arch/x86/svm.c
@@ -354,7 +354,7 @@ int vcpu_vendor_cell_init(struct cell *cell)
 	return 0;
 
 err_free_iopm:
-	page_free(&mem_pool, cell->arch.svm.iopm, 3);
+	page_free(&mem_pool, cell->arch.svm.iopm, IOPM_PAGES);
 
 	return err;
 }
@@ -396,7 +396,7 @@ void vcpu_vendor_cell_exit(struct cell *cell)
 {
 	paging_destroy(&cell->arch.svm.npt_iommu_structs, XAPIC_BASE,
 		       PAGE_SIZE, PAGING_NON_COHERENT);
-	page_free(&mem_pool, cell->arch.svm.iopm, 3);
+	page_free(&mem_pool, cell->arch.svm.iopm, IOPM_PAGES);
 }
 
 int vcpu_init(struct per_cpu *cpu_data)
diff --git a/hypervisor/arch/x86/vmx.c b/hypervisor/arch/x86/vmx.c
index 0d590bbc..5b3c5b8f 100644
--- a/hypervisor/arch/x86/vmx.c
+++ b/hypervisor/arch/x86/vmx.c
@@ -359,7 +359,7 @@ int vcpu_vendor_cell_init(struct cell *cell)
 	return 0;
 
 err_free_io_bitmap:
-	page_free(&mem_pool, cell->arch.vmx.io_bitmap, 2);
+	page_free(&mem_pool, cell->arch.vmx.io_bitmap, PIO_BITMAP_PAGES);
 
 	return err;
 }
@@ -394,7 +394,7 @@ void vcpu_vendor_cell_exit(struct cell *cell)
 {
 	paging_destroy(&cell->arch.vmx.ept_structs, XAPIC_BASE, PAGE_SIZE,
 		       PAGING_NON_COHERENT);
-	page_free(&mem_pool, cell->arch.vmx.io_bitmap, 2);
+	page_free(&mem_pool, cell->arch.vmx.io_bitmap, PIO_BITMAP_PAGES);
 }
 
 void vcpu_tlb_flush(void)
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190713181037.4358-3-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
