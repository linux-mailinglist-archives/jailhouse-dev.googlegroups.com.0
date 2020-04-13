Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBK4Z2D2AKGQEN2IG7GA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 458421A6340
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Apr 2020 08:54:36 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id i61sf8457034edc.2
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 Apr 2020 23:54:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1586760876; cv=pass;
        d=google.com; s=arc-20160816;
        b=VkAWkgEhQ92fcSa7VZQjK9rNQlEls1tV2PXdU1xeUvwwO9Kk7tR1YnSr44j/OA4nMZ
         EqmhIuTfLPaz/JfV1YvzxE8MPXldFzKrdk9nSpJ5tfGO/6ByW+qrafE4z9um5WXMcj0o
         dxJL4iXXMBCWX9ISRggidxWO7qY/LFzykaY1ou9iMoTIyUfooGMbn67z3B6dgyEYdXkE
         zrJxHCiYluSAaRiK5V9SaIhb5NKS3sFd3hcBC40hWdidePu2N40inycxqurRLhT05TXb
         Q8D1SotXpO6B7HWu4ian+PygNU5osBBb9gfXu0Nu/krt6t4zF5afTXvoI2glZZZoFhQh
         zF6g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=YKu1Jk7fSMzRAlV4YOp2zuqOeoel2RAatPqR9zYmV4g=;
        b=fVyYjHQwL1qgWRjljqqDy3Ang5WY3v1F8xDxsBnTS3w9EGBwhD+3Kc35tMUnr779Dv
         +txaE0+hhyfuPlNFr2PAmwJrbZCyhtYmU4i/TgapQKf9alSyt4Iv/FuPQVbVN9fAxbJb
         CkX08Gs/4kb1stT/OxyUwZsUnAAVUSBYqAMriuXjoCpmQ3kW2vpOuaK0QPuV7tp989Jb
         jRuDm3+XiQD4S+UsAKeVEnjrzj47e0udSEQlERdHw41U2OkjK9VF5ec2w9IEoGGxnwas
         oOUGH8JK3B40bN6rE8XYsA4yPYuRl1m+fjoY6ZlOz7r1U/giPlS1TGsw14bzCcd1QCGV
         AIWQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=ZOzABJwj;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=YKu1Jk7fSMzRAlV4YOp2zuqOeoel2RAatPqR9zYmV4g=;
        b=Yzqjg+L0cEByxYf1MMx5xWKqH0mcHWsyT2V6itrjN2NZBeWr5ARdmE1s0oTwoJPazC
         TVIlD4+PmtNDDOtg1YwvTfTOmjsSjsITXZkLGs4Rvo6o6ZmVUygrKaobiwSj+k3lC0xv
         B6xkqg6o9IcXRb4AjEqI1R/Arht5+i/rVwnPAnjMaEJBvHzThBMTZRMjicdPvIJyt3Rm
         aG/0DrYg8P0vtf8/VlKVde7gia6i0y24sSzxwx5q5SJUFYW0TQe8C2RU4bCFMZkdiVkQ
         /GX2XQbampWlLXJNcJTS/DIOEWVf9ryXLPdauprcmR/HTgAVGq71VqRqSUqlaMKUxjN1
         iqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=YKu1Jk7fSMzRAlV4YOp2zuqOeoel2RAatPqR9zYmV4g=;
        b=CocOz7jgvSSpX0XQBLOZEfMQ/DeRvFnDYzJel28HEs3NyQhUccTegC868u08WawxKz
         U94YSSDtT4vLcVQG1WDr8V6keSBlK0J8vM6V0qzto+oihkJhF1/fOu27h1UXSGJOETWy
         Eh1nCOvgeAQhMs9yOtUmUE3T1IIc6iP+g0Y+QqzFMys8WLfFtJn446abRcdtA8AlvUwp
         2AIpWIkgWlBrsoTJeQoOpWyDkCrgih1CMApygYDc7sn4HqpNKSEC7nZccejrrBudwzfF
         1Be+WrZCe0zLccH0d8EegyDSRmFN0w9ES63z6gcygQte+252eeoYGjkBTHkydtZShitn
         wk1Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuacVZVhAxtDe7YQCV1CUuFtSw6KuPfTUljyVDqf7HMJc+ZXS8BN
	P91+zFCd0VDqrpPB49i7nf4=
