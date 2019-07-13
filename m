Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBIN5VDUQKGQE3IRXD3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 8583867B9F
	for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2019 20:10:41 +0200 (CEST)
Received: by mail-wm1-x33b.google.com with SMTP id u13sf3145044wmm.2
        for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2019 11:10:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563041441; cv=pass;
        d=google.com; s=arc-20160816;
        b=W5LJCGAUGgBiAiM2e8gEFvJM83yrrJci0nM0jF8NQ1a4v4Uoelw4OJrPGlxVsbUGUv
         Q3r9szxSak6D4JQT/tF7yI+njRnXW8wAHuhXfdWFdUj/B3qIJjmFzRwMq1Y/oSJNV/sn
         6vbY1JXQ1WjpbM5F3MXagb/BFIQHkDQNvZspRn2BQUVsX3JhaIi/oDn4Ug1j3Q7CMHzy
         BEeHreTIehJIx7NUmHTyCp6BMH1M0AEC6NXbN1b6p76DIzNf+Q6A0qw/yAF3X8Mv786L
         GFVI/Vvm3/1PVxC8eqxrjjQJ/U1iZYLjmuzuTVmT/xGvVgduku/YnDUZyiQUMkXq56UB
         jq/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=blEDUge1n+B6SbJ36wH6OY5VTrbgSYLZ0qVAfzyIMyI=;
        b=mCF0LgUViIce8BLQrnWACaX05u71JWvaBdW4qwA8AEp1sKagbxWLfLolOjwpKYBVjM
         s03dtcCvZslMvMRiVuMcseINaosm4URnY4LxFUM1k7NZ3d7czf1U1bgcjgXVt+tfBck6
         NHboYO+JPTxsIbeWw/2O5e4sL3fat6m+th9v4Qr8x7d51qosvYJHy1lIlJs3ypJnSd7i
         gDRBF5JH6LR/G28OH6aznXr2TjuFH9DHgpuYjRMmGAxDTY6bmkUKFTcIOlTov8HDKps0
         0TiYYyvCUMO43VXsG1OuPsuZReIhrEn/Y9YkuunqZSRJ/DFpjRyePM48gz7TOpUtZHIN
         LKgg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=blEDUge1n+B6SbJ36wH6OY5VTrbgSYLZ0qVAfzyIMyI=;
        b=BNVRDmVkFHClzZM0Ucf3uHjIjkY78Bow5lc9Qj0G+Mi2gEOiADHIUvAXOpWSIuw1Ob
         QeRkYqf457VGc7Sp6aLxfx47dTPmA/PP93vXSWrXQiFIai37PADu+iMptyFRlol87GSx
         SkME/Z311LAjvLah/s2IqDk/LBHFeTw7bLF/KUFx0YRv6wW721792OnUrPM8TtFfcq/c
         SaF/2Om9Me2RnARyhIHSrIEIM2tTXA60QbPrCKdtuHmKrq9Zm4y2xF22XIcQS3qcuHh4
         fw6wic4R4Q01Z1JKUflFrcJNnstGXygge3xv7gqrf90YsJGd8utfehjnGq1IsX32rN8C
         KyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=blEDUge1n+B6SbJ36wH6OY5VTrbgSYLZ0qVAfzyIMyI=;
        b=N6bSX7cA7VjVlYhPu9s5ASGBGDt/r9yNVVYbkXvUFWgPqfvPZ56IMHIA0qLLP0qmqR
         yc1BYKwWGYnhryXt7GWjWJKg2eBPmnA5RPTJKuUuKlYd3z+e5vrmB4bn14lP0cT/HVV8
         7h79Gl8xl9DwVbyvJ+cVjN8DvW+BTolwRAIV0pQctkNUN8qdBzNo2bj5NQ+Tq4lfE4Ms
         0G6CTPo+NDYBF2dpnHCLT5+36D3A65xwmAGFTaRn28UztCA1V66LiH4vbGQsXmZTO+/0
         QuctBq8hCVDnxFnJNJ5lX4WjTi2eMLbXiHmc+/qcpsDpR3oTkAtbq6fnZkfeat6kEEBj
         Yj7g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW13o5r80nd9lA6bBvA/1I/v34Sxe9q1SD3Iq9RtC4Vp/aYGDy7
	TMcPhKkuLwTf5+wLZvVMp2s=
