Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBVF76D6QKGQEAV7HDMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3B42C16B6
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 21:47:16 +0100 (CET)
Received: by mail-ed1-x539.google.com with SMTP id b13sf7018428edy.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 12:47:16 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606164436; cv=pass;
        d=google.com; s=arc-20160816;
        b=b0oDZYIaER55yg+DoOam+9XsTggdbEiQJuzTyb9uF9uAfulMP4u1kO6zBzwG5NIDz6
         e5EB1P5N4Btzm3qvsvRp8HFpT9vXAeOC8VbJ/TrgupAdm82p1ZSHUEaS0LTkfrXYs+3I
         Gi83aKK7UmC/9iJLf3EXqCPj/6qmBiNF6V4uXVAiuEriHCMjfAdllJhKDbJkaZQ5N7YI
         jBHDmEKNUs30oJedC2m2cuQZVwysNzqAI0udLcTNLNryzbFP7ykJbsCz/CcxoEGhCQ/W
         DMxuIGuFVVAv/lYMpTt/7qmL3TMUsQFrcDRL8es/KKPCL/CbofbPneSAy5FbCaWAmJMn
         42kQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=HEvj7dPGK2lyRZseU+o6M90v75XCJuJO4wKoIEI8DQY=;
        b=odsnAncnjoN8XT7y8FaocZbKWKr4CJhM0xlot/cLZSeM1r3ckwgrAETM3lpTfaempw
         RU+22bpeGeXklPsgBp+Zr7Td315uhasq0Xay7QyVqCK+KfVI47q/oBI076y7qibj6OO6
         23/8Y7wQbbAK+mOtY6TwQ+37Le2NW2417IAX4souzEZYLiWsUHOC15S7bASjcuIFxQa2
         j1AG1KGIk4v8HV6pu2/N5OhNDf1PhKA5gLINYSUZdyatnTu6xGbwltU8EUzhgGFjMyaR
         WrGbJX5XFue7aAfR3FKYTjZSI7GmleLGHj9Mwmj1m+PUWISHs/ufVzOOmr/xSwegUhOK
         73Jw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=WQoXHWB4;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HEvj7dPGK2lyRZseU+o6M90v75XCJuJO4wKoIEI8DQY=;
        b=BI09wYpf3AkojyerOOBIGkbZHrYzryWLb4ODo143Gr/xuSSbQ5D4W7yDzvUpy0gSU/
         HTQ62M4FaAR+8cLcFCr/l7dvlUZQwYxC82k4oGkxrPt+PoKkTlJNN9TGF5JkRnpgxb57
         RLtsSo1CaTvU2kiWosxuMCgqvPMajoGaoewhlZQQA1eSpRD1x1xww1NFehDAYdFDKROV
         sKXv/32B6GcYyfJmLL/R4lpdX+RVS+x8vE7+mLIto2bOFjA3K5BAXDOXWe1DYbPnk/gi
         VVRYWnyzypsSw2mCo2YS1wvv0KXiiCROzKlXnwQ93NQyu4yUUQ6GyNtHnw0jz2xujZST
         UQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HEvj7dPGK2lyRZseU+o6M90v75XCJuJO4wKoIEI8DQY=;
        b=nGB7jQTSl+jYPoSodbqq07D69PyiFm6MoghKNOVlWcOHy18/eiAehz6V2pTvV30lAt
         t/gP5zwJUOlzsUfeHhwofV5BRQs8DKo6OTEhcFPQraMgMaArhhuLPLawPdLg9SAeEWzy
         FNHL7xmW6yGwzMWi2jdX+GO0SZI3Btd0wtwSSW570PvgZ8zldfQymr8hClgLzJh+gQBN
         Sgr0R1jfBvUE+BBRqqlhbX9cusatdB/mJFlWe6xg3ATOi2GZFcFN3V8WGeJC98siV2Qq
         eQxItLLSrJS5KMx+gQdhidXy69cHg5ycYucDKUhmKqCNXcR1DnEfg+EYIaxXDRGECkmx
         mvNw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Ead51LjDb/t2DYNtv0RgPAgscabTUJkMSgLVidzBKMqe0y48+
	Hv7DdPCwOWqI8aeifg1Z3z4=
