Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBMEO5TUQKGQEU2AUXHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A6476A74
	for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 15:59:13 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id u5sf25711154wrp.10
        for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 06:59:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564149553; cv=pass;
        d=google.com; s=arc-20160816;
        b=Xoo54IHs5ZChIs2+WkJO4vgrqjvXYdEmHnxo+NHORN7XWxWBpqqdRcwCAPh2nRU66U
         g2bKps0bMywbL2oTqtYHsB0j1dt/J3RFkw9IXiOObyj74Tf+5Rg0mwTTxgGc0yQ2gl+I
         WCYDDX4BBO8EBOjxecOPKMcc46nhfvvqMwXLENK00xscDem4SoJ6+5SkDs3/vlmUTx4A
         4Pu4krgG3hSGbLT6V+fZ4SLY7BMWpkQAxanZ+nKZgGgm205IYLnSgzAA4yJzdFM9hiAU
         KMCm3nQi6l9LXIhx3AzT++y7+cnozX45sIhuZJYIVwIVNvDZPGLWrg/3JOC7jYEuo4Xg
         f44Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=281D/6pDQXmJw3aoKPKr4C05dBaEWU375FQRjuUP3C8=;
        b=i76wC4KXpan/fzw0VWFM4PU1Ov905pZec60CYuFuYK5A+ZdpPvs+R0L95sfhPyJeWY
         2byRGQngYgTSdoj9Wb7qViZga0lPcusUbFNfELZnhjZ9qaYk9htaEJz0N1qhTx/4QPJU
         Uh36Pf39ZtStz+D69hhzVVmC7/iEyRQwRlqirEyfV5N5EM0acOOzOaQC5FrSXLox4zz5
         b+/VzBwaDFCkMD7jP4YUitEbeYuAc0mzXf8FWTWUdQEo9PbY3/k5GFe2UueHFZCUq5Av
         y1234Y9uukeVzPyU9K03ZmQU6Llts2psAzkMdtpCWL+YZNGSBGweL1f65ncFZwjSqAtn
         X5BA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=281D/6pDQXmJw3aoKPKr4C05dBaEWU375FQRjuUP3C8=;
        b=ZYCA3VMK1x5Ak593P19IxTNM9JS8kzzhajkymo24VuJFJN4lrry1JHDgrInJ85uei1
         Acmd/pRvlHtMFTVxwa8i0PgaiR6a46ISn5yBXMUYaFMa5B7bDyKkP67W6DorCHetqPr5
         nlVfwxLZZp9b2a6ekCKXKoTwZuaA0i0FBo7WEug8rBuvj5nI/GmtBr/o4z6RNwCCZQTB
         R76ClABkiirAkofOxxZ92CTBBaXxTGB03d+9u03V93LmkFRM8S9y6B7OQpIxsIiV+AGM
         kyflJbh7PEFFe4Dk/hz2jqBmF36JR75IEB26t8qMp0+P22HbDMwwElIThIAWLXDQk7c8
         jIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=281D/6pDQXmJw3aoKPKr4C05dBaEWU375FQRjuUP3C8=;
        b=JooA0r8pcvvNrjF4lgBskIGi0EgirDvIBpskUa5NPcyQIIMdEHOAZofKyQqm6eN88G
         WJ/V8Jhr28c0tuvbqQmO4GKPYsyFniLweIstPyHvk+/tXD1bvR9yywvp17q3nyFfIQma
         ARSc0C2g9tZQz9BtYq0Rj3ngSx35ZshXQ0MzMw2AOHhbX2euC4Wd+JqsFVUx6jnCf9Pb
         fmKXtJa00Wr24e74zYQDjAcpEpocTjj1agpEpVbuF/wVYFX3Z2OMRg5NP5ooEz28854d
         0sG/zq21tpU6LgTTnAgRUuPUWTNBGn3gVs0KkeZVaekvJU8cbK9svz5P7J+CdKkvyrTf
         PA4w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUYSfEk5Ay/N8fjQP9iWgdkFo5o71PxKwwdVxtMrqep4wAF+TxL
	foSfNbX3fYEfwPB+I/C5b+Y=
