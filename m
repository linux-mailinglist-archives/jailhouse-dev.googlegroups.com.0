Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBWF5T6RQMGQE43GKZHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C86670A0DE
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:57 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id 38308e7fff4ca-2ac8165cad0sf20160431fa.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528856; cv=pass;
        d=google.com; s=arc-20160816;
        b=iT/Qs6hhro+TcPlxkvoUlp7QEREnete7tZITTh2kVnJ+u3AOusVdWQuYhTdCpWEQjw
         cMzfdNYHUMZD9yMfb+fDnT/p5hcxrUXZCIENRdXPWzYkO4j3n6weM/EAP5VoG+hjnLQZ
         efGPzkzOQNuVudn8vX9q5B6G8Nhq9fjhR5xbFixTwRP1+ZFfBwINjX7C4M7MimNiaVsU
         f+ODK+N6Y8p0fJd8WbfYpwvHrO9UtetksB6BjdWUsU45j1mrD2iISyUdP1HAmqzrEqZN
         5gAgCuwCSCKOE2WIJxnNuEj1sjjCId3cG9uyE3kd1eS9bDRVWeY2mf3dEkytNFwhc0Bv
         6wWA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=T41nNGscg5sGadHPVnTVRbQCJcA53y4Z4/MJlKgWkBA=;
        b=LDe8tpduX0TTcOgSaruAfdBSY4f4+MignW/Ag5XpWDPX6ak2sfkQz07XrJCt5VaaZY
         BAzCan+DrOz0htv9LGg86tRaP9ci6zj59GdIZaFo3qwTQ0NtRfHO+cKZjj/BjPNOTTFD
         4/ptOIDQsCl4qnLlLUGi2x1qLeZnLMVQ8Y7omDFAFyBN43nW15SEwT9amMRJ8kHaJrOG
         oiM/6cnzu7YyA4zqk9eClaQFBf19NVCNzRo92CkBoJmpwrW2SThPVZ0VFv0jP2qdA4qM
         QygUHeyACgp6EH5ZWrX7ydauN7nqD7j6MOfDeOwXlTuPkERCmwEa3p2rkOtnpGOtgexm
         +oBw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528856; x=1687120856;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T41nNGscg5sGadHPVnTVRbQCJcA53y4Z4/MJlKgWkBA=;
        b=If0WcKiaLFd7Fqr2WuIumO+lKr6dqc5EB5/wzx0Cw+XY+DnzW2nrWC0kOrKIbboS6S
         GPMQEsUAZlEMrC0omIr2oB76YD1+q3tamiQ2aXkzL1zktvs8sgzeQLOmPNg03IRDfbDq
         LjDL48DcoEU4V/mz95Q8W5Nojl85M9ehTtsxmwTg7LUlV58sSWU62T2hlCbPF8bnZiHu
         nbneK6qgcwpfjsu7i5mr40qwQSfv58/B0L42clTf3RfaBfHX9A4gmx318MC5y+s7yScv
         m2n6m6CC+wf3CPP4de0sqRc0dfk2Q9+15WavxJZByMy2UMQ9+QS0I+OTH7sMN/Tofa/w
         dgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528856; x=1687120856;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T41nNGscg5sGadHPVnTVRbQCJcA53y4Z4/MJlKgWkBA=;
        b=IBf2kbJfjU7tbMZ/lUtr1jtgPCOIeSwIzpMtIwJ75XAMig2Rnbx6Gm7jj9aG9XeCnz
         gdS6hPgSpwUxDf8BK5tUgGGVJJ6EbwKVuFLugbngXgGwpqq5yaRlS1rM2pY0T09eZyRY
         TQ9wpEy/vjL8ZN7KD4gu8+pKgd/zkaRhgGQ9EfEyBVGi2ak3617ngeIGwgdkHBYhXdvY
         HAqmba2RH9VOzQtfmBSHopMTQ1qPM24CljiO49dBNOxz1AXuBdl3LVF1yTiGlO7wQ1tq
         3/WGgbFTRj/cP/BirOYjQ1JZr5G07oEAcYdFDq7E7rXw9ctr+6KfvB7G11t5ZwRF3wfC
         +m5A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDyt0Ty6VdTA30VvuiBnFQm8HBC4JSwGSdhcWt75+x7I1/DnzTIj
	B6o5dPwpVvpbVzSNZxxDa/o=
