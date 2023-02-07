Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBZEGRGPQMGQEIAW22EY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id CDED268D687
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:13 +0100 (CET)
Received: by mail-wm1-x33b.google.com with SMTP id o31-20020a05600c511f00b003dc53da325dsf10502078wms.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772773; cv=pass;
        d=google.com; s=arc-20160816;
        b=XyVdg8CRHjWCQIehv72YEF9v0SPCpOKXInXINdNQ8zOuest4+Otn2UV4ykHP25ZqCq
         VNq+s0oFHTzd7sXWrVrM2w3iZ+ETAn7xrh1O0ihDIScMVeDHIPKScXwV6jYIsXZ6qnJR
         D0ha0wCnP4MRc5aTqLa3UaGf89/xxD4nL0uSIcy2er9pMFFGX5T0nCljfta4BzYx6eAK
         8YN94GYhtElkWdYwAdoQGfqsHC0qipNriaMV+K4MH3gzFtLc7ZoRTRYqu54XvqyIVCrF
         z2nU46QYuRZZsa7ollIxauC98aljBNRp2XFs6Q3I/80YFivvdhV2ScaGSudDjyGJtXHK
         X3AQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=Jhk3Z28vCrg3G3XKmor0ouXwnEJwaR1YSSZ8u+Kaz8I=;
        b=ICsbOvjn5N3U3U9nh88W1TvzYcT+zteYxFgxoCU+qXU3kz56kABMiMaB/iriZ/cPvp
         EO0MwavZh49FFKQJGJ60ZMPBgkbwIjWB9H7MquLAOqeaIn3w69wXIeT8QXO+CIrZUfV+
         doMfdfCPFu8sjXO0tx1iIbNYb6POt3C6XYXSV37WnrYg4MNvJFfLmEjYabIKo95tSfox
         oJTXFt83WIGnO9qiR/215Slg9Fv2G7nzNScw8OThPQmNwfWe4xheL7hrFAAep/ppJTc1
         tU/6m/OvBQrKWgk+aSzoT18FvSs1xe+Z/A+Oh8Q7CPddsQS7kWShRUkIaCjQwe5nkQPz
         6nwA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jhk3Z28vCrg3G3XKmor0ouXwnEJwaR1YSSZ8u+Kaz8I=;
        b=sAfWRv3owjLfXXWLT4q+U/0zin/YK9dIGaTX654WFkEb1kSsPh0KxVioe7F/1zG1FA
         OJBgkXeGYcewXSIjnMu7c1JRKLRe8/fBTzRR9NeO7LHL3iHmQ7wF0hiahYQ4dxfxlnhb
         GyKUqcGmSglfr2b4nCNTgJT0d5GoP8JM6c3U3aYY32fAjRAFY31bjk+8m23BfqoHsWdB
         Oz7El97EhPeFyChrPlXOtfTDsttwSob/WehF55rFfN8kAmHGccpPF+jFIAK+W5apscZC
         yMER0kSouDzl3Y68wjNf1+jf82sKMgIsPFTDj/qBvlPfzKyVDvjLHurJ5GER+F7spnFZ
         uy3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jhk3Z28vCrg3G3XKmor0ouXwnEJwaR1YSSZ8u+Kaz8I=;
        b=Ps7Q+XbRPNVS2uGrPCFSbWe0HSTyCknznAUOn6skBxEpzCXJtcxp/m63XPfUmjrmkt
         ZRezz/QfzHFad8p+49yhYnjGxebaXo1H0hxagVSxI66Ue7Y6keZbgaNm5a+DuL6QzGry
         A7/phwiM1hlDz1QSXj1QCqQdad1Hrt7cG5eGBnHRdfZ9WAsfkrKc7Zir+YY76F847QUI
         VkiSOK1y6ZFtQnim/pIDLtwUVcqyeKA+Ulv7X2BEse/l0rg7xbmgWZAiVNE1cebC0wx3
         detO2mKQPgR+toGvI7Myt/O25RuHFtLse0vXxgZLrnvz90apPxUALnwxVUhJjlPu4fLc
         LkxQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKWVGZovQJYg0lss3+9qb7LsIropoxzCdyrkdUXmBuTY+PCmVexk
	I7/lgVv34cjoxIjvSknAGJQ=
