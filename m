Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBX7XTLTAKGQEDYI2QVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id E1735DE79
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Apr 2019 10:54:55 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id g15sf2015190ljk.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Apr 2019 01:54:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556528095; cv=pass;
        d=google.com; s=arc-20160816;
        b=sMqmEO4gcHfdBjBWFhgcVnc+4dkawifZi9kk3V9Ci1Fll1RYFpOetlUAdKmXlBoIm9
         pnbytlO44wCsXUpvOHKjfT+2DW6mapJUgrwM0etySy6ci9G060kMPNqsFue0pY3vHoZm
         kJ/Wc+UJ1cTRNIoZL/Dn71BUlwKPihq+YkyxO+twwSyNjtgDV/mH+u/PTcFelvXj5MbA
         XYD65OIH6UsQarToZFAayvankxc+sPGKxk7yNzjS3soA7ed4XIkNvDVow//Qu1DoDq1q
         ETGmHJ9F2Gjqriaby9kZ/zaRDJ6i8Zsh53Apn2acS4gFEQeqbRlR8UOctU5A9Ucftif6
         s7kw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=32gF+o46NLH7haXs+y+Hff6CNfOu5DPcVrel1TxlKr8=;
        b=v+BIw2XJ1/TBMKiu2DQm+b7sO9tlrAXRu6TB1+IRcIaKoXWYvZmtWf7Ylawwe1t+9X
         Sf93pGMgdPwxNkL713bLOjMX6z1T+Cqmn9/Fj3sl2XtVy5Bcg+hlccuZtrTPnef3CfHf
         nS3Iq4Pf7WA+o+6H4aK6RrjfTVefFriH5oau5PQs83SnMCb1dtH0G+yRGnS+dqeygwUT
         zn1Nn9lpUsPdiQ6QXsAAUB3DQRvfT2ymBUua1uMnbWFeLLYgMVHazy4wdBTNiPsrBoBr
         2O3MxE1AtaNRa2MqrARjkCIgQvGOlZjzBmPn7os2OOXRY78Gl5Q2oxJyevX8gjoulsAx
         L6Pw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=32gF+o46NLH7haXs+y+Hff6CNfOu5DPcVrel1TxlKr8=;
        b=nplZVBfjmytUH9MwvSl/xztjmvSptUtkMZlVjWHv8FiYNpNlBPgzSAmbcQrhYHLKvR
         zYkFMRN723WCJ7GvW/6H9kP5qEwKjLZtooh8pHqI1o72uGnvpdYuSF+ZHufZBhxJKVTf
         wL31w+QUmpbxF/H77izTpZzzY8eUipkJy4TCkiTWLl3p00sTptBeEIkuAJ3MyMClvvOp
         Vw1/9gF9qO3UpYAHwDiAL9WhncveSIUVjJPHUGuhUdXNRaJcpcd2N+IPL/oiscNuDdp/
         NyPCrKeBVXKiq6jIZbPCttqkTB+eRFY66+m6fIJzB1FSMgYsARSslC2nwhvypxzIGeOd
         JxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=32gF+o46NLH7haXs+y+Hff6CNfOu5DPcVrel1TxlKr8=;
        b=Vb8GZJNyiZK9FGopJdetobVCR+sx49M730drvISsXsVLeq7kV+vLgd3rDlza0Eziwo
         hkmtketLNzjg2FvzEYo9Vj3vT2TLh6mp3mMeio1GMXBGp4WfaRu/mS1UePFdHTDSySL3
         wrzwfq9JNHvVnqbwC4CPFn2u6l8+AfPP4CAu4LeQ/2lYGSZWRygCrrSEsVgxWCXRejKo
         JluBUSpthB0Va3lvwvC1JOijD+K1cXXnhzFqdYO+np2Q1CNcfrJ3CqLG9VI/niBy/3Fp
         Gzr3yiu/R0S1m6NmZlfgNDHRFdrL6g7JNoj4h52kyIWX4w/wVXCYlym1oi6NV39nNh/N
         k8SQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWqGL2F1EvkLCiQVyn6w/KghmmxlKBlnHMm2HM1YEJSsHsygLkW
	EK4YZcPwa+pU9mb3W2tqSKQ=
X-Google-Smtp-Source: APXvYqxyVMh3zbgxZEv8fbW5W4gKFCTX5dCjFRnsW0k1TK+chM/slKsy0BENzVJu4+5pI8cpeRBSFA==
X-Received: by 2002:a19:c38d:: with SMTP id t135mr31415125lff.164.1556528095519;
        Mon, 29 Apr 2019 01:54:55 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:44cc:: with SMTP id d12ls99299lfm.4.gmail; Mon, 29 Apr
 2019 01:54:53 -0700 (PDT)