X-Google-Smtp-Source: ACHHUZ5/Cx3vfovOk5dUuhL4SqWLgER+GMVhrHeOWInI6HzxXa2NVjQG+GrN8+HQDLbw5w/2bPi3ug==
X-Received: by 2002:a2e:7a07:0:b0:2a7:6bb4:a701 with SMTP id v7-20020a2e7a07000000b002a76bb4a701mr761821ljc.5.1684528856601;
        Fri, 19 May 2023 13:40:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:be22:0:b0:2af:27a2:bd47 with SMTP id z34-20020a2ebe22000000b002af27a2bd47ls326195ljq.1.-pod-prod-03-eu;
 Fri, 19 May 2023 13:40:54 -0700 (PDT)
X-Received: by 2002:a2e:98d4:0:b0:298:b335:de49 with SMTP id s20-20020a2e98d4000000b00298b335de49mr1078284ljj.25.1684528854650;
        Fri, 19 May 2023 13:40:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528854; cv=none;
        d=google.com; s=arc-20160816;
        b=Atyy+VJJb7qOriSzDtZ2WqMGQ7752cRX8+eHNFB+SmT+HSJfvsD59Q7LopoCZ+lamv
         OuVNxhgk15NK7+Fw1jC3PF9+FIk+dxYtRIZg/pfDynACktGi94FF6vLz1YUBJwqZmil+
         1FfCv5VkOKMcg3jEHQoitfzfFvR+ioMM2IDVHZo+EUoHakV0iHCSIhYLwhW8mzkdeFt/
         ru1Ffav2oXBLM/dCTa1evjsZVkHeBsmooByj1UFfSAH2npWfPlH/UBGYxgdrf6keLgHr
         WkF25P7M2ODyyJ22yC1KTicg10G94dwtuew8pC/ru/OQOveSOc/1O23P7vExAI3ypOvN
         KlsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=yrHxxjLm353VG06awjdBzTBQiD5sYopsL8AuLZwI8lE=;
        b=HkVDTePmTt3ju9ptX0FH5+GthZe7oYdFZ6gWmM1Mwic+qaq802xaU8jrlYluu3exiC
         1UCy0Um+8isf+DUUE94qfEXQ7xozc6oJm11Vy4cEnUyNcRmff3x4tw4KxoV0jiZV+7ND
         /lfRVfoAjH4WZ79JjJKcTQqD1+wYUtTEvAXRv4/m3xH6xMPLyhXMwrgUQw7yFCJ8lXZu
         AQJ3dkOI27t+CQ1hygB8fHPAv5FL9ky7TrJA0YTFBhj/kjwRSDHL0eFU3RG4sCHTYPha
         QVdhCQYSF1Uaff8MTjT9u47vsL2F1p/ms454ARjsHyEiPcV18u+swbS900crprxE77Es
         AaPw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id f12-20020a0565123b0c00b004f3b0cf753bsi13883lfv.0.2023.05.19.13.40.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdd5Z05zxpn;
	Fri, 19 May 2023 22:40:53 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 43/73] Documentation: Add some documentation
Date: Fri, 19 May 2023 22:40:03 +0200
Message-Id: <20230519204033.643200-44-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_4000_4999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_FUR_HEADER 0, REFERENCES 0, SENDER_NO_AUTH 0, SINGLE_URI_IN_BODY 0, SUSP_DH_NEG 0, URI_WITH_PATH_ONLY 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_URI_IN_BODY 0, __CTE 0, __FRAUD_URGENCY 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __HTTPS_URI 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __PHISH_SPEAR_SUBJ_SUBJECT 0, __REFERENCES 0, __SANE_MSGID 0, __SINGLE_URI_TEXT 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_HAS_HYPHEN_USC 0,
 __URI_IN_BODY 0, __URI_MAILTO 0, __URI_NOT_IMG 0, __URI_NO_WWW 0, __URI_NS , __URI_WITH_PATH 0'
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
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-44-ralf.ramsauer%40oth-regensburg.de.
