Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBXF76D6QKGQE65PZAYQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 799D42C16BB
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 21:47:25 +0100 (CET)
Received: by mail-lf1-x13d.google.com with SMTP id m12sf6570483lfa.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 12:47:25 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606164445; cv=pass;
        d=google.com; s=arc-20160816;
        b=iCe420ppamTEsS6figAkS9AEgK1Oc+nertv6/Ssc7+VzC0NKLUN6BTgFCBNxT8ZBBS
         k0D2hIQPwbKodSdBv+vZTpUdt/uxeKCec3X5xS1dQMDqtZMAlB3Vq79yDGr4A7L+d+wY
         OHS8oyluj+Whwi7OJHTCe2PUsFb7QSFmoRfwYbnYQgFerTc3PaadE1y4GsgEk5iSl29r
         cpqIDgQS5ES+/MsvWkJeVOlfHDLYun8/gKas/A+SAE+FLPy42h3pMgAROoojKSnnO0we
         2hQEBdLbiwi/ULihv0Dvco6My2d167aN5jPxDterNcsotOtkM/7/z68vA4MM7dZMgoeR
         bsmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=GMOvAC8WVksOu5QA3kjdOPTV4T4CkpQ9DBzC3TsOnN8=;
        b=V50YCoxmhtiDKjJMbUqVBgL26KfxJCPG3/nBnk/FwMBVHfIEIwnh0Dbrh719SXGTXU
         cgpkiJONHYGlsksbYNClHUxKa/GggUcbcsA7By3xv+eAWr+50K3dfVaS5BjnfJtbmM7i
         jdXv6lGw25quYfmGvMMmcOs9c/Rp+0rEdu8kubZOQqmIrL6CPsSt4X+MicV8VbsRlL+p
         jve3ZYwvr6uwW7OXCEkxrZS+RAKxXY1+Qb8Xzw/+cY0BRpe0DMk4Edp/dNBLNUKauZmb
         Cg2G0eSCAufcQRj96lNWYUerMZGyHTfQDSKru773OGpDkk5KPajee5T0CS0XiEsMTO6f
         B/Pg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=tc3atFIu;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GMOvAC8WVksOu5QA3kjdOPTV4T4CkpQ9DBzC3TsOnN8=;
        b=kJ8TV4JCUs5lmqMPROHHvi4rH6HRkCPwSdMGqFbRDtnGieWkfc1yLoOsuq2nhJfgI8
         h3JletPfDu20+tx2zKDD9lXshYTWCmjHIORqmf+KLudAHJnzGDr9NW3ZoLq4IPoqq//2
         utCghB6v5HgCK2/dzeTAgsLOFyYHifMrWmgT/ztGnNFf2qPp3Jcm41WqFS+RQg9alSNX
         ivc4bzDa0FgQCvC8rjQlSBoT3Y3MHymlf9lVnSY01TTRLHtSxEedE0jhF3Qgq5sXC5QT
         hR/uB3MzQ9llj2C4qoX3rLELyinZy1GMuGQAGQ6OZKQ/yscY9aiFOmrWYhDea/AcyveI
         Ve8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GMOvAC8WVksOu5QA3kjdOPTV4T4CkpQ9DBzC3TsOnN8=;
        b=GJI7mSmfGuj1nBmF8tq9PeTnLdR/PLbFXKnf9pvyluM87OtMy4AxliwD4oL7Nzxrce
         p+GQ7dj1l+TArQthWkjQ87QKz7FZnq3if6ToKrgp7PrTR7kTh5NkNqc3bJo7c11BMb8V
         0VsY6piATG8S82CpmLxJ1UpHahXTshELe7LMFpPZ+ntXCD/o1ENU/5xopPywdzSBdBbX
         3uNVLD2bAuKbBRlU1QHPR3FQvwmmgchS7zQSw6iMC729erE3eUPS+CmOfyH42mVrZkCx
         0WMjseSE9lA4b+ASiDJYau9f+kHKhJD/K6X8fNpsbdc0mMYtrwB8/jNUejqWBwXID5O3
         17zA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531XcTs4QvDfU2KGb6uAxbn8oKTsHP11RALi1gCDM/iqJdJV2Wky
	f+SfWARZCMiEmmLUr14ywcE=
X-Google-Smtp-Source: ABdhPJyG03zE1M8UmQHBbpZiW4idcbP45aSRrgYUQph2LSA17XufDFe7Mv0HDYsYXnKq22LgKZOFbw==
X-Received: by 2002:ac2:46cd:: with SMTP id p13mr392224lfo.517.1606164445037;
        Mon, 23 Nov 2020 12:47:25 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:58ed:: with SMTP id v13ls2614210lfo.2.gmail; Mon, 23 Nov
 2020 12:47:24 -0800 (PST)
