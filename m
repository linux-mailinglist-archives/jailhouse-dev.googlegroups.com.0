Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBXH7SPUAKGQEEOHQRDI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBBB4706B
	for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Jun 2019 16:25:33 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id b3sf8092249edd.22
        for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Jun 2019 07:25:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560608733; cv=pass;
        d=google.com; s=arc-20160816;
        b=M/S5fEeJ9ATi1AyPOkUzMVqnTdg6PU9BC8zuJ9P2NWgeJ1VyZJQ7Kexkm/aOE/wT+U
         yuFbFaM7N2VHxsW1oYbwVXKCCmEGJPoyiix9I3zbE98/Hp+yxcFtYGqQ5ihgbdh8ABqM
         ktCDA8793UTZMUQbsfP7uA05gC4MIx5zm/Iz6Jv1JgssHKsVD0PjGMiIeVBLYav1Oz2X
         CY6nkGYJ5vgXs0krtZiJ8wvVVR27ozoE8CcC6Gn2ns15O4m35SoWSkfnrDYW2zSHZ2Gj
         NsxF2iT4dtLfvx311LT0La7wIXNyRGse2dvJKDNx4y/PfV1vtselxlqqj7NLrQCft0uu
         mC8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:cc:to:from
         :subject:sender:dkim-signature;
        bh=PC1zI4ClrrkkH4PDPXa2I7+n7DxG8RDPCLRuTNgBXuw=;
        b=edfToZDbp+3XlBG/IKuT+TfaOB/ndNpNhywGMYv6ZWJENNO5y84iWesUHF1MeWBo12
         s8o07XmG+QzzyD3X0yX1pghzic0fPi5FT23FLn5NYI2FQKwXRwOntPY1KhVFJxSmdeZ8
         A7AmQMyqn/4cmXNDzLc4+AEjsr3zWCqldN4dcaWnLJM9OeRa3QHBkFdLaklJFPJY7hbT
         dMjuH4J7aeBJX/sb8wiKIxtiECXWchuGG+KLNWo1i8rdN1hipW+FYWhq8nflfb6hRLXI
         g6kFjxQSO+dT49zUnboUP9oj189AWWAJTGCSjI2VkAIRpatv4ffih6kby2WKSMoq1T+1
         SK9g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=ougRbcKL;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=PC1zI4ClrrkkH4PDPXa2I7+n7DxG8RDPCLRuTNgBXuw=;
        b=X+TGyCP8mCpyC+Mp+tWjJuZZriU4Irnp1kx1AeYxJQtggh1S+t1pAL9hOiQkGof+H4
         P8FFxqun0yGBVmDYA4y+4AB9M0ZibtXmhYirtI4pyvHAklOPyctTMa3NZeUiWfoAJONs
         oy+QPV0IpoMw2EGQgCWIIGhJJ806jPUD1EfMnavepRhnGtYb5fxt7zme0j+0fHmBTDEp
         x1CUa0ihM3eV/2NRdGXYuvAMV9tXotB9wCgLp4Vt1zYrvx/hiUcTFcNzpGoQaTZnhVT0
         VnICeIrEjgiJITm2PtokVWrEXNND7FLCmNH18y5cFKJzjkP8tuegc9s6JosPgoV9xgVM
         nOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=PC1zI4ClrrkkH4PDPXa2I7+n7DxG8RDPCLRuTNgBXuw=;
        b=EkfHc6enwakBtXQpyGy+4NchQh7CyNY33cdTImMRMgFaoFYN5uAZOgPaJcBK/nh2lF
         OQrx8+51ufkaCeqsvwk/MjN2qA024/H13PmV/5EaRak/dKDa4bDTqIrItg6xfD2t2fS4
         un6Tuup8YtoIEOBDwMCY0o/aGs8Fgd3tnNJlpxB+tmd6u1fbC6Z4+e7Y+sQMRVfGxXXJ
         rdOlRxgghcskxaivku3v/J8Pf9WmF5CE/efAbLVxjyFi/vEsCl9glGvZpIzPlU0YuNI8
         3ln9OIOa6MVJ312JxWxDSsG9BDIBiSZzUbXjArAgvT0YBNu80DWN8uj/UuKTnCJoHtl6
         Pp3A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUAdhrw8jgDWLb5EWU/++DfrnyVNfLNQgRKl105n4dyZEpDIcf8
	rrtwS5TpE+JWu68qbWG2Apc=