X-Google-Smtp-Source: ABdhPJxbwjqYKCAxpfEFbh95mmL6wztiqFTru/FKI9OkRMI0DnxQtT1ThpTr2AJfgl7OZBcLIWC7Yw==
X-Received: by 2002:a17:906:9816:: with SMTP id lm22mr1321608ejb.313.1606164436616;
        Mon, 23 Nov 2020 12:47:16 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:a190:: with SMTP id s16ls6650858ejy.3.gmail; Mon, 23
 Nov 2020 12:47:15 -0800 (PST)
X-Received: by 2002:a17:906:a996:: with SMTP id jr22mr1305649ejb.463.1606164435677;
        Mon, 23 Nov 2020 12:47:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606164435; cv=none;
        d=google.com; s=arc-20160816;
        b=CYPegUIqpz48TRIaqKUdhFBzzZj+spdcExWBCMwpo7Y8SP+345wQfYczBqq9aKCbk3
         pkS8j5Zg5rapHye/GBvWAdGwlwxKIuIbADtlvxu0Ww29yFxGbDoZKWi9ssFRioHfiC6l
         956voCm5lsBUq75lqlFe8d9ko2lQfWsImq1kJmmUvAbjMMAaPYhm5595e86tmNhZbyTS
         Ggbo+4jaDJi9TTtYoimgcx6r/GyGKY/rs88jRBua4SHTGm2S5W320L1V4s39y0qvPafq
         ofWpwLN1AdJJXdQQjagTrZG8OTyqrS1iQd6yNtiqVLtf/tC8clffgIj9HtNLHmOuwA/L
         UIVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=WUQpsXySTyrnspZ3QhwXYzWKA+piueVcpVRPFXy2J1A=;
        b=ybCRF2QO4Lou4DawQOm5mZjqaPP9IHtHI+MKz93fhxxDfuC3qmP3Q0SsNDQMn91gLT
         F6n7auxVlfWTVb3SNgl2Nqtt8xP4Da00fmjvSkQGCaMtUmKVCnr7ncgXxIwIqUC7EeJ8
         nDnnxhp+jKPxO3AI61NuYOtPD5RVHlZc2vuFxvRkIFXpSz/2nV64G3OWIHTU6oMEYmpV
         5h1WSjTUjmSl0WwT5u7eNJQgayRcwCL/l0O3PepZGNeZOoBLGFGO4Y3HAw6aPddKv31c
         SSj5G2NcoyPcZgVGihLFMqs8USTbU9qDM2UhbTdAmLP+P4hDFHQTH90RPhccbgpu9Ej+
         f4Jw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=WQoXHWB4;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id v7si689449edj.5.2020.11.23.12.47.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 12:47:15 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4Cfzjb37WQzyTk;
	Mon, 23 Nov 2020 21:47:15 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
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
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id a3NiymR7W9uL; Mon, 23 Nov 2020 21:47:15 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CfzjZ5f99zyTj;
	Mon, 23 Nov 2020 21:47:14 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com,
	marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH 06/14] hypervisor: protect inclusion of control.h
Date: Mon, 23 Nov 2020 21:46:05 +0100
Message-Id: <20201123204613.252563-7-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201123204613.252563-1-andrea.bastoni@tum.de>
References: <20201123204613.252563-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=WQoXHWB4;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
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

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/include/jailhouse/control.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hypervisor/include/jailhouse/control.h b/hypervisor/include/jailhouse/control.h
index 76eb0428..2ac7e2dd 100644
--- a/hypervisor/include/jailhouse/control.h
+++ b/hypervisor/include/jailhouse/control.h
@@ -9,6 +9,8 @@
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
  */
+#ifndef _JAILHOUSE_CONTROL_H
+#define _JAILHOUSE_CONTROL_H
 
 #include <jailhouse/bitops.h>
 #include <jailhouse/percpu.h>
@@ -298,3 +300,5 @@ void __attribute__((noreturn)) arch_panic_stop(void);
 void arch_panic_park(void);
 
 /** @} */
+
+#endif
-- 
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201123204613.252563-7-andrea.bastoni%40tum.de.
