Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBUFH4L6AKGQE6UYP6EY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63a.google.com (mail-ej1-x63a.google.com [IPv6:2a00:1450:4864:20::63a])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BBF29CB5E
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 22:40:33 +0100 (CET)
Received: by mail-ej1-x63a.google.com with SMTP id b17sf1362224ejb.20
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 14:40:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603834833; cv=pass;
        d=google.com; s=arc-20160816;
        b=0Lu7BWYK8lCYNqUS9/8iCu9pO8C/sTF0+MlAI3m5dVMHKQN7kmeNiP00TcxWD8XBPF
         pGqf5JLPuAFdr7hVrAOfZsHjt+EIJ0cGLfyLgzlNyj7uBWcRaCaLoyaTV5TlwkqeYwXG
         1T89dUt8DLhgRY1bEJ8UYUOnfpblF0bCJh7FvCzWM17MXNiqLT0036jYiBnSjfXCd1es
         MczZZeO/3TahRHtX5j5TXauRRE17mVgbmXKu15jXx99xRbHh8H+TYWByXIR/2jtM3nLa
         4WuLUc5ngxdQ9wcPMqpCY76HpA+bgwjy61Dgi+tD9USj0xKTI2C7WCdx2AipRLoinPZi
         BmAg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=ZEzNc5eDezPIsS+5JtX8WRE5Ge8SCivDQdq+G0QHMvY=;
        b=y/FSoNjm32/W7i9uQyjBoYfHXBF1dEsiRI4gxJFCytHnOMLwfKGxqRceWv3XYIu+Nz
         TV0Y7w2Xl1Ku15F8AzrMkoAf8cM1UvTPq611at3DTqQiFHXg74yBaw/luC7bMaJyxpkC
         UXjLKrUNp2fkzDXBiTyAK4dFimZ/0N0BP1apFCEOV9JUn/uD7WlwSiQ2eyEKMNsbJjCb
         xEMbxZ80EBUhwngSwS2kNrw0J8GONhV2QCu5E5SVg8Gh/10QXec2qBXesvQi5yM3qUlW
         PGD2FbteyatDaWahSvB8VY9Lys8DWrXEmHPOhN1XhDbi5cYohWFTUyLDS/b16TveTM65
         q+/g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=EAk9V7qW;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ZEzNc5eDezPIsS+5JtX8WRE5Ge8SCivDQdq+G0QHMvY=;
        b=JkdbIuWqH7rtSsNNBjgJfHowAJUpGm0ZfsE1wFfvm5n0gF6b6BEdbE3/Oe2Bt+D/zL
         oLA+Mco4Rx9uhjF0jRqpLFx9U5KMcUDAuynxQR+y2KZJoW1ZBvyf8HZoU8f89e2uCDTg
         jipUqRp47sGL7KHL0ZSN1tHnOVQkzSNhWo5rLNfw8Euv7izobit2dHC0olhVJHt4AeHB
         6uMwnwvxv2G94RTIMJSL6SvdX+mKM/Id3geO1hvzLZIPOSBr2vzyR2IzFfkW+Mla8o7B
         PMZTdKjKpOJcLg9nfzf4dE3MK8o3Qv06fvbNg2SY2xBE68e9JfAjsx7ZOCD9QVGSS3uK
         BFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ZEzNc5eDezPIsS+5JtX8WRE5Ge8SCivDQdq+G0QHMvY=;
        b=nC7JD1uXuhfShY+0FXkPivXELD+3pZzCWonl9R8wMQAqYG+eUdHUQ7qhq52Su3OcWl
         BsALYpuA9GlaIf0qCxUB0LaOz4UUXQzyc1JZix09acZ774I+wGA58L7NpJQjlc3TmNT5
         HeTHqWoUEaPDtDYSLR8QDt6FxKleDQZ+/pdSJn2Tk3DplCtj/oMnB9KzOtGync8h28Ug
         RSfAf5WSHWP8n0F8SeguGrzf5spnfcnIobtkyoJGp8qTz6iAVY9YH5Y1waTgQ/1qaV0L
         mkaVTzRlIKNMRmYQzZqEBjrCdckEmNIbwnvpHVKCj1K2pd+pBE9f3hkNrZO7Gm5HwMFo
         nKCA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5313o78Pre4fvMPcyksTxrWYkJZZA7XifuXXhF0+uOKzQTOWqPKg
	f+vzOuldGYjOm74wZz/9N5I=