X-Google-Smtp-Source: APXvYqyWGseqjtFE+su/GUQ9x77+gUljtDhqFsiM80kB7eP74GW6aCzItW9hcI2XzS1SA+CuQrCWcQ==
X-Received: by 2002:a50:97ad:: with SMTP id e42mr89244579edb.243.1560608732892;
        Sat, 15 Jun 2019 07:25:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:aeee:: with SMTP id f43ls3488522edd.15.gmail; Sat, 15
 Jun 2019 07:25:32 -0700 (PDT)
X-Received: by 2002:a50:a56a:: with SMTP id z39mr29710532edb.107.1560608732478;
        Sat, 15 Jun 2019 07:25:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560608732; cv=none;
        d=google.com; s=arc-20160816;
        b=w55MJw8MMe6Mr78agVbz279xumvYSqeH1qM+/c0H2c6RhbgRGLsQ5QDpT5iELp6ODJ
         57Uf8S881k3X0hgyxHPnccxPeTO+YIDiobO+rFQkipLoLMHWU+HntHicv2PKuXinmGTe
         kMtxs28PhHv9BTSOnDIMeiJfrDq3A3A1UjSYLzfjVJrDiWxtkdsE+MW74xOjD5nGJpvx
         DtaZk5nqLLWM5UgPMjsiW4QryHdeyMJKRDnaPNj8wwQjDWOSty5dAYzdfqAYdinSATko
         rUMvPoNB9YhQ8odTWXHT+Vn8I6/gHB4h7H7WFWYmPEa63gZ5/p1WIUPLMIP001vXBEmX
         jpOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject
         :dkim-signature;
        bh=oEfWOSiCl9V+m7fKQlmmRMO5ZOUdgElJx60LxFb6LGY=;
        b=0eJ8L/CzveE5vNc0gxaExjP/u+gEyMNFEUGe6nrSNs2XWEf+ekNAV2WrwjzMC7liwC
         8WonmEdSFHjMkixk7c2wtKIRlO47vVVAizSpP+jMK9HE8mL/N0MrktjCcwUYLke4wM6Y
         g9UXDpMCNSrnzxinkg38V8+FUUJVB/tuCvO3cN0brD9ut1LOVof38hz0h5p7BTaNv9s2
         K/4Fl1m7+RzmtwKtO12De2cAFP80zrUDCiwylblEDxNUQru84xE0DP0M99dkfUYcM016
         GIgILlnmCbu0YKUq6SFv8G6HoawFVfySkvvofzXObEdojXsOxry0wgYNPF+RXwtLnA2T
         w0fw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=ougRbcKL;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id e8si231971ejk.1.2019.06.15.07.25.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Jun 2019 07:25:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MY6sm-1i6pcx37IG-00UreH; Sat, 15
 Jun 2019 16:25:31 +0200