X-Google-Smtp-Source: AK7set+xUTw7/fL5XUhdh/eAwuZigXvNFEBWVxph2A3iRfO5roDx7/bph9DF8hcQXg0squ+6ZjYGVg==
X-Received: by 2002:a7b:c2fa:0:b0:3df:f81f:4bdb with SMTP id e26-20020a7bc2fa000000b003dff81f4bdbmr208644wmk.157.1675772773414;
        Tue, 07 Feb 2023 04:26:13 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1c96:b0:3d9:bb72:6814 with SMTP id
 k22-20020a05600c1c9600b003d9bb726814ls8160580wms.3.-pod-control-gmail; Tue,
 07 Feb 2023 04:26:11 -0800 (PST)
X-Received: by 2002:a05:600c:4485:b0:3e0:185:e93a with SMTP id e5-20020a05600c448500b003e00185e93amr2967013wmo.25.1675772771882;
        Tue, 07 Feb 2023 04:26:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772771; cv=none;
        d=google.com; s=arc-20160816;
        b=pu8EKNrlgYh1G0naB1Z1AqPm4H2lrIMIFqKE9vLly6/Petn0NVEDBr1J2VXdAnnmzg
         XOSRta3ul6fgnmCmmKZAeW26AItVpOQn7uM+0zTUVm1MSND5GGlvXhlL0Bx8oD519jA4
         96ptIvrsecT0ymylcTEyb0FBfVxSqQ/x+c3c7ln3YKQlDf667uWBqbvIYzmbeFZtSPS4
         WXxflKeKrNuHKnYOUv93K8lDX41Yfc8h3wgHkNO1TIhYoVOvzNnjGeLz0If3MXQeKL71
         zYWV2z5mcv2RLrXwOmu7wlW3BvXN7Zfnhrt5SUdUrVB7nPNUFGcdcvwkBQt/fy/YAdLH
         YmtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=2RNzWRr3GuljlWNcceNtwGH9vtZtQob4tVsxdoynjP4=;
        b=OoTSDhA/2Db1xaFf8jSc87h7GzgARsL2qrKfLzxfcm3QuY1Qw2WwiAVXR2cViUpGKB
         HhlMTR2MA58g4zuCHxMHXpFP/d2fBUjZQtVRRL0r3bOxF3loIgx8yJbuQLoVu1RpBJgU
         W0BAnlvqN+aHGPiyFx6OatbA3kWF6r4fVaMx+R3+CqkKuvU8cfg46NbbzKuWrhw4UCrp
         Kgk0yeXwAIixWp53yoFdIZ01l1mq0Dw2L4U7Z99jKlZ2rOH9JJ71Syo/3ZNEPPp8/2Np
         +z0Q6OIdi1LIzlgd54sAL88gVTs+ig6bXk4MTe1TGvaxvS4iAfE6XIlk+xZm1Bus2swA
         5vRA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id bg31-20020a05600c3c9f00b003d9c73c820asi71191wmb.3.2023.02.07.04.26.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:11 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RR29h7z1082;
	Tue,  7 Feb 2023 13:26:11 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 24/47] Documentation: Add some documentation
Date: Tue,  7 Feb 2023 13:25:20 +0100
Message-Id: <20230207122543.1128638-25-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_4000_4999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_FUR_HEADER 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SINGLE_URI_IN_BODY 0, SUSP_DH_NEG 0, URI_WITH_PATH_ONLY 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_URI_IN_BODY 0, __CTE 0, __FRAUD_URGENCY 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __HTTPS_URI 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __PHISH_SPEAR_SUBJ_SUBJECT 0, __REFERENCES 0, __SANE_MSGID 0, __SINGLE_URI_TEXT 0, __SUBJ_STARTS_S_BRACKETS 0,
 __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_HAS_HYPHEN_USC 0, __URI_IN_BODY 0, __URI_MAILTO 0, __URI_NOT_IMG 0, __URI_NO_WWW 0, __URI_NS , __URI_WITH_PATH 0'
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

