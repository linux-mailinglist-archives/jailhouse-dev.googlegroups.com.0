Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBD6RXPYQKGQEJZZRCAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F38E14A544
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 14:41:36 +0100 (CET)
Received: by mail-lf1-x140.google.com with SMTP id x23sf1604160lfc.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 05:41:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580132496; cv=pass;
        d=google.com; s=arc-20160816;
        b=X5gCFXccXe0J6eafYXczouTxJ5S3H9vmyXxIIx5oEYP+LzIHkhh8q5/ARF0a0ZKfKv
         FUChQ0yuL9DhHr9d4Yi/ik+PAmRW8WuATq/aKH+I++OjkPNZyFKNTVpAdQ0XG+bMIdv0
         Lckzt+HC6OfFAbQDaEkW+2jS7UWNLU+JQWglzJwqhf3sCu4eE2pKndysS0j+ofMBJ+V0
         AK9Pi/AQWe6trxA5gIvrNymohoUw/VgfOly2kyLwUxgWKCCL+QI30VEs8TZqg3GBjSUw
         MTpXVDsK5eTHwMMW7lRMTr6Pf70FFkHNU1wmXc/XvwaAm5Y47fJMSwVg0glweMOsXNj2
         K+kw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:mime-version:sender
         :dkim-signature;
        bh=uCRt3/9UrTAfXrzHhKEIYRfjDATPdNY2qOilBBLIaug=;
        b=NMzki25y8TQcGR9XMDYIXRGPf/bhlvwNWxX1uIJywcpsf2HG2C2mpHwp478KaDWv/G
         wjbLarB73z9OCbEBXgcYxh4O479T2yqsgrmPrae6lBW24QMHuO+HVd2XT/ywQK9QSQaP
         qCKVNYVHg9TVuFMpgp2Hr082+NDauSm9cLsApOvugjzuLOSwzJEpEGl2/Yzyr0/H+byE
         GsRZlV87EB0An5GibevQlexRCQ/1kHWzHVjir0grNIAnDL+Wp6gLetqBzCkMq0uuBR8t
         UQVYAJeqyfvDw7Sv8Rkmy75k9V18UQv/jw4X9/qxY23a/Vh9EAeHjA5pcl4xc2RLLgY6
         JiuA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=EddDCFdu;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uCRt3/9UrTAfXrzHhKEIYRfjDATPdNY2qOilBBLIaug=;
        b=mUfCmEzWTrR24pMlSAMo7Nvv8zZdP+xHrMImBdzBFTdUeb8A7oRZK2vlH4bnt+DcSO
         7WW4YCFkMGDEjH3RR0wnUPPuTqA324Efo/3bXjPexEaJs7+6+NaArFxpqEUYoz3UPc0E
         O8GcEad/b9zP05NrOeVY7BYKJwgpfG2KrSxTpK8ilSfgoMkHVgjFQQBQvfYRHYECqaNF
         FZI2nI+986mC8ESax6g5J9ABN3SEgyrRL/oBKWeW8ZsghMRBVLbMH+41QKQHBRdC2AIm
         0UfxrUoW2MBBMtxN/BQPw1JRbui3JBK7MJDquOtvgKWYNHWyJrGKEBgrfzgk3K8NZkDb
         GF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=uCRt3/9UrTAfXrzHhKEIYRfjDATPdNY2qOilBBLIaug=;
        b=HO08RiircHC+szaCgJbYlsITH3RPoCYvct5XCKlAKz0jWE4DfzmyqpUOQ0asZP6mwL
         aeI/I92cKq4dBZ10YcjGHCu93Qsk5JDyDrdUPPPknci0tO8Udd/M8ZKwXfWQlRCi4WU5
         bIAaDaexk2BpZf5ThYbr4e6mnPRidg48BR6wk/Wynkzsm3zBQnaLIaSaZsBfpmHKREDh
         u/stoWNmWPhnI0dQ3ybVb02naB0FsdRm5aTnzVvp2CfQtHYYXMEpASpio/7pRI/LxBFd
         QOV0WF9/3DGjH1MFOmtH+oMOZz5/fpPT0Gm6bVBdX4ZvQNmGCyygJbIzfUcsLZ3O5qJa
         28SQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUq+KcrKBSDtYRNDGce93o7rxfDQtXFouW4JduZi9gYemwnHvWL
	zUOQnlIXobRB943fvvrVlP4=
