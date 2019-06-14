Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTEQR7UAKGQEBKYTEPY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C5F463C4
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Jun 2019 18:16:13 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id a11sf1245245wrx.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Jun 2019 09:16:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560528973; cv=pass;
        d=google.com; s=arc-20160816;
        b=tP5k6wgPXRehnql6JWD0V6o6L82TkGGCTTJ+jqYaAcZQvUX7wONMaVZ+3VpnxP3Tgv
         IWcMh31olWsHM0Fc8jCkHyoXwbTuUb0h+pK+QegwT0IufT4/6O+ThTpqO+DQMEs+OCIy
         g3vOT72xLHs46Qo/Ka2Pd60zipJGdqjBKMflqf3bTmOjtBIuYMz/ePJpgf5ocuXRPcPj
         xhTExEpnUiomemd1KtkMnN6zLNb2fAQF0wc0bN0I21T3HJ6dwAPjLJxivWwNqoQ2evw0
         qfu6rLtKjrnC5UnMBQTbEENpdNkoUiQwkrxW9aNIdOhz5eI6IkM25VrvUCDpu22Oy4K6
         YJtw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:subject:from:cc:to:sender:dkim-signature;
        bh=WgFuxLlMSDoUag/97cE+o7f9dTCIY0EASW89GlLkYXI=;
        b=clKj7DnI5t+4cs8JvkkvoemeFLj6qOY0QPCP2K1Qsc9Vw0d54uaHkdB+c5DzojlF+4
         U8JAX3hsrDct7LXCohYjhEiTSvJ57syfsJUsnSEzwHsXxWjcjA2zb9H1Z1BrEXOafdA3
         G36bfvq6KhCfMAJelXRQXczffB/YqNEyusmLhgaFCt0xnvuUn2Ddq3S8ywK9HnJpmQbR
         fAU2uyfU+GpLNrON3bOHl5Q/3PNO5Y5JtGAXRTKPXFo20t9kZKMu2ny6ZflVjTtumOpI
         MCUTpcdSGpNDkhV3eot2RYLzEM6/FOeGPO7RqRf1rOpDkajDJ1+87hd/0ok/Owu8lVQj
         l8gg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WgFuxLlMSDoUag/97cE+o7f9dTCIY0EASW89GlLkYXI=;
        b=XRDt9232E50GD35UxaahYvNquFVJpvYpKS7AA5zYj84i0V8W7uGVDD5Gy7lUTFtfE1
         C4rnrTZhiBh9A0XYcAt0ijAk9lRPv6iChEXjOi9SCxTk0RclI89jNeMP1FeTXigUov2J
         oPCmMj9q0KXUOrlpdZ6vJ5nn8l42ZiX18eRval95ZdiXyLf2HTH/CfFmCC/lp1aS99v9
         3Udj4h5vKL4/rjRxV2bUaostyTpdLA9X6vdxEprwe6OjtAX6Gje4JWYSO4i13K4ToCLo
         Lvb9yOqecAR1KnYLPN7o0qeE4xHsNBuSnLBCdnLK5/mcp9rDs6pXMPiYqAHMwlfPpW6S
         rY2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:cc:from:subject:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WgFuxLlMSDoUag/97cE+o7f9dTCIY0EASW89GlLkYXI=;
        b=DMMnQPCjcF/bwMi4lNDD2V1znCHl+zKQ/B1NYltA+x80CrKR01T649Gm92r5aCfRCT
         qW94l/yFSA4BbMByl/2z+xNp/2sZDVLTaIv7lGk+rGYSiOSUhgVqDtkqjbLUQb+ZNlYS
         xQ2QyscBb4Fo/L1Ujf2sMVT3c9ELewuowqgur6jDDxSmIcu0LQ1ROC4uMQoWdo+IIboR
         fvADZ8Vpj7t9BaqsTBMpylScZuOy0VuTFpU/0iIuOrMYfOAWCg26/owUoHTkCVqjYSUK
         uaNo5bnifDvkDZViuiUaFPDNfwEz3O34URknC9w+/dyg49ci5onQql7L+5C9/XnLRZrF
         ruLA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX/7ZbJVvNa7vKZIYpv0jgxfaSRM4fKgVk3GPqG633rwrDNjPqa
	Kzs0qUYDXsFTxZ5EAsmYPnc=