Subject: [PATCH v2] inmates: Add missing FORCE dependencies
From: Jan Kiszka <jan.kiszka@web.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <b127de14-55e0-d6cf-e588-da367b96e19f@siemens.com>
Message-ID: <f5cca3e7-99ae-5f73-606c-270b29bb14e0@web.de>
Date: Sat, 15 Jun 2019 16:25:27 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <b127de14-55e0-d6cf-e588-da367b96e19f@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:Pn3040K1jtoi42sHcnlY00lY1G2rSiK3P96mRR/b8+0tfJdih9d
 0Vt3Y71992kuEZBC+zcpISAl/i2gFdoyc9v2YvUYMGdcE/sJfIQInfp7CfuBZu+EACb5juA
 0xPvCfDMq8BWoHR1CpnZnVeqR8zg0X7pMX4gF2A2TTiJ5EZ6ED8FsayiYmZdhDzbZePZaPE
 REp2J8YqvR0AGM6srBByQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:k8F/htTgiI8=:OCSehbwPdasdfApbkkx1bV
 9Ocw3vl+JfeVhEy1bv0pdxKJKdHWeTgAdzND2mb1TZqhKtAQcwEiC7QrosgHnwZIEnFGhBzSv
 F4cluKGEzD/JGoNs5sbXBE1JJD8rgEaDmCBFg2zW9At8THWTfkWECxLwblicemnO//j+/itoU
 ynDDqadvah3NYtPyGqnocubqWJN7CX5weu2zE5S4WkL7z01PaQOtrvAGeqpidTDDst2RaZ9Wf
 T8jXvSAddzBJw+pT2F/HAufuXjWoO7orks7Oxn2VtUBMGmduu8l7/rtGIrQ16QmHIIQcSb38E
 m+q5UzGyYTu6soTKGH3zBwz6f+Fe+MjQJtly4W+CjZsvy5wnta2N9z/ZbU4ZwDp4WK3bTJdQD
 VYvFtSQ6/U10vUmDD4uqhEf0/dEHwrj4GmGN9b120QLnPZlzYojiSSwbfos/WOJ/BGcbaodBR
 Gxdgdw1Dk2bYwqs+JvoGPxSjZ0REHmaNisYqKrjHl9pfY+pgU7RC54uxM1egS843TNeC687jw
 hJJ4J4CCaiGo4xpEY7v/ZPNTVGUlqPVRGYZpiNkA4dxuiHzIRw9pVgi338nLaORsHJ85s6y4P
 RjJj0RyAg/S3F8IAZR1EfkeWXNbuwM0qXEE2I9u1jbSq9QaFByaP5qg572M7CGAPlaPEwUvUU
 +JRC9RTud9QtU+W2dVG1GJyrqo5A+OBBm6VcD1WFVOYfplppMsMKj+RySKnFh0Pzq36OdQiry
 7dv/PPg7VFj3+NvojQBwfJTBUhD3iBcF3Qa+hV8XlvGf3jjFN7CvT6G8olqRaeD/OhcTIDuJf
 u9Jp2hg4LkBymv1pwPhpdHwmZ8A1ocpx25AJ/CvLatGrAOZwDpxp8B2CVV1XSI6L+H6QNLi10
 +Fb/Z+gJWDwy7ceuurnllQViSrYYhMb+3HfB6pA5sSkeMUo3Onv7umWOsDq/Bc6x6iIL/8h7M
 CYI05yeHbw7zmvHRSE1n7LlarKsUjMVBtgYSgQXe4by7+RdN2FNrj6YPTJoCyhiaNQdg1pa97
 DA==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=ougRbcKL;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

These rules require unconditional evaluation to ensure rebuilds when
only variables change. Adding this reveals that we missing 32-bit
objects in targets so far.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---

Changes in v2:
 - fix targets

 inmates/lib/x86/Makefile   | 6 +++---
 inmates/tests/x86/Makefile | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
index 527436ef..eda484fe 100644
--- a/inmates/lib/x86/Makefile
+++ b/inmates/lib/x86/Makefile
@@ -56,16 +56,16 @@ cmd_link_archive32 = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS) $@ $^
 $(obj)/lib32.a: $(addprefix $(obj)/,$(lib32-y))
 	$(call if_changed,link_archive32)

-targets += header-32.o
+targets += $(lib32-y)

 # Code of this object is called before SSE/AVX extensions are available. Ensure
 # that the compiler won't generate unsupported instructions for this file.
 CFLAGS_cpu-features.o += -mno-sse

 $(obj)/%-32.o: c_flags += -m32
-$(obj)/%-32.o: $(src)/%.c
+$(obj)/%-32.o: $(src)/%.c FORCE
 	$(call if_changed_rule,cc_o_c)

 $(obj)/%-32.o: a_flags += -m32
-$(obj)/%-32.o: $(src)/%.S
+$(obj)/%-32.o: $(src)/%.S FORCE
 	$(call if_changed_rule,as_o_S)
diff --git a/inmates/tests/x86/Makefile b/inmates/tests/x86/Makefile
index 51c63917..6c8dc0e7 100644
--- a/inmates/tests/x86/Makefile
+++ b/inmates/tests/x86/Makefile
@@ -24,7 +24,7 @@ sse-demo-y := sse-demo.o
 $(eval $(call DECLARE_32_BIT,sse-demo-32))
 sse-demo-32-y := sse-demo-32.o

-$(obj)/sse-demo-32.o: $(src)/sse-demo.c
+$(obj)/sse-demo-32.o: $(src)/sse-demo.c FORCE
 	$(call if_changed_rule,cc_o_c)

 $(eval $(call DECLARE_TARGETS,$(INMATES)))
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f5cca3e7-99ae-5f73-606c-270b29bb14e0%40web.de.
For more options, visit https://groups.google.com/d/optout.