X-Received: by 2002:ac2:547a:: with SMTP id e26mr11039752lfn.148.1556528093774;
        Mon, 29 Apr 2019 01:54:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556528093; cv=none;
        d=google.com; s=arc-20160816;
        b=Gx0bzrpl9eRcNbrZtFqaTo/WOr01YKP+0oHBCO4SL0932VRzB0lq32jSimJIR/xPFC
         kuzkgwtkN2wQefyTh7IKXKFVakGZazdeBg9vV2OplAepHLoT2BHP2UuoGskWBill9iUw
         eHJ9UCj4bssLv3nWwyf3ioZROMF0xOodMAsUCSni/5WlKaJbZ7cLd3r1L+XH7zscinsE
         zdwsejwWT42YAORNKYk2ra1uSAWBRCC2NuRN93wfaU2S8kfJVWHl+hWnXlbPZtJUSlma
         Cmkow8mTH21MO6zoD8XIqyQZ+ErVLxaBIFDVZ5ptWsNoN7nIZihVIIwHVS1AU9vod3jk
         e/GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=3nHx7gIwNyxNgVl1drixCwpEz7iRC1r1XVWkhnNremc=;
        b=olpmklO80q70KiVubqt6hINsGa52KwcWMO4UyWZK2LV3Dci3FXlEiudrIU69+EOYm5
         NN+cz3bgBpJ5HFXJKQEg3j0b3BnHD1rOEm2nQ/SuTo1NW9JAe7mi72LQ8B6JVwGhF58+
         iPH8QeBeKeqSn/iDlXsx0nfwrnqYtgTwsyutyR7FyH4L2Er46n0SxnA1mDC92tPXCg1I
         +LvYtrpBKwlhMaGa6FP+cfQaDB3DCz9qcvKulEBq98/sGWuOpL/Pl6NstzzhN71GqfcS
         cBM0Xz6jYBMzd9ucFJghPn5yy8kTO0etKdT7WJgPD976gUO5R3g9vDc89959hJGWTRKi
         busg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id j7si171377ljc.0.2019.04.29.01.54.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 01:54:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x3T8sqmE013488
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 29 Apr 2019 10:54:52 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.43.249])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x3T8spo8013612
	for <jailhouse-dev@googlegroups.com>; Mon, 29 Apr 2019 10:54:52 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 4/6] pci: Move MSI vector injection to the end of suppression
Date: Mon, 29 Apr 2019 10:54:48 +0200
Message-Id: <97c68dff145689d0a14b61e8ae4132bd0696917c.1556528090.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1556528090.git.jan.kiszka@siemens.com>
References: <cover.1556528090.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1556528090.git.jan.kiszka@siemens.com>
References: <cover.1556528090.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
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

From: Jan Kiszka <jan.kiszka@siemens.com>

This fixes a long-pending issue that actually prevented the injection
when interrupt remapping was in use in the root cell on x86: We are
unable to translate the remapping entry into a physical message before
the 2nd level page table for the root is fully populated. This happens
in init_late, thus after the suppression request. The result is that we
only read invalid messages from the redirection table and did nothing.

By moving the injection to the config-commit phase, we have that full
access to the guest memory and can build the correct message.

Fixes: b50614282cff ("core: Virtualize legacy MSI for interrupt remapping support")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/pci.c          | 2 +-
 hypervisor/include/jailhouse/pci.h | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/hypervisor/arch/x86/pci.c b/hypervisor/arch/x86/pci.c
index c557aabc..492e9859 100644
--- a/hypervisor/arch/x86/pci.c
+++ b/hypervisor/arch/x86/pci.c
@@ -307,7 +307,7 @@ void arch_pci_suppress_msi(struct pci_device *device,
 			pci_write_config(info->bdf, cap->start + 8, 0, 4);
 		pci_write_config(info->bdf, cap->start + 4,
 				 (u32)msi.raw.address, 4);
-
+	} else {
 		/*
 		 * Inject MSI vectors to avoid losing events while suppressed.
 		 * Linux can handle rare spurious interrupts.
diff --git a/hypervisor/include/jailhouse/pci.h b/hypervisor/include/jailhouse/pci.h
index 0429d520..4e744edb 100644
--- a/hypervisor/include/jailhouse/pci.h
+++ b/hypervisor/include/jailhouse/pci.h
@@ -214,6 +214,9 @@ void arch_pci_remove_physical_device(struct pci_device *device);
  * @param device	Device to be silenced.
  * @param cap		MSI capability of the device.
  * @param suppressed	True to disable delivery, false to allow it again.
+ *
+ * @note As events may be lost while a MSI vector is suppressed, re-enabling it
+ * may require injecting one event unconditionally.
  */
 void arch_pci_suppress_msi(struct pci_device *device,
 			   const struct jailhouse_pci_capability *cap,
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
