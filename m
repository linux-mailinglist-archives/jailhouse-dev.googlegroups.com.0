Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4U2T2CQMGQEJTNOLGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF2C38C513
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 12:37:39 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id e28-20020a19501c0000b029020ca0c731b4sf5041908lfb.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 03:37:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621593459; cv=pass;
        d=google.com; s=arc-20160816;
        b=fqfuq4yV1V9OLqHz1dgu7MsDP7lxcb0zJ6Qd6BVs//trcivDshUTndyeRDO7woNetr
         06bMR1RnLiWsuMToPh6kXvFWJzdMpMl5ysjRvGsQryJZ/YuOChI64yqZ8l0B8U7l//eT
         Q4tCnUfV12cNbFANaqpLAXXTOUJ54WzxoP5JtN4wUcEh69xyYqchewpv+F+oAIsEbyXy
         +A7a+kkxA8bYCeAQEJ/OSC9Uqnt//Ff5ov+Kzl0bwxI6Ye/tkOtNfcJG+F9sx8OmBMR0
         bww+8ul1wrgcImYZS6CXNgI33lHnJcfQpgr5Q4LXRPaQ4a9dJQ25JodHTe7GXA4JB/Zi
         QldQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=QGtcNGXtmRQGSDuOAg9sz2m3XotvEsGbIeyREKmdBFc=;
        b=b/xzAebwxrvjf/dVFu1fJSQKwrpVtQpmJUlVU3jjC9TXTCrUoHBaEj9bT22UuOj1eh
         A3gnWJlRl6OHJo6zu5LyEjYnz/eGmmSXzHRUXURTFo3nyJMVyKcIq9ql+/hR5lWWEkqq
         edzbjq0lTjT63+3b9DIeyx/K5CScwEWETi9uEWB+adk3hMsh/Eh2AjkBfFHg9VUyzUgy
         iEXYSk+bYyK03/aAG6L0XskdAXhR0/UzfLRkwCPU0pxFjpLWrtWvlt4hzFT1RSHFVNHo
         9F18klNKlLUkyqOWfDO72drArOB98DRPC32cEhJu4OiKEBJlXqPukyt+b828lPSGM2Kz
         IKSA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QGtcNGXtmRQGSDuOAg9sz2m3XotvEsGbIeyREKmdBFc=;
        b=So9JATW7E3iTEwniPblzoMWgQL9GaHgPsvDeAyVXmgKj6PRY6dh6BC/OauPfXYZLHp
         3O6gwoQCRkl1ya8ViviTuiBY1WSp2koxzGzUpmFz3ySwQ1EjSe+gVE8sgNOl1iRFEclf
         UnCHgcd5mr9rbOeM/uLCA5kXyyTFEFKKItnMF8wnxHeuJvs8uoqmDdZdbavLcqGFCn9I
         ADFQHZbyhT3JZwgZzAGgmq5L7wW50U2H5qTfYaLQ2dZ/8cV0sFSNr+OIfvnzI87l6xDi
         xbZ1seRUCmjYPclBK0VnDFBFGHhKa8k4v1Bt3MgRR63Aag6ADKA6JuHeYu7JroMwfIzW
         Tbdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QGtcNGXtmRQGSDuOAg9sz2m3XotvEsGbIeyREKmdBFc=;
        b=mDG7RGMFlMrmYsCMpD5gjJMM6ksmdvm01XY24UFpwkyKbQ+tVusBQNKGpUB7/+2Ebb
         7dTZN0DrYZTmynOCCSZ1i3pr8Qjut+fWMCagemLbumdS/FWJRi63K80frbGd5UIPZy2F
         KzA8z6F3pApNa2hw35ZwJrIH65pkoM3DXnFKBKjzjHVZFFkUS5lMKQKhqTD9HIM8hKLs
         GZu387MMHOorhhyAcmXiVp/pxpWqeu9XRx/iwotBdGdeV8GOC90o8ft2VmoelpPiUpfS
         ovEbJbJeXscAH6hYdP0Y2UzV2n4dMdvPxD8tEEqAqB2ikN6UxQZnP8V8IKh62Tz6P/Fg
         ja6A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5339vC7a+jSFCF+IvHyjDCQRUrS3TatIWPK7x+TKzr/3USs2BILn
	EZwzK8ofgyHY1Y9QhZPOWmE=