X-Google-Smtp-Source: APiQypLCIgavgqFOKHwAydEwkqISewVu8eQcc2SVLrQNvjC3VTgB9pqmH4SXMN3XvzEhQptF6p4L5g==
X-Received: by 2002:a17:906:6b10:: with SMTP id q16mr14641176ejr.170.1586760875960;
        Sun, 12 Apr 2020 23:54:35 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:a2d2:: with SMTP id by18ls17853384ejb.2.gmail; Sun,
 12 Apr 2020 23:54:35 -0700 (PDT)
X-Received: by 2002:a17:906:f1c3:: with SMTP id gx3mr14784989ejb.25.1586760875340;
        Sun, 12 Apr 2020 23:54:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586760875; cv=none;
        d=google.com; s=arc-20160816;
        b=pBgKf2MCrJTgqbZwvPWqkolorwmbyfdz/ocRWRD2jPEsB/IX7vlV/BpiUCGOahTmgc
         okdXHCWRk4Bg5Tj/DSMiyCDK4nQ6tDOQgh8+h9QlHjQRRcezsGYVKXBimZcHUlcVCKUY
         VY0mPg3KcydEPElNQ16c2ISzqVd8580+dkTzTx2N40gGg2ihhp/n0UEkvTazodtZDfJN
         BUuTwr+5BpO7OVZFhxkvu68HkM5kebsJRUCRSgVUHT795aLeKnZCe5+ZbnR75kz8dWep
         w8NtQfqYcS3nJ+t/3DN68+xFC0qs1vX8jC5FLHEqXklNTzd0Trznng9VUWS55qPEvJeL
         Yb2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=8KSuWCYOcH7a1i4VH6viuvU0YWqVDxOsGmmJ1/D/gD8=;
        b=UG0YA8GuudWjRF8AHo7n0zDzZYITzykdOQhlxjHU5R/v6RGccT8f3OlcN8tfHr1uaG
         IfEDNadtQnC8PCD3bKkUN6RTptsPQZ1LVxLOLjgPnUyvFmOxsZYHQP1pVwDcu3hr18/9
         SFpY5XAzAlHALWVGjX6jdf/9nVTGRdniiLsSQj0r4mXT/bVTzBLRUl6beABNngKhXEYv
         EdEK/sLaglSqa0Vma/FEl805C3kqdSrO/4Bdz5wfF3mUD9leo6t4jDZBheEIGWIz5rg1
         OPpaDlO4dUo5bw2RvkE1lKaXNuUOuoGSdSwdfmgoa8YspcpZ2vIJACmU9Y6B9AZwyiTz
         ITUQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=ZOzABJwj;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id hh9si328321ejb.0.2020.04.12.23.54.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Apr 2020 23:54:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([109.41.193.243]) by smtp.web.de
 (mrweb103 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0LgpNC-1isixo3JIc-00oHO0 for <jailhouse-dev@googlegroups.com>; Mon, 13 Apr
 2020 08:54:34 +0200
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 08/13] jailhouse: Prepare for adding more recipe-shipped configs
Date: Mon, 13 Apr 2020 08:53:50 +0200
Message-Id: <b175dc3e57d49c50539e7902ff89e9a5d9dcc9ba.1586760835.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1586760835.git.jan.kiszka@web.de>
References: <cover.1586760835.git.jan.kiszka@web.de>
In-Reply-To: <cover.1586760835.git.jan.kiszka@web.de>
References: <cover.1586760835.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:8158OPDpLjclwoFOpLJ1+745mUn0Qcd3JJck/sJ9bWOoYqSZxeh
 Xz7X3LCfzj9IV6Sg2g1G3mqueQvYM3B32eeH1sOnRPKEbxJatbKErEI7uX9tjecRcdxsH4b
 bgHrE1QMrbpIBvDkUrs1haXTASNibMi4+9L10IgvFypC94kbG2ZAS6rLfVGS0wdVgUwJ4RJ
 9ZKf7a2gN2Y9CV+v/LqVw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:b14/Xs9rKIg=:GWFLB9PEVbMZ+UrHu9RjMF
 9Eqc7iN8VjDyAjv96tA7sRM2t38moy9mrCTigCCw99ktsgp0Zw6U7xdjzWq0fZ/9M6ysnKWQN
 Qyw8BsBrECpP6XEg1nQSA+tUPgEBUZtKA4DV4gXzA48WdyFpCeBT0iD88Aq//Mea+5ZAJCfK+
 obRlZ38tZ91F7UIbpS967GUZllQJFPKzXEuG3rWMEpVIdoROLCOdEi9K+C7XlW/PwjDYjUU+4
 wDXhjRGpwpR8AIhgPc/EwsM/tIA1b4r+Yag9hp4aFI8VBgV6roTV0FyECRz1e7bsStRlW6vLG
 XS2ja268niOJbhAIOikUAi0ac/R37SAo5PEJf6xp13dCW2YIYmkoAQsznhpyzOmrFjbTduazH
 H6yW2hYDb+2cxOw2DBvdLZ5OuWUHfZg8W7LLWavWm5wu8Z29cpOdjsonutpWb1fNuamDFitPC
 gHbVVpIhrMu5oRqhDKOSsjfSMogCFEhk2WADFWmAOEUBx2XE3BW85eyq17DTXEA3PLmqsU8NK
 RCbDYyWFtxWwft2NacNFqNoQGPS7f3pV88uqqM1pOtYA2f6v654jXNVIRVHEksE4lJTDDGtV8
 olgvwTDidczzORnR2amQTw62yP5TF8Jl5GL4yylxlxrrGqGq5hRg9Jc9aIq3BrJFS9thScuvF
 GS7iZ0v1m4EFUlW4z0jI9eai3MtApQwk/VJl9OEdvYTMSPFWe9U/PnS4ONmdnqLgfzW7mHqNL
 gb1zcd92fM6WjH8ODd9ifyfdSS08B/Ndp11LqlYZgbR/u0WWorsUkPBjbrsNdto7+mzeOTuvU
 SFpt/ujmXgt1/GiRml5Zp6v+dm/7CpUZYMljjhsxcH9Yo8SWnqvKyhbdSX3nM/CTpweBQziWE
 gIBsVRzaGEz9horitky6SBwGTixRO/EKMWXSJ8OOgRVa9XQmNrbtu+kjhFXcNeXh/tDs98jBA
 ED5RvrgquxNgWbDPZa5CQa5y2pZa8hqMfwPdn49D9IpfX9vJIoyvUTjDCLqtUb4Je4rgbbiQK
 1kl1QD9/B3HLUMiyzlhCGxOr3cE1M6iLAf1njK73YmiozZYJfyNRGd4Sqecu1P1sM8S5zjijZ
 1ipbUkG7WCaLZxdLXUQqCZ8ekYPBkHR08GkfktgRuuAjWJKU97KCpS7635EUnus+bxu2TO6DD
 A7Doyxnsr9Bmf6i2BwGo02Ossydm493sTzM68By2QFunNBQVGSQWM0Ysdc9MrPPZHnJDq/4Sa
 LMQYK5WKB04rCbbb2
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=ZOzABJwj;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
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

