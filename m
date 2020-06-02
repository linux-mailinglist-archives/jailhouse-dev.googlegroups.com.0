Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTN63H3AKGQE6Z3M3JI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BDC1EBDCE
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jun 2020 16:16:46 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id t2sf3503300lfq.11
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jun 2020 07:16:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591107405; cv=pass;
        d=google.com; s=arc-20160816;
        b=QlxyL0/hknp85K28CdFsY3aOvJOs70EnXzF3ZhmZKjpFWf0A/1Vculpmg7pzlorr36
         MrEMN7KCtpTLAlLJe7n8h5GMuJ+k4h7U8y5NmtCfHZfRaPhT5r2H8UrZz62q2Toy+WV0
         HyiVdUGdlWBA5jXY9xuQ1FBqPlp46BGyKQf9biZwM6ooe+XQMDshI08pJ5jQVn/b+P+Y
         1xb4rFkxKyihIzqsAO/CGFXc5HPRQJkfJyaAYrk9RNRc7lyGlbvKwMN/eti2+HXJjkec
         QIluLAX6rwabnHo+qdpU9ZLzsKcMFfUJVEXDo1jh6gY57S7K2CFjDoItgkQBL2Wx2tEQ
         PIsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=UvMgLcjP6TywNeZzT0f5mrSq0EjZuJQPGicJxlayBR4=;
        b=sa6Fuoq/SUnKxvbLYUJjNp53Nd0ZxHbPSMwuwqQZ1cphaWWWOjCxdYZIc6gvBbmltF
         UQ8oqqao9cLozMCZbO9N2FgIdm1fQx79BpRgY/l4ttmociwT9GPydKS4db7d6c4/utNr
         geaQ5sHEnSqZPLJn0tBSkGyEwoIsTbJRK65njZ0RX37MgqTltwo6nWR2sFWEkwRPJgyc
         yT4FvNTHN8de//ZQy/uj7qAc142/UyUG45ktsZrxBmX3BmIph8O4NwmrO3S1OgCDqR2d
         dVg49YKbSMsKjWElz1F4lSVLXwbjGU1A9/NMsLUPnH034vn5BaZ7UrTFWmWls4K6fcN5
         Pxbg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UvMgLcjP6TywNeZzT0f5mrSq0EjZuJQPGicJxlayBR4=;
        b=bVoSM85mzEfECkfFO92Yq7ZrAXfnUHefmV6ThOSkcORrQGDuT6Sb6dcBMViMgiiKY4
         Hz1mNLGHyJinEvuEqD8IAisdnqPybpUyjzGSS0h7DTKK1fXPtRUcBHYagiyoTq/AGRW9
         sYqjdkPgc4Lmzovlybs2WIKrFjVb0DT9SZ5HXAOD3ANCqamrDYmodDuZTcWVvhTFIhhl
         rHxMMIc+f1UgEsZSj8WB+I0e3a+zXAwgP7+OBEEdTgYq3Vq2J8e1mWhsgzSdtHXSYU8s
         GcgiMG8kHPQVzI43jqA2J15NLciLxoIhBAhLZYq09ii5rvoVEO4cq/7ZWIjtUMOgY5/x
         VjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UvMgLcjP6TywNeZzT0f5mrSq0EjZuJQPGicJxlayBR4=;
        b=YQm9JJg6Z5VDl/RmKHAvmCHcmi6SESsTepUvnrJJWDkpAzdSTCmjJ2EgGcG1z1LDT5
         Yn9om9cJ5Z7dygTDqarkS0Xs2YwHk9hesEhliyNKfmEOM5B+rIGjuOJhdCc68iPoc/cf
         AEdsggzJ1P/w3/ZbWsx7MbazkCKKXz3B0F0XfAwq4mutFsaAXngh0NVd9BmpPoL+cAbF
         y+iWl2BeRLIyM74cpaguWgSH9rM+0qeYwrGKeQ4S3gheGEvM8VH5HKJuiSUnzdh43Yzh
         6J+5boykyjrRReWen10pxC2StPY7nr0jQoEz6HaThtSyMFImjLQ6QhjYQ+gydti/Gev7
         RquA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532gn1OyvFL2pjrRwHyOyYdBOR2G4FQg73E0mfpuF2Raabir+GhV
	5UF9L+H/yqPJHdF8+oS56d4=