X-Google-Smtp-Source: APXvYqx/Jmd2Rt1OMGlQlph4tABjmiWAlpT/PxPWZtP+kOPUkmi5nV4fQlWIbg/ApXf0/OIyWQm2qw==
X-Received: by 2002:a05:600c:1008:: with SMTP id c8mr8811732wmc.133.1560528972836;
        Fri, 14 Jun 2019 09:16:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4d89:: with SMTP id b9ls2355158wru.0.gmail; Fri, 14 Jun
 2019 09:16:12 -0700 (PDT)
X-Received: by 2002:a5d:4d06:: with SMTP id z6mr39686594wrt.343.1560528972117;
        Fri, 14 Jun 2019 09:16:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560528972; cv=none;
        d=google.com; s=arc-20160816;
        b=VLNQZ1sEEufxF6HbkN2yEL4ywSikVXAgQH/kAErBzImrU1NsRaBRj1hYqISMgZ05WN
         gwumfiPJJw+aaith++XvxGuS67K6UCGpEZP9XVkkG4DLWbnKdJRdR1dJ/RaSIAT2f1FK
         Njbo7Q4BNn4WHXI6hcqp1WQAXuH/Jft+Ba7ytun0KzHldcNV3YuBMxOadm/89vJkItEr
         bWo+tk3fKvd6QUFwqi2nt+yWddpktlelV9YK33XvUe8K1ERiBp8qxd3IGlsopDDdy0xG
         1IteGwZz6LThT1ZRXJYg+nAhONXBC6tgAFdMjFWLzpuVZt8WYxGk9B47z4hKAiHPlj/h
         dy2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:cc:to;
        bh=juhNU/ZwQSSF3mffsFyk2ndLIyhfPDsjirdehlBSq8M=;
        b=lYrVimEQbtT1zQOMcbSFyt2pkdcGYk5pcFcfLti5Lp2VylF7dhhpoi8Ld+oXlZ/7pE
         54DTZBUklhEfBuosFTcWUwARkYDrBDzxNo5oPgwzc/0gSH8/rMG8txkWDAFcwtYaMUO4
         5p61jegkoG3yGQydr+qGJS3Cn1LJ8HkwUV64d9ZSjUTaZw1htCShxmU0ySohlb/+d0Al
         ZAyoHi4AVUPowdm+i8UwJg1temGYpQHKqYh/rF0prSlGJ2KKPS5j+X8oQKo4H4P/dDfv
         wQGp3rwDRrYEyoLhMJptkmCsoR2a47xNP09E0ghjx9jO0wrMBsTyOqzE1zeY3kzTTwCN
         MA+A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id z11si324614wmc.2.2019.06.14.09.16.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jun 2019 09:16:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x5EGGBkL029019
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Jun 2019 18:16:11 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x5EGGBLt032383;
	Fri, 14 Jun 2019 18:16:11 +0200
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] inmates: x86: Ensure 32-bit targets are built with SSE
 support
Message-ID: <7c9a2eff-56a9-18a2-1ce3-5ed801c7e098@siemens.com>
Date: Fri, 14 Jun 2019 18:16:08 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Not all compilers may have this enabled by default when building 32-bit
applications. Ubuntu does not, e.g.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 inmates/lib/x86/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/inmates/lib/x86/Makefile.lib b/inmates/lib/x86/Makefile.lib
index fec117ab..6190315b 100644
--- a/inmates/lib/x86/Makefile.lib
+++ b/inmates/lib/x86/Makefile.lib
@@ -63,7 +63,7 @@ $(obj)/%.bin: $(obj)/%-linked.o
 
 # 32-bit (i386) support
 define DECLARE_32_BIT =
- CFLAGS_$(1).o := -m32
+ CFLAGS_$(1).o := -m32 -msse
  LDFLAGS_$(1)-linked.o := /dev/null -m elf_i386 -T
  $(1)_32 := y
 endef
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7c9a2eff-56a9-18a2-1ce3-5ed801c7e098%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