Simplify the way to specify configs that are shipped with the recipe and
simply injected into the build by copying them over. This is
amd64-specific, so do nothing for other archs.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-jailhouse/jailhouse/jailhouse.inc | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/recipes-jailhouse/jailhouse/jailhouse.inc b/recipes-jailhouse/jailhouse/jailhouse.inc
index 772f2e3..fbca1fd 100644
--- a/recipes-jailhouse/jailhouse/jailhouse.inc
+++ b/recipes-jailhouse/jailhouse/jailhouse.inc
@@ -15,11 +15,17 @@ DESCRIPTION = "Jailhouse partitioning hypervisor"

 LICENSE = "GPL-2.0 & BSD-2-clause"

+EXTRA_JAILHOUSE_CONFIGS ?= ""
+
+EXTRA_JAILHOUSE_CONFIGS_amd64 = " \
+    nuc6cay.c linux-nuc6cay-demo.c \
+    "
+
 SRC_URI = " \
     git://github.com/siemens/jailhouse;branch=next \
     file://debian/ \
-    file://nuc6cay.c \
-    file://linux-nuc6cay-demo.c"
+    ${@ " ".join(["file://" + cfg for cfg in d.getVar('EXTRA_JAILHOUSE_CONFIGS').split()]) } \
+    "

 TEMPLATE_FILES = "debian/control.tmpl"
 TEMPLATE_VARS += "KERNEL_NAME"
@@ -39,8 +45,9 @@ do_prepare_build() {
     fi
     mv ${S}/debian/jailhouse.install ${S}/debian/jailhouse-${KERNEL_NAME}.install

-    cp ${WORKDIR}/nuc6cay.c ${S}/configs/x86/
-    cp ${WORKDIR}/linux-nuc6cay-demo.c ${S}/configs/x86/
+    for cfg in ${EXTRA_JAILHOUSE_CONFIGS}; do
+        cp ${WORKDIR}/$cfg ${S}/configs/x86/
+    done
 }

 dpkg_runbuild_prepend() {
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b175dc3e57d49c50539e7902ff89e9a5d9dcc9ba.1586760835.git.jan.kiszka%40web.de.