X-Google-Smtp-Source: ABdhPJwWqe5OYeOpHEJHAyIpq2syfiuGuCdNSpSFtpj0w0An3FyQ3bHrb/PPVSUqvpxHYLL0elAiBA==
X-Received: by 2002:a05:6512:682:: with SMTP id t2mr14197408lfe.101.1591107405639;
        Tue, 02 Jun 2020 07:16:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9791:: with SMTP id y17ls2550876lji.8.gmail; Tue, 02 Jun
 2020 07:16:44 -0700 (PDT)
X-Received: by 2002:a2e:8490:: with SMTP id b16mr8053513ljh.325.1591107404823;
        Tue, 02 Jun 2020 07:16:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591107404; cv=none;
        d=google.com; s=arc-20160816;
        b=Ehepqb0FKxT1AtCpj8b4kCzQAo+9ax8XFkJCrMM5LigKBPcSenEH/ynJsPeAw7YBtg
         oEwyiy4JxR9/pD6xs+UAIGX34qQyTo1fmNIMb6BuXPNvvhh41W6ARh0E6oxtlD5NYC78
         0r0O0L+hbZAdsmDK9xy7bcwfsFmk9OAH2w9fr+JKL3gEkMR+ABaLGCsKxKzqmijl8DTd
         UN3mG3iSP+bp8Tbg66N44inXPMXT1bdTEyCO8Pn2j9e7qP2vQNBuyl+j1i30k7ba4uwl
         IBDYMv+Cx8o/u7rN6q8XivZOgKY8OFM9ViVty14lz7lt5FtjCC9Vy4zMReuLES7paM9d
         IGBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=u3YPHWPaQIqSwuSOwbu2L1msCBletZMa0SPGsmdT8VA=;
        b=k925E5/X1eaXlyrHDDF2/d+BwHqXxZhEuVF1xf1n5bW0gb+SX7wKCQj205TzZQwbXX
         qusXtCYTaracASJtjL6fwehfYKe2KLFJNfhSGO7x0w8de5zvToCmKHrDi1Qnwa1LQfZu
         gdtT7SFenvS+vLAgp8MtxacABoUdY/bj0diksT3qyTmvaIw3d1JrONEU3W2AQQkE8UE2
         O+W8uw6hy4E9RH9Y3teHzGkkxNueJaWQvoLTmzvLOJtlKovAkNFlbHDBoDMuB23dibar
         lKMPn171YntoEejUVkAjW1tBvRDcHjj3+qwpbftLL3o9ML639DnGq9K/AE4DE4UfVVv6
         iMKA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id k6si115327ljj.6.2020.06.02.07.16.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2020 07:16:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 052EGhN8014572
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 2 Jun 2020 16:16:43 +0200
Received: from md1f2u6c.ww002.siemens.net ([167.87.142.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 052EGcdB028463
	for <jailhouse-dev@googlegroups.com>; Tue, 2 Jun 2020 16:16:42 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 02/15] cell-config: Rearrange paddings
Date: Tue,  2 Jun 2020 16:16:25 +0200
Message-Id: <3bbe8ec295e8fa7183c971345c499080042d4266.1591107398.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591107398.git.jan.kiszka@siemens.com>
References: <cover.1591107398.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Use the chance of a config revision bump to update / add padding bytes
so that 32-bit words are 32-bit aligned again.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 include/jailhouse/cell-config.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 004d048a..3dfa4df1 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -310,15 +310,16 @@ struct jailhouse_system {
 		union {
 			struct {
 				__u16 pm_timer_address;
-				__u32 vtd_interrupt_limit;
 				__u8 apic_mode;
-				__u8 padding[3];
+				__u8 padding;
+				__u32 vtd_interrupt_limit;
 				__u32 tsc_khz;
 				__u32 apic_khz;
 			} __attribute__((packed)) x86;
 			struct {
 				u8 maintenance_irq;
 				u8 gic_version;
+				u8 padding[2];
 				u64 gicd_base;
 				u64 gicc_base;
 				u64 gich_base;
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3bbe8ec295e8fa7183c971345c499080042d4266.1591107398.git.jan.kiszka%40siemens.com.