X-Google-Smtp-Source: APXvYqwz5egrB2CHbwSZboUrZRuowgjFrIxNlshr+/XA1ZotM1wvOtWkeL0HlUMSo1KQH3SFtML4IQ==
X-Received: by 2002:a5d:4b8b:: with SMTP id b11mr19103648wrt.294.1563041441295;
        Sat, 13 Jul 2019 11:10:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:bac4:: with SMTP id w4ls4075240wrg.13.gmail; Sat, 13 Jul
 2019 11:10:40 -0700 (PDT)
X-Received: by 2002:adf:d4c1:: with SMTP id w1mr19141193wrk.229.1563041440706;
        Sat, 13 Jul 2019 11:10:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563041440; cv=none;
        d=google.com; s=arc-20160816;
        b=vC+qRylyl4tpLvmYvqwWfgBnI2jeKwtNhIVBpL4D+ftQxyaVj9CthgSpzEfa+Pm0Yg
         UgRRrEnfe5cUY8Nnvb89AQ8LTZlDaRhNx5l+KmbATOoQBo7WQlDlPOgvnhmO2DWNnfN2
         3+tQBIU+/R7IWJoODsKfLuftffzgzHkgHg/gky/HlKEp/rPu02CFWXPQSPgneuIC7N7P
         qvHW0yNZ+su2kbs8W0XcnOwtzJK1C2l2I0LYBcvlIsQFcQBo/Rx4332O5s/d9RQTWvCb
         2Cj4uB/dgy+9fqDhZ4qfruLwrnTupKSX97GUWq4sG3XNbWH7HRn/dyrxzjbR1xRekY5N
         ZiZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=PV6RHkYcmoWQQK6bGMBBnSz4Wj5/+0+E9QA1dyo031Y=;
        b=GFfxu+jefB6C2shR981PyP+PtTMfNgjLqTmQ7VViJKF2BBG5KvpMw3v/G/PMjbvJuY
         fvW8l5qxMIXL3kYozMuJ+FOBKKg+3/fK2hQZuZmEHE28GEEf6QhEBcoVPXki2mkGkwLs
         Eaox09tJoGYKaYlDX1R9w2X/EGOoXLvs0yoeQnZgfEJvaGrt/9E8Izn5Tt7YqwvNk7jv
         /kS/hSnbmTQHESN66FzdM2k1jznj+PBe84zzRaVQe0T3GTsPiaRZ4hvWf/34cQI35ngP
         nKSNmampzcmDRi/HJMOjd9tXuc6p3HfO5rVtYoG5h9+Q1vj6BJnBLcHt4Ng2N8zJtSSI
         jz+w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id b15si217386wmg.1.2019.07.13.11.10.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Jul 2019 11:10:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45mHsD2ldtzy2b;
	Sat, 13 Jul 2019 20:10:40 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 07/11] x86: remove superfluous statement
Date: Sat, 13 Jul 2019 20:10:33 +0200
Message-Id: <20190713181037.4358-8-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190713181037.4358-1-ralf.ramsauer@oth-regensburg.de>
References: <20190713181037.4358-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.7.13.180316, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.7.13.5630002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1000_LESS 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, BODY_SIZE_700_799 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

pio_bitmap already is set to the cell's pio bitmap. No need to repeat the
assignment.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/x86/vcpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hypervisor/arch/x86/vcpu.c b/hypervisor/arch/x86/vcpu.c
index 81ff8772..8588d399 100644
--- a/hypervisor/arch/x86/vcpu.c
+++ b/hypervisor/arch/x86/vcpu.c
@@ -123,7 +123,6 @@ int vcpu_cell_init(struct cell *cell)
 		 * access rights.
 		 */
 		vcpu_get_cell_io_bitmap(&root_cell, &root_cell_iobm);
-		pio_bitmap = jailhouse_cell_pio_bitmap(cell->config);
 		for (b = root_cell_iobm.data; pio_bitmap_size > 0;
 		     b++, pio_bitmap++, pio_bitmap_size--)
 			*b |= ~*pio_bitmap;
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190713181037.4358-8-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