X-Google-Smtp-Source: APXvYqy6yr5l9gXfEWgPy90+2jcO6irNxCfcjXhz2DqPBahtKZPaDKw0jgB/+nYPCOezXnhWjO0Hvg==
X-Received: by 2002:a05:6512:64:: with SMTP id i4mr8031105lfo.55.1580132496135;
        Mon, 27 Jan 2020 05:41:36 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b530:: with SMTP id z16ls726899ljm.2.gmail; Mon, 27 Jan
 2020 05:41:35 -0800 (PST)
X-Received: by 2002:a2e:9183:: with SMTP id f3mr10255364ljg.64.1580132495391;
        Mon, 27 Jan 2020 05:41:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580132495; cv=none;
        d=google.com; s=arc-20160816;
        b=LE3nKC7qLl5vi9r6RBaNIrVT1BwUJVoo2S4rBYa4jXy7sj9MeHJqZMbbt0EUOkTE35
         1l2r/8orVyxwcojaNwYKoYWyc95HE4ULRrchlTLnaevmtGWvdTTMGc1jssCZwtO4jVdt
         kfieIm/FKQAZFygTHWoljJvLUHEWYDMNBg4HMOPLAJN/u2GYHQkweyNpuSHFg7dH3C1y
         5xDy6sByYntTZkcjJBPCiLHkNz4XKhOM/PksckQJzoMAHktRJT5alF3jGSDgTsUA9AgU
         AdqVLyNLncX6c9pZOH0250NtXNBcDd5D09hHIJdHBQfRqpyNJsxR7mO2Z3xIdgqS6nI9
         KGLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=9Eky0TzLwQpxJwI4gUzC4W4oSApZCGIlZM+E/Bpmha8=;
        b=AFjEDI6cSZL2V8JeGh/eS3twSS18P1Z1eEj6ttZEfryUpLZ4zq9/GVbZbjs5KPK7n8
         zVbT2DT8dnKsMYeAdH7Ukr/MFWPlM8CVzRbQi7mSB2YS443oRkpMz+ZJ0dZMrFBwMdL+
         kJpGGWLohqZFxicUURuQhFcwpHmu31EbOLJpNbIYBPnhnUlLRLmt0O9yveM89Tuc9rsG
         ozVzwI8sKptGdKaYff9H8oI0Gyw/xM6O57R6oRdxMLfSkt/r3i3Eny3B4D3CrVyIyxEt
         +EkrRM4FLo00O+xqgyapRH1kmTciwppiD/JVqdiXyMqCTcfCwUWPKrm4iLgVbcUrVTkN
         vFAg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=EddDCFdu;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id o24si685323lji.4.2020.01.27.05.41.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 05:41:35 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([95.157.55.156]) by smtp.web.de
 (mrweb101 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0Maamb-1jBfiZ2gFF-00KCeH; Mon, 27 Jan 2020 14:41:34 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v2 1/4] core: Tune comm region's flags field definition and documentation