Specifically on RISC-V, and fix some typos.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 Documentation/hypervisor-interfaces.txt | 16 ++++++++++++++--
 Documentation/memory-layout.txt         | 20 ++++++++++++--------
 2 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/Documentation/hypervisor-interfaces.txt b/Documentation/hypervisor-interfaces.txt
index d888dab7..fe493e46 100644
--- a/Documentation/hypervisor-interfaces.txt
+++ b/Documentation/hypervisor-interfaces.txt
@@ -13,8 +13,8 @@ Detection
 ---------
 
 This interface is useful for cell code that should work not only inside a
-Jailhouse cell. The ABI is architecture specific. So far, it is only available
-for x86.
+Jailhouse cell. The ABI is architecture specific and not available for
+all processor architectures.
 
 
 x86 ABI
@@ -53,6 +53,18 @@ Result in EAX:  0
           EDX:  0
 
 
+RISC-V ABI
+- - - - - -
+
+Jailhouse adhers to the Supervisor Binary Interface (SBI) defined in
+https://github.com/riscv/riscv-sbi-doc/blob/master/riscv-sbi.adoc
+That is, it provides the SBI to guests (as well as using the system
+provided SBI).
+
+The sbi_get_impl_id() function returns 'JHOU', 0x4a484f55.
+The get_sbi_impl_version() function returns the version of the Jailhouse SBI.
+
+
 Hypercalls
 ----------
 
diff --git a/Documentation/memory-layout.txt b/Documentation/memory-layout.txt
index 82029f17..7e8281af 100644
--- a/Documentation/memory-layout.txt
+++ b/Documentation/memory-layout.txt
@@ -6,10 +6,10 @@ visible hypervisor memory, globally visible I/O memory remappings and CPU-
 specific remappings of hypervisor memory as well as cell memory pages.
 
 Cells are not mapped as a whole into the hypervisor address space. Only
-explicitely shared pages and pages that are temporarily mapped, e.g. during
-MMIO instruction parsing, are visible by the hypervisor during runtime.
-Furthermore, the visibility is limited to the CPU that create it because they
-are only added to the CPU-specifc mapping.
+explicitly shared pages and pages that are temporarily mapped, e.g. during
+MMIO instruction parsing, are visible to the hypervisor during runtime.
+Furthermore, their visibility is limited to the CPU that creates the mapping
+because they are only added to the CPU-specific mapping.
 
 
 Common memory region
@@ -23,9 +23,9 @@ Prior to enabling the hypervisor and after disabling it, this region is also
 mapped into the address space of Linux that acts as root cell. The virtual
 address of this mapping is identical to the one used by the hypervisor when the
 architecture set JAILHOUSE_BORROW_ROOT_PT (currently x86 and ARM), on other,
-this addressed can differ.
+this address can differ.
 
-The commom memory region contains an array of per-CPU data structures, one for
+The common memory region contains an array of per-CPU data structures, one for
 each configured CPU. Each per-CPU data structure consists of a private part and
 a public part. The public part will remain visible for all CPUs throughout the
 hypervisor operation. The private part, however, is only visible during setup
@@ -112,15 +112,19 @@ Size: PAGE_SIZE * NUM_REMAP_BITMAP_PAGES * PAGE_SIZE * 8
         |                                      |
         +--------------------------------------+ - higher address
 
+The architecture-independent code assumes that the I/O mememory remapping
+region is described by the same top-level PTE as the common memory region
+(JAILHOUSE_BASE).
+
 
 CPU-specific remapping region
 -----------------------------
 
-This region is differently mapped for each CPU. It consistes of a virtual
+This region is mapped differently for each CPU. It consists of a virtual
 address range that is used for temporarily mapping individual pages of the cell
 that runs on the same CPU.
 
-Futhermore, the private per-CPU data which is hidden from the common memory
+Furthermore, the private per-CPU data which is hidden from the common memory
 region is made available at fixed virtual address here. This allows to
 dereference CPU local data quickly and generically. Moreover, it hides cell-
 private data that the hypervisor may collect on VM exit, e.g. register content,
-- 
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-25-ralf.ramsauer%40oth-regensburg.de.
