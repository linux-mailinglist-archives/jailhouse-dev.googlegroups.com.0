Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBNWXR3UAKGQEPZZB6CA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vs1-xe3f.google.com (mail-vs1-xe3f.google.com [IPv6:2607:f8b0:4864:20::e3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FBE46046
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Jun 2019 16:14:16 +0200 (CEST)
Received: by mail-vs1-xe3f.google.com with SMTP id v9sf900296vsq.7
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Jun 2019 07:14:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560521655; cv=pass;
        d=google.com; s=arc-20160816;
        b=TX7exX24+FlbMRKaZJ6F6MpjOm/8NyV34b+PxO/JoM9NWX72QczcG0Cmlv7Kaiw7rI
         5g88vCL998q4qrXVRk0S8qR0jzci8vl1NL8GkG9rx1ntGQYHCb6Q4w0rC30fHw1Z9hDk
         CIDBRftl7ORKr0KPzC94ikBmTl9ZL7m4ORJgkk9JoEgjD6puB1R92N9INsKguGpA4nGm
         GKMyZ4daobS34jwAWFQlLGxPOV3afy0KRZ3L3ZiVtOdt0c6Q4lGUWXMj522B+fuQx35V
         m7dOLOehYtZojZJl5+plxpZioj0f6MflQBw+Po4ziMF5tiBqNK+to6KbiDsMe3cJ7XGP
         Brsg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=zLicRIb4F0iKTxOlGiQpuOkOaTWQCQFESXkdWOeVGb4=;
        b=Z2eRs4ntfCUMR6Y3sO6cq2H0nMeXgDAKEOlP/4q+WiDUxNlf2lILk3Uo0WNR/HYoeQ
         +FaWHvQFO+n054/GBgKPn1TEQEdTSQz83mC99MGyySQ5NwY1OJKzBHcd4zTAL9LdRjze
         cKFh3LuDRP3b8XpWTf60ZPjd2I6KJAS9Es6yunPUpLZ6Zo9kkAPyehw+gcF23jqV3Haw
         x7U6FlqNwJtsyzJAP8eLpya3qiyV0VKzpm+1lAJduirHYRVOwZAUleknJqp01Ub0Jl+y
         SUNWodDC2A7Q+Y0/M/rYYG8UzUhmgT3MpUQCBJVr1Hhr+9LvwrGlctChBGcDVX34fNuf
         CctA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=XVrRSTaQ;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zLicRIb4F0iKTxOlGiQpuOkOaTWQCQFESXkdWOeVGb4=;
        b=W/GGrj8JOR4u3M8/ulx/oa2g6AHIxcWMJtW224fpVxN96rFnTomjGSubTwHN518nhI
         wj+rX3yU1YKwLyQScmbiATfDEH8RY2ILgK5Dd+5r4E4SCbCmD5vDVbt8M3KPAMppMKxQ
         HWj4qbe1lJbdUEXo13rrSPtu6trvQZO1AihbFlmESxbD4A7k8Uw+yl2yQMxoYyO8vYW5
         EeMhGNflRzHU5+alrGhPVoahRdAG3FGWvy9D9BVGGEks72Ii2EZsrTIBCOB5baDIqaHe
         nY9o9iN6JpwJwl0CXJZsi3zGqHpxjViGGr6/20BxJD4gxjwzHi54ZrqHiNmBAF8z4YIF
         48Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=zLicRIb4F0iKTxOlGiQpuOkOaTWQCQFESXkdWOeVGb4=;
        b=AeaQuLW0Rzqa+dqGjJXi/A7H5z0Hg2GLMAzA4CAcy/zNVCtym3kkUtMGtmsd4ztzkC
         1L1Vbn6iIFFmHYovTiqzkeNh5fezrwdEOB5q5Tk5ZX8aH/lyr4v7RpTGVfCgZy6ElmLB
         sbg/XtNe5d4qgawdqZjh0ylE7kntSPD9wfMm17Y1XlLeG5X4pv5cAbsHRbM/61890Iza
         3huKRR4e2kyyD/a51O+uE1i6k3tBVULcOGm9Guz0p6BBuWlpq+IT5G8dl908wusV0K2c
         aTQWXd5aeVU2Q3uOT3z7Q2mMpl/51lWYZ9FAjjElJBCSaiK5CSvsosurcbHzaZICk8sN
         v1Aw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVKga3EfATu8x38w3bp33OM+TM4iwYANnYQAbirvHxeQ/+v4nWn
	vF/pQiSLXADnNdjtB44lTd4=
X-Google-Smtp-Source: APXvYqxeof87m22+SO+o6jHaYIyNXb2NUvzgb6+Kxml9sJjF/rQxrmqEoSuyyvaWJglPt08ns4t7uw==
X-Received: by 2002:a67:e3da:: with SMTP id k26mr12512955vsm.131.1560521655102;
        Fri, 14 Jun 2019 07:14:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:dc6:: with SMTP id 189ls1246563vsn.2.gmail; Fri, 14 Jun
 2019 07:14:14 -0700 (PDT)
X-Received: by 2002:a67:5c3:: with SMTP id 186mr38105276vsf.103.1560521654581;
        Fri, 14 Jun 2019 07:14:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560521654; cv=none;
        d=google.com; s=arc-20160816;
        b=QccnLPMBagd5Ppq6BeQTL2Vo2BAoASid+vYgunf8R8JDVTRB6Be0+YpfnaV34Vyzso
         J4qgHbQeLMHiJSWM9HybzIjNBGARIovF0713Oo81hZmSJy7Sjh3kHTaK9pdXLt1Vni5Y
         w2iYj94CLQj8aBxa1UQN1F9/u0S07+g/47iaVG9df7YUpP4U3X1fWMRlFw1HKIureciw
         jQQM4t/+MAIdpUuvQklOXjp7VXT2Uz6UXjRyDGdVsjr3UP4tTZFv6etG62A8IVo2V2wv
         0uRyAj57QR3z0oBo/oKv5FSnB5a3HOp32mNSNCZRu4zedB6P3eyty9jb0GItfGRiCRyC
         34kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=nsQZX+8O8quRDeLJ47LWayavUK8sbQzB7L5mFV447sI=;
        b=D3rzus3J5RNyeEKMZDG7wOAvvnI0q/yX6mLwlsievhnePVz+TbydObuIchMOW1eY1C
         D4tcyF4hNIlrtZzGRRr6kLc18LNS3pqH4HbBDtjE0oSDG1buCSoU05l3DtQI8gPzwGE9
         7yVd0szPnxCYzVyHt5g99TWlm3Elct2IUFUGCesP+c+jQ3RhDFu6bcy7rc/19TrlGcFr
         gQIlSJsJuUe2UMOcrj5cEBBYv4NZTWQ7BOIin2m56C9sbrIv54rVwknBxdftHM3mc1q+
         aD6jS/UWtW9X1iecwzL132Fvr1payz7w08aVRkIvJFbxVawBqFai+EdbPyPtRgSNCsSd
         /oEg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=XVrRSTaQ;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-19.smtp.github.com (out-19.smtp.github.com. [192.30.252.202])
        by gmr-mx.google.com with ESMTPS id q12si124150uar.1.2019.06.14.07.14.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jun 2019 07:14:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) client-ip=192.30.252.202;
Date: Fri, 14 Jun 2019 07:14:14 -0700
From: Ralf Ramsauer <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/89f09d-26561f@github.com>
Subject: [siemens/jailhouse] 6aa1ac: inmates: x86: discover and activate
 SSE/AVX
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=XVrRSTaQ;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.202 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=github.com
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: 6aa1ac9ec5e4eae7040cf55126be818b30e31098
      https://github.com/siemens/jailhouse/commit/6aa1ac9ec5e4eae7040cf55126be818b30e31098
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-14 (Fri, 14 Jun 2019)

  Changed paths:
    M inmates/lib/x86/Makefile
    A inmates/lib/x86/cpu-features.c
    M inmates/lib/x86/header-32.S
    M inmates/lib/x86/header-64.S
    M inmates/lib/x86/include/asm/regs.h

  Log Message:
  -----------
  inmates: x86: discover and activate SSE/AVX

Recent gcc versions emit SSE instructions for 32-bit inmates (e.g., in
hex2str or cmdline_parse routines). Inmates aren't able to execute those
instructions as SSE is not enabled and will crash.

Enabling SSE is the same code for 32 and 64 bit x86 and straight
forward: Lookup SSE/AVX availability via cpuid and set according bits in
control registers.

Simply call the routine before calling the actual C entry point.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 40d7b89cf7187babb2ccbeb5f89b61e743db6790
      https://github.com/siemens/jailhouse/commit/40d7b89cf7187babb2ccbeb5f89b61e743db6790
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-14 (Fri, 14 Jun 2019)

  Changed paths:
    A inmates/lib/include/test.h
    A inmates/lib/test.c
    M inmates/lib/x86/Makefile
    M inmates/tests/x86/mmio-access-32.c
    M inmates/tests/x86/mmio-access.c

  Log Message:
  -----------
  inmates: introduce test.h and test.c

MMIO access tests use the same test pattern. Let's share the code.
Later, we will also reuse it for the SSE test.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 26561fa529d14fe31f844d121641cf6ac65df731
      https://github.com/siemens/jailhouse/commit/26561fa529d14fe31f844d121641cf6ac65df731
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-14 (Fri, 14 Jun 2019)

  Changed paths:
    M inmates/tests/x86/Makefile
    A inmates/tests/x86/sse-demo.c

  Log Message:
  -----------
  inmates: x86: Add SSE/AVX test inmate

Depending on availability, this inmates executes some SSE/AVX
instructions, compares the result against an expected result and exits.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
[Jan: replaced source link for sse-demo-32.c with makefile rule]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/89f09da9bf23...26561fa529d1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/89f09d-26561f%40github.com.
For more options, visit https://groups.google.com/d/optout.