X-Google-Smtp-Source: APXvYqw1BLy+dUUHVrLO5ZLbGjNEtSSPNGF1IJZn/CHswpU/JXAlBDFrF96AK59WRs0mdjY6Qpf1Ng==
X-Received: by 2002:a1c:6555:: with SMTP id z82mr87910000wmb.129.1564149553078;
        Fri, 26 Jul 2019 06:59:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:ca58:: with SMTP id m24ls18896513wml.1.canary-gmail;
 Fri, 26 Jul 2019 06:59:12 -0700 (PDT)
X-Received: by 2002:a1c:9696:: with SMTP id y144mr85022239wmd.73.1564149552465;
        Fri, 26 Jul 2019 06:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564149552; cv=none;
        d=google.com; s=arc-20160816;
        b=eP/jBCaqsmCA/qcEee23pmSbPz21CDR+HrETguP2uJJQ368SB9AoLifKkUKmy1BN6m
         Ws9+fYKn2vf0p6fQIJbSGImyuCD7UjUC686gPMRatTPLG6WJbJvxkdpuZSmKlvJv6SrJ
         ikoMx/rOW1WBNr3wMes83WQIK2RRegfiRejBT40XxW4wQbYkYlNhgpdTeIHe044qZQoX
         LBaj48YGLd2ALkgi4UGOSlTcpI7XIUateAaBg42xRtSxQ70t/clqmDCp7EgFTNGGYxWW
         gv8bV9CQG+2rpOtxPLp6lcAfk/d3e8w84TkKDoltKt1B9wi8dUcb+QZTB8X/ZHa2zyE7
         7Z+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=xIdQFqG/CaHhAWl3rBi004YWLI9RIHXGJwd0XBd2+2c=;
        b=T0Oh+Rg78f9YhkgoW/s4h0KGDR8WIT5bvUiw8XV91fc9LBhHkOP451csjuoU8GrB2A
         VXq0aV5APCL1uRKgYBQobSiJt/08lkzZ0NcyOPhUrMGs/TmoJLlQgWa0f0hAB1GhOeZb
         im6wV2neTEO/BZKwguwzXGlewu4Yx4PxLKq5FsnzD6kORN9NTuCzCeSp8WNOzzeOYFMS
         TkmVz4KcPh9WfvjTbUYakeYLL7fdSu6Ei9bJEgRPqBsZIDnUMAmsYnCCqlt+zkcQKrL1
         Al5T3OMCQsZ64ix4dr/JkDhjOWkZYDLMeF7JLpNM0a872fmNOL7/fgxfFwIK2ye0Cs1+
         0EdQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id s13si3124058wra.1.2019.07.26.06.59.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 06:59:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45w9g417Tczy8N;
	Fri, 26 Jul 2019 15:59:12 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 3/5] cell-config: introduce pio_whitelist structure and helpers
Date: Fri, 26 Jul 2019 15:59:09 +0200
Message-Id: <20190726135911.16810-4-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190726135911.16810-1-ralf.ramsauer@oth-regensburg.de>
References: <20190726135911.16810-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.7.26.135117, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.7.26.5630001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1000_LESS 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, BODY_SIZE_800_899 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

Introduce struct jailhouse_pio_whitelist, and a macro PIO_RANGE that helps to
fill lists in config files.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 include/jailhouse/cell-config.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 76c9e56f..a95db470 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -206,6 +206,17 @@ struct jailhouse_iommu {
 	__u32 amd_features;
 } __attribute__((packed));
 
+struct jailhouse_pio {
+	__u16 base;
+	__u16 length;
+} __attribute__((packed));
+
+#define PIO_RANGE(__base, __length)	\
+	{				\
+		.base = __base,		\
+		.length = __length,	\
+	}
+
 #define JAILHOUSE_SYSTEM_SIGNATURE	"JHSYST"
 
 /*
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190726135911.16810-4-ralf.ramsauer%40oth-regensburg.de.