Date: Mon, 27 Jan 2020 14:41:24 +0100
Message-Id: <78fc409a3a5288d800de94ec0847beb5430647b4.1580132487.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1580132487.git.jan.kiszka@web.de>
References: <cover.1580132487.git.jan.kiszka@web.de>
In-Reply-To: <cover.1580132487.git.jan.kiszka@web.de>
References: <cover.1580132487.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:8ZmAjAcHdnOLbM7SFIWsXWXJypXH3tpaYSNqmtQuDixraGpwxru
 irc+VRn1O0VfsDVdCdxFhLJZ77TSdStIFpRSJ083hhYNEyLvLOsOg5unKntDTTARpWRY66Q
 cSXCPOt+3ngYq09gOi9VXGCr6Jlg2X1+5Q+XCikubr32dkrq7XewAvEBABJwU0BI/kLX88K
 tTtYBkwCLw67mKVNq2Yqw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:M2xUMZHZ8Ys=:SA/C+M4/2INtcBEUHOy2QA
 fb9Qu9c3+i2ezIov/gLYpiuwt/CtFhKW86lPchRULXiFyGGE/cQZ8XJLlWIr98IraK7uLdx2d
 g3yvIjxN5XAXSpH4qA7H4iQi1KjhetH9HtZGDhyjj6izgd8kXVhRU0FKeyYRkWQPgs9ypSGJZ
 wYWoikKqvG9pSzfzpo+yLR97bkCQG7O7QucpRGP7dhuSTPttaopXYnhx2ECawo26yycNcH/rO
 Pq4d30KrnFvVV94aA2/CUkAHN3N4vicqd5qhn4KiMaQ7y3/gjE2RSL1PgUydn2lr7VEKOG746
 LScxylVD9Jq0R/d9T2akEkLBhWMvYIRvU3VYkVqOX7myFbYajYQYvx+eYEV8cdnFFk+uyuRzi
 evIle/KQK/BlbyFlM3mkFmZ5IbhB55B+w1SOr9RpdoE+GVATsbH7s4e1J3xjPCrdWlhjWeClB
 q4NLPA1DN0si1SkvMHlTY+nIx3BfkjPV01pqrdQw/pRgZeQ3cS/o6WnPcnDbbdpCAG7NOaL3g
 m35S6JhNo+oEenipGFOJg77B1CDAiV4F0fOeoywxKuDE+rIt0I47vsbNHUq1aIuHWUy/grNbP
 OtbcMHLxui7ygZQX1g9FbvBXz0Srrz45qzVNNwuOPdVE0MOnMbbp0dUxpLlZV7w6HYirEQmFv
 q7n671GoPzhto4N8YDD+KW+TSsCHkuB05mw41pbIJ8Zb33CxcgbMgIxTZAc5aSAmDLM/U+wrt
 9rueidoryVpIUpuZbLw6x1vD6b/k1HO9Xz/SAVVW5jC+b37JVeUFVMzckLwlCkRns2P5a/TF9
 fb+AC+a2QAxwFe1Z7tOkHg9yQXvZlbSOHX0ToRxRmlJ7hCOm06kTkCMPMjvP7RU5JdA3TffMN
 2egFqpy75vEKuo05uu7dTAkd17osGX4rj+Hd0Di6lv/MYDWS5SkNfXiO1wIAwgEJRT2M8W+M+
 +JXFtsok91Ns58Tgk2ThNRBsEW1HN6fLPYyo4R6D89V+V2xeUPu4VUBSAaGNRnSyxJSGEjCzv
 RYWwrUOPRE/9uAZPO10zWA98w6ouKzuUqyDk6dpt20dLlHQ7iZ+okkve8lRJ+IqD4+hD++3ej
 P3lKdsQtmDUNm6K/GAlS0CQSRF9eYJTzmVsM5dzxV7XeeA7rpDezZOGAb6K451k8u4jH6NFWd
 qxLYUVVPrPmNcb7Mh7ChngjsnI2mYbi0b0V7Ty/qlK6fYr9NQ5fmn9OtW4FieKmvUBa/B0X8c
 EaYhCxKpM/kzEEUAb
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=EddDCFdu;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

This field is static, thus volatile is not appropriate. Rephrase the
field and flags documentation for a clearer wording.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 include/jailhouse/hypercall.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/jailhouse/hypercall.h b/include/jailhouse/hypercall.h
index 20eea801..07574d3d 100644
--- a/include/jailhouse/hypercall.h
+++ b/include/jailhouse/hypercall.h
@@ -92,9 +92,9 @@
 #define JAILHOUSE_CELL_FAILED			3 /* terminal state */
 #define JAILHOUSE_CELL_FAILED_COMM_REV		4 /* terminal state */

-/* indicates if the inmate may use the dbg putc hypercall */
+/* indicates if inmate may use the Debug Console putc hypercall */
 #define JAILHOUSE_COMM_FLAG_DBG_PUTC_PERMITTED	0x0001
-/* indicates if the dbg putc is automatically used as output channel */
+/* indicates if inmate shall use Debug Console putc as output channel */
 #define JAILHOUSE_COMM_FLAG_DBG_PUTC_ACTIVE	0x0002

 #define JAILHOUSE_COMM_HAS_DBG_PUTC_PERMITTED(flags) \
@@ -116,8 +116,8 @@
 	volatile __u32 msg_to_cell;					\
 	/** Reply code sent from cell to hypervisor. */			\
 	volatile __u32 reply_from_cell;					\
-	/** Holds information special flags */				\
-	volatile __u32 flags;						\
+	/** Holds static flags, see JAILHOUSE_COMM_FLAG_*. */		\
+	__u32 flags;							\
 	/** Debug console that may be accessed by the inmate. */	\
 	struct jailhouse_console console;				\
 	/** Base address of PCI memory mapped config. */		\
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/78fc409a3a5288d800de94ec0847beb5430647b4.1580132487.git.jan.kiszka%40web.de.