X-Received: by 2002:a19:ef01:: with SMTP id n1mr401307lfh.9.1606164443998;
        Mon, 23 Nov 2020 12:47:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606164443; cv=none;
        d=google.com; s=arc-20160816;
        b=OQq5eX1ZQcDzdWsPJGIf1EZj9MIysPlyTb26ffLdepGVk+BrQgkXl99RyVSpTEAONQ
         eWzvo8r3hhuGdOh3mq4PAeARfVVTLt+9k4rSB0Dxq26lH5FzeQ5wWAdEBaaNDGHjYOiv
         czEVqFiuRHeahAeEJmDaMrMzytw59AzywCv0qt3ZHGJdJNy9865Fc2RXqy2o4+QygXIc
         qw0n2rULGeRpc3SUr4HJfUx2kvNVaENTVl/hblDlngUtEoQ/MQHFS3P2glrZOztNXKP1
         v4kFgSSgHqYqu0LRm7ZKXuUIUEC7SYSiV8cO4i9Uu7kLBOY5lw6rUxKOcHXea8fPFtSu
         Gx5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xauP0xQHs8XXOYTHgsBmvLdMeVP0cy//0ozaM5KRCaE=;
        b=GNWcyhhIYO2epJb097HU0O0EqQbKyQI0A9kyd850pmvJQ9U2E/8q3EW1Nc0pj9QNii
         c86bodaig2uCSXvttz7xmR2temeO8bpG4gigdvUr90qWGjA0x7dsbyXiM6RFfp3vhWN3
         pXb4Ler3XX4CB1lfthhftuj4mvLaFtnTXzTeGbybjoFeTTYX/PH+Np3R1MHEGkxbl5up
         8A6NQOWFi50ZFpaSmyFyW+2GWgNbGsm/OAikkctY/5JJZlFCwkfrCWosHOwsIL0F6m+G
         gyQotAsgWYLbU9e3Cbh+Xe5VWwHyQRSQm9fXv0BqrnNqRX7K4VulEAuPT7mjv21z7/Ok
         dpIg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=tc3atFIu;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [2001:4ca0:0:103::81bb:ff89])
        by gmr-mx.google.com with ESMTPS id f28si23941ljp.3.2020.11.23.12.47.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 12:47:23 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff89;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4Cfzjk64L0zyTc;
	Mon, 23 Nov 2020 21:47:22 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.877
X-Spam-Level: 
X-Spam-Status: No, score=-2.877 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_TO_SHORT=0.001] autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id TUAgjnIBxSQY; Mon, 23 Nov 2020 21:47:22 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4Cfzjk0r06zyT6;
	Mon, 23 Nov 2020 21:47:22 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com,
	marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH 10/14] hypervisor: provide runtime assert() helper for DEBUG only
Date: Mon, 23 Nov 2020 21:46:09 +0100
Message-Id: <20201123204613.252563-11-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201123204613.252563-1-andrea.bastoni@tum.de>
References: <20201123204613.252563-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=tc3atFIu;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

Debugging is enabled by adding CONFIG_DEBUG in config.h

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/include/jailhouse/assert.h | 37 +++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 hypervisor/include/jailhouse/assert.h

diff --git a/hypervisor/include/jailhouse/assert.h b/hypervisor/include/jailhouse/assert.h
new file mode 100644
index 00000000..eedb1b9f
--- /dev/null
+++ b/hypervisor/include/jailhouse/assert.h
@@ -0,0 +1,37 @@
+/*
+ * Runtime assert.
+ *
+ * Copyright (C) Technical University of Munich, 2020
+ *
+ * Authors:
+ *  Andrea Bastoni <andrea.bastoni@tum.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+#ifndef _ASSERT_H
+#define _ASSERT_H
+
+#ifndef CONFIG_DEBUG
+/* runtime assert does nothing in non-debug configurations */
+#define assert(e) do { } while(0)
+
+#else
+extern void __assert_fail(
+		const char *file,
+		unsigned int line,
+		const char *func,
+		const char *expr) __attribute__((noreturn));
+
+#define assert(e) \
+	do { \
+		if (e) { \
+			/* empty */ \
+		} else { \
+			__assert_fail(__FILE__, __LINE__, __FUNCTION__, #e); \
+		} \
+	} while (0)
+
+#endif /* CONFIG_DEBUG */
+
+#endif
-- 
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201123204613.252563-11-andrea.bastoni%40tum.de.