X-Google-Smtp-Source: ABdhPJya7uIPuMfFNc86QidRKDtiJbE8BYdqDY7BfvLpGqxU+gHl4P6xHBH4zzML+Pt9zAAaM8TbCw==
X-Received: by 2002:a05:651c:201b:: with SMTP id s27mr6499182ljo.190.1621593458870;
        Fri, 21 May 2021 03:37:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:592a:: with SMTP id v10ls324262lfi.2.gmail; Fri, 21 May
 2021 03:37:37 -0700 (PDT)
X-Received: by 2002:a05:6512:cb:: with SMTP id c11mr1869533lfp.286.1621593457658;
        Fri, 21 May 2021 03:37:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621593457; cv=none;
        d=google.com; s=arc-20160816;
        b=pX+gg7IVz7336UyH/hsxOgI0w9JWCQwGonxREIJVq1DEfi1GhNaTVm/4j2PLjsIfJC
         P5QpkMU+XvOca0999rzwDdw7Nif0b5U3ta4STKOF8Kxv2sF78Mps4FHhKQX+srPWEHOl
         IKEQixyGRufRmoiVSRVGLj7zqm4JgcTsRi4K2r+0lUutcJ0Q0v5ddEzV+v8RxmdqFbws
         x2q8k7p0k6YsmDkHodOdWv8t1W81FkUIxMeVjeauiC2yA9IBZ9Z5tQ7Gco9ubFd1wUz8
         pH1TeYXPfOIM3c73ZlL74ijPv71AdLOFF/OWfn4ngFghsuTglpUD1Y1JRBf7t/usHkln
         8GIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=PD3kPZKDjlCU1vr9O2lXyct51ckGqr3pCkabOCPPulM=;
        b=HGl+hCqVVIkv/UptoyweVSMUX1Xo9NGIg5ZJjTY6gWqt6NqumHn0gX3o3U0IoQEi8i
         aU2UwaBEboNBMlJvqmd8f1XHUkrn43afcqnFH4XkOP8WgUKr+bF1favzG0wweCgHu22O
         fmxsHk8KtSvYDy0P2M469sdSfVgjgww5HwNDKEn8/T25d2MZZltyW//AgB/rFDJjFk6h
         wjX+VjVpzicbCrICjMvoJgp9S9W8PE22p1m2eVlK17okv7b4/Oy95KzgMpjG3A7pdXoX
         RVehjXqyLVQOdvyVVNHOl+BV0xw+/7jkrATX1ND7No+PF4Q2PVlghxBINFnXO9zdxKPj
         f1rQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id o13si285152ljp.0.2021.05.21.03.37.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 03:37:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 14LAbb9J017916
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:37:37 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.49])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14LAbYcD032504
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:37:36 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v3 08/22] README: Add QEMU ARM support
Date: Fri, 21 May 2021 12:37:20 +0200
Message-Id: <6b3d38e74e638d6a62d54ffce592541f5e526ee9.1621593454.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1621593454.git.jan.kiszka@siemens.com>
References: <cover.1621593454.git.jan.kiszka@siemens.com>
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

Lift the minimally required QEMU version to 4.2, the one that the ARM
target was tested with.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 README.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/README.md b/README.md
index 44bbfb4..cbceffc 100644
--- a/README.md
+++ b/README.md
@@ -13,7 +13,7 @@ Quickstart for Virtual Targets
 The host-side requirements are:
 
 - Docker (tested with 19.03.5-ce)
-- QEMU >= 3.1
+- QEMU >= 4.2
 - Kernel >= 4.4 with KVM support (for qemu-x86 image)
 - kvm_intel module loaded with parameter `nested=1` (for qemu-x86 image on
   kernel < 4.20)
@@ -21,7 +21,7 @@ The host-side requirements are:
 To build a target image, just run `build-images.sh` and select one (or
 both) of the QEMU targets. The generated image can then be executed using
 `start-qemu.sh ARCHITECTURE`. Currently supported are `x86` (only works on
-Intel CPUs so far) and `arm64` as architectures. On x86, make sure the
+Intel CPUs so far), `arm64` and `arm` as architectures. On x86, make sure the
 kvm-intel module was loaded with `nested=1` to enable nested VMX support.
 
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6b3d38e74e638d6a62d54ffce592541f5e526ee9.1621593454.git.jan.kiszka%40siemens.com.