X-Google-Smtp-Source: ABdhPJxOES9E3sbaGc8bfECP3DCIkckP22XSKKwo+j8B6gncjfEPmzz4RsSKMg9FyDEf1xbzU+qIDw==
X-Received: by 2002:a17:906:bfe2:: with SMTP id vr2mr4635088ejb.248.1603834833215;
        Tue, 27 Oct 2020 14:40:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:43c6:: with SMTP id i6ls1469553ejs.6.gmail; Tue, 27
 Oct 2020 14:40:32 -0700 (PDT)
X-Received: by 2002:a17:906:b010:: with SMTP id v16mr4583417ejy.163.1603834832138;
        Tue, 27 Oct 2020 14:40:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603834832; cv=none;
        d=google.com; s=arc-20160816;
        b=uhylbzOId0IOppzlgECPbWyJlrVm5n6KJS6PHa1wFdDFUQ6ytP8Sk8ymVAEeUtUbZL
         XYNpIDszQS9jtom1689OQuTqNNnJokbvYWCsUUtskvq1ZdHpHrPujfJFjC7qQOKt5fEV
         vJ1qRMA2we0rXen1uVG7i0OBPqL4tYFiiw0UsNPANhNe1HKnJof1Fna0itb35APD8hOY
         PKdU+X/2q6xd6Dy/owXE9xk3DTa6bcgmnoRAg605jpf5+VC0C3HszNHD3vvmHmMpJQQj
         eG12fTA2CNqtn1RQUeGKfmsyM+03Kf/tbE2JiOk2AwtEzYFGbnjf/+secDqfJATsZhjs
         D2xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=xs8j/CWGTf7IdfGrvMMR0dkc7sT4pIrDZbVyVi/P+GY=;
        b=h+wGeoeww4J9GR0IorBhyV2pf3115xLTSxEvXFldirda3wnJrYYNxthnYoQ3XhSHDB
         oOC99/sJY6ToZFdSxCoh6+3P7ucK4fuE7uG524gmGHEC4i1HxsJwABTJzNw54aMmCEOW
         N5GIrnSNxsDNb1Ug5upHqjQGK2olfmdK68I/DDrinv0krKQX/Q7Vf5Es+8ZZtOXQyYps
         u4aZ8mnKto04bzcXymtEfo6gq8J50e48cLDvomeaj0dbuPdEqn/2/NYT+xHeO6nqERjE
         W/sh7Ttso7XcSZV6AApQHmI1bit2yCQcKv4CX6AXI0PseHaaNTRwt0yy0aaXEK/O/2ar
         5vOA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=EAk9V7qW;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id n11si111113edi.1.2020.10.27.14.40.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 14:40:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4CLQ9W3zW2zy1q;
	Tue, 27 Oct 2020 22:40:31 +0100 (CET)
Received: from omega.home (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 27 Oct
 2020 22:40:31 +0100
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v2 1/2] tools: Makefile: remove duplicated rules
Date: Tue, 27 Oct 2020 22:40:20 +0100
Message-ID: <20201027214021.407707-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=EAk9V7qW;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Remove redundant rules by using wildcards.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 tools/Makefile | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/tools/Makefile b/tools/Makefile
index d336369d..e6945cd6 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -106,10 +106,7 @@ endef
 
 targets += jailhouse.o ivshmem-demo.o
 
-$(obj)/jailhouse: $(obj)/jailhouse.o
-	$(call if_changed,ld)
-
-$(obj)/ivshmem-demo: $(obj)/ivshmem-demo.o
+$(obj)/%: $(obj)/%.o
 	$(call if_changed,ld)
 
 CFLAGS_jailhouse-gcov-extract.o	:= -I$(src)/../hypervisor/include \
@@ -120,9 +117,6 @@ LDFLAGS_jailhouse-gcov-extract := -lgcov -fprofile-arcs
 targets += jailhouse-gcov-extract.o
 always-y += jailhouse-gcov-extract
 
-$(obj)/jailhouse-gcov-extract: $(obj)/jailhouse-gcov-extract.o
-	$(call if_changed,ld)
-
 $(obj)/jailhouse-config-collect: $(src)/jailhouse-config-create $(src)/jailhouse-config-collect.tmpl
 	$(call if_changed,gen_collect)
 
-- 
2.29.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201027214021.407707-1-ralf.ramsauer%40oth-regensburg.de.
